---
title: Restart Jobs and Preemption
primary_reviewers: atombaby
---

The restart partition will allow you unlimited use of idle cores with the caveat that jobs running in this partition will be terminated if priority jobs (jobs in the campus partition) require the use of that core.  This process is called "preemption," in that the job in the restart partition is _preempted_ by a job in the higher-priority campus partition.

If your workflow can handle jobs being terminated in-flight, this can be a good option for increasing job throughput.

## How to Use the Restart Partition

For historical reasons, the restart partition is currently called "restart-new".  It is also necessary to specify the "restart" QOS when submitting these jobs.

An example (using `sbatch`) would be:

```
sbatch --partition=restart-new --qos=restart ...
```

> If you omit the "qos" options you jobs will not be eligible to run and will be held- you will see messages similar to "partition not available" in the "reason" field of `squeue`

### Finding Preempted Jobs


The `sacct` command can be used to find preempted jobs:

```
sacct -S 2021-10-01 -E 2021-10-26 -s PR
```

This command shows your jobs that were preempted (the `PR` state) between the specified dates (note that the dates are necessary).

## Managing Restart Jobs

For the restart partition to be an effective solution, you need to be able to recover from (or possibly not care about) jobs being terminated early.  This is highly dependent on the nature of your work.

Workflow managers like Cromwell, NextFlow, and snakemake are good ways to manage restart jobs.  These systems have features managing the outputs of the steps and can automatically re-run individual steps should those steps be killed prematurely.

When using the restart partition it's important to note a few things:

#### Slurm doesn't necessarily remove intermediate files

If your task is writing a file into fast, temp, or some other non-transient storage, that partial output isn't removed when the job is preempted.  Restarting that task later with the same output file specified may cause problems.

This can be circumvented by using the local job temporary directory specified by $TMPDIR in the job environment.  That directory and its contents are removed when the job is preempted.

#### Jobs aren't actually restarted

The "restart" name is a bit of a misnomer since your jobs aren't actually restarted by Slurm.  You can have Slurm requeue the job if it's preempted by adding `--requeue` to the job submit arguments.

Note that a job that fails will not be requeued.
