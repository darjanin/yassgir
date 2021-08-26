---
title: The biggest mistake of a code reviewer
excerpt: What mistake should be avoided by code reviewers?
date: 2021-04-02T11:50:08
slug: code-review-mistake
---

# The biggest mistake of a code reviewer

Before I explain what the biggest code review mistake is, let me start from the beginning.

## **Code reviews are awesome**

Code reviews are great and we’re doing them a lot at Vacuumlabs. They are my favorite tool to avoid nasty bugs and keep our code in a readable shape. Most importantly, knowing your code is about to be closely inspected by your colleagues applies healthy pressure to [think before you code](https://www.youtube.com/watch?v=f84n5oFoZBc).

The code review process is often a lengthy one. It’s [certainly not a quick peek](https://medium.com/palantir/code-review-best-practices-19e02780015f) into the code and concluding LGTM. A code reviewer needs to focus on so many things: Is the code well designed? Does it fit well to the broader picture? Are there some nasty bugs, not immediately surfacing in the tests? Then there are issues of performance and security, and finally, you need to consider structuring the code into functions and modules, naming, readability, and having comments where they should be.

But even though it is a lot of work, I usually feel satisfied when giving or receiving a review, because it feels like time well spent.

A friend of mine had a different experience: a colleague of hers requested several days of frustrating work to improve the readability and cleanliness of her code. The sentiment came from the fact that she was writing just a unit test. The test added very little value and probably shouldn’t be there in the first place. It was one of those sad tests, that are very closely tied to the actual implementation—it’s passing until you change the implementation and at that point, you need to rework it from scratch. It was obvious that no one will ever read or debug such a test, its job is just to “be there” and then get deleted during the next bigger refactoring. But another reviewer decided it’d be good to write such a test anyway, and so she did.&nbsp;

After the test was there and the first reviewer satisfied, the second reviewer came. For several long days, they iterated the naming of local variables, created helper functions, and altered syntax, as if it was the single most critical piece of code. What a complete waste of time!&nbsp;

## **Context matters**

The moral of that story isn’t that the naming of local variables doesn’t matter. It’s all about the context. For some code, you aim for maximum readability, because the error is extremely costly. Imagine writing a piece of [low-level C code](https://github.com/LedgerHQ/app-cardano) that is responsible for moving billions worth of dollars every month. Surely, if good naming can prevent a bug in such a code, you want to spend some time on it! But polishing the naming in a meaningless unit test? That’s quite a different story.

If you forget the context, you’ll waste your time and frustrate everybody else with your review. My friend’s story outlines the first cardinal rule of code reviewing: the more critical the code, the more it justifies putting pressure on anything smelly—and vice versa. But it doesn’t end here. As an reviewer, you may be tempted to object to other things, not realizing there is a good reason to leave it be. Let me give you some examples:

As a rule of thumb, you want the author to avoid certain code repetition. But sometimes, you mindfully want to repeat some code, and refactor it later, when you find out what a good abstraction should be.

Or maybe you want the author to add something, such as better error handling, handling of non-happy-path, or improved logging. But sometimes, having a functioning and deployed prototype matters more than producing 100% perfect code a week later, just to notice that the business requirements have already changed in the meantime.

Or you may want the author to write a code consistently with other parts of the codebase, that she maybe hasn’t thought of yet. I know from experience, because I’m often guilty of such OCD requirements myself. Sometimes it’s worth it, but surely it comes with a cost: consistency above a certain level is hard to maintain, especially in a bigger team, no matter what “Coding Standards” document you have. You need to be mindful of what battles are you going to commit to, because you are not going to win them all.&nbsp;

Or how about wanting&nbsp; the author to write a code in a future-proof way? Sounds reasonable, right? But how sure are you, that your idea of what the future looks like is clear enough to justify that extra work? As the finance guys like to say: it’s difficult to make predictions, especially about the future.

Finally—my last example—you may want the author to follow some dogma you consider a healthy standard. Healthy standards are good, but be mindful that there are also good reasons to break any one of them. Which brings me to my last point:

## **Don’t do dogma driven development**

The loss of context often follows from being too attached to a specific dogma.

- “A line cannot be more than 80 characters long.” 
- “Global variables are evil.” 
- “Avoid code repetition at all cost.” 
- “Function should do one thing.” 
- “There needs to be a unit test for all the code you write.” 
- “Variable names need to be at least 7 characters long.” 
- “The functional form of a statement is more readable than a declarative one.”

A junior engineer doesn’t know such rules and hence produces ugly code. Later, by adhering to such mantras, she writes more and more beautiful code. But to grow _beyond that,_ and become a stellar engineer, she needs to understand that these are all just suggestions and best practices. Know the rules, so you can break them responsibly.

So there you have it—that’s the biggest mistake a code reviewer can make: to forget the context and ignore the “why”, before jumping into a code review. Not all battles are worth fighting.

So before you add a demanding review comment, ask yourself: “Do I really think that the proposed change has a reasonable business impact? Or, am I just trapped by dogma?”&nbsp;

**Gotten enthusiastic about great code reviews? Would you like _me_ to be your code reviewer? Well, you’re in luck, because [we’re hiring](https://vacuumlabs.com/jobs)!**

