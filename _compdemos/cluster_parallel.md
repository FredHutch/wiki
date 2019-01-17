---
title: Parallel Computing on Slurm Clusters
last_modified_at: 2019-01-10
---

## Overview of Parallel Computing

_Parallel computing_ is an approach to computing where many tasks are done
simultaneously- either on a single device or on multiple independent devices.
These tasks can be dependent or independent of each other requiring varying
degreees of ordering and orchestration.  Parallel computing can be quite
complicated but can improve job throughput.

Parallel computing starts with breaking a larger task into smaller steps- the
"size" and relationship of those steps is highly dependent on the task
at hand but determines much about how the job can be "parallelized".  When
steps are highly dependent on each other (e.g. the output of one step is used
for input into the next) that job is said to be "serial" and it won't benefit
greatly from parallel processing.  At the other end, "embarassingly" or
"pleasantly" parallel work has individual steps that do not depend on each
other.

Once you've determined how your work can be parallel-ized, there are two ways
to distribute those steps.  The first uses the capabilities of multi-core
CPUs- modern CPUs have multiple cores, each of which are capable of processing
independent steps.  This technique is typically referred to as "threading."

Another approach to using multiple processors is to spread the work over
multiple different computers.  This approach has the advantage of being
able to scale up the amount of computation being done concurrently.  This
approach is often described as "distributed"

> Note: it's also possible to combine those techniques- using multiple cores on
> multiple computers.  This can add a little complexity, but many tools will
> handle this neatly.

### Choosing

The primary drivers for choosing between the two is how much communication
between individual steps is necessary and how many steps there are.
Communication between steps is expensive, and if that communication needs to
cross a network (as in a distributed solution) there can be a degredation in
performance compared to keeping all of the steps on the same system (as in
the threaded solution).  However, if there are many steps the resources on a
single system will be a bottleneck, which makes a distributed solution more
appealing.


