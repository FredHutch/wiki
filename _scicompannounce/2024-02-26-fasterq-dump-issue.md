---
Title: fasterq-dump Causes Nodes to Hang and Require Reboot (Updated)
---

## Update 26 Feb 2024:

We have added some guardrails to the configuration of the gizmo cluster nodes to prevent fasterq-dump from being run against the Scratch file system.  This function operates at the kernel level and prevents read and write operations.

If you run fasterq-dump using Scratch you will now get errors- typically indicating an IO problem.  The exact error depends on the version of SRA Toolkit being used. If you run into errors please double check your working directory and arguments sent to fasterq-dump.  SciComp is always available to help debug any errors you may encounter.

## Overview

`fasterq-dump` is a command-line utility used to extract FASTQ or FASTA data from SRA-accessions. 

There is a known issue with the way the application interacts with the version of filesystem used for `Scratch` storage on the cluster. This bug causes cluster nodes to become unresponsive and require a reboot to restore to normal operation when `fasterq-dump` is used with `Scratch` for reading or writing data.

**_Scratch_ should not be used with the `fasterq-dump` application**. To run `fasterq-dump` on the `Gizmo` cluster please use one of the following workarounds:

## Workarounds

### Use Fast instead of Scratch

One option is to use `Fast` storage instead of `Scratch` for temporary data. A major downside to this approach is that it can end up creating a significant amount of wasted space in backups, particularly when data is frequently created and deleted. Additionally, performance may be significantly lower than with `Scratch` when used for temporary data.

### Use local scratch space on the cluster nodes

Another alternative is to use the local scratch space available on the cluster nodes. This is available to cluster jobs at `/loc/scratch/<jobid>` where `<jobid>` is replaced by the actual SLURM job id. This location is also stored in the `TMPDIR` and `SCRATCH_LOCAL` environment variables.

It is important to note that this location only exists for the duration of the job, so any data here that needs to be kept would need to be copied to persistent storage (e.g. `Scratch` or `Fast`) by the job before it exits.

The amount of local scratch space needed should be specified with the **--tmp** argument to `sbatch` when submitting a job.

More information on node local scratch space is available at the [Job local storage page](/compdemos/store_job_local)

### Use `parallel-fastq` instead

`parallel-fastq` can speed some operations- this is available in the module `parallel-fastq-dump/0.6.7-GCCcore-11.2.0`.
