---
title: Gitalk config error
tags:
  - Hexo
  - Gitalk
catagories:
  - Hexo
date: 2018-05-11 15:54:28
---

Issue
--------------
When configurating this blog's comment function, a error shows up. 
> Error message:
> "Error: u.concat(...).join is not a function"

![gitalk-config-error](https://ddr3pa.dm.files.1drv.com/y4meR3Y_9y4Us66zVUV-UmJk5O8-v4Ioak7_q8ZUNpQqdZ5wK-La75I812ZaiuP850yQGyzhOTXxRgMvMqGjsr3SzXycy57FQjZXlbGioNmYlEKYTS77uo5-UKuvzCeLNm0uZenoXXehUO9YAodQsb_Nfx6CI2JWc-GDcLk3Jp5B38A8MYrMiKvyptGjv0EBFIMrhRyVsRYf__EHiEHh45dMQ?width=660&height=142&cropmode=none)

Analysis
---------
I'm pretty sure that his issue is rare and can be solved as I don't find much information online. One related post is the git project of Gitalk and a closed issue submit by the author. Unfortunately, he just solved it with no clues.

[Gitalk issue#114](https://github.com/gitalk/gitalk/issues/114)

Causes and solutions
---------------------
After searching and investigating error messages in Chrome developer tool, I located the error in configuration.
I setup my comment function following a online tutorial.
The so-called most complete tutorial do suggest a complete configuration as:
```yml
gitalk:
  enable: true
  ClientID: xxxxxx
  ClientSecret: xxxxxxxxxxxx
  repo: gitalk
  owner: geedme
  adminUser: geedme
  ID: location.pathname
  labels: gitalk
  perPage: 15
  pagerDirection: last
  createIssueManually: true
  distractionFreeMode: false
```
The issue is caused by the item "labels: gitalk".

>The concat() method is used to join two or more arrays.
>
>This method does not change the existing arrays, but returns a new array, containing the values of the joined arrays.

Simply changing this item to "labels: [gitalk]" makes it work.

Conclusion:

It's a really simple issue just that it is hidden.
1. Most users won't include "labels" in their "gitalk.swig" file. The default value is used without issue.
1. The author saw this issue but never found the actually reason.
1. Tutorial user doesn't expose this issue.
1. Error message doesn't explain the real location of the root cause.



