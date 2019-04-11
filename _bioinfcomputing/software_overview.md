---
title: Overview of Common Programming Languages in Bioinformatics
last_modified_at: 2019-04-01
primary_reviewers: k8hertweck
---


Frequently in scientific research, we must write code in order to perform our desired analysis. Whether we are writing a short script for our own manuscript, or making an app we intend to share with other researchers, incorporating standard programming practices will enhance the readability and reproducibility of our work. Below, we provide an overview of Fred Hutch coding standards as well as resource pages for commonly used programming languages in biosciences research.

Fred Hutch offers training resources for each of the languages listed below. For course descriptions and session notifications, go to Hutch Learning [here](http://www.fredhutch.io/). New class offerings will also be posted in the Coop Newsletter. Email `thecoop` to join the mailing list.


## [Wiki Examples Repository](https://github.com/FredHutch/wiki-code-examples)

In addition to the documentation provided in this wiki, we maintain a repository of coding examples to demonstrate the use of our coding standards, while showcasing some features and packages that could be useful in your research. We aim to include projects of various scope, so we can exhibit the software development principals in different types of user interfaces (e.g.: packages and interactive notebooks will both be included with appropriate documentation). 

We encourage a broad range of coding example submissions from researchers, with the hope that it will enhance innovation and learning within Fred Hutch. The submission requirements are outlined in the following section, [Fred Hutch Software Development Standards](#fred-hutch-software-development-standards). In addition to creating reference material for your peers and gaining local notoriety as an awesome developer/researcher, you will have the added benefit of additional technical review and sharing/communicating your work with other researchers that may be interested in follow up.

>Note: A common use of the examples repository will be to clone a copy locally and play with the available code. For this reason, we ask that data files not be stored in the repository.


### Accessing the Examples
TODO

### Submitting Your Code
TODO

#### Future - DOI Available?
TODO

## Fred Hutch Software Development Standards

This section documents coding standards at Fred Hutch, along with several helpful tool suggestions and examples. In an effort to create high-quality, transparent, and reproducible software-aided research, it is important that best software practices be fused into the process.

### Using Templates
- README.md (Summary Documentation, Title, Author, Technical and Domain Reviewer(s))
- LICENSE.md (What's an okay default? MIT license?)
- Raw data stored unmodified (note: do not store data on github)
- src code
- See https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424

### Coding Practices
- meaningful variable names
- fully document code
- automate tasks
- use libraries when available

### Writing Help Documentation


## Getting Started with Common Languages

### Compute Resources Needed

For R and Python, you can run the code you have written locally on your computer, or remotely on the [Linux clusters](/bioinfcomputing/compute_platforms/). For running remotely, you can either run on a cluster node shared with other users, or reserve a node for your exclusive use for a limited time.

#### Running on your computer
- Pro: immediate access, familiar environment
- Con: limited CPU, memory and disk resources for large tasks (eg. aligning RNASeq reads, variant calling, etc.)

#### Running remotely on shared cluster node (`Rhino`)
- Pro: higher CPU, memory and disk resources
- Con: need to transfer files to Hutch servers, requires Internet connection, can be temporarily slow if Rhino has many concurrent users

#### Running remotely on reserved cluster node (`Gizmo`)
- Pro: higher CPU, memory and disk resources, and you're the exclusive user
- Con: need to transfer files to Hutch servers, requires Internet connection, if you request a very powerful computer, you may have to wait a while for one to become available

When using the Fred Hutch computing clusters, users should access these programming languages via the environmental modules (eg. `ml R` rather than simply `R` in Rhino). Doing this will ensure reproducibility of your code and that you're using the latest software available. More information about environmental modules are available [here](/bioinfcomputing/compute_environments/).


### [R, RStudio](/bioinfcomputing/software_R/)

R is a programming language and also a software development environment. It is widely used among statisticians and has strong capabilities for statistical modeling and data analysis. While R's core functions are fairly small, there is a robust community of user-contributed R 'packages' (eg. see "Bioconductor" on the target reference page). You can [download](https://cran.r-project.org/) R for your computer, install it from Center IT's Self Service (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs), or run R on SciComp's computing clusters (see "Current R Builds on Gizmo" and in the [Scientific Computing domain of this site](/computing/comp_index/)).

RStudio is a graphical frontend to R that also improves upon a basic R installation, providing syntax-highlighting and code-completion, static or dynamic reports (via RMarkdown documents), and easing the creation of R packages, among other functionalities. It is considered an [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) which functions much like a wrapper around R itself, to create a graphic user interface, and easy access to various tools and functions that enhance the user's experience of using R.  


### [Python](/bioinfcomputing/software_python/)

Python is another language used extensively within the bioinformatic community. A very high-level comparison of Python to other commonly used languages is that it’s generally on the easier side for being able to learn and understand, but it doesn’t give you as much detailed control over the details of computation compared to C. In other words, it’s easier to use, but not quite as performant. One of the nice things about Python in recent years has been that there is a large community of software developers contributing highly efficient code as installable modules, which makes the entire codebase more valuable for your average user.


### [Managing and Sharing Code](/bioinfcomputing/software_managecode/)

While version control software has evolved over time, a new evolution that is happening more and more is the need for a wider group of researchers to actively use version control resources to manage their code and documentation of processes that are ongoing in their research. From the perspective of reproducibility, shareability and interoperability, the need for a sharing platform that integrates version control and collaboration is becoming more and more a critical part of a researcher’s toolkit. Thus, regardless of the degree to which code plays a direct role in a research project, more and more often at least a cursory understanding of what GitHub is and how it can be utilized in scientific research is important.

### [Linux, Unix and Shell Resources](/bioinfcomputing/software_linux101/)

Unix is the foundation for both Linux and macOS, and is the operating system that is most commonly used for developing and executing bioinformatic software tools. In order to navigate a Unix-based operating system and execute commands, it is extremely useful to use the command line interface, which is generally referred to as BASH (Bourne-Again SHell).


## Tools and Ideas to Further Improve Software

There are times when you may want to go beyond the minimum requirements to build a more robust piece of software. This may be the case if you are working with many collaborators, plan to publish/release your code, or anticipate a need to update your code and/or data over time.


### Manage Dependencies (Environments and Containers)


### Use Standard Styles (PEP8, linter tools)


### Unit Testing


### Version Control and Issue Tracking
 - Link to managecode
 - Reiterate importance of review

### Continuous Integration


#### Git Badges
https://travis-ci.org/

https://medium.freecodecamp.org/how-to-use-badges-to-stop-feeling-like-a-noob-d4e6600d37d2

## Examples

Pointer to specific wiki code examples:
 - Jupyter notebook
 - R?
 - src code file system

