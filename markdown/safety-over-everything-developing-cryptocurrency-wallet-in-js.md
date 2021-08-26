---
title: Safety over everything: developing cryptocurrency wallet in js
excerpt: MyEtherWallet’s great success already proved, that having a cryptocurrency wallet in a browser is an interesting idea. At the end of the day, you cannot rely on the browser nor the dependencies you have or the lack of them when it comes to security.
date: 2019-09-10T23:37:28
slug: safety-over-everything-developing-cryptocurrency-wallet-in-js
---

# Safety over everything: developing cryptocurrency wallet in js

MyEtherWallet’s great success already proved, that having a cryptocurrency wallet in a browser is an interesting idea. First, it’s portable and easy to install. Furthermore, thanks to private browsing and statelessness it’s quite secure (I’d argue it can easily be made more secure than a typical desktop app) and if integrated with a hardware wallet, the security is perfect. Since Cardano [cryptocurrency](https://inside.vacuumlabs.com/category/crypto) is growing popular and it did not have a similar platform, we decided to take the challenge and start developing our solution for it. It’s called AdaLite and here’s how and why we did it.

## Daedalus’s Labyrinth
<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="626" src="https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-1024x626.jpg" alt="" class="wp-image-4118" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-1024x626.jpg 1024w, https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-300x183.jpg 300w, https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-768x469.jpg 768w, https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-1536x939.jpg 1536w, https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-2048x1252.jpg 2048w, https://vacuumlabs.com/wp-content/uploads/2021/02/labyrinthFull-1294x791@2x-1294x791.jpg 1294w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

There are currently more than 10,000 .js production files, that the official Daedalus wallet depends on. These are downloaded from the npm registry without any guarantee that they don’t include any malicious code. May any of these dependencies contain a key-logger, which is indeed easily doable, your security is screwed. Of course, this is a common problem of many javascript applications, but it’s especially important here when dealing with money.

[related\_article]

Yes, there are paper wallets for Daedalus, but in general, they may help you only against some almost trivial attacks. Fundamentally, it’s more a quick-fix than a proper solution; a hardware wallet integration.

Another sad fact is that Daedalus has to store and sync the whole blockchain to work and this is time and disk space consuming.

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="626" src="https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-1024x626.jpg" alt="" class="wp-image-4119" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-1024x626.jpg 1024w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-300x183.jpg 300w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-768x469.jpg 768w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-1536x939.jpg 1536w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-2048x1252.jpg 2048w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_1_FS-1294x791@2x-1294x791.jpg 1294w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

However, we don’t like to complain in vain, so we decided to address those issues by coming up with our own Cardano light wallet implementation. Lacking a precise enough Cardano technical specification, we resorted to reverse-engineering Daedalus’s backend from the Cardano codebase, made mostly in Haskell.

## Achieving Security

Those are the principles we are following to make our light wallet as safe as possible:

### Make the project publicly auditable and easy to review

The source code is available on [GitHub](https://github.com), you can review it, build it yourself locally and compare the resulting bundle with the one hosted on the site. The most relevant part of the code is around two thousand lines of ES6 JavaScript, which is a lot less than the official Cardano implementation of Daedalus and it’s certainly more readable for the majority of developers, as opposed to Haskell.

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="626" src="https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-1024x626.jpg" alt="" class="wp-image-4120" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-1024x626.jpg 1024w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-300x183.jpg 300w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-768x469.jpg 768w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-1536x939.jpg 1536w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-2048x1252.jpg 2048w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_2_FS-1294x791@2x-1294x791.jpg 1294w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>
### Keeping compatibility with the official wallet

We are aware that at any time our wallet may stop working because some breaking change in Cardano might be released. However, since we replicate the way Daedalus is deriving addresses from the passphrase, you can always fall back to it, i.e. recover your wallet from the passphrase.\* If the change was breaking even for Daedalus, you can rely on the same instructions that would be provided to its users by the official community; therefore you don’t have to be afraid about being locked out from your funds in such case.

> \*to be efficient, we generate the addresses deterministically which is indeed a difference from Daedalus, that does it randomly. However, it’s not a difference that would prevent Daedalus from being able to recover a CardanoLite wallet. It’s a “problem” only the other way around.

### Hardware wallet support

At the end of the day, you cannot rely on the browser nor the dependencies you have or the lack of them when it comes to security. We realise that currently there is probably no better way to provide a reasonable level of security for cryptocurrency wallets but to manage your private keys and sign your transactions with a dedicated device. That’s why we integrated AdaLite with Trezor Model T and Ledger Nano S, so virtually no matter what goes wrong in your computer or the network, you can be quite confident that your private keys are safe, never leaving the circuits of the hardware wallet.

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="626" src="https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-1024x626.jpg" alt="" class="wp-image-4121" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-1024x626.jpg 1024w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-300x183.jpg 300w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-768x469.jpg 768w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-1536x939.jpg 1536w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-2048x1252.jpg 2048w, https://vacuumlabs.com/wp-content/uploads/2021/02/content_3_FS-1294x791@2x-1294x791.jpg 1294w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

[cta\_to\_website]

At the end of the day, you cannot rely on the browser nor the dependencies you have or the lack of them when it comes to security. We realise that currently there is probably no better way to provide a reasonable level of security for cryptocurrency wallets but to manage your private keys and sign your transactions with a dedicated device. That’s why we integrated AdaLite with Trezor Model T and Ledger Nano S, so virtually no matter what goes wrong in your computer or the network, you can be quite confident that your private keys are safe, never leaving the circuits of the hardware wallet.

