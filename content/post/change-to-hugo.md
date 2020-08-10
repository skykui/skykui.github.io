---
title: "Change to Hugo: GitHub+Hugo+Travis-CI"
date: 2020-08-09T22:30:32+08:00
draft: true
---

- [Background](#background)
- [Setup infrastructure](#setup-infrastructure)
- [Initialization](#initialization)
- [Deployment](#deployment)
  - [Automatic scripts](#automatic-scripts)
  - [Travis-CI](#travis-ci)
- [Lessons Learned](#lessons-learned)
- [Conclusion](#conclusion)

# Background
Years ago I moved my blog host from WordPress to GitHub+Hexo. I didn't write much since then. Recently I decide to pickup writing again, and surprisingly many people suggest Hugo. The main reason behind is that Hugo can compile the static pages much faster than Hexo especially when your pages are accumulated to a considerable amount.
# Setup infrastructure
I work on Win 10 now so this article is based on this presumption.
-  Git
   -  Not much thing to say
-  Hugo
   -  Download the .exe
   -  Put it somewhere and add its path into Windows environment variables - "PATH".
   -  Alternatively, you can just put it in your project folder, but remember to exclude it by adding in .gitignore.
- VS Code
  - I use VS Code for coding so naturally I will use it to edit markdown files. Its embedded git support makes publishing of the blog straightforward.
  - Edit the configuration file

# Initialization
- Create new Blog folder
- Create a repository
  - I have a repository for my blog with Hexo, so I just cloned it.
  - My previous blog is build in the way that the source codes are on a branch "hexo" and the deployed files are pushed to branch "master".
  - 
# Deployment
## Automatic scripts
Follow the Hugo doc below for deploying from local.

[hosting and deployment](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

There are 3 major choices. The most convenient one is to put your source code as one repository and the output in "public" in the \<USERNAME>.github.io.

As explained above, I managed my last blog in one repository with different branches. I want to try the same method with Hugo. This is the method using a branch called "gh-pages". It is not hard to setup but it may cause issue when  you deploy with Travis-CI, which I learned in a hard way. See [Lessons Learned](#Lessons-Learned).
## Travis-CI
You can find plenty of tutorials about deploy Hugo with Travis-CI, but most are using the method of two repositories. I modified a bit to adapt to my single repository deployment.
1. 

# Lessons Learned
- Travis-CI  
  - Missing branch
  
    Travis-CI by default clone with "--depth" which includes a equivalent effect of "--"
    It causes issue on this part of the publish script.

    ```
    echo "Checking out gh-pages branch into public"
    git worktree add -B gh-pages public origin/gh-pages
    ```

    The error observed:
    ```
    fatal: Not a valid object name: 'origin/gh-pages'.
    ```
    If you check the branches, you will find that this branch is missing.
    ```
    $ git branch -r
    origin/HEAD -> origin/hugo
    origin/hugo
    ```
    There are 2 solutions
    1. Disable "--depth" by adding in .travis.yml.
   
        The disadvantage is that all commit history will be fetched.
        ```
        git:
            depth: false
        ```
        
    2. Use the command below to fetch the "gh-pages" branch.
        ```
        - git fetch origin +refs/heads/gh-pages:refs/remotes/origin/gh-pages
        ```
        Details see this link: [How to add, fetch and checkout missing remote branches?](https://stackoverflow.com/a/23780060)

  - Pending Changes
    - The Travis-CI build first failed with this error


# Conclusion
If you just start from scratch, you may consider to use the "2 repositories" method to deploy your Hugo site. It is straightforward and easier to configure for Travis-CI.
If you are like me, who want to keep one project in one repository, I hope this article can help you a bit and avoid the problems that I encountered.