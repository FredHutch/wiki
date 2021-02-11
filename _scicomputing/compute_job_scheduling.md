---
title: Cluster Accounts and Usage Limits
last_modified_at: 2021-02-09
primary_reviewer: atombaby
---

The compute resources provided by Scientific Computing are available to all Hutch researchers.  As a shared resource in high demand, it's necessary to manage usage such that some resources are available on short notice.

This is primarily seen in the Gizmo cluster, where we have limits on how much can be used by individuals and groups and algorithms that prioritize pending work.  The limits and prioritization algorithms serve to schedule the waiting jobs for available resources.

A primary goal of this process of job scheduling is to ensure sufficient idle resources for "new work" to start quickly ("new work" meaining jobs from cluster accounts that don't already have active jobs).  The other scheduling goal is the equitable allocation of resources, that each group has access to the same amount of resources.

To this end, each group is limited to a maximum amount of computational resources- no one group can dominate the resources- currently this is implemented as a maximum on the number of cores available.  Furthermore, as a group's usage increases, the priority of that group's waiting jobs is lowered, allowing other groups to access idle resources.  This "fairshare" algorithm looks at usage over 24 hours and adds priority to a group's jobs if that group hasn't been using the group's "fair share" of the cluster.

### A Metaphor

Imagine a fenced pasture for grazing.  Around this pasture are many farmers, each with a gate to the field.  Some farmers raise cattle, some sheep, and other chickens.  Each animal has different needs and requires a different amount of space in the pasture.  For example, cows need a big chunk of that pasture- sheep require less, and chickens less than sheep.

All of these farmers have different needs- some don't raise a lot of livestock and can get by in a pen inside their farm.  Others raise vegetables.  Some have huge herds and flocks and are dependent on ready access to the pasture.

Fitting all of that onto the pasture becomes the problem.  When farmers don't have a lot of animals this is a fairly easy problem  As the population of livestock increases, timely access to sufficient pasture becomes a problem.

If farmers' gates were open all the time it would be a proper mess, so the farmers agree to limit the amount of pasture any one farmer can use at any time.

Access to the pasture is exclusively through one of the existing farmers' gates- so any farmhands who want to graze need to work through one of those farmers with a gate.

## Cluster Accounts

The _cluster account_ provides access to the cluster.  No one is able to submit jobs to the cluster without being associated to a cluster account.  The account provides the primary basis for measuring usage and enforcing limits.

Accounts are created for Hutch Faculty and NIH grant principals.

### A Metaphor

In the metaphor of the farmer's pasture, the account is the gate from the farmer's property to the pasture. 

## Limits and Allocations

Accounts do not provide a guarantee of an explicit number of cores at any time- resources are not set aside (allocated) for any one account but are in a general pool. This oversubsription allows us to have higher limits than an explicit, dedicated per-account allocation.

Large numbers of cores will only becore available over time- only the first few cores are instantaneously available.

### A Metaphor

Access to the pasture doesn't mean that the farmer has a section reserved for their animals or that they will be able to put all of their livestock out at the same time. If the pasture is very full, one or two head will have space to run, but it will be some time before all of the farmer's livestock can be put to pasture.

## Scheduling: Fairshare and Backfill

Pending jobs are assigned a priority- jobs with higher priority are run before lower priority jobs.  This priority is primarily calculated using the "fairshare algorithm" which looks at the usage by an account over a period of time.  Older usage is decayed using something like a half-life calculation so that current usage has the greater impact on the job's priority.

There is an additional time factor which accounts for the amount of time a job has been waiting.  This and the fairshare factor are combined to calculate the job's priority- multipliers provide different weights to those factors.  The wait-time for a job has a very small factor and only ensures basic ordering of jobs for an account.

The jobs with the highest priority are reserved resources- the scheduler identifies suitable resources which are or will be available and reserves those for the job.

However, there is another mechanism for jobs to get resources.  Once those reservations are made, jobs which can fit onto idle resources and don't block those reservations can be allocated those resources.  This "backfill" mechanism allows lower priority jobs to run on otherwise unused nodes.

### A Metaphor

When the pasture is filling up it becomes necessary for the farmers to have more care in putting livestock into the field.  To do this, farmers who have had a lot of livestock grazing hold back putting more livestock out to allow those who have not been grazing to put out their herd.
