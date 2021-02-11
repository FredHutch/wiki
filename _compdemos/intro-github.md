---
title: Publishing code and data on GitHub
last_modified_at: 2021-02-09
main_author: Lauren Wolfe
primary_reviewers: k8hertweck
---

This tutorial is meant to act as a step-by-step guide for researchers interested in publishing code associated with a manuscript. While there are different ways to go about this task, this document is focused specifically on publishing to GitHub.

## Getting Started

Using GitHub requires and basic understanding of:
  - using the command line
  - basic git and GitHub workflow
  - git jargon and syntax

This tutorial will cover:
- Briefly, what is version control and how does it work?
- How to set up a GitHub repository
- How to push and pull data from a GitHub repository
- A basic repository directory structure
- When to publish code
- General best practices for reproducibility

## Prework

Before we can get started with working directly with our code and GitHub it's important to take the time to understand the basic workflows and jargon you'll come across.

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
- Some resources on reproducibility (link open science series?)

### Examples!

Below are some examples where a lab has used a GitHub repository to share out code and data related to a project. 
  - https://github.com/jbloomlab/flu_single_cell
  - https://github.com/matsengrp/pan-CoV-manuscript
These repositories are great examples of how to make code and data associated with a manuscript available publically and reproducible. Notice, that they contain a detailed `README` that clearly explains where to find the raw data, generated data, and scripts and how to reproduce the analysis. Both also clearly state how to find the published paper that corrosponds to the dataset.

## Data management
- GitHub is set up so that all data and code related to a single project live in the same repository.
- On your own personal computer, you will need to create a directory that will act as your local repostiory.
  - This can go anywhere on your local computer
  - This directory will become the repository
  - A basic repository structure might look like:
    - `README.md`: A document in markdown containing an overview of the software.
    - `data-raw/`: A directory containing raw, unprocessed data
    - `data/`
    - `code/`

## Tutorial

1. [Create a GitHub account](https://github.com/join).

    A basic GitHub account is free and only requires an email address to set up.

2. Create a remote repository.

3. Create a local repository.

4. Create a skeleton file structure in your local repository.

5. Move data into repository.

6. Fill out a README.md.

