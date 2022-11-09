---
title: Memory Scheduling on Gizmo
---

Starting Xxxxxx Xth, 20xx we will begin constraining the memory your job uses. This will require that you add a memory request to your job as any job that goes over its memory request will be killed.

## Background

To date we have not controlled the amount of memory your jobs use, instead relying on the number of cores (or CPUs) as a loose proxy for the amount of memory your job will need.

As memory available to all jobs on a node is otherwise unconstrained, we frequently encounter situations where a job uses more memory than availble or drives memory use to a point where the node fails.  This impacts everyone allocated to that node, causing all jobs on the node to fail.

## The Change

We will be updating the configuration of Slurm to constrain memory available to a job.  Jobs that attempt to allocate more memory will fail.  Jobs that do not explictly request memory will be given a default request of 10MB per core requested.  The maximum memory per core is 20GB.

## FAQ

### How can I determine how much memory my job will need?

> tbd- note history is available in sacct and you can use whole node to run a single job to size it

### Why is the default memory so low?

We've chosen a very low default so that if you don't request memory, the job will fail quickly.  The concern is that many jobs will use low amounts of memory and then "baloon" up at various stages, sometimes days into a long job.  We'd rather that job fail quickly than waste hours or days of compute time.

### Why can't I request more than 20GB per core?

Limits are still set on the number of cores a PI account is using.  Without a maximum we could conceivably end up with all nodes in use by a single account without exceeding those limits.  As an extreme example- if an account had 300 running jobs each requesting 1 core and 700GB of memory there would be no more memory available for other accounts on any node.

### My job failed- how can I tell if I didn't request enough memory

### I used `--mem` to request memory and the number of cores I requested increased

If the gross amount of memory requested by a job (i.e. `sbatch --mem`) exceeds the memory-per-core limit then Slurm will attempt to adjust the number of cores for a job to meet this limit.  This may have unintended side effects.
