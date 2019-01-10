---
title: Parallel Computing on Slurm Clusters
last_modified_at: 2019-01-10
---

## Overview of Parallel Computing

_Parallel computing_ is an approach to computing where many tasks are done
simultaneously- either on a single device or on multiple independent devices.
These tasks can be dependent or independent of each other requiring varying
degreees of ordering and orchestration.  Parallel computing can be quite
complicated but has a huge payoff in throughput.

Parallel computing starts with breaking a larger task into smaller steps- the
"size" and relationship of those steps is highly dependent on the task
at hand but determines much about how the job can be "parallelized".  When
steps are highly dependent on each other (e.g. the output of one step is used
for input into the next) that job is said to be "serial" and it won't benefit
greatly from parallel processing.  At the other end, "embarassingly" or
"pleasantly" parallel work has individual steps that do not depend on each
other.

Once you've determined how your work can be parallel-ized, there are two ways
to put the power of multiple processors to work.  The first is using the
capabilities of multi-core CPUs.  A single CPU (or socket) has multiple cores
which are each capable of processing independent steps.  Another approach to
using multiple processors is to spread the work over multiple different
computers.  The latter approach has the advantage of being able to scale up the number of individual steps performed simultaneously.

> Note: it's also possible to combine those techniques- using multiple cores on multiple computers.  This can add a little complexity, but many of the tools described below will handle this neatly.
