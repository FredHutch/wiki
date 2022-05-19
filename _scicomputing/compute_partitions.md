---
title: Cluster Partitions
primary_reviewers: atombaby
---

## Overview

Slurm _partitions_ organize and associate compute resources in the cluster. Partitions have a number of attributes that can be adjusted to suit the particular needs of the compute users- primarily we use partitions to adjust the limits and scheduling of compute jobs.

## Gizmo Partition Summary

| Partition Name | Nodes | Guaranteed | Priority | Max Time | Limits
|----------------|-------|------------|----------|----------|--------
| campus-new (*) | All   | yes        | normal   | 30 days  | 1000 cores per account
| short          | All   | yes        | normal   | 12 hours | 8000 core-hours committed per account
| restart        | All   | no         | low      | 7 days   | no limit

> "guaranteed" means that the job is guaranteed all of its requested time

> "priority" indicates the relative priority of jobs in one partition versus the others.

Selection of a partition is done when the job is submitted- queued jobs may have the partition changed, but this cannot be changed once the job has started.

### campus-new

The partition "campus-new" is the default partition- this is a general purpose partition with a great deal of flexibility in its limits.

### short

"short" is a partition intended for workloads with many jobs of short duration.  The limit is a little more complicated in that it limits the amount of run time committed to the account, but allows you to run many more cores than under the campus-new partition.

More information is available [here](scicomputing/compute_short/)

### restart

The "restart" partition has no upper limit on the number of cores allocated to an account's workload.  However, these jobs are not guaranteed the requested walltime and can be preempted- the tasks killed and removed from the node- when jobs in other partitions are waiting and can use the resources allocated to restart jobs.

More information is available [here](scicomputing/compute_restart/)
