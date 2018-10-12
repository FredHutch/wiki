---
title: Git and GitHub
last_modified_at: 2018-06-20
---
Version control software allows anyone using a computer to track changes made to computer files over time, which allows both referencing and reverting back to earlier work. Such software is becoming increasingly common among scientists, academics, and other researchers to manage computational work. While originally developed to support code development, version control software is useful for not just computer code, but also data, documentation, or any other files associated with a project. Moreover, version control software streamlines collaborative editing of documents, allowing changes to be easily identified and attribution of changes to be assigned to individual contributors.   

## What is Git and Github?
Git is the name of a free, open source version control software commonly used among academics and software developers. GitHub is a web-based hosting service for projects managed with Git version control software, and includes a wide variety of additional tools which allows users to collaborate, publish files, release new versions of software, and even create webpages (in fact, this wiki is published through GitHub!). There are many different ways to interact with Git and GitHub. Choosing which approach to use depends on whether you're collaborating, if you are an experienced programmer, and how complex your work in Git will be; the advantages of each of these methods are described below. fredhutch.io's recommended methods for beginners are described on their [software page](http://www.fredhutch.io/software/). In general, a good place to start is the GitHub Desktop client.

### Command Line Git
Git was originally written, and continues to be developed, as a command-line tool accessible through Terminal (Mac) and Command Prompt or Powers\Shell (Windows). This version of Git is the only way you can run all available Git commands, and is appropriate if you are already familiar with the command line and consistently perform work using it. Additionally, you will likely need to use the command line version if you are connecting to remote computational resources like a cluster or cloud. To read more about command line [Git, follow this link.](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)  To download a version of git to your local machine, [follow this link.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### GitHub on the Web
[GitHub](https://github.com) provides a web-based graphical interface for interacting with projects that are published through GitHub. While GitHub's interface limits your ability to perform more advanced version control operations, there are additional tools available for collaborating, publishing wikis, and managing projects (see section below on "Additional options available in GitHub").

### GitHub Desktop Client
For many users, command line git is not the ideal mode of interacting with version control software.  As an example, if the majority of the code produced by a user is originating from interfaces such as RStudio, it may be much simpler and more straightforward to use GitHub via the desktop client.  You can download the desktop client for your system for free [here.](https://desktop.github.com/)

The desktop client will allow you to "clone" repositories from the web based GitHub source and allow you to work on those files locally.  Then when edits have been made to files in those repositories, those edits will be shown in the GitHub Desktop client for the user to then comment on and commit those changes to the version of the repository on the web.
![]({{ site.baseurl }}/compdemos/assets/comp_github-96005f6a.png)

There are many different ways of working with multiple people on multiple files in a GitHub repository, and there are many places on the web that can provide some insight into how to use it's many features.  However, [this GitHub Guide for the flow of using GitHub is useful for understanding the basics.](https://guides.github.com/introduction/flow/)
![]({{ site.baseurl }}/compdemos/assets/comp_github-5c26f4cd.png)

### Git Kraken
[Git Kraken](https://www.gitkraken.com/) is a desktop client (Mac, PC, and Linux) available for free use to academics. It allows greater control and granularity than GitHub Desktop, especially when dealing with collaborative projects involving lots of branching and forking.  It is good for advanced beginners and beyond.    

## Additional options available in GitHub
GitHub is a free service that individuals can make their own usernames to join the service and begin hosting publicly accessible repositories containing code they have produced or edited.  As GitHub was originally intended to facilitate open source software development, the basic resources available to users are only public, but free, repositories in order to continue to encourage developers to keep their code in the open and shared.

Given the history of GitHub being linked with open source software development, it is set up with the intention to prioritize publicly accessible code.   However, given the need to limit access to code under development and not ready for public input, or other situations such as in the context of biomedical research, private repositories are available.  

### Public vs Private Repositories
When creating a repository the user chooses whether it should be public or private.  Private repositories require payment, but GitHub provides unlimited, free public repositories.  

### Individual vs Institution GitHub Repositories
When the software is being developed as part of an institution, such as at Fred Hutch, users can use repositories that are their individual repositories OR their username can be associated with an institution.  The Fred Hutch supports the use of GitHub for research via this institutional account which allows all Fred Hutch employees to create public *or* private repositories.  This wiki itself is developed and managed via a Fred Hutch institution [GitHub repository.](https://github.com/FredHutch/wiki)  This resource is a valuable tool for researchers looking to manage, communicate and document code or analysis processes in a platform that can be both private or public, and where they can manage permissions to their repositories.

### GitHub API
More to come about using the GitHub API

## Available Resources and links
There a wide variety of resources on the web for learning to use the various forms of GitHub.  
- Get a [GitHub username here.](https://github.com/join)
- Join the Fred Hutch GitHub institution by sending your username to `helpdesk` and request to be added.  
- Getting started with [GitHub Desktop](https://help.github.com/desktop/guides/getting-started-with-github-desktop/)
- How to [contribute to projects with GitHub](https://help.github.com/desktop/guides/contributing-to-projects/)
- A good tutorial slide deck on how to use GitHub with command line can be found [here](https://s3-us-west-2.amazonaws.com/fredhutch-docs/Introducing-Git-and-GitHub.pdf).
  - Signing up for a GitHub account - Slide 12
  - How to be part of Fred Hutch GitHub Organization - Slide 13
  - Creating a new GitHub Repo - Slide 14
  - Cloning repository (repo) to local machine - Slide 19
  - Keep your local repo up to date, in the scenario of collaboration with others or moving to a different machine. - Slide 21
  - Make change to files locally and commit the changes - Slide 23 ~ 27
  - Push the local committed changes to the remote GitHub repo - Slide 28
  - Collaborations internally and externally - Slide 31 ~ 43
