---
title: How to Build a Google-like Search for Trademarks
excerpt: You start your business. Than someone suggests you should trademark your brand. Oh no! You find out that the name you have chosen cannot be trademarked. Game over – unless you don’t think ahead.
date: 2021-05-19T15:09:32
slug: how-to-build-a-google-like-search-for-trademarks
---

# How to Build a Google-like Search for Trademarks

Imagine you are starting a new business. You start with essentials: creating a brand, a website, and buying a fancy coffee machine. The business takes off, everything is fine, and business is booming. Competition is fierce, and it tries to imitate your brand. You open a bottle of good wine to celebrate the fact that your company is worth imitating. Then you think about how to fight the dirty competition. Your lawyer suggests that you should trademark your brand. But no! You find out that the name you’ve chosen cannot be trademarked. It’s game over, at least for this solution.

Many business founders feel intimidated with buying a trademark, so they don’t do it soon enough. I have a lot of understanding for them: Buying a trademark can be a lengthy process with uncertain rules and results. It also costs a lot of money. Moreover, lawyers are involved, which makes it even more unpleasant and even more costly.&nbsp;

These are the reasons why we’ve built Trama. With Trama, you’ll get the right amount of lawyers’ support to do the trademark registration for you. We also provide a nice and quite unique feature: if your trademark registration is not successful, you don’t pay. In other words, the moment we say YourProductName can be trademarked, the financial responsibility is ours. If we’re wrong, it’ll hurt our purse. This means when we need to be damn sure about whether the registration will succeed. And since we register hundreds of trademarks each month, we need to be damn sure damn quickly.&nbsp;

And this is precisely the moment when IT comes into play. What we need is one simple Google-like input, where a trademark attorney can input your trademark, and that’ll tell them what are the most similar existing trademarks that could interfere with your registration. But before we continue, let me make a quick intermezzo about how trademarks work.

## Three rules of a trademark registration

First, your trademark cannot be similar—in writing or phonetically—to some already registered trademark. For this reason, you cannot register “Shelf” as a trademark for a chain of gas stations or “Nerd Face” as an outdoor clothing brand. The existing trademarks are like bullies in a high school: the bigger and more famous one is, the more distance you need to keep from it. If you break this rule, the owner of the established trademark can submit an opposition to your registration, which may result in your registration being dismissed.

Second, meet trademark categories. Every trademark is registered in a certain category, and usually, there are no conflicts across categories. For this reason, you could register [Trama](https://tramatm.com/) as a fashion brand, even though Trama is already a registered trademark in the Computer and Software Services and Scientific Services category. The simile with bullies applies here as well: Some trademarks are so powerful, they forbid similar names even in other categories. For this reason, you cannot register Adidas as a trademark for a seller of fresh vegetables.

Third rule: If it’s a generally used term, you cannot trademark it. For this reason, Apple cannot be trademarked. However, its visual representation, the famous bitten apple, can be trademark-protected.

Finally, let us amuse you with some real-world examples:

- We wanted to register a trademark for VANAVITA, which a company with the trademark VITA opposed.
- We wanted to register the trademark ELVIRE, which wanted registration in multiple categories, but specifically in the _clothing_ category, it was opposed by a company called ELVINE.
- We completed trademark registration for Eatster. Companies with the names Beatstar or Heatstar chose not to oppose the registration of that trademark.

## ML solution for the win

By now, you’re probably starting to understand why this is a complicated and fuzzy problem. And as such, it is a perfect fit for an ML solution. First, we need a proper dataset to train the model. There exists a beautiful set of successful and even unsuccessful trademark registration attempts. The problem? The really desperate registration attempts are not there, simply because an attorney hasn’t even submitted them. The ML approaches we’ve tried seemed to be quite confused by such a bias.

The second problem was that Trama’s internal dataset was relatively small at the time of implementation, just a couple hundred trademarks, which made it unusable for actual model training. Well, they could at least use them later for validation of our model. So we decided that EUIPO data (a.k.a mapping from ‘text applied for a trademark’ to a result of such application ‘approved/declined’) is our best shot.

Of course, we need to do some preprocessing first. Data needs to be tokenized first: the trademarked strings are split into individual words. This is harder than it seems: sometimes the words are abbreviated, and sometimes they even come from different languages.

The next step was to enrich our data with phrases that we know could not be trademarked, and such trademark applications would be declined. Wikipedia has a corpus of English language. If a part of the trademark can be found here, it’s a bad signal—trademark (or its part) is a word too common to be trademarked.&nbsp;

Then we fed the data into elastic search to query for similar words, both syntactically and phonetically, as there may be some occurrence of leetspeak, for example. If there are many similarities found, then it is a bad sign, as well as there is a high chance of conflict with existing trademarks. Finally, all these inputs are inputs to the ML model. We’ve tried several models and finally went out with decision forests. We tried for our model not to fit the EUIPO data too much as we knew the data we were basing our decisions on were biased. For validation of the results, we were able to use our internal dataset.

The result of the ML code is the yes/no verdict plus a list of trademarks that are most likely to conflict with the given trademark. The yes/no verdict is currently not that precise; if we’d trust them, we’d bleed money. The list of conflicts is a much more valuable output. A sharp eye of a skilled attorney can quickly check whether something of it is a valid reason to push back the registration.

And that’s it. In Vacuumlabs, we focus more on deterministic problems than ML work. But still, I very much enjoyed this small project. It feels great to hop onto the completely unknown field (natural language processing and ML) and, within a few weeks, put together something that our attorneys can use to speed up their work. Even though the results are currently a bit hard to read, which is the main reason why we haven’t made this tool public yet. However, the Trama business is growing, and so is the demand for our tool’s accuracy—and I’m looking forward to deepening my skills in this area more when we’ll push it to the next level.

