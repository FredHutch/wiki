---
title: Gizmo Job Scheduling
last_modified_at: 2021-02-09
primary_reviewer: atombaby
---

The compute resources provided by Scientific Computing are available to all Hutch researchers. As a shared resource in high demand, it's necessary to manage usage such that some resources are available on short notice.

This high demand for a shared resource is primarily seen in the Gizmo cluster, where we have limits on resource use by individuals and groups and algorithms that prioritize pending work. The limits and prioritization algorithms serve to schedule the waiting jobs for available resources.

A primary goal of this process of job scheduling is to ensure sufficient idle resources for "new work" to start quickly ("new work" meaning jobs from cluster accounts that don't already have active jobs). The other scheduling goal is the equitable allocation of resources that each group has access to the same amount of resources.

To this end, each group is limited to a maximum amount of computational resources - no one group can use all the resources. Currently there are limits on the number of CPU cores and GPUs.  Furthermore, as a group's usage increases, the priority of that group's waiting jobs is lowered, allowing other groups to access idle resources.  This "fairshare" algorithm looks at usage over 24 hours and adds priority to a group's jobs if that group hasn't been using their "fair share" of the cluster.

## Cluster Accounts

The cluster account provides access to the cluster. No one can submit jobs to the cluster without being associated with a cluster account. The account provides the primary basis for measuring usage and enforcing limits. More information about accounts is available [here](/scicomputing/compute_accounts)

## Limits

> It is important to note that we do not allocate or reserve any particular resource or set of resources for accounts.  The resources in the cluster are generally available until allocated to a job.

Limits on resource usage are the primary tool used to ensure that we maintain some idle resources to allow  instantaneous demand from accounts that do not have active work. When an account has reached this limit, pending jobs are blocked from running until the number of cores in use by this account fall below the limit.

While resources are not explicitly allocated to a group, we do have a goal of providing a certain number of cores per account (current limits are specific to the partitions and are documented [here](/compdemos/gizmo_partition_index/)). However, that number of cores may only become available over time- only the first few cores are instantaneously available.

The goal is a minimum target. There is a process that monitors available resources and adjusts limits up and down depending on the number of idle resources to improve utilization. These limits are tracked, and times when the limit is below the goal are noted in that monitoring system.

## Scheduling: Fairshare and Backfill

Pending jobs are assigned a priority - jobs with higher priority are run before lower priority jobs. This priority is primarily calculated using the "fairshare" algorithm that looks at the usage by an account over a period of time. Older usage is decayed using something like a half-life calculation so that an account's current usage has the more significant impact on the job's priority.

There is an additional time factor that accounts for the amount of time a job has been waiting. This additional time factor and the "fairshare" factor are combined to calculate the job's priority - multipliers provide different weights to those factors. The wait-time for a job has a very small factor and only ensures the basic ordering of jobs for an account.

The jobs with the highest priority are allocated resources if available. If there are no suitable resources idle, then the scheduler will identify appropriate resources and reserve those for the job. This resource reservation is done for a few of the highest priority jobs.

There is another mechanism for jobs to get resources. Jobs that can fit onto idle resources and don't block other jobs can be allocated idle resources. This "backfill" mechanism allows lower priority jobs to run on otherwise unused nodes.

For example, if there is one idle core and two pending jobs, the higher priority job will get that core. However, if that higher priority job requires four cores, the lower job may be run if it will complete before the other three cores become available.

