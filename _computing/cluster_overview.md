---
title: Large Scale Compute Overview
last_modified_at: 2019-03-19
---
This section contains articles that describe a range of high performance computing resource options available to Fred Hutch researchers.


## [Linux Operating System](/computing/linux_linux101/)
The operating system for remote (non-local desktop) computing is Linux.  This page provides background on what Linux is and how you can learn to use it.

## [Technologies](/computing/resource_overview/)
This page describes all the various technologies and specifications for them that are supported by Fred Hutch for large scale computing.  

## [Scientific Software](/computing/cluster_software/)
A wide range of pre-built scientific software is available for use in large scale computing work.  This page describes how to find out what is available, how to use it and what to do if something you need is not yet available.

## [Job Management](/computing/cluster_usingSlurm/)
When doing large scale computing tasks, one often shifts to the use of jobs to perform specific tasks.  This page provides some background on managing and interacting with your tasks.  

## [Cloud Computing](/computing/cluster_cloudCompute/)
Beyond on premise resources, cloud computing access is available for Fred Hutch researchers and this page provides some basics on how to get started if you are in need of cloud computing specifically.  The Hutch is just getting started with cloud computing.  Options like the
`beagle` and `koshu` [clusters](/computing/resource_overview/), while built _in_ the cloud, are very much a simple
extension of existing infrastructure into cloud providers but does not fully or
particularly efficiently utilize the real capabilities and advantages provided
by cloud services.   Additionally, Fred Hutch users have access to the [Amazon Web Services Batch](https://aws.amazon.com/batch/) service directly, which can be a powerful tool, but may have a steeper learning curve or be more finicky than users may have the bandwidth for.  

Another option for using cloud resources, especially when performing a series of tasks (a workflow) repeated, while not necessarily having to
understand or coordinate the individual components of the AWS infrastructure
is to use the workflow manager [Nextflow](https://www.nextflow.io/).  Nextflow can be configured to use AWS
as the backend execution resource, and thus it is very helpful to understand the basics of
AWS Batch in order to get your data to a place where it can be
analyzed easily via Nextflow.

If you are at all interested or curious about cloud solutions and would like to
talk over options, Scientific Computing hosts a cloud-specific office hours
every week.  Dates and details for SciComp office hours can be found in
[CenterNet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html) or on the Coop Communities [calendar.](https://calendar.google.com/calendar/embed?src=gd30dlifri4fu7h104cuqdj0dg%40group.calendar.google.com&ctz=America%2FLos_Angeles)
