---
vim: filetype=liquid
layout: page
title: Blog by Digital Mercenaries
description: >-
  Technical business focused pubicly published posts

version: 0.0.2
author: Digital-Mercenaries
license: All Rights Reserved

navigation:
  title: Blog
  weight: 50
---

{{ page.description }}

{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
{% for post in site.blog | sort: post.date | reversed %}
  <ul class="post-list">
    {% if post.title and post.description and post.date %}
      <li>
        <a href="{{ post.url }}" title="{{ post.description | truncate: 80 }}" class="post-link">
          {{ post.title }}
        </a>
        <blockquote>
          <span class="post-meta">{{ post.date | date: date_format }}</span>
          <br>
          {{ post.description }}
        </blockquote>
      </li>
    {% endif %}
  </ul>
{% endfor %}

