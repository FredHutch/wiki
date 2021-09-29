---

---

The gizmo cluster will be unavailable during the Scratch file system rebuild.   To prevent jobs from running during this time we have placed a maintenance reservation on gizmo.

Jobs that would not complete before the maintenance will start will be held until after the work is complete.  `squeue` will show the job as pending with reason _ReqNodeNotAvail, Reserved for maintenance_.

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

## Updates to the Gizmo Environment

We are making a few changes to the gizmo/rhino computing environment.  These are described below.  Contact Scientific Computing by filing a helpdesk ticket (`scicomp@`) if you need assistance or have further questions.

### Slurm Upgrade

We'll be updating Slurm to version 21.08.  There are a number of changes which we don't expect will impact our current use of Slurm but upgrading will keep us well positioned for support.

Detailed changes are available in the [release notes](https://github.com/SchedMD/slurm/blob/slurm-21-08-0-1/RELEASE_NOTES).

### Move app file system

We're moving the `/app` file system (hosting the software modules) to a different file server in anticipation of the retirement of the server it's currently running on.  This should not change how you use modules.
