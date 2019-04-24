---
title: Overview of Software Development at Fred Hutch
last_modified_at: 2019-04-01
primary_reviewers: k8hertweck
---


Frequently in scientific research, we must write code in order to perform our desired analysis. Whether we are writing a short script for our own manuscript, or making an app we intend to share with other researchers, incorporating standard programming practices will enhance the readability and reproducibility of our work. Below, we provide an overview of Fred Hutch coding standards as well as resource pages for commonly used programming languages in biosciences research.

## [Getting Started with Common Languages](/bioinfcomputing/software_languages/)

Fred Hutch has several resources available for folks that are seeking instruction in a new programming language, version control (managing and sharing code), or navigating linux/shell scripting. If software development in research is new to you, or you wish to pick up a new skill, we recommend you start with the [Common Languages](/bioinfcomputing/software_languages/) page.

The remainder of this section will presume a basic skill level in at least one common language, as well as a basic understanding of [GitHub](/bioinfcomputing/software_managecode/).


## Compute Resources Needed

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


## [Wiki Examples Repository](https://github.com/FredHutch/wiki-code-examples)

In addition to the documentation provided in this wiki, we maintain a repository of coding examples to demonstrate the use of our coding standards, while showcasing some features and packages that could be useful in your research. We aim to include projects of various scope, so we can exhibit the software development principals in different types of user interfaces (e.g.: packages and interactive notebooks will both be included with appropriate documentation). 

We encourage a broad range of coding example submissions from researchers, with the hope that it will enhance innovation and learning within Fred Hutch. The submission requirements are outlined in the following section, [Fred Hutch Software Development Standards](#fred-hutch-software-development-standards). In addition to creating reference material for your peers and gaining local notoriety as an awesome developer/researcher, you will have the added benefit of additional technical review and sharing/communicating your work with other researchers that may be interested in follow up.

>Note: A common use of the examples repository will be to clone a copy locally and play with the available code. For this reason, we ask that data files not be stored in the repository.


### Accessing the Examples

Examples can be explored in a web browser by clicking the link above. Alternatively, you can use github to clone a copy to your local machine, where you can modify and play with the example code independently. 

```
git clone https://github.com/FredHutch/wiki-code-examples.git
```

For more information on using Github, see the [Managing and Sharing Code](/bioinfcomputing/software_managecode/) page in this wiki.


### Submitting Your Code
When you have completed a coding project that you would like to submit to the examples wiki, there are a few steps in Github to navigate the review process. You will want to push your code in a clean branch to the repository, and then submit a pull request on `github.com` for your branch that will kick off a review and merge process.

## Fred Hutch Software Development Standards

This section documents coding standards at Fred Hutch, along with several helpful tool suggestions and examples. In an effort to create high-quality, transparent, and reproducible software-aided research, it is important that best software practices be fused into the process.

### Using Templates
- README.md (Summary Documentation, Title, Author, Technical and Domain Reviewer(s))
- LICENSE.md (What's an okay default? MIT license?)
- Raw data stored unmodified (note: do not store data on github)
- src code
- See https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424
- bash script in addition to git repo?

### Coding Practices
- meaningful variable names
- fully document code
- automate tasks
- use libraries when available

### Writing Help Documentation


### Additional Resources
 - Software Carpentry
 - PLOS Computational Biology's [Good Enough Practices in Scientific Computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510)


## Tools and Ideas to Further Improve Software

There are times when you may want to go beyond the minimum requirements to build a more robust piece of software. This may be the case if you are working with many collaborators, plan to publish/release your code, or anticipate a need to update your code and/or data over time.


### Manage Dependencies (Environments and Containers)


### Use Standard Styles (PEP8-- pycodestyle, linter tools)
- pylint

### Unit Testing


### Version Control and Issue Tracking
 - Link to managecode
 - Reiterate importance of review

### Continuous Integration


#### Git Badges
https://travis-ci.org/

https://medium.freecodecamp.org/how-to-use-badges-to-stop-feeling-like-a-noob-d4e6600d37d2

