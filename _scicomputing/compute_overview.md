---
title: Large Scale Computing Overview
last_modified_at: 2019-08-01
primary_reviewers: bmcgough
---

Researchers are more and more likely to need to analyze raw data sets using some sort of analysis process before they can be interpreted in the context of the scientific question. Raw data, whether from an array or sequencing for example, are not typically directly interpretable results, thus require some degree of processing. The nature of the processing depends on the data type, the platform with which the data were generated, and the biological question being asked of the data set. How this process is performed depends on the specific project, but support and resources for this process are available at the Fred Hutch for a variety of needs.

The first step in doing this work is often as simple as asking "what computing resource do I need to use for this task?"  This section describes a range of computing resource options available to Fred Hutch researchers, all the way from a single laptop to the Fred Hutch on-premise high performance computing cluster (`gizmo`) to various cloud-based options, as well as how to get started using each platform.

## [Quick Start Guide](/scicomputing/compute_quickstart/)

If you have experience working with cluster computing resources at other institutions, this quick start guide should give you a general idea of our compute resources at the Hutch.

## [Technologies](/scicomputing/compute_platforms/)
This page describes all the various technologies and specifications for them that are supported by Fred Hutch for large scale computing.  

### Desktop computing platforms

While most bioinformatic analysis of genomics data, for example, will likely require more compute resources than are typically available in a desktop computer, some smaller analysis jobs or training can be done on a desktop or laptop.  For these smaller compute jobs, scientific computing languages [R](https://www.r-project.org) or [Python](https://www.python.org) may be useful (see [the Software Development page](/scicomputing/software_overview/) for more information about these computing languages). You can obtain assistance in installing a copy of R and RStudio on PCs through the Center IT desktop software resource. The installation of a commonly used Python and R package management system called Conda can be done on either PCs or Macs and more information about Anaconda and Miniconda (two versions of the Python oriented version of Conda package manager) can be found [here.](https://conda.io/docs/glossary.html#anaconda)

### Interactive Computing:  Easy Access, Moderate Capability
These systems are provided by the Fred Hutch to serve the community with the intention of:
  1. being immediately accessible by everyone, regardless of skill set,
  2. allowing for interactive development of code and/or approaches to analyses, and
  3. being supported by compute resources larger than a typical desktop computer.


These systems are best used for situations such as training of new users in development of R or python code or curation of Galaxy-style workflows that need connectivity to our local filesystem in a way not accessible via the [public instance of Galaxy.](https://usegalaxy.org/) These systems also provide compute resources that are a step above a typical desktop computer, thus are good systems for slightly more compute-intensive jobs that still require interactivity.  Each is a managed resource with actively managed packages/modules/tools depending on the system, and thus work well for fairly standard platforms for interactive computing that does not require highly specialized software components.  Additionally, these systems may not be appropriate for analyses that require a higher level of data security, please contact FH username `scicomp` to inquire.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
[RStudio Server](http://rstudio.fhcrc.org) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast
[Fred Hutch Galaxy Instance](http://galaxy.fredhutch.org/)| web, platform-specific credentials | Matsen Group | Limited to staged data
[JupyterHub](https://jupyterhub.fhcrc.org/) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast


### Interactive Computing: Command Line Interface (CLI), Moderate to High Capability
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.  Often reasons to move to these HPC resources include the need for version controlled, specialized package/module/tool configurations, more compute resources, or rapid access to large data sets in data storage locations not accessible with the required security for the data type by the above systems.


## [Computing Environments and Containers](/scicomputing/compute_environments/)
A wide range of pre-built scientific software is available for use in large scale computing work.  This page describes how to find out what is available, how to use it and what to do if something you need is not yet available. 

## [Job Management](/scicomputing/compute_jobs/)
When doing large scale computing tasks, one often shifts to the use of jobs to perform specific tasks.  This page provides some background on managing and interacting with your tasks.  

Batch computing allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop disconnected, the job would be terminated.

The batch system used at the Hutch is [Slurm](http://schedmd.com). Slurm provides a set of commands for submitting and managing jobs on the `gizmo` and `beagle` clusters as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.  

## [Parallel Computing](/scicomputing/compute_parallel/)
There are many approaches to parallel computing (doing many jobs simultaneously rather than in series). We have a [wiki resource available describing parallel computing](/scicomputing/compute_parallel/) as well as the [FredHutch/slurm-examples repository](https://github.com/FredHutch/slurm-examples) containing community curated examples with additional documentation that can help you get started.   


## [Cloud Computing](/scicomputing/compute_cloud/)
Beyond on premise resources, cloud computing access is available for Fred Hutch researchers and this page provides some basics on how to get started if you are in need of cloud computing specifically.  Options like the `beagle` and `koshu` [clusters](/scicomputing/resource_overview/), while built _in_ the cloud, are very much a simple extension of existing infrastructure into cloud providers but does not fully or particularly efficiently utilize the real capabilities and advantages provided by cloud services.   Additionally, Fred Hutch users have access to the [Amazon Web Services Batch](https://aws.amazon.com/batch/) service directly, which can be a powerful tool, but may have a steeper learning curve or be more finicky than users may have the bandwidth for.  

If you are at all interested or curious about cloud solutions and would like to
talk over options, Scientific Computing hosts a cloud-specific office hours
every week.  Dates and details for SciComp office hours can be found in
[CenterNet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html) or on the Coop Communities [calendar.](https://calendar.google.com/calendar/embed?src=gd30dlifri4fu7h104cuqdj0dg%40group.calendar.google.com&ctz=America%2FLos_Angeles) 

## [Computing with GPU](/scicomputing/compute_gpu/)

Graphical Processing Units (GPUs) provide acceleration for some kinds of computations and tools, [tensorflow](https://www.tensorflow.org/) is a notable example of such a tool.

[This page](/scicomputing/compute_gpu/) describes in general where you can find those resources and how to request those for your jobs.  [This](https://sciwiki.fredhutch.org/compdemos/tensorflow-gpu/) has a specific example of running tensorflow on SciComp clusters.

## [Information for Grant Writers](/scicomputing/compute_grants/)
Scientific Computing has provided a description of computational and storage resources for grant writers.
