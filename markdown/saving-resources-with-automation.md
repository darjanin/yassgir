---
title: Saving resources with automation
excerpt: No spaghetti software engineering saved Kiwi 1,800 man-days of manual work
date: 2020-05-07T16:50:45
slug: saving-resources-with-automation
---

# Saving resources with automation

It’s nothing new that automation and digitalization are transforming the job market. Tons of work can now be done more efficiently with good software engineering, allowing to transfer human work to more important tasks. Our client Kiwi, a flight search engine, asked us four years ago to help them with development.  
  
Our collaboration has brought lots of Kiwi fruits, enabling them to save 1,800 man-days of manual work, speed up the search, retain customers, increase revenue and many more features. This is how we did it.

###   
Detecting the disruptions

Online travel search engines have to deal with thousands of disruptions, delays or cancellations per day. These are the nightmares for both customers and customer support agents. Our flexible development team has found a solution saving 1,800 man-days of manual work of one customer support agent. The tool, processing 20,000+ requests, detects any disruptions in travel routes and automatically offers alternative trips customized for the user or refunds. Besides saving tons of manual work of customer service, the automation tool helps to retain customers and revenue that would otherwise be lost.  
  
Compared to the previous state, our tool helped to erase seven steps in the workflow of a customer support agent. One e-ticket would, for example, start with obtaining information about the disruption, reviewing it, finding an alternative route, comparing it, sending it to the customer, waiting for their response, updating the booking and, finally, resolving the e-ticket. Pretty complex, right? One e-ticket could easily take one hour.

<figure class="wp-block-image size-large"><img loading="lazy" width="2796" height="1398" src="https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771.png" alt="Kiwi" class="wp-image-1963" srcset="https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771.png 2796w, https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771-300x150.png 300w, https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771-1024x512.png 1024w, https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771-768x384.png 768w, https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771-1536x768.png 1536w, https://vacuumlabs.com/wp-content/uploads/2020/05/Screenshot-2020-05-07-at-12.37.03-e1588848004771-2048x1024.png 2048w" sizes="(max-width: 2796px) 100vw, 2796px"></figure>
### Tools for human touch

We also managed to develop tools for Kiwi that speed up workflows of its customer support agents. Whenever manual handling is needed, agents can use the tools. Also, we have built an emergency situation tool to set up a flow for thousands of bookings in just a few minutes. The effectiveness saves tons of time, effort and costs associated with handling these situations manually.  
  
The service is built on a microservices [architecture](https://inside.vacuumlabs.com/category/technology) running on the GCP. Each service can work as a synchronous request/response, HTTP server or asynchronous worker where the tasks are processed from the queue. Both types of consumers can scale independently. For HTTP server we use CPU, for queue workers we use the number of unprocessed tasks. Currently, there are 8 types of services where each of them is responsible for part of the processing. For example, store data about received changes, find affected bookings, prepare suitable alternatives, etc. We are using Python3, PostgreSQL, Redis, Elasticsearch.

<figure class="wp-block-image size-large"><img loading="lazy" width="1123" height="601" src="https://vacuumlabs.com/wp-content/uploads/2020/05/kiwi-case-spiderman4.png" alt="Kiwi" class="wp-image-1965" srcset="https://vacuumlabs.com/wp-content/uploads/2020/05/kiwi-case-spiderman4.png 1123w, https://vacuumlabs.com/wp-content/uploads/2020/05/kiwi-case-spiderman4-300x161.png 300w, https://vacuumlabs.com/wp-content/uploads/2020/05/kiwi-case-spiderman4-1024x548.png 1024w, https://vacuumlabs.com/wp-content/uploads/2020/05/kiwi-case-spiderman4-768x411.png 768w" sizes="(max-width: 1123px) 100vw, 1123px"></figure>
### Improving Kiwi’s user experience

Our Kiwi extended team has grown from one member to a dozen developers, a UX designer and one tester. Over the course of four years, the team took over the landing page and search page module. We also did two full redesigns.  
  
Continuous UI/UX and code improvements produced a cut in a mobile load from five to two MB. Also, it improved loading time by 335% and brought 20% more users to the website. Backend improvements also resulted in a thirty-per-cent increase in online booking process speed.&nbsp; The collaboration helped Kiwi to grow its business and deliver the best customer experience possible.  
  
You can read more details about our collaboration with Kiwi in the case study published on our [web](https://www.vacuumlabs.com/projects/kiwi).

