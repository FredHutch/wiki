---
Title: Gizmo Maintenance October 1st
---

The gizmo cluster will be unavailable during the Scratch file system rebuild.   To prevent jobs from running during this time we have placed a maintenance reservation on gizmo.

Jobs that would not complete before the maintenance will start will be held until after the work is complete.  `squeue` will show the job as pending with reason _ReqNodeNotAvail, Reserved for maintenance_.

If you are confident your job can complete before the maintenance period starts you can reduce the time limit of the job.  This command will set the time limit to one day:

```
scontrol update jobid=<jobid> timelimit=1-0
```

## Updates to the Gizmo Environment

### Slurm Upgrade

We'll be updating Slurm to version 21.08.  There are a number of changes which we don't expect will impact our current use of Slurm but upgrading will keep us well positioned for support.

Detailed changes are available in the [release notes](https://github.com/SchedMD/slurm/blob/slurm-21-08-0-1/RELEASE_NOTES).

### Slurm Resource Selection Algorithm

We are changing the plugin that selects the resources for a job (SelectType) to allow better allocation of resources- notably GPU- for jobs.  The current plugin (`select/cons_res`) only allows selection of cores and memory.  We are switching to `select/cons_tres` to allow us to select any trackable resource (or TRES).

This will allow those using GPUs on many nodes to use selection options like `--gpus-per-task` in job requests.

### Updates to Storage Mounts

> This is still in development- this may not happen during this maintenance

Storage (fast, home, secure) is mounted on rhino and gizmo nodes with automount- a daemon that performs on-demand mounting of file systems.  There is a system (NIS, network information system) that is running on some very old hosts which underpins automount.  These systems are scheduled for retirement and, rather than upgrade these systems, we are switching to static mounts of those file systems.

_This will not change the paths at which you access your data_

We expect that changing this will not have any impact on use- this is effectively a change of _when_ the file system is mounted, not how or where it is mounted.

Contact Scientific Computing by filing a helpdesk ticket (`scicomp@`) if you need assistance or have further questions.
