---
layout: page
title: Jobs for Digital Mercenaries
description: >-
  Join our team and be part of driving technological excellence.

version: 0.0.4
author: Digital-Mercenaries
license: All Rights Reserved

navigation:
  title: Jobs
  weight: 90
---


At {{ site.title }}, we're always seeking highly skilled and talented
individuals to join our team.  While we don't have any open positions at the
moment, we believe in fostering an environment that promotes growth,
creativity, and innovation.


---


## Get in Touch


If you're passionate about software engineering, technical mentoring, or
leadership development, we would love to hear from you!

Please send an email to `{{ site.email }}`, including links to your GitLab,
GitHub, or other relevant work, and tell us how you can add value to our team.
We'll keep your information on file and may reach out to you when suitable
opportunities arise.

<details>
  <summary>Example email template <sup>(click to show/hide)</sup></summary>
  <blockquote>{% include email-template/jobs.html %}</blockquote>

  <p>
    Please customize above to suit your own style!...  However, until we
    explicitly ask, do <strong>not</strong> include any attachments such as;
    cover-letter, resume, or other PII (Personally Identifiable Information).
  </p>
</details>


## FAQ


{% assign data__faq__page = site.faq | where_exp: "item", "item.heading == page.title" %}
{% include faq/iterate-target-heading.html items=data__faq__page %}


---

We appreciate your interest in joining {{ site.title }} and look forward to
connecting with you in the future!

