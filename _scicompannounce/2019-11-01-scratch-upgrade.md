---
title: Scratch File System Migration
---

On the weekend of 1 November we'll be upgrading the scratch file system to new
hardware and to a new version of the underlying software providing the file
services (BeegFS).  This will impact access to data in the scratch filesystem,
specifically paths under `/fh/scratch/delete10`, `/fh/scratch/delete30`, and
`/fh/scratch/delete90`.

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

## Job Network Scratch

Network scratch is a volatile directory on the scratch file system that exists
only for the duration of the job.  This is referenced in the job environment
variable `NETSCRATCH` and has a form similar to `/fh/scratch/gizmo/<jobid>`.

This feature has seen little to no use so we are discontinuing its support.  If
you require this functionality, please email us for a workaround.
