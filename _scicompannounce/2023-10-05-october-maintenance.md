---
Title: October Maintenance for Scicomp Systems
---

On October 29th from 12:00PM PDT until 5:00PM PDT Scientific Computing will be taking many systems offline for maintenance. During this work, the _scratch_ file system, _rhino_ login nodes, and the _gizmo_ compute cluster will be unavailable.

> Note that for this work we will be cancelling any running jobs when the maintenance period starts.  We will be attempting to keep any pending jobs.

> If you have any questions, have any concerns, or need any assistance, please contact scicomp to open a ticket

During this maintenance period we will be performing the following work:

## Gizmo Controller Replacement

We will be replacing the existing Slurm controller for the _gizmo_ cluster with three new systems.  One to host the database, and two in a high-availability configuration.

The version of the controller will remain the same and there will be no other changes to how you use the cluster.

## Scratch File System Backplane Replacement

One of the nodes in the cluster making up the _scratch_ file system has persistent errors with disks that we believe caused by a failing backplane (a backplane is the physical connector between the disks and the main system boards).  This requires that we take the scratch file system offline and power down the node with the suspect hardware.

We do not expect any impact or changes to data stored on _scratch_.

## OS Updates

We are going to update the kernel and NVIDIA driver versions on the compute nodes (rhino and gizmo cluster nodes).  This is an operation that requires a reboot of the hosts.

The kernel updates are primarily bug-fixes and should have little impact on how we use these systems.

The updates of the NVIDIA drivers may have more impact on your work if you are using GPUs.  If you would like to check your work against these updates, please email scicomp for access to the test systems with the kernel and NVIDIA driver update.

## NoMachine Updates

Lastly, we will be upgrading NoMachine on the rhino nodes to the latest version (8.8.1).  This won't change how we use NoMachine but will keep us up-to-date with security and bug fixes.


