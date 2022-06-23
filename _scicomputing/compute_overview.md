---
title: Large Scale Computing Overview
primary_reviewers: bmcgough
---

Researchers are more and more likely to need to analyze raw data sets using some sort of analysis process before they can be interpreted in the context of the scientific question. Raw data, whether from an array or sequencing for example, are not typically directly interpretable results, thus require some degree of processing. The nature of the processing depends on the data type, the platform with which the data were generated, and the biological question being asked of the data set. How this process is performed depends on the specific project, but support and resources for this process are available at the Fred Hutch for a variety of needs.

The first step in doing this work is often as simple as asking "what computing resource do I need to use for this task?" You can find a brief review of [where to run your code here.](/scicomputing/software_running/) This section describes computing resources that support work that requires additional resoruces beyond your local desktop comptuer, from the Fred Hutch on-premise high performance computing cluster (`gizmo`) to various cloud-based options, as well as how to get started using each platform.

## [Quick Start Guide](/scicomputing/compute_quickstart/)

If you have experience working with cluster computing resources at other institutions, this quick start guide should give you a general idea of our compute resources at the Hutch and how to get started using them.

## [Technologies](/scicomputing/compute_platforms/)
This page describes all the various technologies and specifications for them that are supported by Fred Hutch for large scale computing.

### Interactive Computing

Web-based access to HPC resources. These resources are only available from the Fred Hutch network.
You can use web resources remotely with VPN access. 
You will have the same file system access as your cluster account has.


Compute Resource | Access Interface | Resource |
--- | --- | --- | ---
[RStudio Server](http://rstudio-launcher.fredhutch.org) | web, FH credentials | Web IDE for R Programming |
[Jupyter Lab](/scicomputing/software_python/jupyter) | web, FH credentials | Web IDE for (Python, R). Python Notebooks |

### Interactive Computing: Command Line Interface (CLI), Moderate to High Capability

These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.  Often reasons to move to these HPC resources include the need for version controlled, specialized package/module/tool configurations, more compute resources, or rapid access to large data sets in data storage locations not accessible with the required security for the data type by the above systems.


## [Computing Environments and Containers](/scicomputing/compute_environments/)

A wide range of pre-built scientific software is available for use in large scale computing work.  This page describes how to find out what is available, how to use it and what to do if something you need is not yet available. 

## [Job Management](/scicomputing/compute_jobs/)

When doing large scale computing tasks, one often shifts to the use of jobs to perform specific tasks.  This page provides some background on managing and interacting with your tasks.

Batch computing allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop disconnected, the job would be terminated.

The batch system used at the Hutch is [Slurm](https://slurm.schedmd.com/archive/slurm-21.08.5/). Slurm provides a set of commands for submitting and managing jobs on the `gizmo` cluster as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.

## [Parallel Computing](/scicomputing/compute_parallel/)

There are many approaches to parallel computing (doing many jobs simultaneously rather than in series). We have a [wiki resource available describing parallel computing](/scicomputing/compute_parallel/) as well as the [FredHutch/slurm-examples repository](https://github.com/FredHutch/slurm-examples) containing community curated examples with additional documentation that can help you get started.

## [Cloud Computing](/scicomputing/compute_cloud/)

Beyond on premise resources, cloud computing access is available for Fred Hutch researchers and this page provides some basics on how to get started if you are in need of cloud computing specifically.  Fred Hutch users have access to the [Amazon Web Services Batch](https://aws.amazon.com/batch/) service directly, which can be a powerful tool, but may have a steeper learning curve or be more finicky than users may have the bandwidth for.

If you are at all interested or curious about cloud solutions and would like to
talk over options, Scientific Computing hosts a cloud-specific office hours
every week.  Dates and details for SciComp office hours can be found in
[CenterNet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html) or on the Coop Communities [calendar.](https://calendar.google.com/calendar/embed?src=gd30dlifri4fu7h104cuqdj0dg%40group.calendar.google.com&ctz=America%2FLos_Angeles) 

## [Computing with GPU](/scicomputing/compute_gpu/)

Graphical Processing Units (GPUs) provide acceleration for some kinds of computations and tools, [tensorflow](https://www.tensorflow.org/) is a notable example of such a tool.

[This page](/scicomputing/compute_gpu/) describes in general where you can find those resources and how to request those for your jobs.  [This](/compdemos/tensorflow-gpu/) has a specific example of running tensorflow on SciComp clusters.

