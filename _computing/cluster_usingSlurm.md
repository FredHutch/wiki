---
title: Using Slurm on Hutch Systems
last_modified_at: 2018-09-27
---
>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.

## Slurm

Slurm is the workload manager for Scicomp clusters.  It manages both your jobs
and the resources available in the cluster.  There are two main clusters in use today- the on-campus _gizmo_ cluster and the cloud-based _beagle_ cluster.  Commands work the same in either environment.

## Basic Slurm Terminology

### Cluster

A cluster is a collection of compute resources (nodes) under the control of the workload manager (Slurm in our case)

### Partition

A partition is a collection of resources (nodes) inside of a cluster.  There are defaults, so specifying a partition name is not required.

### Node

A node is the basic computing unit that shares processors, memory, and some (limited) local disk.

### Job

A job is a collection of tasks, typically implemented as a shell script.

### Account

When we refer to an "account" in the context of Slurm, we are referring to the PI account used to enforce limits and priority and _not_ your HutchNet ID.  Your HutchNet ID is associated with an account.

## Commands for Managing Jobs

### squeue

The `squeue` command allows you to see the jobs running and waiting in the job queue.

### scancel

`scancel` allows you to signal jobs- most commonly this command is used to stop execution of a running job or remove a pending job from the job queue.  A job IDis the common argument though `scancel` will take many other arguments that allow bulk management of jobs.

### hitparade

The `hitparade` command will show a summary of all jobs running and queued on the cluster broken down by user and account.

## Commands for Submitting Jobs

### sbatch

`sbatch` is used to submit a job script to the cluster.  These run jobs without your intervention or input (i.e. non-interactively).

### srun

`srun` is used to run a task on the cluster.  This is an interactive session,
where you can directly view output as it's produced or provide input (if needed
by the task your are running.

### grabnode

The `grabnode` command will start an interactive login session on a cluster node.

## SciComp Wrappers and Tools

<!-- grab commands, hitparade -->

