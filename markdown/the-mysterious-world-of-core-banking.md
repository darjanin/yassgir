---
title: The Mysterious World of Core Banking
excerpt: Exploring new paradigms of core banking technology
date: 2019-12-15T15:57:44
slug: the-mysterious-world-of-core-banking
---

# The Mysterious World of Core Banking

In our [last article](https://inside.vacuumlabs.com/fintech/one-provider-to-build-it-all) of the “build your own bank” series, we explored innovative partners who deliver out-of-box banking services; from licensing to the technology stack. In this article, we will take a closer look at the very foundation of the banking stack – the core.  
  
Gartner defines core banking as a ‘back-end system that processes daily banking transactions and posts updates to accounts and other financial records. Core banking systems typically include deposit, loan and credit processing capabilities, with interfaces to general ledger systems and reporting tools’.  
  
From a tech perspective, core banking would typically be composed of (relatively) simple transaction and balance holding systems.&nbsp;  
  
What typically causes the incredible complexity in banking is the interconnectedness of these systems within legacy system architectures which have been incrementally layered upon over years and years of their service.  
  
Core banking replacement projects can take literally years, even in mid-sized banks. This is due to the direct or indirect implication on almost every system, business or reporting process and in the end, on the customer journeys too.  
  
To no one’s surprise, the incumbents usually treat these back-end systems in an _‘if it is not broken, don’t fix it’_ manner, especially considering the expense and risk related to replacing core banking systems while.  
  
Decades-old technology plagues this part of banking stack hidden for from the executive and customer view. It is no wonder that in this part of the banking world, COBOL, a programming language originally invented in 1959 is still a force to consider. Reuters has reported that COBOL-based systems working say that 95% of ATM transactions pass through COBOL programs, 80% of in-person transactions rely on them, and over 40% of banks still use COBOL as the foundational technology of their systems.

## The Tide Is Changing

Enter the new wave of financial services. Beyond the customer-facing businesses such as Revolut or Monzo lies a layer of innovation that uproots the very basis of legacy banking. New core banking platforms built with no technology debt and architecture which responds to the age of digital-first, cloud-based and super-agile businesses.  
  
Let’s explore some of these players now.

## Thought Machine

Set up in London in 2014 by Paul Taylor, Thought Machine is boldly claiming to be building technology to revolutionize banking with a heavy-hitting tech team –&nbsp; their CEO, CTO, CIO, and COO are all former Google engineers. In October 2019, Thought Machine made it to Fintech 50 – an annual ranking of the hottest fintech startups in Europe amongst the likes of Monzo or Revolut.  
  
Thought Machine scored Lloyds Banking Group as one of the lead investors in their Series A financing round – with Lloyd acquiring a 10% stake in the fintech for an £11m investment. In terms of customers, it has recently announced partnerships with the likes of IBM and challenger Atom Bank.  
  
At the core of Thought Machine’s offering sits Vault, a core banking platform designed and written from the scratch, driven by microservice API architecture and native to the cloud.  
  
This is how Thought Machine describes their engine: “Vault can run any type of banking product, from mortgages to current accounts. It has a workflow engine which defines how the bank operates. All data runs in real time within the system, meaning data analytics and regulatory reporting can be fully automated. Customer Apps and APIs create the ability to have fully automated customer interaction.”  
  
This Google-like approach to banking is heavily reliant on cloud, enabling quick deployment and horizontal scaling. At the very heart of Vault lie immutable ledgers which hold the single source of truth of any bank instance.&nbsp;  
  
These ledgers include a transactional database and then something dubbed ‘smart contracts’. Not to be mistaken with the Ethereum implementation, in Thought Machine semantics smart contracts are a way to implement the product logic – from current account to a credit card – into their system. These contracts hold both the legal side of the contract and product servicing.

<figure class="aligncenter"><img src="https://vacuumlabs.com/wp-content/uploads/2019/12/thought_machine-1024x531.png" alt="though machine banking revolution" class="wp-image-1167"><figcaption>Thought Machine <a href="https://www.thoughtmachine.net/">Website</a></figcaption></figure>

## Mambu

Founded in 2011 and hailing from Berlin, Mambu is one of the original core banking tech innovators. Among its current customers, you can find household fintech names such as N26 or a SME lender Oaknorth, but also legacy players such as ABM Amro.  
  
At the heart of their offering lies a cloud platform for banks and lenders which optimizes for speed, agility and ‘puts customer relationships’ first. What does that mean in terms of the technology? At core of Mambu’s offering there are two core pieces at play:

- **The Cloud Banking Engine** is the cloud-based platform enabling account origination, lending, deposits and associated transaction with an exposed API
- **The Process Orchestrator** empowers banks to quickly integrate or ‘compose’ their IT landscape with integrations and business processes, delivered as-a-service

<figure class="aligncenter"><img src="https://vacuumlabs.com/wp-content/uploads/2019/12/mambu_architecture-1024x725.png" alt="core banking infographic" class="wp-image-1145"><figcaption>Mambu Architecture (source: <a href="https://cdn.sanity.io/files/0k2k2bbv/production/5019753fe5e8c59a89198c60f175c2efaa961716.pdf">Introduction to Composable Banking whitepaper</a>)</figcaption></figure>

Mambu packs all of this under the premise of composable banking. According to Mambu, composable banking is an _“approach to the design and delivery of financial services based on the rapid and flexible assembly of independent, best-for-purpose systems. Instead of locking these functions together for dedicated applications and workflows, composable banking separates the functions so they can be combined and recombined in new ways to deliver new services and customer experiences.”_  
  
In other words – banking stack composed of self-contained components which can be mixed and matched, are scalable and connectable via APIs, deployed in cloud and natively supporting lean delivery of new customer experiences.&nbsp;  
  
We are of course only dabbing at the surface of the technology here – for more information take a look at Mambu’s composable banking [whitepaper](https://cdn.sanity.io/files/0k2k2bbv/production/5019753fe5e8c59a89198c60f175c2efaa961716.pdf).

## Five Degrees

Founded in 2009, [Five Degrees](https://www.fivedegrees.com/) hails from The Netherlands. The company offers two clearly separable products.

- **Matrix Mid** As the same suggests, this is a product for banks with legacy systems which are not looking to replace all of their stack. Instead, it serves as a middleware option which can integrate with any legacy core banking. The key selling point here is that it enables banks to create a holistic view of a customer by separating customer data and interactions from everything else. Why is this important? By taking control of _‘onboarding, transactions, documents, and all customer interactions’_ the banks can offer a more personalized and tailored customer experiences and journeys. In addition, this technology layer is built with open banking in mind, helping banks to comply with regulations such as PSD-2 and more easily open up to a fintech ecosystem.
- **Matrix Accounts** is the end-to-end core banking platforms that enables issuing a suite of core banking products including single and multi-currency cash accounts, term deposits and loans. The platform also supports payments functionality ‘out of box’ such as SEPA, SWIFT and internal payments. Similarly to Mambu and Thought Machine, the platform is built with modern tech principles in mind, based on micro-services architecture and highly componental.

## Who Is This For?

The three players we shortly introduced have a fair amount of commonalities, at least when it comes to the first principles of the technology architecture. Cloud-based and continuous deployment, microservices, self-contained components and exposed APIs are just a few key principles they abide by.&nbsp;  
  
Who are the target customers for these new technologies?  
  
For incumbent banks, the underlying issue is the sheer complexity of replacing the core banking from the ground up. This is where solutions such as Five Degrees’ Mid Matrix might provide the best effort to value in the short-term for their core business. There are parts of&nbsp;their business – such as launching a new brand or business line where even incumbents can take advantage of. ABN-AMRO is a fitting case in point here. The bank has utilized Mambu to launch new10, an SME banking proposition in the Dutch market and Five Degrees’ technology to launch Kendu, a retail investment app.  
  
On the other side of the spectrum, some of the top tier of fintech unicorns with significant amount of resources at their disposal (such as Monzo and Revolut)&nbsp; opt to build out these systems from scratch and in a proprietary way.&nbsp;  
  
Most new players to the fintech and banking world with an ambition to launch a banking product are truly the sweet spot. An investment to develop a core banking system from zero simply does not make sense. Vendors such as Mambu, Thought Machine and Five Degrees are welcome news as they provide another point of opportunity to leapfrog the incumbents and challenge the status quo of financial services.

