---
Title: New Harmony GPU Compute Nodes
---

The gizmo cluster has been augmented with more capable GPU nodes which we are calling the "harmony" class node.  These systems have four NVIDIA L40S GPUs and provide significantly more memory (44GB) for GPU processes.  These should be helpful for many processes that were constrained on the old gizmo J and K class nodes.  Additional information is available on the wiki ([here](/scicomputing/compute_gpu) and [here](/scicomputing/compute_platforms)).

These new systems are part of the gizmo cluster but there are a number of important differences:

### Hardware

These use the AMD EPYC processor- the 9354P with 32 cores running up to 3.8GHz.  These are very compatible with Intel but have some differences which require rebuilding some tools (see below, "Environment Modules")

### OS

These new hosts are also running the latest LTS release of Ubuntu (Noble Numbat, 24.04).  Again, while there is some compatiblity with the OS on the J and K class gizmo nodes (Bionic Beaver, 18.04), there are many cases where software built on the old gizmo nodes will not run on these.

### Environment Modules

Because of the above differences we have rebuilt the entire Lmod environment module tree for these new hosts.  Not all of the modules available on the J and K class nodes are available on the harmony class nodes- use `ml spider` to list available modules, and `ml spider <modulename>` to show available versions.  If you need a specific version or toolset built, please email SciComp.

Please note that we are reserving these hosts for GPU workload.  We will be adding non-GPU hosts in the future, but for now we will be prioritizing modules needing GPU capabilities
{: .notice--info }

### Partition & Limits

These harmony nodes have been configured into the _chorus_ partition.  There are a limited number of nodes with this capability so jobs running in this partition are more restricted- access requires the job request a GPU and a maximum of four GPUs can be allocated to an account.  These nodes have 32 cores, but any one job is limited to 8 cores- CPU intensive work should be targeted for J and K class nodes.

### Access

Requesting the _chorus_ partition and a GPU is all that's required to allocate harmony resources to your job.  Because of the differences between the J/K class and Harmony nodes we have configured a login/dev node called _maestro_ for interactive use.  This node is something like a _rhino_ login node, but configured with the new hardware, OS, and modules.

_maestro_ can be accessed via SSH.  At this time we do not have NoMachine available for this node.

This is a shared host- please watch your utilization and limit use of its resources to the very minimum necessary to prove and develop your work.  Once you have confidence that a job will work, submit it to the _chorus_ parition.
{: .notice--info }

## Last Word

Eight nodes have been added, but currently (18 November) there are only 6 available: one is having hardware problems and will be put into service as soon as that has been resolved.  The other is currently serving as _maestro_ and providing login and development services for harmony nodes until its replacement arrives.  This replacement should be available in early December.
