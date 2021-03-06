---
title: An Isolated Place: Writing Software for Crypto Hardware Wallets
excerpt: Today, we want to take you on a tour through the odd world of hardware wallets. Over the years, Vacuumlabs engineers have gained extensive experience with this technology, so it seemed fun to share some of the learnings with fellow developers…
date: 2021-07-22T11:32:19
slug: writing-software-for-crypto-hardware-wallets
---

# An Isolated Place: Writing Software for Crypto Hardware Wallets

Vacuumlabs is the official partner to offer hardware wallet support for the Cardano ecosystem which, in turn, is one of the most active and engaged blockchain communities in the world. Vacuumlabs engineers develop and maintain the official Cardano libraries for both Trezor and Ledger — the two dominant hardware wallet vendors.

Today, we want to take you on a tour through this odd world. Over the years, Vacuumlabs engineers have gained extensive experience with this technology, so it seemed fun to share some of the learnings with fellow developers…

## **What is a hardware wallet?**

A hardware wallet is a physical device that stores the private keys to sign cryptocurrency transactions. Every address that holds cryptocurrencies such as Bitcoin, Ethereum or Cardano is composed of two keys: a public key and a private key. The public key is roughly the equivalent to a username or bank account number — something that other users can recognize as a place to send tokens to — while the private key is the equivalent to a _password_ to log into that account. The private key is needed to sign or “approve” outgoing transactions from the account.

In an environment without any middlemen or options to roll back or reverse malicious transactions, anyone who gains access to the private key of a given account has the ability to steal all the funds on that account without any way to reverse the theft. And given that anyone can easily find out which accounts hold large balances with hundreds of thousands or millions of dollars worth of tokens, the protection of public keys is an important matter.

In order to best protect the private keys, private keys should never be stored on a computer or mobile phone, or even be typed in via a keyboard. After all, whoever gains access to that device — through a silent key logger or other malicious software —&nbsp;might be able to extract the private keys and run off with the money.

A hardware wallet looks roughly like a USB thumb drive, and acts as a box that physically stores the credentials to a crypto wallet, in a way that is entirely isolated from the computer it plugs into. When the hardware wallet is connected to a computer, a user can access his wallet account and prepare a transaction on the laptop. When the transaction is composed, the transaction will be streamed into the hardware wallet —&nbsp;the USB-connected device —&nbsp;and the hardware wallet will upon approval of the user sign the transaction using the private key stored in the hardware wallet. The signed transaction can then be passed back into the computer and published on the blockchain… but, importantly, without the private key ever having left the hardware wallet. Even the computer where the transaction was composed only sees the signed transactions, but not the private key that signed it.&nbsp;

Let’s say that user Bob wants to send 100 tokens to Alice. From Bob’s perspective, the process would look like this:

1. Bob connects his hardware wallet via USB to his computer. He then opens his wallet provider of choice (such as AdaLite).  
2. Upon login, he is prompted for authentication. Bob uses the buttons on his hardware wallet to enter his PIN number, and then unlocks access to the wallet.  
3. On his computer, Bob can now see his token balance, and compose a transaction. Bob enters Alice’s public key, and sets the amount to 100 tokens.  
4. Bob now needs to confirm and finalise the transaction. The wallet provider then streams the transaction data into the hardware wallet.  
5. On the secure display, Bob can see the details of the transaction: the amount of tokens, the address it will be sent to, etc. Bob confirms on the hardware wallet that the details are correct.  
6. The hardware wallet now uses Bob’s private keys to sign the transaction.  
7. The signed transaction is returned to the computer, and streamed out onto the blockchain. In the next block, Bob’s transaction is included, and Alice receives the tokens.  

## **Writing software for hardware wallets presents some unusual challenges for developers…**

A hardware wallet of course needs to have some software to be able to execute the operations it needs to perform: ingesting the unsigned transaction, displaying it to the user for approval, generating the signature, and then pushing the signed transaction back out.&nbsp;

While the private keys for multiple cryptographic assets you might hold on a hardware wallet are all generated from one common seed, each separate blockchain requires its own implementation to sign valid transactions, and thus requires its own little “app” on the hardware wallet to get the job done.

Because security is the primary (if not only) concern for a hardware wallet, writing code for it presents its own and somewhat unusual set of constraints and challenges. In the rest of this article, let’s explore some of them:

**1. Hardware wallets are extremely limited in resources, especially memory**

A hardware wallet has to act as a vault to store and protect the private keys within them. This means the wallet needs to be secure on the software level, but also on the hardware level to protect against hardware exploits. The hardware is very carefully chosen to minimise risks of hardware exploits, and since the memory is obviously the most vulnerable part — since it stores the private keys —&nbsp;memory of hardware wallets is intentionally extremely limited.&nbsp;

