---
title: Using Slurm on Hutch Systems
last_modified_at: 2018-09-27
---
>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

## Slurm 

Slurm is the workload manager for Scicomp clusters.  It manages both your jobs
and the resources available in the cluster.  There are two main clusters in use today- the on-campus _gizmo_ cluster and the cloud-based _beagle_ cluster.  Commands work the same in either environment.

## Basic Slurm Terminology

**Partition** A partition is a collection of resources- compute nodes.  There are defaults, so specifying a partition name is not required.

**Account** When we refer to an "account" in the context of Slurm, we are referring to the PI account used to enforce limits and priority and _not_ your HutchNet ID.

## Commands for Managing Jobs

### scancel

`scancel` allows you to signal jobs- most commonly this command is used to stop execution of a running job or remove a pending job from the job queue.  A job IDis the common argument though `scancel` will take many other arguments that allow bulk management of jobs.

### squeue

The `squeue` command allows you to see the jobs running and waiting in the job queue.

## Commands for Submitting Jobs

## SciComp Wrappers and Tools

<!-- grab commands, hitparade -->

