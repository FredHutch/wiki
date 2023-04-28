---
Title: New Limits on GPU Use
---

We have implemented limits on the total number of GPUs an account can use concurrently.  At this time (April 2023) we've set this limit to 20 GPUs (though this is subject to change- please contact SciComp if you would like to know the current limits).

## What to Expect

Submitting jobs that need GPU resources is no different- if the limit is reached you will see a different reason message.  If your jobs are not running because your account has reached the GPU limit you will see a reason of "MaxGRESPerAccount" in the reason column in the output of `squeue`.

## Background

The Gizmo cluster has a slightly unusual architecture: each node has a single, smaller GPU.  In most other environments there are fewer GPU nodes with many more GPU cores installed per node.

As GPU use has increased we are running into a problem where the lack of GPU limits is causing resources to get fragmented. Each GPU job also uses a CPU and the number of available GPUs is much less than the limit on CPU- this means that once all GPUs are in use, there will be no more "full" nodes available.  Any job needing 36 cores will have to wait for those GPU jobs to complete before being allocated resources.
