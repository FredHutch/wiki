---
title: Cloud Computing at Fred Hutch
last_modified_at: 2018-08-31
---
>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

The Hutch is just getting started with cloud computing.  Options like the
beagle and koshu clusters, while built _in_ the cloud, are very much a simple
extension of existing infrastructure into cloud providers but does not fully or
particularly efficiently utilize the real capabilities and advantages provided
by cloud services.

If you are at all interested or curious about cloud solutions and would like to
talk over options, Scientific Computing hosts a cloud-specific office hours
every week.  Dates and details for SciComp office hours can be found in
[Centernet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html).

Here are the areas where we are actively developing solutions:

# Batch Computing

_AWS Batch_ is an AWS service that uses Docker containers to build a batch
computing system.  Batch is made up of a queueing system where jobs are defined
and queued, and a computational resource made up of Docker containers to
process those jobs.  Resources are provisioned when there are jobs to be
processed and destroyed when the work is complete.  This results in a very
efficient and cost-effective solution for some work.

_Batch_ is useful if you have a fairly standard processing workflow or at least
a step which is fairly consistent.  The classic example for _Batch_ is image
processing: converting a raw image to some other format.  _Batch_ is capable of
much more complicated analyses and pipelines.

As _Batch_ is very much a cloud service, some familiar resources aren't
available when using this.  Our ubiquitous file systems (home directories,
fast-file, scratch) are not available- data used in _Batch_ is typically stored
in S3 or some other web-available source.  There have been some recent changes which
expand options for data storage which may make some workloads more accessible to _Batch_.

If you think your work might benefit from using _Batch_, please contact Scientific Computing or come to cloud office hours.
