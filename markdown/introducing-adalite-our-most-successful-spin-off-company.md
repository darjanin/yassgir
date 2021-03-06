---
title: Introducing AdaLite, pet project turned successful spin-off company
excerpt: Learn about how we built the very first light wallet for the Cardano blockchain, the challenges we faced as we launched and grew, and where AdaLite is headed for the future.
date: 2021-04-30T10:26:06
slug: introducing-adalite-our-most-successful-spin-off-company
---

# Introducing AdaLite, pet project turned successful spin-off company

The [Cardano](https://cardano.org/) blockchain was launched in the autumn of 2017, as one of the most anticipated and best-funded “3rd generation” blockchain projects, following in the wake of the [Ethereum](https://ethereum.org/en/) success. And while our focus at Vacuumlabs was on building Fintech solutions, we were following the crypto space with great interest. We were playing with crypto, buying crypto, holding crypto, trading crypto, and generally curious about what this market might hold. The next logical step, of course, was to find out if we could successfully sell software development services in this growing market, too.

We decided we’d build some sort of crypto-related product for ourselves, so we could show potential clients that we had what it takes to build good software in this space. The Cardano ecosystem seemed like the perfect playground, and a light wallet an obvious product to build.

## **Why Cardano, and why a light wallet?**

In the autumn of 2017 there were of course a multitude of projects to choose from. We decided we’d want to dedicate ourselves to the Cardano ecosystem because of two main reasons: first of all we liked both the technology, and the research-based approach to blockchain development that they were taking. While many blockchain platforms — in a rush to become a market leader —&nbsp;chose the philosophy to _“move fast and break things”_, the Cardano ecosystem stood out for their diligence, depth and technical commitment. Secondly, from a business perspective the Cardano blockchain looked relatively underserved, with many of the most obvious and fundamental building blocks of a healthy ecosystem yet to be developed. In particular, we saw a clear opportunity for a better Cardano wallet…

At the time, there were only two ways for people to hold their Cardano cryptocurrency, Ada: either you’d have to download and run the official Daedalus wallet, which meant running a full node with a full replication of the Cardano blockchain, or one would have to hold their tokens on an exchange, which is against the spirit of many crypto enthusiasts and brings exposure to 3rd-party risks. The Daedalus option was too complex and cumbersome, while holding Ada on exchanges wasn’t bringing the security that most users sought and had already come to expect. What Cardano desperately needed was a light _wallet_ —&nbsp;the equivalent of the MyEtherWallet Ethereum wallet, but for Cardano. And thus, we set out to build that.

## **Building a light crypto wallet**

The principal way for a user to execute transactions on a blockchain is to run what’s called a _“full node wallet”_. The user runs a full node of the blockchain protocol, including a full replication of the blockchain in question. Every time the user opens the wallet, the node needs to synchronize and update, downloading the data on all new transactions that were made on the blockchain since the node was last online. This quickly gets impractical and annoying for most everyday crypto users.

A light wallet on the other hand allows a user to communicate with the blockchain via a more user-friendly mobile app or browser extension. The light wallet communicates with the AdaLite server, where a full node runs, and thus saves the user the headache of running a full node themselves. A light wallet offers a much better user experience, and – especially when combined with a hardware wallet to confirm transactions – offers excellent security properties, and protection against phishing and other web-based security threats.

When we set off to build the AdaLite wallet, we wanted users to be able to send and receive tokens, hold them, and see their balance. We also wanted to integrate with the Trezor hardware wallet, to offer users the highest level of security. And while these were only the most basic features, we knew we would be adding more features as the capabilities of the Cardano blockchain would grow.

## **First mover disadvantage — the challenges of building on top of a brand new, undocumented blockchain protocol**

Being amongst the first external developers to build something on top of the Cardano protocol came with some serious challenges, both technical and social. The first and most obvious one was the fairly significant technical challenge: when we started developing AdaLite, there was no public documentation for Cardano, no specs on how the transactions are created and serialised, and not much in terms of details on any of the other technical aspects of the Cardano blockchain, either.&nbsp;

To add to the complexity, Cardano is written in Haskell code. Haskell is a functional programming language. Functional programming makes it easier to formally verify the correctness of much of the codebase but also presents a programming paradigm that is quite distinctly different from what most developers are used to. Our challenge was thus to reverse-engineer the Haskell codebase, to understand what was happening at the protocol level, and then transpile the code to javascript so that it could be used for the wallet implementation.

Another initial challenge we faced was not technical in nature, but rather a social challenge: when we started development, core providers of the Cardano platform such as Emurgo and IOHK suspected us of building some sort of scam wallet, and were reluctant and reserved when they noticed our eager interest. In a market as hostile and scam-ridden as the crypto market, you have to prove yourself before anyone will trust you.&nbsp;

## **Hello world**

That proof came when we launched the AdaLite wallet as an open source project, open for anyone to inspect it’s codebase. We launched it softly, with the only promotion limited to posting it on some Cardano forums, Cardano-related subreddits, and a few other places Cardano enthusiasts hang out.&nbsp;

We launched small, and grew relatively slowly. In the first six months, we had around 5 transactions per day executed on AdaLite –&nbsp;barely enough to even be worth mentioning. Worse yet: many of these transactions were executed by developers for testing purposes! But we had a committed team, and we were slowly developing and growing. As we added more features, such as support for Ledger hardware wallets and other such things, the user base started to grow. People realised that we were adding new Cardano features really quickly, in particular related to hardware wallet integrations. We were&nbsp; sometimes even faster than official wallets in bringing these updates.

Where we initially were faced with skepticism and reluctance, the momentum started to shift. While early on we were looked upon as could-be-scammers, we slowly became more recognised in the community. It took a really long time, but AdaLite is nowadays recognised as a trustworthy wallet, and Vacuumlabs as a trusted development partner within the Cardano ecosystem. If people talk about official Cardano wallets they will typically first mention the Daedalus full wallet, then Yoroi — a light wallet that we helped develop for Emurgo after our success with AdaLite —&nbsp;and then often AdaLite as a solid third option.&nbsp;

AdaLite thus became a trusted wallet option in the world of Cardano, but our volume of transactions was still relatively small, and our revenues even smaller. For the first two years of its existence, AdaLite was purely a hobby project… albeit one that we pursued with much passion and enthusiasm. The big breakthrough would only come in 2020.

## **When moon?**

The big breakthrough for AdaLite came in the summer of 2020: Cardano rolled out an essential proof-of-stake upgrade that allowed Ada holders to stake their tokens to help secure the Cardano network, and earn tokens as stake rewards. Because most casual users don’t want to deal with the underlying technical complexity of being a staker, they instead put their tokens into stake pools. The model is that stake pools take care of all technicalities – for a small fee –&nbsp;and pay the investors the majority of their stake rewards after the staking period ends.

With that upgrade in mid-2020, AdaLite suddenly had access to a much better revenue model: we could offer the ability for AdaLite users to use our staking pools, thus increasing convenience to AdaLite users while at the same time being able to earn enough revenue for the project to be sustainable by acting as a convenient staking pool provider.&nbsp;

What also helped, obviously, was the token appreciation we have seen since then. Compared to last summer, the dollar value of Ada is up roughly 10x, as is the optimism and trust in the broader blockchain market. AdaLite is currently servicing around 40.000 users/month, and averaging around 1000 transactions per day.

In the next 6 months or so, we expect Cardano to roll out yet another essential upgrade that will bring smart contracting capabilities to the Cardano platform. This brings additional complexity, but also a new range of possibilities for what can be done on Cardano. On our end, it means that development for AdaLite is never really done: as long as new functionalities become available on the protocol level, we are committed to supporting Cardano users the best way we can. For instance, the anticipated smart contracting capabilities would mean we could look for ways to integrate with smart contract protocols built on Cardano, extend our support for NFTs, and allow people to interact with smart contracts in various ways.&nbsp;

All in all, we’re excited about the success we’ve had with AdaLite, and our development efforts have not gone unnoticed: we are proud to have worked for multiple core providers in the Cardano space, like IOHK and Emurgo. Since we got our toes wet with AdaLite in late 2017, we have also started developing on other blockchains, and we’re enjoying every part of the adventure.

