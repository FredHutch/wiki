---
title: Git and GitHub for Computational Research
last_modified_at: 2018-10-19
primary_reviewers: k8hertweck
---
Version control software allows anyone using a computer to track changes made to computer files over time, which allows both referencing and reverting back to earlier work. Such software is becoming increasingly common among scientists, academics, and other researchers to manage computational work. While originally developed to support code development, version control software is useful for not just computer code, but also data, documentation, or any other files associated with a project. Moreover, version control software streamlines collaborative editing of documents, allowing changes to be easily identified and attribution of changes to be assigned to individual contributors.   

## What is Git and Github?
Git is the name of a free, open source version control software commonly used among academics and software developers. GitHub is a web-based hosting service for projects managed with Git version control software, and includes a wide variety of additional tools which allows users to collaborate, publish files, release new versions of software, and even create webpages (in fact, this wiki is published through GitHub!). Some relevant terminology associated with Git and GitHub includes:
- **repository:** a project folder including all files and their history as tracked with Git. A repository can represent a variety of projects, including a piece of software, quarterly report, or research manuscript.
  - **local:** exists on your own computer
  - **remote:** exists somewhere besides your own computer and must be accessed over a network, such as on GitHub, the cloud, or a shared computer cluster
- **clone:** a copy of a repository (e.g., you may clone a repository from GitHub onto your own local computer)
- **commit:** a change to a file (or set of files) that represents a revision to previous versions
- **branch:** a parallel version of the "master" repository that allows you to test changes without affecting the original (or live) version; changes in a branch can be merged back to the "master" when a particular task has been completed
- **fork:** a copy of someone else's repository in which you can make changes (and submit a request for the original repository owner to accept these changes)
Additional terms are defined in [GitHub's Glossary](https://help.github.com/articles/github-glossary/).

## Using GitHub
There are many different ways of sharing projects collaboratively in a GitHub repository. [This GitHub Guide for using GitHub is useful for understanding the basics.](https://guides.github.com/introduction/flow/)
![]({{ site.baseurl }}/compdemos/assets/comp_github-5c26f4cd.png)

There are many different ways to interact with Git and GitHub. Choosing which approach to use depends on whether you're collaborating, if you are an experienced programmer, and how complex your work in Git will be; the advantages of each of these methods are described below. fredhutch.io's recommended methods for beginners are described on their [software page](http://www.fredhutch.io/software/). In general, a good place to start is the GitHub Desktop client.

### GitHub Desktop Client
Developers at Git have developed a desktop application with a graphical user interface that will allow you to accomplish most of the common tasks associated with Git version control and collaboration with GitHub. This is a great place for new Git users to learn about version control; you can download the desktop client for your system for free [here.](https://desktop.github.com/)

This desktop client will allow you to perform the basic Git workflow of making changes that are documented with Git version control. Additionally, the desktop client will allow you to clone repositories from web-based GitHub so that you can work on the project on your own computer.  After you have modified the file or files in your project, you can document and commit those changes back to the remote repository.
![]({{ site.baseurl }}/compdemos/assets/comp_github-96005f6a.png)

### Command Line Git
Git was originally written, and continues to be developed, as a command-line tool accessible through Terminal (Mac) and Command Prompt or PowerShell (Windows). This version of Git is the only way you can run all available Git commands, and is appropriate if you are already familiar with the command line and consistently perform work using it. Additionally, you will likely need to use the command line version if you are connecting to remote computational resources like a cluster or cloud. You can learn more about command line Git [here](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics) and download the command line software [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### GitHub on the Web
[GitHub](https://github.com) provides a web-based graphical interface for interacting with projects that are published through GitHub. While GitHub's interface limits your ability to perform more advanced version control operations, there are additional tools available for collaborating, publishing wikis, and managing projects (see section below on "Additional options available in GitHub").

### Git Kraken
[Git Kraken](https://www.gitkraken.com/) is a desktop client (Mac, PC, and Linux) available for free use to academics. It allows greater control and granularity than GitHub Desktop, especially when dealing with collaborative projects involving lots of branching and forking.  It is good for advanced beginners and beyond.    

### Git Integration with RStudio
If you are working with R statistical programming, the [RStudio](https://www.rstudio.com) interface possesses robust [integration with version control](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).

## Additional options available in GitHub
Anyone may create an individual GitHub account and username for free. These individual accounts allow creation of repositories that are by default published publicly for anyone to view and use. This supports the goal of GitHub to facilitate open, reproducible science and collaboration. Collaborative options include forking repositories belonging to other people and allowing other people to collaborate on your own projects. Depending on the content and nature of your repositories, however, you may require additional flexibility in sharing and collaboration. Some of these options are described below.

### Private Repositories
Repositories are publicly available by default. While this supports open science practices, there are also cases in which code or data in a repository needs to be kept private, such as when data or code are proprietary or need to be kept secure for other legal or ethical reasons. Although GitHub provides unlimited free public repositories to all users, private repositories owned by individuals require a developer (paid, upgraded/premium) account (but see section below for information on obtaining private repositories through the Fred Hutch GitHub Organization).

### GitHub Organizations
GitHub Organizations are accounts shared by individuals that assist in coordinating large collaborative projects. Scientific Computing maintains a [Fred Hutch GitHub Organization](https://github.com/fredhutch) through which affiliated employees can create public *or* private repositories and share access with collaborators external to the Hutch. For more information on our GitHub Organization, please see this wiki's section on GitHub in [Computing Credentials]({{ site.baseurl }}/computing/access_credentials).

### GitHub API
An API (Application Programming Interface) is a tool that allows you to communicate, or pass information between, two pieces of software. GitHub has an API that you can read more about [here](https://developer.github.com/v3/), which is useful for developing software that needs to reference information embedded in GitHub repositories.

## GitHub and Information Security
With open, agile, collaborative research rapidly becoming the preferred model for scientific inquiry, many researchers at Fred Hutch and elsewhere are adopting Git and GitHub as an essential part of their analytic and publishing workflow. Combining code, data, documentation, and visualizations together in a GitHub repository along with an interactive notebook application provides an enhanced platform for reproducible research and dynamic, computational narratives. However, the same flexibility, ease-of-use, and openness that are major benefits in research collaboration can introduce serious risks when Git is used by design or unintentionally to maintain sensitive data such as protected health information (PHI) or data storage credentials. Git does not provide the same granular access controls, audit logging capabilities, and data encryption available with a database or filesystem certified for HIPAA compliance. A user with read access to a Git repository can readily clone the entire repository, including all current and previous versions of datasets and freely distribute the data through another repository or other communication channels with no record of such activity. While a GitHub repository containing sensitive data can be made “private,” simple misconfiguration or oversight can expose it to the public. 


Considering both the large potential benefits and risks of using GitHub and Git, it is imporant for researchers at Fred Hutch to use these tools effectively while protecting the privacy of patients and Fred Hutch data resources. It is important to understand the types of sensitive information related to security which should never be put on GitHub.  Examples include individually identifiable health or financial information, server names, database or data storage credentials (i.e., usernames, passwords, tokens, access keys, etc), IP address, name of networks, etc.


Given the potential risk associated with even a private repository, however, you should carefully consider alternatives to maintaining any level of sensitive data in public or private GitHub repositories. The preferred method for ensuring privacy and security is keeping all potentially sensitive data out of GitHub repositories. Options for helping accomplish this while realizing the benefits of Git include restructuring workflows to preprocess and sanitize sensitive data in secure backend systems prior to it being posted to Git and storing secrets such as access keys and database credentials in the Vault secrets management system, accessing them when needed from Git using a secure API. For more guidance about how to structure your code or content you are putting in GitHub to ensure security, email `scicomp`.  

## Available Resources and links
 There a wide variety of resources on the web for learning to use the various forms of GitHub.  
 -Get a [GitHub username here.](https://github.com/join)
- Join the Fred Hutch GitHub organization by sending your GitHub username to `helpdesk` and request to be added.  
- Getting started with [GitHub Desktop](https://help.github.com/desktop/guides/getting-started-with-github-desktop/)
- How to [contribute to projects with GitHub](https://help.github.com/desktop/guides/contributing-to-projects/)

