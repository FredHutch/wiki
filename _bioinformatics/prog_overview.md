---
title: Overview of Common Programming Languages in Bioinformatics
last_modified_at: 2019-01-15
---
Software used in scientific research are written in a wide range of programming languages, we highlight the most commonly used ones below.

While programming in R, Python or other languages you may need access to various User Interfaces or "Notebooks".  This document provides an overview of these tools.

## Compute Resources Needed
For R and Python, you can run the code you have written locally on your computer, or remotely on the [Linux clusters](/computing/resource_overview/). For running remotely, you can either run on a cluster node shared with other users, or reserve a node for your exclusive use for a limited time.

### Running on your computer
- Pro: immediate access, familiar environment
- Con: limited CPU, memory and disk resources for large tasks (eg. aligning RNASeq reads, variant calling, etc.)

### Running remotely on shared cluster node (`Rhino`)
- Pro: higher CPU, memory and disk resources
- Con: need to transfer files to Hutch servers, requires Internet connection, can be temporarily slow if Rhino has many concurrent users

### Running remotely on reserved cluster node (`Gizmo`)
- Pro: higher CPU, memory and disk resources, and you're the exclusive user
- Con: need to transfer files to Hutch servers, requires Internet connection, if you request a very powerful computer, you may have to wait a while for one to become available



When using the Fred Hutch computing clusters, users should access these programming languages via the environmental modules (eg. `ml R` rather than simply `R` in Rhino). Doing this will ensure reproducibility of your code and that you're using the latest software available. More information about environmental modules are available [here](/computing/cluster_software/).

## R and RStudio
R is a programming language and also a software development environment. It is widely used among statisticians and has strong capabilities for statistical modeling and data analysis. While R's core functions are fairly small, there is a robust community of user-contributed R 'packages' (eg. see "Bioconductor" below). You can [download](https://cran.r-project.org/) R for your computer, install it from Center IT's Self Service (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs), or run R on SciComp's computing clusters (see "Current R Builds on Gizmo" and in the [Scientific Computing domain of this site](/computing/comp_index/)).

RStudio is a graphical frontend to R that also improves upon a basic R installation, providing syntax-highlighting and code-completion, static or dynamic reports (via RMarkdown documents), and easing the creation of R packages, among other functionalities. It is considered an [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) which functions much like a wrapper around R itself, to create a graphic user interface, and easy access to various tools and functions that enhance the user's experience of using R.  

For more information about RStudio, see the [Notebooks and UIs](/bioinformatics/compute_uis/) page.


## Python

Python is another language used extensively within the bioinformatic community. A very high-level comparison of Python to other commonly used languages is that it's generally on the easier side for being able to learn and understand, but it doesn't give you as much detailed control over the details of computation compared to C. In other words, it's easier to use, but not quite as performant. One of the nice things about Python in recent years has been that there is a large community of software developers contributing highly efficient code as installable modules, which makes the entire codebase more valuable for your average user.


## Unix/Bash

Unix is the foundation for both Linux and macOS, and is the operating system that is most commonly used for developing and executing bioinformatic software tools. In order to navigate a Unix-based operating system and execute commands, it is extremely useful to use the command line interface, which is generally referred to as BASH (Bourne-Again SHell).

## Other languages
