---
Title: February Maintenance for Rhino/Gizmo Compute Environment
---

On Sunday, 2 Feb 2024, SciComp will be performing maintenance on systems in the Rhino/Gizmo compute environment.  We expect this to take most of Sunday- during this time jobs will not be run and access to many systems will be intermittent.

If you have questions about any of this work, please email Scientific Computing.

## What to Expect

We will be rebooting each of the cluster nodes and therefore running jobs will not survive this work.  To minimize the number of jobs that are cancelled, we have put a reservation on all cluster nodes that blocks out the maintenance window. Any job still running when the maintenance starts will be cancelled/killed as we reboot nodes.  Any queued jobs will remain in a pending state and will be run after the maintenance is complete.

Any job you submit that would run into the maintenance window will be held until after the maintenance is complete- you will see the reason "ReqNodeNotAvail,_Reserved_for_maintenance" in the output of `squeue`.

The most significant changes that affect your use of the rhino/gizmo nodes are 1) the removal of scratch from cluster nodes and 2) the changes to the grabnode limits.  Those changes are described below

## Maintenance Items

These are the changes we'll be making to the cluster during this work:

### Disabling Scratch Access

As part of the process of decommissioning the scratch file system, we will be removing access to the Scratch file system from the rhino and gizmo compute nodes.  Scratch will still be available via Motuz for data transfers.  You will also still be able to access Scratch from your workstation.

Removing _scratch_ from the rhino nodes may require that we terminate processes that are accessing _scratch_.
{: .notice--warning}

If you are still using scratch, you will need to get your lab migrated to one of the Fast, Temp, or Working storage platforms. Both DaSL and SciComp are available to assist with migrating your data and workflows.

### Revising Grabnode Limits and Prioritization

We are adjusting `grabnode` to improve utilization of cluster compute cycles.  `grabnode` jobs will be routed to a dedicated QOS that limits `grabnode` to a maximum of 3 jobs or 36 cores _per-user_.  `grabnode` jobs will also be given a priority bump to improve allocation time for those jobs.

### Upgrading Slurm

We will be upgrading Slurm to the current release (24.11).  This will keep us on track and supported by the Slurm development team.  This update won't impact or change how you use gizmo.

This work includes an update of the database which we expect to take approximately one hour.

### Upgrading Slurm Controllers

We'll be updating the Slurm controllers to the latest OS release (Ubuntu Noble, 24.04).  This won't impact how you use the cluster- this is only to bring the controllers up-to-date and help with any support problems that come up in the future.

### Pruning Slurm Accounting Data

We need to reduce the number of records we maintain in the Slurm accounting database (the long-term records stored for each job).  The database is currently over 90GB in size which makes maintenance and management cumbersome.  We are going to prune records older than 90 days, moving those to a backup database. Job records going back to mid 2021 are still available in [XDMoD](https://sciwiki.fredhutch.org/scicomputing/compute_xdmod/).
