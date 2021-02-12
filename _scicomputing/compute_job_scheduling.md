---
title: Gizmo Job Scheduling
last_modified_at: 2021-02-09
primary_reviewer: atombaby
---

The compute resources provided by Scientific Computing are available to all Hutch researchers.  As a shared resource in high demand, it's necessary to manage usage such that some resources are available on short notice.

This is primarily seen in the Gizmo cluster, where we have limits on how much can be used by individuals and groups and algorithms that prioritize pending work.  The limits and prioritization algorithms serve to schedule the waiting jobs for available resources.

A primary goal of this process of job scheduling is to ensure sufficient idle resources for "new work" to start quickly ("new work" meaining jobs from cluster accounts that don't already have active jobs).  The other scheduling goal is the equitable allocation of resources, that each group has access to the same amount of resources.

To this end, each group is limited to a maximum amount of computational resources- no one group can use all of the resources. Currently this is implemented as a maximum on the number of cores available.  Furthermore, as a group's usage increases, the priority of that group's waiting jobs is lowered, allowing other groups to access idle resources.  This "fairshare" algorithm looks at usage over 24 hours and adds priority to a group's jobs if that group hasn't been using the group's "fair share" of the cluster.

## Cluster Accounts

The cluster account provides access to the cluster.  No one is able to submit jobs to the cluster without being associated to a cluster account.  The account provides the primary basis for measuring usage and enforcing limits. More information about accounts is available [[here|scicomputing/compute_accounts]] 

## Limits

> It is important to note that we do not allocate any particular resource or set of resources for accounts.  The resources in the cluster are generally available until allocated to a job.

Limits on resource usage are the primary tool used to ensure that we maintain some idle resources to allow for instantaneous demand from accounts which do not have active work.  When an account has reached this limit, pending jobs are blocked from running until the number of cores in use by this account fall below the limit.

While resources are not explicitly allocated to a group, we do have a goal of providing 300 cores per account.  However, that number of cores may only become available over time- only the first few cores are instantaneously available.

The goal is a minimum target.  To improve utilization, there is a process that monitors available resources and adjusts limits up and down depending on the amount of idle resources.  These limits are tracked and times when the limit is below the goal are note in that monitoring system.

## Scheduling: Fairshare and Backfill

Pending jobs are assigned a priority- jobs with higher priority are run before lower priority jobs.  This priority is primarily calculated using the "fairshare algorithm" which looks at the usage by an account over a period of time.  Older usage is decayed using something like a half-life calculation so that an account's current usage has the greater impact on the job's priority.

There is an additional time factor which accounts for the amount of time a job has been waiting.  This and the fairshare factor are combined to calculate the job's priority- multipliers provide different weights to those factors.  The wait-time for a job has a very small factor and only ensures basic ordering of jobs for an account.

The jobs with the highest priority are reserved resources- the scheduler identifies suitable resources which are or will be available and reserves those for the job.

However, there is another mechanism for jobs to get resources.  Once those reservations are made, jobs which can fit onto idle resources and don't block those reservations can be allocated those resources.  This "backfill" mechanism allows lower priority jobs to run on otherwise unused nodes.