As a matter of fact, very few hardware options actually exist that offer strong security properties against physical attacks and exploits. Both Trezor and Ledger have settled on using flash memories that are [extremely small](https://ledger.readthedocs.io/en/latest/userspace/troubleshooting.html?highlight=RAM#not-enough-ram) by today’s standards, Ledger Nano S having literally only several kilobytes of it.

From a developer perspective, this implies that you cannot really hold anything in memory. In fact, development of hardware wallet firmware feels similar to developing for early game consoles: a developer needs to very carefully use and reuse memory, to be able to execute its program and avoid crashes.

The limited memory availability complicates many things a great deal. For instance: you often cannot simply iterate over a data set, but rather need to be extremely explicit and precise about what you need or not need, in order to preserve memory. In the case of Ledger, where you work with the C language, you can easily end up writing things that overwrite the memory or otherwise make low-level mistakes on memory management.&nbsp;

It’s important to note that the memory limitations are created _on purpose_: while it is easy to produce powerful computers, it is very difficult to make powerful computers secure. Progress on hardware wallet development isn’t focused on increasing the computational power of the devices, but rather to keep them simple (and likely more secure). As such, hardware wallets are likely to remain limited in their capabilities for the foreseeable future.

**2. You are stuck with a very limited language to express yourself**

For most jobs, developers have some freedom in picking their language, libraries and tooling of choice, but not for hardware wallets. Each hardware wallet will limit you to whatever the SDK offers you. In Ledger’s case, that means you’ll have to make do with a limited subset of the C language. Trezor is not much different, with Micropython —&nbsp;a limited subset of Python — as the language of choice.

The limiting language and absence of any libraries means that developers work on a very low level of abstraction, and have to build everything pretty much from scratch. It is back to basics, in a big way. The reward, of course, is that it is also quite cool to go back to basics, rather than build on layer upon layer of work that others have built before you.&nbsp;

**3. Debugging is limited and… buggy**

The nature of a hardware wallet is that it is a black box —&nbsp;that is the whole design, after all. It also means that debugging is relatively tricky. In the case of Ledger, until recently you had to constantly reload the compiled app into the device every time you change anything. Now [an emulator](https://github.com/LedgerHQ/speculos) is available, although it emulates the device only to a limited extent. Trezor is a little better with a somewhat more mature emulator to aid in debugging, however it still doesn’t 100% mimic the behaviour of the actual Trezor hardware. Debugging a hardware wallet is a bit spartan, and lets you appreciate the great debugging support we have available in other fields of software development.

**4. Security is the essential consideration in your software design**

Needless to say security is constantly top-of-mind as you write the software. This is reflected in the high-level design of the software you write, but goes down to the lowest level. You are building the software equivalent to a vault, so everything needs to be meticulously secured and safeguarded. Under no circumstances should private keys be leaked out of the device or should users be able to sign transactions they didn’t intend to. Any edge case —&nbsp;no matter how unlikely —&nbsp;needs attention and careful management.&nbsp;

**5. Backwards compatibility and change management is tough**

Finally, change management is a constant concern. The field of blockchain technology is constantly evolving, and Cardano —&nbsp;our main concern —&nbsp;is constantly rolling out new functionalities and capabilities. Those changes to the protocol need to also be translated and reflected in the hardware wallets and software that supports it.

As the ecosystem changes, coordination is needed between the various components. In an ideal situation the updates on a protocol level should immediately be reflected in the various wallets and light wallets that support the ecosystem, and that should in turn be in alignment with the hardware wallet implementations.&nbsp;

As you submit changes to the hardware wallet code, constant care is needed to not break any existing integrations — such as software wallets interacting with hardware wallets — when the update goes live. There may be delays of days or even weeks before hardware wallet updates become available to the end-users, so you usually need to update the libraries used by these integrations ahead of time with backward compatibility adjustments, preventing outages as the hardware wallet update is rolled out.

## **My personal perspective on writing software for hardware wallets**

Personally, the experience of writing software for both Ledger and Trezor wallets has been both interesting, challenging and rewarding in unexpected ways. While the above challenges make it tough to write good software, these constraints also force you to go back to basics, and work on a very low level, intimately close to the hardware constraints.

Anyone who has a computer science background will remember professors nerding out over particular kinds of algorithms and their rather academic intricacies. When you are thrusted into the working world, it seems that you never see those algorithms and low-level problems again.&nbsp;

Writing software for hardware wallets is probably the closest I will ever come to writing and analysing these algorithms myself. It’s very unique that you actually use the algorithmic knowledge that you learn about in computer science class. The challenges are far more “pure” in a computer sciences sense than the problems one faces in, say, a web development job.

Hardware wallet software feels like a pretty cool combination of high-level things — such as the software design — and also super low-level problems like security, far-fetched edge cases, and so much more.&nbsp;

If you are the kind of senior developer that is interested in new challenges and working in an environment that pushes you to grow further and strengthen your fundamentals, then Vacuumlabs might be just the place for you. We’re always looking for new colleagues to come join us, so check out the blog to learn more about what we’re up to, or [**jump over to our hiring pages**](http://link.com) to see what might be a good fit for you!&nbsp;

