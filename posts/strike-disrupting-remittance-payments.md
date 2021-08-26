---
title: Strike: Disrupting the remittance payments via Bitcoin’s Lightning Network
excerpt: Strike’s remittance trial in El Salvador paves the way for the future of remittance payments, effectively driving the cost of sending cross-border payments to zero.
date: 2021-05-25T08:51:28
slug: strike-disrupting-remittance-payments
---

# Strike: Disrupting the remittance payments via Bitcoin’s Lightning Network

Strike is a phenomenal application merging fintech and bleeding-edge Bitcoin tech. Strike’s remittance trial in El Salvador paves the way for the future of remittance payments, effectively driving the cost of sending cross-border payments to zero.

### **Bitcoin the network and bitcoin the asset**

Bitcoin is usually perceived as the thing that goes up (or down) in price that people hold, speculate on, buy or sell. That’s bitcoin the asset – usually spelled with a lower case “b”. Bitcoin the asset is the most exciting aspect for most people, and its short-term volatility and long-term upwards trend is the gateway drug to the crypto space.

But besides bitcoin the asset, we have Bitcoin the network – conventionally spelled with an upper case “B “. Bitcoin the network is often neglected and taken for granted as a simple enabler of bitcoin the asset. But Bitcoin, the network, has many exciting features on its own. Let’s take a look:

- it is a global settlement network and knows no borders
- there is no credit and no delayed settlement, as transactions are either unconfirmed or fully settled
- it doesn’t require any identification of its participants (miners, account holders, transaction parties)
- it is fully open-source and permissionless
- it has no single point of failure and doesn’t fall under any single jurisdiction

These are major differences to any existing payment or settlement networks like Visa, PayPal, Swift, Fedwire, etc. Bitcoin as an open, permissionless, global network is positioned to ultimately dominate, as such networks do when competing with permission-walled gardens. It’s a similar story to how Linux ultimately won as a dominating operating system for mission-critical services (most servers today are[running](https://w3techs.com/technologies/comparison/os-linux,os-windows) on a Linux environment).

But the settlement network by itself isn’t enough. As many know, transactions over the Bitcoin network can be slow and costly, especially in times of high transaction demand. That’s why a payment layer called the[Lightning Network](https://www.coincenter.org/education/key-concepts/lightning-network/) is being actively developed on top of Bitcoin. Lightning Network allows users to send bitcoin instantly and with almost zero cost. A $10 payment within Lightning Network arrives within a second, all over the world, and costs three satoshis (1 satoshi is 1/100,000,000 bitcoin), i.e., the cost is $0.0015 or 0.015%. And the good news is the transaction fees aren’t much higher in relative terms with higher volumes. For further explanation of the Lightning Network fee mechanics, see[this blog post](https://medium.com/suredbits/lightning-101-lightning-network-fees-86abbbc17024).

### **Strike**

Strike is a mobile application that cleverly combines the current financial system with Bitcoin’s Lightning Network capabilities. Strike’s founder Jack Mallers initially founded a Lightning-only wallet back in 2017. But he soon discovered the obstacle for the users to utilize Lightning transactions’ tremendous potential fully: users have to use bitcoin the asset. Using bitcoin the asset for daily transactions is a problem for two reasons: the first one is bitcoin’s store of value capability is currently valued highly, and bitcoiners choose to hold bitcoin rather than transact with it. The second reason is the tax consequence: every bitcoin transaction is a taxable event.

Mallers’ solution to overcome both obstacles was to leverage Lightning Network capabilities without exposing users to bitcoin the asset (unless they choose to). So in the fall of 2019, Mallers came up with the idea that became Strike. The most fitting description of Strike is that it’s a _Bitcoin-native neo-bank_ that allows users to send money instantly all around the world, with almost no cost. How is that possible?

Under the hood, Strike works as follows:

1) User connects his conventional bank account to the Strike app

2) User initiates a transaction of $10 from the US to Europe, where the recipient would like to receive €8.2

3) Strike debits the $10 from the sender’s bank account

4) Strike converts the $10 to bitcoin on the Lightning Network

5) Strike sends the bitcoin instantly via Lightning Network to its European branch (or partner institution)

6) Strike converts the bitcoin to €8.2

7) Recipient’s account on Strike is debited €8.2

In the given example, neither the sender nor the recipient came into contact with bitcoin the asset. Still, they were utilizing Bitcoin the network (or rather the Lightning Network built on top of Bitcoin). There is no taxable event.

The interesting part is how the USD gets converted to EUR. There is no Forex market involved. Instead, USD is first converted to bitcoin, and bitcoin is then converted to EUR. Since bitcoin has large liquidity in USD/BTC and EUR/BTC pairs, the resulting rate doesn’t deviate from the Forex rate. Bitcoin markets operate 24/7/365, and bitcoin has sufficient liquidity across dozens of currency pairs.

