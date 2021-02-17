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
    - [Choose a license](https://choosealicense.com/)

### When to make code and data available
- Publish code as you develop it in either a public or private repository
  - entire git history maintained, helps users understand how the code was made
- Include code with the corresponding paper when it is submitted
  - code made available but git history is not
- Publish when the corresponding paper is published

### Where to publish code within GitHub
 - Your personal account
 - A lab organization
  - if your lab doesn't have an organization you can create one. For more information about organizations click [this link](https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-organizations) 
 - The [FredHutch organization](https://github.com/FredHutch): The FredHutch account offers higher security through [GitGuardian](https://www.gitguardian.com/). The FredHutch organization is managed by Scientific Computing, meaning they maintain high level privledges on every repository within the organization. To gain access or request help email them at `scicomp`. 

## Tutorial

1. [Create a GitHub account](https://github.com/join).

    A basic GitHub account is free and only requires an email address to set up. Click the link and follow the steps to set up an account.
    
2. [Create your remote repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-new-repository). This is the repository that is hosted on GitHub.

    In this step you will make the following decisions for your repository:
      - Owner: This can be your personal account or any organization you are a part of. See 
      - Repository name: This should be short and descriptive. You can always [rename the repository](https://docs.github.com/en/github/administering-a-repository/renaming-a-repository) later if needed.
      - Repository privacy: Public or private.
      - The option to initialize the repository with a:
        -  README
        -  License
        -  `.gitignore`

    For the purpose of this tutorial, do not initialize the repository with a README, licence, or `.gitignore`

3. Open the command line on your computer.
      - On a Mac the command line is an application called Terminal. Open Finder, click Applications, click Utilities, and then open Terminal.
      - On Windows

4. If you've never worked with git before, install git on your computer. Follow [this tutorial](https://www.taniarascia.com/getting-started-with-git/) for whichever operating system you are using.

5. Create your local repository. This is the repository that is hosted on your computer.
    
    ```
    # create the repository directory
    mkdir -p file/path/repoName
    # go to repository
    cd file/path/repoName
    # initialize git in the repository
    git init
    ```
    
    _for more about the commands used here see these resources:_
      - [_`mkdir` documentation_](https://kb.iu.edu/d/afsk#mkdir)
      - [_`cd` documentation_](https://kb.iu.edu/d/afsk#cd)     
      - [_`git init` dcoumentation_](https://git-scm.com/docs/git-init)


6. Create a skeleton file structure in your local repository. 

    A minimal repository will have a `README.md`, a directory to store code, and a directory to store scripts or code. Be aware that the actual directory names can vary. For example, code may be stored in a directory called 'scripts', 'code', or 'R' depending on the context.
   
   ```
   # create an empty README file. Make sure to include the '.md'.
    touch README.md
    # create two directories within your new repository
    mkdir data
    mkdir scripts
    ```

5. Move or copy data and scripts into relevant directories in your local repository.
    
    ```
    # copy data into your repository.
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
