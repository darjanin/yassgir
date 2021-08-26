---
title: Bitcoin: a layered evolution of money
excerpt: Money is layered – and has been so for hundreds of years. Bitcoin is evolving in a similar manner. There seems to be a natural tendency for a strong monetary base layer, on which further, more agile instruments are built.
date: 2021-08-17T10:17:16
slug: bitcoin-a-layered-evolution-of-money
---

# Bitcoin: a layered evolution of money

_Bitcoin is expanding its use cases in hierarchical layers – a development that we can witness in history with other forms of money._

We’ve all heard the common criticism of Bitcoin: its transaction throughput is only four transactions per second, making it unable to compete with Visa, PayPal, and other global payment networks capable of thousands of transactions at the same time.

Such criticism is the result of common and understandable confusion. People compare Bitcoin with what they know and use daily: the transaction layer of the current monetary system. But transactional utilities such as card companies and payment processors do not work on their own. Instead, these systems rely on the underlying layers of central and commercial banks, bank accounts, and settlement networks.

Money today is layered – and has been so for hundreds of years. Bitcoin is evolving in a similar manner. There seems to be a natural tendency for a strong monetary base layer, on which further, more agile instruments are built.

A note: this article is inspired by Nik Bhatia’s[_Layered Money: From Gold and Dollars to Bitcoin and Central Bank Digital Currencies_](https://www.amazon.com/Layered-Money-Dollars-Bitcoin-Currencies-ebook/dp/B08PS293NT) – a book on the logic of monetary evolution published in January 2021. All the quotes in the following text are from Bhatia’s book.

### **Money is a pyramid**

_“Before layered money, there was simply money.“_

A cursory glance at monetary systems today can evoke an impression that many parallel monetary standards exist. We have dollars, pounds, euros, and about 180 other national currencies. A monetary cacophony.

But the truth is there are multiple _currencies_, but essentially one _money_.

To understand the distinction between a currency and money, it’s helpful to get acquainted with history.

For thousands of years, most humanity used precious metals like gold and silver as the dominant form of money. As civilization expanded and the extent of trade along with it, people quickly learned about the downside of precious metals: they are heavy and thus expensive to move around. A workaround needed to be found, so that trade could continue expanding. Thus the concept of a _deferred settlement_ was born.

Deferred settlement is an idea that you don’t have to pay for goods or services in the generally accepted money straight away. Instead, you pay with a money substitute such as an accounting entry (debt), the promissory note (banknote), or various forms of securities. All the money substitutes throughout history always had one thing in common: if we followed the line of promises, we would find there’s always one final settlement in the end -the underlying money in the form of precious metal.

Consider the well-known names of national currencies like dollar, pound, or mark. These terms originally denoted a standardized weight unit of gold or silver:

dollar = 1.6 grams of gold or 24 grams of silver

mark = 233.856 grams of silver

pound sterling = 7.32 grams of gold

Even though various currencies emerged in history, these were only local denominations of money proper. In the form of coins, these currencies were actual money, while in the form of notes, they were money substitutes. The most important difference between money and currency/monetary substitutes is the trust factor. When a merchant accepts a silver coin for payment, the transaction is immediately settled, and the merchant doesn’t have to trust his counterparty. On the other hand, when the merchant accepts a note, he has to trust that the note issuer will make good on his promise to redeem the note in silver. But such a trade-off made sense from an economic perspective. Moving around lumps of precious metal was less and less practical for an ever-expanding trade. So precious metal became the rarely used settlement layer, while notes and accounts became the transaction layer of everyday trade.

![image.png](https://lh6.googleusercontent.com/ODGRGDIPkRo2lEO7np6yrsTw4vsH_FejXullZV6sycbnj_MBktF0-4WGJWqwL4vNNK5RjhcySpEI5-mSeiBAwUVFJHSnmRjtQ3lPZb0hwas53YiBcPuoCq2ItyieROU7_Oy-siUk) _Monetary pyramid before central banking._

### **U.S. Treasuries: the current money**

_“In gold’s absence, the Fed’s balance sheet used U.S. Treasuries as its dominant asset, and the private sector used them as the omnipotent form of monetary collateral. “_

So what is money in today’s world, and does the world share one monetary standard as was the historical norm? Today’s money isn’t reliant on gold or silver anymore. Indeed it does, and the money today is the U.S. Treasuries.

After most national currencies lost their linkage to gold between world War I and II, only the U.S. dollar remained backed by gold. That’s why the U.S. dollar became the world reserve currency after the Bretton-Woods agreement in 1944. Then in 1971, president Nixon unilaterally decided that the U.S. dollar would not be redeemable for gold anymore. Nevertheless, the U.S. dollar retained its position as a global reserve currency. But the money proper today isn’t the dollar per se. Instead, the dollar as such is backed by the “full faith and credit of the U.S. government” – essentially by U.S. government bonds (Treasuries). As Nik Bhatia points out, treasuries are today’s risk-free collateral and the sought-after ultimate monetary settlement worldwide. Treasuries are the closest thing comparable to gold’s historical role of the final settlement, of course with one major difference: there is an unlimited amount of debt that can be created by the government and bought by the central bank, with all the consequences in the form of inflation, business cycle, and speculative bubbles.

One confusing thing about the modern financial system is the detachment of the settlement layer from the money itself. While it’s true that we can settle a transaction by simply handing over dollar bills, most of the money today isn’t in the form of cash but instead exists in an electronic form. Moreover, there are multiple settlement networks around the world today: SWIFT, Fedwire, ACH, and others. So the current monetary pyramid (in a very simplified form) looks like this:

![image.png](https://lh6.googleusercontent.com/LJsOdzmgAZwo5Ryx6wFrcdtX2LTj1k7Vt9Stc4qxe1gmTzZjYLawYZp_1Bk0yw6FKAAuzXPEzbi6YOTo3_kdzY2zdKk4aiEv6i3jWF_aprn_6jQyvbuu7_rXo5DgPG-PmE0hsOq8) _Modern monetary pyramid._

**Bitcoin: cryptographic proofs instead of trust**

> _“The most fascinating component of Satoshi’s design of Bitcoin was his intention for it to mimic gold as first-layer, counterparty-free money.“_

As Bhatia argues in his book, Bitcoin is best understood as money, following the same hierarchical development we’ve witnessed in history. Through this optic, we find that bitcoin the asset is the money proper, living on the base layer of the blockchain. A confirmed on-chain transaction is a final settlement within Bitcoin’s monetary universe – there is no further backing or credit relation when a user holds bitcoin in his address. The most important effect is that there is no trust requirement when working with the base layer.

Bitcoin’s base layer is admittedly minimalistic. It doesn’t allow for much other than broadcasting and settling of transactions in between user addresses. In this regard, it is pretty similar to gold or SWIFT – all that we seek from these settlement layers is maximum reliability. Of course, other capabilities can be built on top of the robust base layer, as has been the case throughout history.

The major difference between Bitcoin and the preceding monetary standards is that there is no trust prerequisite as we go deeper down the monetary layers. Instead, Bitcoin’s second layer in the form of the Lightning Network relies on[Hash Timelocked Contracts](https://en.bitcoin.it/wiki/Hash_Time_Locked_Contracts) (HTLC) – simple, smart contracts where the users creating payment channels lock their bitcoin. Thus, users can “fall back” to the base layer bitcoin at any time without losing their money if the counterparty misbehaves. This is a significant improvement to the monetary pyramid, as history is full of breaches of trust on various layers – from the widespread practice of fractional reserves to unfair economic reforms.

![image.png](https://lh5.googleusercontent.com/zWBzBCCWdgJgj1odvfitaH6M4DQ77_UyAJV5Gt1Z4PjHWoKdc9RzvSx7BXdkrFycNRxnNKuWDDMHMtahwbqtmgPtaKud1APToXG7liqAkSbD3TbfsV_TBeDiJfWORTN6h6rToVSm) _Bitcoin monetary pyramid._

The capacity of Lightning Network channels has been[rising exponentially](https://bitcoinvisuals.com/ln-capacity) this year, with over 2000 bitcoin currently dedicated to the transaction layer providing a capacity of more than $80 million for its users to perform instant, near-costless transactions all around the world.

But there’s more to Bitcoin layers. A third layer is built on top of the Lightning Network graph – a value and data transfer layer. This is still a very recent development (Lightning Network itself has been live only since 2018), but it is one to watch in the future. So far, the most promising projects are[RGB](https://www.rgbfaq.com/faq/what-is-rgb), an asset issuance network;[LN Markets](https://lnmarkets.com/), a bitcoin derivatives platform;[Sphinx Chat](https://sphinx.chat/), a privacy-preserving messenger; and[Impervious API](https://www.impervious.ai/), a programmatic layer for secure P2P data transmissions.

### **Conclusion**

Finally, we are able to address the criticism from the beginning of this article adequately. Bitcoin isn’t comparable to Visa or PayPal simply because it doesn’t make sense to compare across the monetary layers. Onchain bitcoin is the base layer where we find money proper in the form of bitcoin, the asset. It is where the final settlement in the form of an on-chain transaction occurs. If we were to compare Bitcoin with the current financial system in terms of settlement speed, the appropriate comparison would be with the likes of SWIFT – where the final settlement for cross-border transactions takes days. Visa or PayPal, on the other hand, is comparable with the Lightning Network.

Viewing Bitcoin through the lens of layered money allows us to understand why Bitcoin is evolving the way it is. The layered approach reflects the historical evolution of money, where each layer provides for a more complex use case over the preceding one.

The base layer in the form of blockchain is robust and simple, having just enough capability to achieve decentralized and distributed consensus, execute the algorithmic monetary policy, perform large settlements, and enter simple, smart contracts to open up a transaction layer. Development on the base layer follows a conservative path, as the base layer provides the foundation for further layers.

The transaction layer in the form of the Lightning Network has slightly expanded capabilities over the base layer. However, its primary function is to scale up the Bitcoin transaction capacity to the level of modern payment networks such as Visa or PayPal. Further layers built on top of the Lightning Network graph allow for yet more complex use cases – always with the cryptographic assurances to fall back to the previous layer if something goes wrong. Thus, each subsequent layer makes the preceding one stronger and more valuable without compromising on security.

Indeed, there are also attempts to construct trust-based layers on top of Bitcoin via federated sidechains and wrapped bitcoin on other blockchain platforms. When building bitcoin-focused services, it’s crucial to realize the trade-offs of various layers, whether they are appropriate for our intents, and how we communicate them with potential users.&nbsp;

It’s also important to remember that these are still the early days, and bitcoin’s short-term price can be manipulated. This is mainly caused by relatively low market capitalization (compared with other markets such as gold or securities) and a global market that is active 24/7. So while bitcoin’s volatility decreases over the years, it’s best not to speculate on short-term price moves and zoom out.&nbsp;

We will address these concerns in more detail in future articles.