> _We now have an open monetary network that can physically settle any amount of value, at any time, to any place, at virtually no cost. Combine that with an application that allows you to utilize this open monetary network with your bank account, and you get monumental innovation and pure disruption._
> 
> -Jack Mallers,[Announcing Strike Global](https://jimmymow.medium.com/announcing-strike-global-2392b908f611)

### **Disrupting the remittance market: El Salvador case study**

Strike was publicly launched at the beginning of 2020 and was initially available only to US users. The primary use case in the US was the ability to pay Lightning Network invoices with dollars and vice versa. This fiat-bitcoin payments interoperability proved that Mallers’ vision is workable. So at the beginning of 2021, Mallers announced the intention to go fully global by the end of 2021. And as a surprise to some observers, Mallers chose to focus on developing markets and started to provide remittance services in El Salvador.

El Salvador is a small country in Central America, officially dollarized since 2001 and heavily dependent on remittances, mainly from the US. Around 22% of El Salvador’s GDP comes from remittance payments. But as Mallers points out in a recent[podcast](https://youtu.be/aY5M-er2ybU), a large part of those remittance payments gets siphoned off by financial institutions due to an unfortunate combination of the small size of a typical payment and a fixed cost of a cross-border transaction.

Strike has been active in El Salvador since the beginning of April and reached [#1 in installed apps within three weeks](https://twitter.com/JackMallers/status/1386432966843244545). It seems reasonable to predict that Strike will significantly disrupt the way locals receive money from their relatives abroad. Compared to conventional remittance providers, Strike is instant, doesn’t cut on the payment, has no limits on minimum sent amount, and is mobile-native.

Since the banking infrastructure in El Salvador isn’t as reliable as in the US, Strike allows recipients to hold USD stable coins in the app. The most popular one is currently USD Tether. There is already a well-functioning cryptocurrency community in El Salvador (one of the fast-growing local initiatives is [Bitcoin Beach](https://www.coindesk.com/strike-launches-bitcoin-lightning-payment-app-in-el-salvador-full-eu-support-is-next)). There are many ATMs, merchants, P2P traders, and bitcoin meetups where Tethers can be exchanged for physical dollars or spent directly.

What’s next for Strike after El Salvador? Strike has active beta testers in the Philippines, one of the largest remittance markets in the world. And there are many more countries to come – the best advantage of Strike is that it doesn’t have to build its infrastructure. Bitcoin and Lightning Network infrastructure is developing rapidly, and so are the markets for bitcoin the asset. So all that is necessary for expansion is a local marketing campaign and perhaps a partnership with a local banking provider – but even that may be unnecessary, as we can see in El Salvador, where the US dollar is substituted with a stable coin.

> _Today Strike launched in El Salvador. However, the real victory is Strike launching in an emerging market and providing financial tools to people that have lacked them for centuries. This is only possible because of[#Bitcoin](https://twitter.com/hashtag/Bitcoin?src=hashtag_click). The power of an open monetary network on display._
> 
> -Jack Mallers,[Twitter](https://twitter.com/JackMallers/status/1377405359912968194)

### **Strike charges no fees, so what’s the catch?**

There are no fees associated with Strike payments. For now, Strike is a traditional VC-backed ([$3.5m raise](https://www.coindesk.com/lightning-startup-zap-raised-3-5m-for-bitcoin-app-ahead-of-visa-deal)) startup focused on rapid user growth. According to Mallers, Strike’s business model will leverage the large capacity of its Lightning payment channel. Institutional investors can leverage these channels to make lightning-fast arbitrage trades – something that isn’t possible today without depositing a lot of capital on multiple exchanges. Another possibility that Mallers mentioned previously is the payment for order flow, an approach similar to how[Robinhood](https://www.investopedia.com/articles/active-trading/020515/how-robinhood-makes-money.asp) makes money on its free brokerage service. Perhaps merchants will serve as a revenue stream through acquiring, as Strike’s costs are orders of magnitudes lower than card companies’ due to eliminating chargeback risks.[Strike’s cashback](https://jimmymow.medium.com/announcing-cashback-by-strike-cce2829bc152) trial may also develop into a viable business model.

Whether Strike finds a successful business model or not, it already served as a proof of concept: services merging fintech and Lightning Network are possible and very popular when introduced to communities where they make an enormous impact due to substantial cost savings. Similar projects are already emerging ([Lastbit](https://lastbit.io/)).

It will be exciting to watch Strike and similar startups come head to head with conventional remittance providers. One thing is for sure: the customer always wins when the industry is being radically disrupted through innovation.

