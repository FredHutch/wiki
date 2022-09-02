---
title: Rhino/Gizmo Updates, 10 September 2022
---

On 10 September 2022 the Systems Engineering team will be updating the operating system on the file server _silver_ which hosts fast, home directories, and many other file services essential to our computing environment.

While this is a rolling upgrade which doesn't affect many services, the nature of our HPC work has in past resulted in problems as individual nodes in the _silver_ cluster are rebooted.  Thus, we've decided to take a full outage and to use this as an opportunity to perform some much-needed maintenance on those systems.

This document describes the scope of the outage, the updates we're making, and what you can expect in the lead-up to the outage.

## What to Expect

During this maintenance the rhino login nodes and gizmo compute nodes will be unavailable for any work.  Attempts to connect via ssh will fail.  Any processes running on these nodes will be terminated.

As we have done in the past, we have put in a reservation against all cluster nodes starting at midnight of the 10th. Pending jobs that would not complete before the maintenance window begins will be held until after the work is complete.  `squeue` will show the job as pending with reason _ReqNodeNotAvail, Reserved for maintenance_.

For example, if you submit a job requesting 3 days run time on the Thursday before the maintenance starts, that job will not be run until after the maintenance is complete.  If you reduce the walltime to one day, it can be allocated resources, but would be killed if it exceeded that time limit.

If you are confident your job can complete before the maintenance period starts you can reduce the time limit of the job. When submitting a job, use `--time` to adjust this:
```
sbatch --time=1-0   # Requests 1 day
```
or
```
sbatch --time=12:00:00 # Requests 12 hours
```

if the job has already been submitted, update using `scontrol`:

```
scontrol update jobid=<jobid> timelimit=1-0
```

## The Work

### Kernel Upgrade

We'll be updating the kernel (and associated libraries) on rhino/gizmo nodes to the latest maintenance release from Canonical.  These are primarily bug and security fixes- we don't expect any changes to arise from this.

### NVIDIA Driver Upgrade

The drivers for the NVIDIA GPU cards will be updated to version 515 (from the current version of 460).  Again, we don't expect changes to GPU use arising from the update of these drivers.

### Slurm Upgrade

We will be updating Slurm to version 22.05.3.  There are a number of new features available in this version, but we aren't implementing any of these at this time.  This update is primarily to keep on a supported version and to implement some bug and security fixes available in this updated version.

### NoMachine Upgrade

Some time back we'd upgraded the NoMachine service on the host _rhino03_ to version 7.  This update seems to have been very successful, so we'll be upgrading _rhino02_ and _rhino01_ from version 6 to version 7 to get all of these in sync.

There are no changes that will impact typical use of NoMachine in these updates.

### Updated Automount Configuration

We are retiring the _very_ old systems providing information to the automount services on rhino/gizmo cluster nodes.  Automount provides dynamic connections from the nodes to networked file systems (e.g. where to find your home directory).

We're updating to a new back-end (LDAP) and reconfiguring the nodes to use this new service.

### Reboot

Lastly, everything will get a reboot.  This is required to update the kernel, but has the added benefit of "clearing out the cobwebs" that can accumulate on systems that are running at high load for long periods of time.

