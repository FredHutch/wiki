---
title: Scratch File System Migration
---

On the weekend of 1 November we'll be upgrading the scratch file system to new
hardware and to a new version of the underlying software providing the file
services (BeegFS).  This will impact access to data in the scratch filesystem,
specifically paths under `/fh/scratch/delete10`, `/fh/scratch/delete30`, and
`/fh/scratch/delete90`.

As this work will cause any job using these paths to fail, we are reserving
cluster nodes during this time.  This may cause your jobs to be held until
after the work is complete- you will see _ReqNodeNotAvail_ as the "reason"
for the job pending.  See below if you want to allow your job to run during
this maintenance period.

> NOTE: the cloud-based clusters _beagle_ and _koshu_ are not going to be
> affected by this maintenance as these are served by a different scratch file
> system.

As part of this work we are decomissioning per-job network scratch.

Please email Scientific Computing with any questions or assistance.

## Scratch File System Access

During the maintenance, any files under the paths:

 - `/fh/scratch/delete10`
 - `/fh/scratch/delete30`
 - `/fh/scratch/delete90`

will be unavailable.  Any process or job using files in these directories will
most likely fail.  Data will be migrated from the old system to the new.  We do
not know how long this process will take as the time required is highly
dependent on the number of changes to the file system.

## Running Your job During the Maintenance

We have placed a reservation from November 1st at 6:00 through the 3rd to
prevent jobs from running on the cluster.  If your job is being held because of the maintenance, you will see something like:

```
squeue -u mrg
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
40614034    campus     wrap      mrg PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
```

This indicates that your job would run into the maintenance period- that the requested wall time extends into the time allocated for the maintenance.  The two options for running a job are then:

### Reduce Wall Time

The default is three days- if you know that you won't use that much time you
can adjust the time using scontrol

    scontrol update jobid=<jobid> timelimit=1-0

Would set the job's time limit to one day.

### Use the Reservation.  

If you know you don't use the scratch file system you can configure your job to use the maintenance reservation.  During job submission add `--reservation=scratch_move`.  If your job has already been submitted, update the job with scontrol:

    scontrol update jobid=<jobid> reservationname=scratch_move

Contact Scientific Computing with any questions or for assistance.

## Job Network Scratch

Network scratch is a volatile directory on the scratch file system that exists
only for the duration of the job.  This is referenced in the job environment
variable `NETSCRATCH` and has a form similar to `/fh/scratch/gizmo/<jobid>`.

This feature has seen little to no use so we are discontinuing its support.  If
you require this functionality, please email us for a workaround.
