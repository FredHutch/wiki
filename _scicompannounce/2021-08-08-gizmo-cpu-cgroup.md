---
title: Control Group Resource Management
---

We are making some changes to gizmo that will ensure that jobs have access to the resources requested.

On gizmo the resources are shared- with the large nodes we acquired in the last upgrade, we could have up to 36 jobs all running concurrently on a single node, each from different labs and individuals. This occasionally leads to problems with jobs that may use more than the requested resources (e.g. using 8 cores instead of the one core specified at job submission).  There is currently no mechanism to ensure that a job only uses the number of cores requested.

Similarly, we do little in the way of memory management.  We have recommendations (requesting a number of cores corresponding to the amount of memory you anticipate using), but there are frequently instances where a single job may- inadvertently- use all free memory which can cause multiple job failures.

Thus, we are working to better manage jobs, to put fences around jobs to make sure these jobs don't overwhelm a node or cause problems for other jobs.  To do this we are integrating Linux Control Groups (cgroups) with Slurm to create control groups that correspond to the requested resources for each job.

We are tackling this in two phases- the first phase, where we use a cgroup to ensure jobs use only the requested CPU and GPU resources, and a second phase where we add memory as a managed resource.

## What is a Control Group

Straight from the [kernel.org](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/cgroups.html) source:

> Control Groups provide a mechanism for aggregating/partitioning sets of tasks, and all their future children, into hierarchical groups with specialized behaviour.

Wikipedia has a [slightly more grounded description](https://en.wikipedia.org/wiki/Cgroups):

> cgroups (abbreviated from control groups) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, etc.) of a collection of processes.

_cgroups_ have been around for some time.  We currently use cgroups to manage workload on the rhino nodes as well.  This integration adds an additional step when Slurm allocates a node to a job- it will create a cgroup made up of resources we want Slurm to monitor.

It is important to note that these cgroups are nearly transparent to the use of the node- you will only notice changes when the job reaches the limit of the cgroup its been assigned to.

## Phase 1: CPU and GPU cgroup

> Effective: 8 August 2021

In this first phase we are only going to manage CPU and GPU resources.  When your job starts, it will be placed into a cgroup which is only allowed to use the number of CPUs and GPUs requested.

### What to Watch For

#### Default Threads

Your job may slow down if it has previously used more resources than requested.  This is often due to the default behavior of some tools and libraries- OpenBLAS is a frequent offender as it by default uses all available cores.  Picard also defaults to all of the cores on a host.

In general, it's a good practice to review your tool's documentation and manage the threads explicitly.  Slurm jobs will have the environment variable SLURM_CPUS_ON_NODE which you can use to indicate the number of cores available to your tools:

```
java -jar picard.jar IlluminaBasecallsToFastq NUM_PROCESSORS=${SLURM_CPUS_ON_NODE} ...
```

## Phase 2: Memory cgroup

> Effective: TBD

The second phase of this work will add memory to the job cgroup.  This will allow Slurm to track the memory allocated to a job and ensure that jobs stay within that cgroup.  This change will affect how jobs are submitted as you will need to add a memory request to your jobs.  Jobs that exceed the cgroup's resources will fail, so we are proceeding carefully.

This feature is still in development.  We don't have a precise timeline for adding this integration, but hope to add this in the next two-to-three months.
