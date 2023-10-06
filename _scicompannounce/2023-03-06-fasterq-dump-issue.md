---
Title: fasterq-dump Causes Nodes to Hang and Require Reboot
---

> Updated information is available [here](/scicompannounce/2023-09-01-fasterq-dump-issue/)

`fasterq-dump` is a command-line utility used to extract FASTQ or FASTA data from SRA-accessions. 

There is a known issue with the way the application interacts with the version of filesystem used for `Scratch` storage on the cluster. This bug causes cluster nodes to become unresponsive and require a reboot to restore to normal operation when `fasterq-dump` is used with `Scratch` for reading or writing data.

**`Scratch` should therefore not be used with the `fasterq-dump` application**. To run `fasterq-dump` on the `Gizmo` cluster a workaround is required that involves using an alternative location for scratch space. 

## Workarounds

### Use Fast instead of Scratch

One option is to use `Fast` storage instead of `Scratch` for temporary data. A major downside to this approach is that it can end up creating a significant amount of wasted space in backups, particularly when data is frequently created and deleted. Additionally, performance may be significantly lower than with `Scratch` when used for temporary data.

### Use local scratch space on the cluster nodes

Another alternative is to use the local scratch space available on the cluster nodes. This is available to cluster jobs at `/loc/scratch/<jobid>` where `<jobid>` is replaced by the actual SLURM job id. This location is also stored in the `TMPDIR` and `SCRATCH_LOCAL` environment variables.

It is important to note that this location only exists for the duration of the job, so any data here that needs to be kept would need to be copied to persistent storage (e.g. `Scratch` or `Fast`) by the job before it exits.

The amount of local scratch space needed should be specified with the **--tmp** argument to `sbatch` when submitting a job.

More information on node local scratch space is available at the [Job local storage page](/compdemos/store_job_local)
