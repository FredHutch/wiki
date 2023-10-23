---
Title: October Maintenance for Scicomp Systems
---

On Sunday, 29 October from 12:00PM PDT until 5:00PM PDT Scientific Computing will be upgrading and replacing a number of the systems and components in our computational environment.  During this time the scratch file system, rhino nodes, and gizmo compute cluster will be unavailable.  During this work, all Slurm operations (job submission, querying the job queue, etc) will fail.

Please note that we will need to cancel any running jobs as many of these operations require that we reboot the compute nodes.  Pending (queued but not running) jobs will be preserved and will be released after the maintenance is complete.

We have also placed a reservation to prevent jobs from starting if the job would run into this maintenance window.  This means that as we get closer to the date you may see jobs waiting even though there are available resources (see below for more information and workarounds).

## What to Expect

### Scratch File System

During this maintenance the scratch file system will be unavailble.  This includes access via workstation mounts (e.g. smb://center.fhcrc.org/fh/scratch).  After we have completed the work on the file system we will be restoring it to service.

We don't anticipate any loss of data- taking down the whole service significantly reduces the risk of data loss or corruption.

### Rhino and Gizmo

During this maintenance the rhino login nodes and gizmo compute nodes will be unavailable for any work.  Attempts to connect via ssh will fail.  Any processes running on these nodes will be terminated. Any RStudio sessions started by the [RStudio Launcher](rstudio-launcher.fredhutch.org/) will fail and any active sessions will be terminated.

As we have done in the past, we have put in a reservation against all cluster nodes starting at Noon on Sunday, 29 October. Pending jobs that would not complete before the maintenance window begins will be held until after the work is complete.  `squeue` will show the job as pending with reason _ReqNodeNotAvail, Reserved for maintenance_.

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

## What we are Doing:

### Gizmo Controller Replacement

We will be replacing the existing Slurm controller for the _gizmo_ cluster with three new systems.  One to host the database, and two in a high-availability configuration.

The version of the controller will remain the same and there will be no other changes to how you use the cluster.

### Scratch File System Backplane Replacement

One of the nodes in the cluster making up the _scratch_ file system has persistent errors with disks that we believe caused by a failing backplane (a backplane is the physical connector between the disks and the main system boards).  This requires that we take the scratch file system offline and power down the node with the suspect hardware.

We do not expect any impact or changes to data stored on _scratch_.

### OS Updates

We are going to update the kernel and NVIDIA driver versions on the compute nodes (rhino and gizmo cluster nodes).  This is an operation that requires a reboot of the hosts.

The Linux kernel will be updated to version 4.15.0-213. The kernel updates are primarily bug-fixes and should have little impact on how we use these systems.  There are a few associated OS packages that will be updated as part of this, but again, we anticipate no changes to use of rhino/gizmo nodes.

However, the updates of the NVIDIA drivers may have more impact on your work if you are using GPUs and modules like tensorflow and torch.  If you would like to check your work against these updates, please email scicomp for access to the test systems with the kernel and NVIDIA driver update from version: 470.141.03 to version: 535.104.05.

### Ubuntu Nvidia Packages

These packages have the same name as the `470` driver release, just a newer version.
```
nvidia-driver-535
nvidia-utils-535
libnvidia-compute-535
libnvidia-gl-535
libnvidia-extra-535
nvidia-compute-utils-535
libnvidia-decode-535
libnvidia-encode-535
xserver-xorg-video-nvidia-535
libnvidia-cfg1-535
```

### NoMachine Updates

Lastly, we will be upgrading NoMachine on the rhino nodes to the latest version (8.9.1).  This won't change how we use NoMachine but will keep us up-to-date with security and bug fixes.

