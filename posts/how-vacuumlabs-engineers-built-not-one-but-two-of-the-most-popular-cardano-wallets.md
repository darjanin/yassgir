---
title: How Vacuumlabs engineers built not one, but two of the most popular Cardano wallets
excerpt: What challenges did Vacuumlabs engineers face while building Cardano wallets?
date: 2021-07-07T15:58:59
slug: how-vacuumlabs-engineers-built-not-one-but-two-of-the-most-popular-cardano-wallets
---

# How Vacuumlabs engineers built not one, but two of the most popular Cardano wallets

The success of a cryptocurrency depends on much more than just the core protocol that it’s built on top of. Currencies like Bitcoin or Ethereum are valuable not only because of the technical innovations at the platform level, but also because of the ecosystem of application developers, corporate users, research bodies, liquidity and staking providers, educators and evangelists, and so much more.&nbsp;

Wallets provide amongst the most essential of ecosystem services, enabling users to receive, hold and send their coins in a way that hopefully is both secure and easy to use. As a development agency that is currently actively involved in the crypto space, we’re proud that we have been able to play a direct and significant role in the success of two primary Cardano wallet providers: AdaLite (which we [wrote about earlier](http://link.com)), as well as the ever-popular Yoroi Cardano wallet, for which we developed much of the mobile implementation. We’ve spoken about AdaLite before, so it is about time we shed some light on the development of the Yoroi mobile wallet as well.

## **What is the Yoroi wallet about?**

The Yoroi wallet is a light wallet developed by EMURGO, one of the main development bodies supporting the Cardano project. Light wallets enable users to interact with the blockchain —&nbsp;to send, receive and hold Ada cryptocurrency —&nbsp;without the headaches and complexities of having to run a “full node” wallet. Along with the Daedalus wallet, which is the Cardano official full node wallet, the Yoroi wallet represents the most prominent Cardano light wallet developed by the official Cardano core developers. Yoroi in particular offers access to the Cardano blockchain via a Chrome extension as well as a mobile application.

The EMURGO team tasked with developing what would become the Yoroi wallet started off with the browser extension implementation but ran short of development capacity for developing the mobile version of the wallet. Since Vacuumlabs engineers already had a&nbsp; proven track record of reverse engineering the Cardano Haskell codebase to enable the AdaLite wallet, it was clear that we would be amongst the most qualified developers available to help out in developing the Yoroi mobile implementation as well.

## **Challenges in building the Yoroi mobile wallet**

Of course, building a project like a cryptocurrency light wallet is never without problems. Given our experience with AdaLite, we already had intimate knowledge of the blockchain we would be building for, but the particularities of the mobile implementation of a light wallet still provided more than enough of a challenge along the way.  
  
The first problem? Hardware encryption on Android.

### **The state of hardware encryption on Android**

Back in 2018, the state of hardware encryption on Android devices was a nightmare. Since we were developing a wallet that will potentially hold and secure millions of dollars worth of cryptographic tokens, encryption and security is the primary concern.&nbsp;

Anyone who interacts with the blockchain would of course like to encrypt his credentials to the blockchain. Ideally those credentials are stored in the device’s “security enclave”, which acts like a vault inside of your mobile phone to store sensitive information like your private keys and guards it against other (potentially malicious) apps. The problem here was that in 2018 the secure part of the system was still very much evolving and maturing, and each version of Android had a slightly different API. In effect, this meant that for various types of Android devices running multiple versions of the Android software, we would each be developing version-specific code to ensure security. We spent quite some time to make sure to have proper support for all the Android versions up from Android 5. Developing very specialised code for each of these versions effectively meant an enormous weight on the technical team.&nbsp;

### **Keeping properly synchronized transactions**

Besides keeping all the various Android versions secure and optimised, we also ran into problems of transaction synchronization to the blockchain.&nbsp;

One of the most fundamental and key properties of a blockchain is that at any time a blockchain might reorganize itself to keep following the longest chain of transaction blocks. This means that at any time reorganisations might happen where the last few blocks of transactions disappear and become invalid, and the network switches to following a different (longer) chain. From a technical point of view as a wallet developer, this means that the last few transactions could disappear because we effectively roll back a few blocks, and new transactions appear instead.&nbsp;

In order to keep things functional, wallets need to know at any moment in time exactly what the current state of the blockchain is. The hard part about this is that you need to design the system in such a way that it can recognize these reorganizations, and synchronize them correctly. A mobile wallet needs to be built for handling situations where such reorganizations happen while being offline. Yoroi had to cache the transactions, load them at the appropriate moment, and load things incrementally in order to avoid overloading the server.&nbsp;

Compared to the first problem of keeping Android versions secure, this challenge was quite different in nature, and more of a conceptual challenge where you need to think through how to approach these state synchronization issues. We ended up writing a very detailed technical document to outline how synchronization would have to be approached for the Yoroi wallet and then implemented things accordingly.&nbsp;

## **A successful EMURGO collaboration**

It ultimately took four of our developers 3-4 months to build the mobile implementation of the Yoroi wallet, and we’re incredibly proud that the Yoroi wallet is and probably will continue to be one of the most heavily used crypto wallets for the Cardano protocol. As the Cardano network further expands and matures, so will the role of its wallets increase.

We are grateful for the direct collaboration between the technical teams of both EMURGO and Vacuumlabs, where our engineers got to spend a lot of time with the senior technical staff of EMURGO. We constantly worked in a way to enable the first versions of the Yoroi mobile wallet to be shipped to EMURGO early in the process, so we could together iterate on it to add functionalities and capabilities. We started very simple, so people could already test it and play around… and then simply built from there.

Since our successful collaboration on the Yoroi project, Vacuumlabs and EMURGO have spent more time together building further projects and also collaborate actively with IOHK —&nbsp;the other core development team of the Cardano project —&nbsp;to offer hardware wallet implementations for the network.

All in all, our engineers are proud of having built not only the first and still most popular web-based Cardano wallet (AdaLite) but also the mobile implementation for the even-more-popular Yoroi wallet. It has been an exciting experience to be involved in the Cardano project, and we are even more excited about the future of Cardano.&nbsp;&nbsp;

If you want to hear more about Yoroi project, listen to our Banking on Air episode:

<iframe border="0" class="player__iframe" src="https://anchor.fm/insidethevacuum/embed/episodes/32-Yoroi-and-future-of-blockchain-with-Vicente-Almonacid-EMURGO-e11ilih" width="100%" height="100%" scrolling="no" frameborder="0"></iframe>

**WHERE TO LISTEN** &nbsp; &nbsp;[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/Apple-Podcasts.png)](https://podcasts.apple.com/us/podcast/inside-the-vacuum/id1505101625?uo=4 "Apple-Podcasts")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/Breaker.png)](https://www.breaker.audio/inside-the-vacuum "Breaker")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/Google-Podcasts.png)](https://www.google.com/podcasts?feed=aHR0cHM6Ly9hbmNob3IuZm0vcy8xODhkNTE2OC9wb2RjYXN0L3Jzcw== "Google-Podcasts")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/Overcast.png)](https://overcast.fm/itunes1505101625/inside-the-vacuum "Overcast")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/PocketCasts.png)](https://pca.st/jdvlp9mq "PocketCasts")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/Spotify.png)](https://open.spotify.com/show/2wKh1nEPsvZfJc8nZFBFah "Spotify")[![](https://vacuumlabs.com/wp-content/plugins/podcast-subscribe-buttons/assets/img/icons/RSS.png)](https://anchor.fm/s/188d5168/podcast/rss "RSS")

