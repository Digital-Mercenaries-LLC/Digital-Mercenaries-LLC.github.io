---
vim: textwidth=79
title: GitHub Pages and Google Domains
description: >-
  Notes from setting-up GitHub Pages with custom Google Domain

author: Digital-Mercenaries
date: 2023-07-12 16:51:00 -0000

layout: post

categories:
  - DNS
  - web-dev

attribution:
  links:
    - text: Devdiaries -- How to set up custom domain for GitHub Pages with HTTPS
      href: https://www.devdiaries.net/blog/How-to-set-up-custom-domain-for-Github-Pages-with-HTTPS/
      title: How to set up custom domain for GitHub Pages with HTTPS

    - text: GitHub Docs -- Configuring a custom domain for your GitHub Pages site
      href: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
      title: Configuring a custom domain for your GitHub Pages site

    - text: GitHub Docs -- Managing a custom domain for your GitHub Pages site
      href: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
      title: Managing a custom domain for your GitHub Pages site

    - text: GitHub Docs -- Troubleshooting custom domains and GitHub Pages
      href: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages
      title: Troubleshooting custom domains and GitHub Pages

    - text: GitHub Issue -- Custom Domain issues with Github Pages and Google Domains
      href: https://github.com/orgs/community/discussions/21964
      title: Custom Domain issues with Github Pages and Google Domains

    - text: GitHub Issue -- No information about `NotServedByPagesError` in GitHub pages documentation
      href: https://github.com/orgs/community/discussions/35168
      title: No information about `NotServedByPagesError` in GitHub pages documentation

    - text: 'Laxmena -- Guide: Publish your personal website with GitHub pages and Google Domains'
      href: https://laxmena.com/posts/github-pages-to-google-domains
      title: 'Guide: Publish your personal website with GitHub pages and Google Domains'

    - text: Medium -- How to setup GitHub Pages with Google domains
      href: https://medium.com/@Tnylnc/tnylnc-how-to-set-up-github-pages-with-google-domains-83bd5a4fbc5c
      title: How to setup GitHub Pages with Google domains

    - text: Mozilla Support -- Secure connection failed and Firefox did not connect
      href: https://support.mozilla.org/en-US/kb/secure-connection-failed-firefox-did-not-connect?as=u&utm_source=inproduct
      title: Secure connection failed and Firefox did not connect

    - text: Stack Overflow -- How do I add a newline in a markdown table?
      href: https://stackoverflow.com/questions/11700487/how-do-i-add-a-newline-in-a-markdown-table
      title: How do I add a newline in a markdown table?

    - text: Stack Overflow -- How to solve this error "NotServedByPagesError"
      href: https://stackoverflow.com/questions/69715796/how-to-solve-this-error-notservedbypageserror
      title: How to solve this error "NotServedByPagesError"
---


> {{ page.description }}


## Google Domains -- DNS -- Custom records


Host name | Type | TTL | Data
----------|------|-----|-----
`digital-mercenaries.com` | A | 1 hour | `185.199.108.153` <br/> `185.199.109.153` <br/> `185.199.110.153` <br/> `185.199.111.153`
`digital-mercenaries.com` | AAAA | 1 hour | `2606:50c0:8000::153` <br/> `2606:50c0:8001::153` <br/> `2606:50c0:8002::153` <br/> `2606:50c0:8003::153`
`www.digital-mercenaries.com` | CNAME | 1 hour | `digital-mercenaries-llc.github.io.`
`_github-challenge-digital-mercenaries-llc-org.digital-mercenaries.com` | TXT | 1 hour | `<TOKEN-FOR-ORGANIZATION>`
`_github-pages-challenge-digital-mercenaries.digital-mercenaries.com` | TXT | 1 hour | `<TOKEN-FOR-PROFILE>`


> Note; above IP addresses are, as of {{ page.date | date: '%F' }}, provided
> by
>  [GitHub Docs](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)


______


## Dig command examples


The following examples may be useful for double-checking DNS configurations,
and propagation, are proceeding as intended.


- **With** `WWW` sub-domain

   ```bash
   dig WWW.DIGITAL-MERCENARIES.COM +nostats +nocomments +nocmd
   ```

   ```
   ;WWW.DIGITAL-MERCENARIES.COM.   IN      A
   WWW.DIGITAL-MERCENARIES.COM. 3600 IN    CNAME   digital-mercenaries-llc.github.io.
   digital-mercenaries-llc.github.io. 3600 IN A    185.199.108.153
   digital-mercenaries-llc.github.io. 3600 IN A    185.199.109.153
   digital-mercenaries-llc.github.io. 3600 IN A    185.199.110.153
   digital-mercenaries-llc.github.io. 3600 IN A    185.199.111.153
   ```

- **Without** `WWW` sub-domain

   ```bash
   dig DIGITAL-MERCENARIES.COM +nostats +nocomments +nocmd
   ```

   ```
   ;DIGITAL-MERCENARIES.COM.       IN      A
   DIGITAL-MERCENARIES.COM. 3600   IN      A       185.199.110.153
   DIGITAL-MERCENARIES.COM. 3600   IN      A       185.199.109.153
   DIGITAL-MERCENARIES.COM. 3600   IN      A       185.199.111.153
   DIGITAL-MERCENARIES.COM. 3600   IN      A       185.199.108.153
   ```


______


## Common Errors


### `NotServedByPagesError`


> **digital-mercenaries.com is improperly configured**
>
> Domain does not resolve to the GitHub Pages server. For more information, see
> [documentation](https://docs.github.com/articles/setting-up-a-custom-domain-with-github-pages/)
> (NotServedByPagesError).

According to
[GitHub -- Community -- No information about `NotServedByPagesError` in GitHub pages documentation](https://github.com/orgs/community/discussions/35168),
this is often due to slow DNS propagation and will be resolvable by rechecking
after a day or two.

Less common, though still possible, is this error is due to misconfiguration of
DNS settings.  In which case double-checking Google Domains, and waiting, is
the best course of action.

