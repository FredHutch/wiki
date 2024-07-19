---
Title: August Gizmo Maintenance
---

On August 5th from 7:00PM to 9:00PM we are going to be working on the Gizmo cluster.  We will be upgrading to new packages and a new version of Slurm and switching the state database to a different storage backend.

Much of this work will require shutdown of the controllers- this will interrupt Slurm services like `squeue`, `sbatch`, `srun`, and `grabnode` commands will fail.  Running and queued jobs will be preserved throughout this work.

## Slurm Upgrade

We will be updating Slurm to version 24.05.1.  The primary reason for this is to keep current and supported.  There are updates but these will not change how you interact with the cluster*.

As this is a major version upgrade (currently we are at 23.05) we need to shut down controllers and the accounting database as these components need to be upgraded in a particular order.  This downtime should be minimal, but during this work job commands (`sbatch`, `srun`) and accounting database commands (`sacct`) will fail.

## State Database Backend

The Slurm "state database" is a set of files that maintains Slurm's internal state (running/queued job information, node state, etc.).  This needs to be a high performance file system and (because of our HA configuration) a file system that's available to both primary and backup Slurm controllers.

We are currently using GlusterFS to share the file system between the two controller nodes.  This has worked well, but there is a memory leak in the GlusterFS client which necessitates a weekly failover to clear up.  While later versions of GlusterFS address this issue, we have decided to move this to the chromium file server (currently hosting _temp_) as it will simplify operations.

This requires shutting down both controllers and copying the state database files from one file system to another.

> * Those of the Hobbit-ish persuasion will be gratified to know that Slurm now knows about "elevenses". "Elevenses" can now be used as a time specification for Slurm commands, e.g. `sbatch --begin=elevenses teatime.sh`
