---
title: Moving your bank to the cloud. The right way.
excerpt: Why deploying your bank to the cloud is very different from using a cloud-native core banking engine
date: 2020-08-28T11:20:52
slug: moving-your-bank-to-the-cloud-the-right-way
---

# Moving your bank to the cloud. The right way.

Banking technology has evolved significantly over the past century. We have witnessed several significant shifts in the core tech stacks used to power banks, from pen and paper through the full digitization of records.

<figure class="wp-block-image size-large"><a href="https://resources.vacuumlabs.com/thought-machine-paper"><img loading="lazy" width="644" height="369" src="https://vacuumlabs.com/wp-content/uploads/2021/02/image.png" alt="" class="wp-image-4274" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/image.png 644w, https://vacuumlabs.com/wp-content/uploads/2021/02/image-300x172.png 300w" sizes="(max-width: 644px) 100vw, 644px"></a><figcaption>Although this article is intended for a general reader, there might be some parts, which are for a more technical audience. <a href="https://resources.vacuumlabs.com/thought-machine-paper">Read more here</a></figcaption></figure>

When technology began to make its way into banking technology we saw the mainframe play a central role in an industry that still relied on its branch presence for traffic. Updates to the ledger took place at the end of the day, around 5 pm when the branches closed. End of day positions were calculated, the daily positions were then collected and placed in a centralized ‘general ledger’, that acted as the centralized repository for accounting data. These days experienced slow and unreliable server communication because this was before the age of the internet.  
  
As we moved into the 1980s, consumer banking evolved to be less branch centric; the next generation systems extended to support emerging channels such as ATMs and call centers. As consumer demand changed, and 24/7 banking became the norm, banks built systems to authorize payments using basic computer logic standing-in for the core and then passed on the changes at the end of the day to the core.  
  
Eventually, the third generation of core banking systems emerged, which could parameterizable product engines, making any changes to the fees, product portfolio or card programs became cheaper and less risky. However, since they were often tightly coupled to their respective UIs, it could be challenging to compose this newfound flexibility in novel ways. These systems still chiefly use batch-based processing and are still monolithic in style. Since there was no link to the expensive yet effective mainframe, they can actually be less resilient and perform worse than their predecessors.  
  
In the first decade of the 21st century, facing increasing pressure from the market to ‘move to the cloud,’ banks and their vendors often employed a lift and shift strategy. This saw banks containerize their monolithic app server, and deploy it on the cloud. Although this technically qualifies as a cloud strategy, it is not an effective one because the actual benefits, notably elastic scalability, is not accessible. In essence, banks are dealing with the same monolithic server, but now with a more expensive data center.

## Sealing the technology gap with tape and hope

Moving to the cloud with multiple generations of core banking platforms proved tricky. Banks typically opted for one of three equally problematic strategies: shimming the mainframe, hollowing out the core, or just cosmetically moving app servers to the cloud.  
  
This means that initial capital expenses are eliminated and it converts a lot of the infrastructure cost into operational expenses and in many cases you only pay for what you use. Moving or expanding infrastructure to new regions or creating redundancies is significantly easier than having to buy endless new servers blades and hardware  
  
This shift creates some challenges. You are just moving what was designed to work in a completely different self-hosted environment into the cloud. It is like putting a car engine from a car made in the 80s into a brand new car. It will most likely work if you try hard enough, but the car is severely limited because these old engines had no sensors to check for problems, optimize fuel consumptions or for example work in conjunction with a hybrid battery.  
  
There is, however, another way: Cloud-native core banking engine!  
  
Following the previous analogy, with a cloud-native core you are putting a modern engine into a modern car. You can use all the bells and whistles of the cloud and even go completely serverless and only use cloud functions. You are very much in the 21st century and have the capability to use all the features that appear.  
  
On top of that, an emerging term that banks are using to describe their transformation needs is the “headless core,” which means it is no longer bound to a specific green screen terminal window or custom app. It is API-only and stream-based, designed for the 24/7/365 world of the 21s century.

