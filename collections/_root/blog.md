---
vim: filetype=liquid
layout: page
title: Blog by Digital Mercenaries
description: >-
  Technical business focused pubicly published posts

version: 0.0.1
author: Digital-Mercenaries
license: All Rights Reserved

navigation:
  title: Blog
  weight: 50
---

{{ page.description }}

{% for post in site.blog | sort: post.date | reversed %}
  <ul>
    {% if post.title and post.description and post.date %}
      <li>
        <a href="{{ post.url }}" title="{{ post.description | truncate: 80 }}">
          {{ post.date | date: "%F" }} -- {{ post.title }}
        </a>
  
        <blockquote>{{ post.description }}</blockquote>
      </li>
    {% endif %}
  </ul>
{% endfor %}

