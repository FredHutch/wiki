---
title: Publishing code and data on GitHub
last_modified_at: 2021-02-09
main_author: Lauren Wolfe
primary_reviewers: k8hertweck
---

This tutorial is meant to act as a step-by-step guide for researchers interested in publishing code and data associated with a manuscript. While there are different ways to go about this task, this document is focused specifically on publishing to GitHub.

Using GitHub requires and basic understanding of:
  - using the command line
  - basic git and GitHub workflow
  - git jargon and syntax
  
Resources:
  - [Git documentation](https://git-scm.com/doc)
  - [Introduction to unix commands](https://kb.iu.edu/d/afsk)
    - [`cd`](https://kb.iu.edu/d/afsk#cd)
    - [`mv`](https://kb.iu.edu/d/afsk#mv)
    - [`cp`](https://kb.iu.edu/d/afsk#cp)

This tutorial will cover:
- Briefly, what is version control and how does it work?
- How to set up a GitHub repository
- How to push and pull data from a GitHub repository
- A basic repository directory structure
- When to publish code
- General best practices for reproducibility

## Prework

Before we can get started working directly with code and GitHub it's important to take the time to understand the basic workflows and jargon you'll come across.

### What are git and GitHub?

- `git` = [version control system](http://guides.beanstalkapp.com/version-control/intro-to-version-control.html) that manages and keeps track of code history.
- GitHub = cloud-based code hosting platform built on git that allows you to more easily manage git repositories and share code widely.
- How does it work?
  - Developers create a remote repository on GitHub. This is the central repository that is hosted on the cloud.
  - Each developer creates a local repository on their own computer that corrosponds with the remote repository. Here, they are able to work on code locally. When the developer is ready they will push the fresh code up to the remote repository. Now anybody working on the project can update from the remote repository and have this new code included on their local computers!
  - Throughout this process `git` is keeping a detailed history of what lines have been added/deleted from each file, who made the changes, and when they were pushed to the repository.
  - Resources on the git and GitHub workflow
    - [An overview of the GitHub workflow using only the website GUI](https://guides.github.com/activities/hello-world/)

### Reproducibility

Just putting code and data on GitHub is not enough to make it usable and accessable to other researchers. 
- FAIR (more like FAR for manuscirpt publishing)
  - brief overview
- Some resources on reproducibility (link open science series)

### Example repositories

Below are some examples where a lab has used a GitHub repository to share out code and data related to a project. 
  - https://github.com/jbloomlab/flu_single_cell
  - https://github.com/matsengrp/pan-CoV-manuscript

Notice, that they contain:
  - detailed `README`:
    - where to find the raw data, generated data, scripts
    - How to reproduce the analysis
    - A pdf of the corrosponding paper and a link or note stating where it was published.
    - Where to find related datasets hosted elsewhere (GEO, etc)
  - directory structure:
    - clearly named directories to hold scripts, figures, data, etc
  - a `LICENSE.txt` file
    - [GitHub Docs: Licensing a repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository)

### When to make code and data available
- Publish code as you develop it in either a public or private repository
  - Pros: 
- Include code with the corresponding paper when it is submitted
- Publish when the corresponding paper is published

### Where to publish code within GitHub
 - Your personal account
 - A lab organization
 - The [FredHutch organization](https://github.com/FredHutch): The FredHutch account offers higher security through [GitGuardian](https://www.gitguardian.com/). The FredHutch organization is managed by Scientific Computing. To gain access email them email at `scicomp`. 

## Tutorial

1. [Create a GitHub account](https://github.com/join).

    A basic GitHub account is free and only requires an email address to set up. Click the link and follow the steps to set up an account.
    
2. [Create your remote repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-new-repository). This is the repository that is hosted on GitHub.

    In this step you will make the following decisions for your repository:
      - Owner: This can be your personal account or any organization you are a part of. See 
      - Repository name: This should be short and descriptive. You can always [rename the repository](https://docs.github.com/en/github/administering-a-repository/renaming-a-repository) later if needed.
      - Repository privacy: Public or private
      - The option to initialize the repository with a:
        -  README
        -  License
        -  .gitignore
3. Create your local repository. This is the repository that is hosted on your computer.
    
    Navigate to or create the directory you'd like to use as your repository.
    
    ```
    cd your/file/path
    git init
    ```

4. Create a skeleton file structure in your local repository. 

    A minimal repository will have a `README.md`, a directory to store code, and a directory to store scripts or code. Be aware that the actual directory names can vary. For example, code may be stored in a directory called 'scripts', 'code', or 'R' depending on the context.
    ```
    touch README.md
    mkdir data
    mkdir scripts
    ```

5. Move or copy data and scripts into relevant directories in your local repository.
    
    ```
    cp ~/path/to/data ./data
    cp ~/path/to/scripts ./scripts
    ```

7. Commit

    ```
    git add *
    git commit -m "first commit"
    git branch -M main
    ```
    
8. Push

    ```
    git remote add origin https://github.com/<yourGitHubUserName>/<repoName>.git
    git push -u origin main
    ```
