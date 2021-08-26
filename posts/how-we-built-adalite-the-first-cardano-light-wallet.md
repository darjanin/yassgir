---
title: Behind the scenes: how we built AdaLite, the first Cardano light wallet.
excerpt: In late 2017, we bought a few coins and wanted to store them securely. The whole ecosystem was relatively immature, so we decided to implement a good wallet that’d be secure enough, and that’d suit our needs. It seemed pretty straightforward; you do some crypto-mojo of hashing and signing in Javascript and broadcast the resulting transaction. This is kind of a task which makes you ask yourself, “OK, and what will I do in the afternoon?” Obviously, we couldn’t be more wrong.
date: 2021-06-22T13:44:35
slug: how-we-built-adalite-the-first-cardano-light-wallet
---

# Behind the scenes: how we built AdaLite, the first Cardano light wallet.

We recently published an article about [how we built AdaLite](https://docs.google.com/document/u/0/d/1vigi3Gf2iO6DZwUD7f7X-HX-GvUhV7tZUSeBlv_fchg/edit) — one of our most successful spin-off companies within the Vacuum Group, and the first light wallet for the Cardano blockchain. Today, I will take you on a technical behind-the-scenes, and show you how what was supposed to be a “quick side project” turned into some serious yak shaving. Enjoy!&nbsp;Ten years ago, we were young, foolish, and full of [ideas about economic liberty](https://en.wikipedia.org/wiki/The_Theory_of_Money_and_Credit). So when Bitcoin came, we immediately had a hunch: this thing can be damn serious.

The worst part about Bitcoin is probably the proof-of-work. The mining process is not only wasteful, but what’s worse, it doesn’t seem to buy the system [enough security](https://vitalik.ca/general/2020/11/06/pos2020.html). Moreover, it’s hard to obtain instant finality with proof-of-work, and it’s not possible to fork out malicious block-producers. [Siberian babushkas mining Bitcoin](https://www.youtube.com/watch?v=BCeEjG3L-KM) is one of the few profoundly positive things I see about proof-of-work.

So naturally, when proof-of-stake was invented, we were thrilled. However, first implementations such as Peercoin were a joke, full of design flaws, and easy prey for malicious actors. Then Cardano came and designed the system properly, faithful to its roots in academia, with the [formal proof of its properties](https://link.springer.com/chapter/10.1007/978-3-319-63688-7_12). Nowadays, many protocols have solid proof-of-stake consensus implemented, but back in 2017, this was huge.&nbsp;

In late 2017, we bought a few coins and wanted to store them securely. The whole ecosystem was relatively immature, so we decided to implement a good wallet that’d be secure enough, and that’d suit our needs. It seemed pretty straightforward; you do some crypto-mojo of hashing and signing in Javascript and broadcast the resulting transaction. This is kind of a task which makes you ask yourself, “OK, and what will I do in the afternoon?” Obviously, we couldn’t be more wrong.

## **_“This will be easy”_**** , we said…&nbsp;**

Cardano was just recently launched and – for most practical matters – basically in its alpha stage. There was barely any support for external developers or much technical documentation on any aspect of the blockchain. Worse yet: to most of the Cardano insiders, a group of very “interested” Slovak developers trying to build a beginner-friendly wallet solution set off all their scammer alarm bells.&nbsp;

But as we would soon find out, that was not our biggest problem. Our biggest problem was that almost everything in the Cardano world is written in Haskell…&nbsp;

## **Reverse-engineering the Haskell codebase**

What can you do if you want to develop a product on top of a new, primarily undocumented blockchain protocol? You look up the source code and figure out what’s going on.&nbsp;

As we jumped into this, we faced a steep challenge: Cardano is primarily written in Haskell, a functional programming language. And while I was confident in my capabilities as a developer, learning Haskell was a humbling experience. The functional programming paradigm is a tricky one to wrap your head around, and a complex platform like Cardano isn’t exactly the best environment for someone new to get started. The scarcity of technical documentation forced us into a lot of trial and error until we figured out every piece of the puzzle.

To crack this code, we started off by finding how to compile the Cardano node’s codebase so that we could put basic debugging statements in the code. However, little did we know, Haskell doesn’t allow a developer to simply put a print statement anywhere they like because the individual instructions inputs/outputs are chained together. In addition, we didn’t know how to transform the data to be displayed in a “Haskell friendly way.” Each of these problems stemmed from the pure functional paradigm that Haskell is based on, which we were utterly unfamiliar with at the time.

We ended up taking a step back and studying the basics of Haskell for a week or two before diving deeper. We were then finally able to figure out what the error messages meant and how to debug properly. From that point on, the progress was steady. We were able to inspect the code during runtime and get feedback on how our JavaScript code matched up with it. After being thrown in at the deep end… we were learning how to swim!

## **Another challenge: the Cardano crypto primitives**

Once we had our first taste of the Haskell approach to everything, we started to get the hang of things. We weren’t on the timeline we had hoped for, but at least we had gotten some really interesting technical challenges to work through. As our project was slowly progressing and shaping up, it turned out Cardano had made slight modifications to their crypto primitives. These are things such as key derivation, signatures, etcetera. We found JavaScript libraries that seemed to be implementations of the same crypto primitives. Still, more often than not, they didn’t work out of the box and needed to be traced to where they differed from Cardano — a tedious and frustrating process.

Even though our efforts to map Cardano’s cryptography to existing JavaScript libraries were quite tedious, we ultimately got there. After playing around with those crypto libraries, I suddenly realized that some of them were just transpired from their reference C implementation. The Cardano node, albeit written in Haskell, had its core crypto primitives mostly written in C. It turned out that, even though we had spent a month trying to find and tweak existing JavaScript libraries, we could quite easily transpile the C primitives into JavaScript as well and just be done with it. Once we had this, we made it into a standalone JavaScript library, and Cardano-crypto.js became the first JavaScript library with a comprehensive interface to Cardano cryptography, transaction signing, and address construction.&nbsp;

All this hard work came with a reward, though: the library was later picked up by other light wallets, most notably Exodus, which would otherwise have had to go through the same ordeal that we did. It was an enabler for Cardano light wallets, which are an essential part of the cryptocurrency ecosystem, and play a key role in its adoption.

## **The boss fight: submitting transactions**

The final technical challenge to get AdaLite live – what can only really be described as the AdaLite “boss fight” – was that there wasn’t a high-level API to submit transactions to the Cardano blockchain. The code for that didn’t seem obvious, and the rest of the team and I had only limited Haskell experience at this stage. What we ended up doing was taking WireShark and tracing the traffic to the Cardano nodes when submitting a transaction and then figuring out what packets to send to make our transactions go through. It turned out the protocol was quite an exotic multi-round interaction with particular relay nodes. Fortunately, it was enough to hard-code most of it in our script, and then we were finally able to submit transactions. Low and behold… we had a functioning Cardano light wallet, and AdaLite was born!

## **Crypto interfaces are hard, too**

While building a functioning light wallet was the hard requirement, the _reason_ we set out to create a light wallet was to make interacting with the blockchain much easier and more intuitive for users. For that, you need not only a functioning product but also an intuitive interface. As it turns out, building good interfaces and user experiences is also a complicated and ongoing challenge in the world of blockchain and crypto.

Crypto is a very young field, and compared to the conveniences of a Fintech or banking application; crypto UX is really in its infancy. While we as developers banged our heads on the keyboard as we struggled through the Haskell codebase, designers have to walk a fine line that balances between “transparent” on the one hand and “easy to use” on the other. AdaLite started as a wallet that simply allowed users to send, receive, and view their Ada balance. From that humble starting point, we slowly matured over time. We took a lot of inspiration from the MyEtherWallet Ethereum light wallet and then tried to simplify things even further. And as the Cardano blockchain matures and new capabilities are enabled at the protocol level, our designers are constantly challenged to develop UI and UX solutions that make things simple to use yet transparent enough to provide clarity and confidence. It is an ongoing balancing act.&nbsp;

—

All in all, the experience of working on AdaLite and working in the broader Cardano ecosystem has been both challenging, humbling, and ultimately rewarding. We came expecting a “quick victory” and instead ended up with some of the most demanding technical challenges we had ever faced. The Cardano ecosystem has since then become much more mature and is entirely different these days, with a lot of good documentation and other supporting infrastructure. It’s an ecosystem that we are proud to be part of and proud to have played a role in shaping up.&nbsp;

If you are curious to learn more about the various blockchain projects that engineers and designers at Vacuumlabs work on, or play a role in similar projects and technical adventures, then please reach out to us, and get in touch. [We’re hiring, and we are looking for you.](http://link-to-hiring-page.com)

