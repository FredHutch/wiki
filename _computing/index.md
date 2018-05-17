---
author: bmcgough
description: Scientific Computing Landing Page
---

# SciComp Docs

{% for scd in site.computing %}

<a href="{{ scd.url | prepend: site.baseurl }}">
        {{ scd.title }}
</a>

<p class="post-excerpt">{{ scd.description | truncate: 160 }}</p>

{% endfor %} 