<figure class="wp-block-table is-style-stripes"><table><tbody>
<tr>
<td></td>
<td><strong>Mainframe monolith</strong></td>
<td><strong>Hybrid monolith</strong></td>
<td><strong>Cloud-native</strong></td>
</tr>
<tr>
<td><strong>Emergence</strong></td>
<td>1970-1990s</td>
<td>Late 1990s</td>
<td>Late 2010s</td>
</tr>
<tr>
<td><strong>Product engine</strong></td>
<td>Static</td>
<td>Parameterisable</td>
<td>Hyper-flexible</td>
</tr>
<tr>
<td><strong>Messaging</strong></td>
<td>Batch</td>
<td>Batch + Events</td>
<td>Stream</td>
</tr>
<tr>
<td><strong>Interface</strong></td>
<td>Terminal</td>
<td>Specific channels</td>
<td>Headless</td>
</tr>
<tr>
<td><strong>Connectivity</strong></td>
<td>Server/Client + RPC</td>
<td>API + File transfer</td>
<td>API only</td>
</tr>
<tr>
<td><strong>Portability</strong></td>
<td>Mainframe</td>
<td>App server</td>
<td>Cloud / Agnostic</td>
</tr>
<tr>
<td><strong>Availability</strong></td>
<td>Single Data center</td>
<td>Multi zonal</td>
<td>Multi-regional</td>
</tr>
<tr>
<td><strong>Architecture</strong></td>
<td>Monolith</td>
<td>Monolith</td>
<td>Microservices</td>
</tr>
</tbody></table></figure>

The core banking engine Vault has been written purposefully as a cloud-native by [Thought Machine](https://thoughtmachine.net/?utm_source=Vacuumlabspartnership&utm_medium=Article&utm_campaign=TM2) from its inception. Vault is built around APIs using a microservice architecture. The services within Vault constitute a significant portion of all the functionality required to run a bank. For example, they are currently powering Asia’s first all-in-one numberless bank card and virtual bank [Mox](https://mox.com/):

<figure class="wp-block-image size-large"><img loading="lazy" width="1024" height="308" src="https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-1024x308.png" alt="" class="wp-image-2572" srcset="https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-1024x308.png 1024w, https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-300x90.png 300w, https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-768x231.png 768w, https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-1536x462.png 1536w, https://vacuumlabs.com/wp-content/uploads/2020/08/Frame-242-2048x615.png 2048w" sizes="(max-width: 1024px) 100vw, 1024px"></figure>

Vault’s Configuration Layer enables a bank to achieve a wide scale of customization without changing anything in the underlying platform. It is highly advantageous and key part of how Vault’s architecture is a counterweight to the “spaghetti” that arises in other systems when customization and platform functionality are not separated.  
  
Vault is a “headless core” essentially meaning it is agnostic to the apps and interfaces it provides access to. Whether you are launching a new challenger bank, building a new banking product or completely re-platforming your existing bank stack, you will need a guide by your side to help you build out all the necessary interfaces and applications needed to achieve the experience you want for your customers.  
  
Vacuumlabs specializes in building digital products and tools for fintechs and banks. We have been doing this for challengers like [Twisto](https://www.vacuumlabs.com/projects/twisto), [Cledara](https://www.vacuumlabs.com/projects/cledara), Railsbank, and even worked with Though Machine to help integrate Thought Machine with various third party providers into one cohesive app experience on some of their major client successes:

_&nbsp;“Vacuumlabs is providing us with experienced software engineers who are helping us build the bank from the ground up.”_ CEO of Mox Bank: [Read more here](https://issuu.com/gigabitmagazine/docs/fintech_september2019/12)

<figure class="alignright size-large is-resized"><a href="https://issuu.com/gigabitmagazine/docs/fintech_september2019/12"><img loading="lazy" src="https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine-1024x841.png" alt="" class="wp-image-2569" width="363" height="298" srcset="https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine-1024x841.png 1024w, https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine-300x246.png 300w, https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine-768x631.png 768w, https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine-1536x1262.png 1536w, https://vacuumlabs.com/wp-content/uploads/2020/08/fintechmagazine.png 1568w" sizes="(max-width: 363px) 100vw, 363px"></a></figure>

At Vacuumlabs, we have teamed up with Thought Machine to put together a guide on building a future proof digital cloud-native bank with Thought Machine at its core while building a world-class customer experience with help from Vacuumlabs.

<figure class="alignleft size-large is-resized"><a href="https://resources.vacuumlabs.com/thought-machine-paper"><img loading="lazy" src="https://vacuumlabs.com/wp-content/uploads/2021/02/image-1.png" alt="" class="wp-image-4275" width="182" height="182" srcset="https://vacuumlabs.com/wp-content/uploads/2021/02/image-1.png 352w, https://vacuumlabs.com/wp-content/uploads/2021/02/image-1-300x300.png 300w, https://vacuumlabs.com/wp-content/uploads/2021/02/image-1-150x150.png 150w, https://vacuumlabs.com/wp-content/uploads/2021/02/image-1-208x208.png 208w" sizes="(max-width: 182px) 100vw, 182px"></a></figure>

You can download the document here.   
[**Download and read now**](https://resources.vacuumlabs.com/thought-machine-paper)

