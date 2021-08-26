---
title: Convenient Data Fetching with Higher Order Components: Martin Pinter’s ReactiveConf talk
excerpt: Convenient Data Fetching with Higher Order Components While the React community has mostly agreed on abstracting complex app state away from the components, it is often a different story when it comes to remote data-fetching. On one side stand the many incarnations of the “fetch on didMount, show placeholder while isLoading” pattern, on the other […]
date: 2019-10-10T19:07:24
slug: convenient-data-fetching-with-higher-order-components-martin-pinters-reactiveconf-talk
---

# Convenient Data Fetching with Higher Order Components: Martin Pinter’s ReactiveConf talk

## Convenient Data Fetching with Higher Order Components

While the React community has mostly agreed on abstracting complex app state away from the components, it is often a different story when it comes to remote data-fetching. On one side stand the many incarnations of the “fetch on didMount, show placeholder while isLoading” pattern, on the other you have frameworks like Apollo and Falcor—excellent in their own right, but what if we can’t (or don’t want to) use them on a particular project?  
  
We’ll be showing a small and self-contained data provider library—using higher-order React components and Redux on the client side, and requiring zero changes to your backend. We’ll also keep our components from worrying about how and when the fetching happens—defining instead only what data is required, while abstracting all of the race-conditions and caching via a single HOC, handling the hard parts.

Martin Pinter is an engineer and tech-lead at [Vacuumlabs](https://inside.vacuumlabs.com/category/technology), helping both start-ups and established companies put their products (back) on track. He is shamelessly using javascript to build everything from web-apps, through servers, to desktop apps and mobile libraries. Particularly fond of React and Node.js.

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
<iframe loading="lazy" title="ReactiveConf 2018 - Martin Pinter: Convenient Data Fetching with Higher Order Components" width="800" height="450" src="https://www.youtube.com/embed/iEIwTiPQY3g?feature=oembed" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div></figure>

[cta\_to\_website]

## What’s ReactiveConf?

[ReactiveConf is a 3-day](https://reactiveconf.com/) European-wide web & mobile development festival in the heart of Europe made for functional developers, where World-class JS experts share unique insights. With more than 1300 attendees and 60+ speakers, it’s one of the world’s biggest dev conferences.

