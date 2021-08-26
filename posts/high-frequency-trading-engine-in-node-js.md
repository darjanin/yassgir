---
title: Lessons learned from writing a high-frequency trading engine in Node.js
excerpt: How to choose the right technology for a high-frequency trading project to execute trades on crypto exchanges?
date: 2021-04-02T11:36:34
slug: high-frequency-trading-engine-in-node-js
---

# Lessons learned from writing a high-frequency trading engine in Node.js

Imagine, you need to choose a technology for a high-frequency trading project to execute trades on crypto exchanges. What would you go with?

This is exactly the situation we found ourselves in, two years ago. We had several heated discussions about this between various developers. There were many opinions and arguments, a lot of languages were explored and considered, and their pros and cons voiced repeatedly.

When the dust settled, we had identified two and a half requirements that resonated most:

First, we need speed. Not the Wall Street high-frequency-trading speed, but a very decent speed. The system today processes more than 10k updates/second on a single machine. It also does lots of I/O—our database tortures the disk with 100MB/s of I/O, and machines running our code can easily top 200GB of logs per day.

Second, we need extreme agility. The crypto space is often compared to a wild-wild-west, and everything can change in a heartbeat. New exchanges pop up and go bankrupt every month. Also, there are only two kinds of APIs: brittle and [extremely brittle](https://www.bitmex.com/app/wsAPI#OrderBookL2).&nbsp;&nbsp;

Finally, we like to write code in a functional way, because it’s the easiest way to avoid bugs by design.

As you probably already guessed, we chose Node.js and Typescript.&nbsp;

## **Node.js is faster than you’d think**

Backed by the V8, a Google Chrome Javascript engine, Node.js can in many cases have performance in the same ballpark as native code. Especially if you focus on the hot path and let JIT do its work there. Node.js is certainly much faster than for instance Python, and this is what Alameda Research (a big market maker in the crypto space) used [for their first prototypes](https://youtu.be/n85x_h21bGs?t=1492).

Compared to C(++), Java, or even Python, Node.js has another nice property: it is designed with a non-blocking API first, and instead of using a huge amount of threads, it just runs a single event loop that schedules your asynchronous tasks. In the world of streaming updates from crypto exchanges, this is a very good functional fit.

## **What about all that garbage**

Javascript is a garbage-collected language. GC pauses are nasty, but again, with the right design, you can optimize a lot here. You may be curious what the heaviest unnecessary-garbage producers in such a system could be. Well, the below were our two most relevant spaces for improvement:

### 1. String concatenation

Did you know that V8 can very efficiently concatenate strings? Values such as

`const value = 'nodejs'+'surely'+'can'+'concatenate'+ 'strings'+'quickly'+'right?'`

are not immediately materialized into a single contiguous string. Instead, they are represented by a [special class ConcatStr](https://docs.google.com/document/d/1o-MJPAddpfBfDZCkIHNKbMiM86iDFld7idGbNQLuKIQ/preview). This obviously puts a lot of pressure on the Garbage collector as many “hot” strings in our codebase were produced by a logging/metrics system that assembled the data using concatenation. We relieved some GC pressure by forcing V8 to flatten strings in our logging infrastructure. With 200GB/day of logs, this is not something to be taken lightly.

### 2. Data layout

For example, when representing things such as order books, you would naturally use format such as:

`type OrderBook = {   asks: PriceLevel[],   bids: PriceLevel[]},`  
  
where:  
  
<kbd>type PriceLevel = {price: number, amount: number}.</kbd>

Using this design creates lots of tiny objects which means more work for GC. This improves rapidly, by just turning these objects into type:

type <kbd>OrderBook = {asks: Side, bids: Side}</kbd>,   
  
where:  
  
<kbd>type Side = {price: number[], amount: number[]}.</kbd>

## **Type safety is essential**

I’m sorry type-haters, it really is. Especially for a product like this one. We’re all well aware that type-safety doesn’t imply correctness, but if you can prevent a critical bug by writing proper Typescript annotations, surely you want to do that.

In general, Typescript presents a great solution for Javascript’s [nasty surprises](https://www.destroyallsoftware.com/talks/wat). Especially if you adopt a culture of strict typing, code reviews, and linter rules. You can always opt-out to untyped code, for instance, if you are just prototyping.

## **Runtime Validation of External Data**

Maintaining correct typings for third-parties is hard. Many times, third parties will send you messages in a different format than they advertise on their documentation page. You definitely don’t want to execute some unintended trades and lose a lot of investors’ money because a certain exchange suddenly sends you “1.234” (string) instead of 1.234 (float)—which is exactly the kind of small-but-important difference that are surprisingly frequent occurrences with exchanges’ APIs. Comparing [this](https://bybit-exchange.github.io/docs/linear/#t-getactive) to [this](https://bybit-exchange.github.io/docs/inverse/#t-getactive) gives you some idea.

To deal with brittle APIs, we need robust runtime input validation. We already have good Typescript type annotations, so the obvious design would be to generate a runtime type-check out of these. Many people have already solved this same issue, so this should be a piece of cake, right? Well, no. We’ve tried several libraries but none of them had all we need—some of the libraries need a schema but do not produce good TypeScript types, while others were too slow to validate inputs.&nbsp;

Finally, we decided to write a custom schema DSL and generator which produces both TypeScript types as well as a highly optimized validation routine. Part of our optimizations was a realization that we **do not** need to validate arbitrary Javascript objects. Instead, we always run validation on the result of JSON.parse(). This has a huge benefit because by definition the objects being validated aren’t cyclic, and they cannot contain classes/functions or other funky JS stuff.

## **JSON (De)Serialization is Surprisingly Slow**

This caused several headaches for the engineering team. There are several reasons why JSON is slow:

1. JSON is very chatty. It introduces a lot of redundancy (i.e. long field names) in the protocol
2. JSON is UTF-8 based. This is a very nice property except that UTF-8, being a variadic-length format, [is hard to parse](https://www.youtube.com/watch?v=wlvKAT7SZIQ).&nbsp;
3. JSON in our use-case requires a ton of CPU to constantly format floats as strings and then parse strings into floats, an operation we do a lot in our architecture.

Of course, we cannot choose a data format when it comes to communicating with third-party APIs, but a majority of the traffic we send is between internal parts of the project. Therefore we’ve had the freedom to replace JSON with something else. After some experiments, we’ve gone with [AVRO](https://avro.apache.org/). For this, we heavily rely on our DSL schema generator, which can now produce both TypeScript types, JSON validation routines, and AVRO schema definitions. Think of all this as Google Protobuf on steroids. The result is a lightning-fast (de)serialization of internal messages.

## **It’s Just the Beginning**

Node.js allowed us to build a working product quickly and get to know the space we’re operating in. Armed with this knowledge, we are finally ready to move to the next stage – a slow rewrite to a language with high-performance guarantees. After weighing all the pros and cons, we’ve chosen Rust. While it has a steep learning curve and has strict constraints on the design, it is very good at controlling memory and thread safety. This is exactly what you need when you need to go fast but can’t risk losing your investors’ money on stupid mistakes.

## **Summary**

Some may think that spending two years with Node.js just to rewrite the project to Rust is a complete waste of time. We see it differently though. Only in retrospect, we can see how crazily complicated our problem is. Would we start with Rust, we’d be both nervous wracks and probably bankrupt, too. As a good rule of thumb: properly understand the problem before investing a lot of effort into low-level optimizations.&nbsp;  
If such an approach resonates with you, and you’re curious to work on similar projects… [we’re hiring](https://vacuumlabs.com/jobs)!

