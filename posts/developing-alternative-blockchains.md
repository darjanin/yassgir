---
title: Why is Vacuumlabs developing for alternative blockchains
excerpt: Sometimes betting on new and promising kid on the block brings great benefits!
date: 2021-04-02T11:35:33
slug: developing-alternative-blockchains
---

# Why is Vacuumlabs developing for alternative blockchains

## **A brief history of Ethereum**

When Ethereum came out, back in 2015, its fans were crazy for its Turing-complete scripting capabilities. It felt somewhat magical: submitting pieces of code to the almighty blockchain, letting the world’s most resilient computer interpret that code, perform financial operations, and store the results forever. All this without KYC, and at the cost of a few cents.

People were fascinated and everyone guessed what the first practical use case would be. Then tokens came. They were a joke. Seriously, do we need a [coin for dentists](https://dentacoin.com/)? Or, [Bananacoin](https://bananacoin.io/)? But from an engineering perspective, everything worked fine and after all, some use case is better than no use case.

A few years and one crypto-bubble burst later, the first big [decentralized exchange](https://uniswap.org/) and [lending platform](https://compound.finance/) were built. Many more similar projects followed soon and the umbrella term [DeFi](https://ethereum.org/en/defi/) was coined. And since Ethereum supports as many as—hold your breath—10 transactions per second (tps), the transaction fees climbed to as high as $50 per transaction. The sentiment is that the [Ethereum blockchain is clogged and quite unusable](https://www.reddit.com/r/ethereum/comments/lffh25/eth_gas_fees_are_too_d_high/).

## **The mainstream solution**

So here we are: Ethereum finally discovering its first real use case, but almost immediately getting close to unusable under the load.

Why is Ethereum so slow? With Ethereum, Bitcoin, and the majority of blockchains, every node receives, and processes, and forever stores [all transactions within the system](https://www.coindesk.com/what-is-sharding-ethereum). Such a huge redundancy is a cost of the enormous stability and fault-tolerance that blockchains such as Ethereum guarantee.&nbsp;

The high-level solution probably won’t surprise you much: Let the nodes work more in parallel. This means that every transaction will be processed by just a small fraction of all nodes. These nodes will find an agreement on what the transaction results are and update the balances on affected addresses. Inspired by database design, the system is called _sharding_ and has become one of the most common buzzwords related to blockchain scaling.

## **The problem**

Let me come out of the closet now: I’m really skeptical about sharding and I’m really skeptical about horizontal scaling proposals in general. While [it creates an interesting playground for scientists](https://scholar.google.com/scholar?start=0&q=blockchains+sharding+protocol&hl=en&as_sdt=0,5), it may be beyond human power to engineer such a complex system.&nbsp;

Let me present three arguments why I think this is the case:

First, let us compare with existing systems, that are trying to achieve _roughly_ the same thing—distributed databases. Reading through [Amazon’s DynamoDB](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf) or [Google’s Bigtable](https://research.google/pubs/pub27898/) design papers, these systems are an order of magnitude simpler than sharded blockchain. Yet it took a paramount effort to make such systems work properly. And the creators didn’t even need to design for malicious actors that’ll do everything possible to sabotage your protocol!&nbsp;

Second, the scaling issue is not anything new and history shows that it is indeed a hard problem. You may recall projects such as RaiBlocks (later Nano), EOS, or IOTA. They all claimed they fixed the scaling issue and they are all [pretty much dead now](https://drive.google.com/file/d/17VoariX45RTcP4zN5t-qzz1Hvm2xXzWG/view?usp=sharing). Ethereum’s scaling solution Plasma created [more than 20](https://ethresear.ch/t/plasma-world-map-the-hitchhiker-s-guide-to-the-plasma/4333) different design proposals and yet the project seems abandoned now.&nbsp;

Finally, it takes years from the “spec ready” state to the “product ready” state. If the researchers cannot even write the specs, how many years are we from the launch?

To illustrate what I mean: the Ethereum 2.0 specification is [very detailed](https://github.com/ethereum/eth2.0-specs/blob/dev/specs/phase0/beacon-chain.md) when it describes the proof of stake part. But when talking about sharding it suddenly looks like an [introductory blog post](https://hackmd.io/@HWeNw8hNRimMm2m2GH56Cw/sharding_proposal).

Polkadot, a new kid on the sharding block, brings some really refreshing ideas to the table and I’d like to see them succeed. They, however, don’t give a definitive answer for implementing their no. 1 feature: checking the validity of the parachain state transitions by validators. The [whitepaper](https://polkadot.network/PolkaDotPaper.pdf) mentions zero-knowledge proofs, which is a fine solution for token transfers. However, as [Vitalik Buterin noted](https://ethereum.org/en/eth2/shard-chains/#do-shards-need-code-execution), zero-knowledge-SNARKs suitable for powering up a smart-contract blockchain are not even discovered by scientists yet! This is certainly not a small missing detail in a protocol design.

With the Avalanche ecosystem, you can create as many separate zones as you want, but there is no solution for zones to communicate with each other, so it’s as good as “scaling” Ethereum by launching multiple separate ETH blockchains.&nbsp;

The Near project has a [very nice whitepaper](https://near.org/downloads/Nightshade.pdf), and in my opinion, they get farthest in producing a proper high-level spec. However, as an engineer the whitepaper gives me the creeps: every other sentence in the design part represents months of engineering work. It’ll take ages before anyone implements Near properly; Near is certainly not near.&nbsp;

## **Vertical scaling for the win**

Imagine this situation: you’ve developed software for a client. Now the software has a problem: it cannot process the current load of transactions. All low-hanging performance fixes are already done. You are in a client’s place and have 12 hours to solve this. What would you do? The answer is simple: spend 2 hours migrating the system to the stronger AWS machine and spend the remaining 10 hours in the pub tasting the local beer.

This approach is quite opportunistic and not very noble in my fellow scientists’ eyes. But it has a few advantages: it works, it _probably_ doesn’t break anything and it’s compatible with your taste for a good beer.

A powerful personal notebook can easily transmit, process, and store 1,000 tps. That’s a very practical 100x improvement over the current Ethereum throughput. There is no _fundamental_ reason why Ethereum couldn’t simply do the same. Fundamental is an important word here: it’s certainly not as easy as turning the switch to 1,000 tps!

Solana is one project using such an approach. Their requirements for running a node are [much more demanding](https://docs.solana.com/running-validator/validator-reqs) than the Ethereum node. Apart from using the sheer power of their hardware, Solana engineers optimized like crazy on all levels of the system: They write smart contracts in low-level languages such as Rust, [they replaced mempool with a faster alternative](https://medium.com/solana-labs/gulf-stream-solanas-mempool-less-transaction-forwarding-protocol-d342e72186ad) and they even came up with [a novelty consensus approach](https://medium.com/solana-labs/tower-bft-solanas-high-performance-implementation-of-pbft-464725911e79) which is designed for speed. All these things combined, they are [bragging about supporting 50,000 tps](https://break.solana.com/). Based on my quick research no one seems to contest this statement, so it’ll probably be roughly correct. After all, [project Serum](https://projectserum.com/) is an order book-based (read: extremely transaction heavy) exchange that’s already operating on top of Solana.

Another example: Binance launched its version of an Ethereum-compatible smart-contract chain called Binance Smart Chain. While not even properly decentralized, people flock to it. The reason? It works now, for a fraction of the cost.

Let me end with a prediction: by the end of 2021 people will be fed up by sharding solutions not progressing fast enough and new vertical-scaling solutions will emerge. Solana and Binance Smart Chain will attract even more attention and so will non-sharding scaling solutions on Ethereum such as [Rollups](https://docs.ethhub.io/ethereum-roadmap/layer-2-scaling/optimistic_rollups/). Sure, these may be a temporary solution, but sometimes [nothing is more permanent than a temporary solution.](https://www.quoteopia.com/quote.php?quote=301091)

At Vacuumlabs we are conservative about the choice of technologies. Using overhyped stuff often leads to pain, misery, and weekend overtimes, and no one needs that. But to innovate, sometimes you need to mindfully bet on something new and promising. That’s what we did with [Cardano](https://adalite.io/) years ago, and we’re doing with Solana now.  
**If you’re interested in developing for these platforms, [we’re hiring](https://vacuumlabs.com/jobs)!**

_Disclaimer: The article is not investment advice. Do your own research before putting your money somewhere. The author has some positions in most of the projects mentioned, with the exception of Bananacoin._

