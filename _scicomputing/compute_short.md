---
title: Short Partition- Overview and Use
primary_reviewers: atombaby
---

## Overview

The short partition is intended for high-volume, short duration jobs that need guaranteed execution (as compared to the restart partition which does not guarantee a job the full time requested).

The usage limits for the short partition are based on the amount of time committed to your account's running jobs.  "Time committed" for a job is calculated by multiplying the amount of time remaining in the job's run time with the number of cores requested. The total time committed for an account is then the sum of time committed for all jobs running in that account.

> Example: An account has two jobs running in the short partition, one has 4 cores allocated and one hour remaining to run, the other has 2 cores with 10 minutes time committed.  The total time committed for the account is 4*60 + 2*10 = 260 core-minutes

There is no specific limit on the number of cores your account can use concurrently, but the total amount of time committed must be less than 480,000 core-minutes.  With this limit, you could conceivably use up to 7000 cores for an hour (depending on resource availability and queued jobs of course)

There is an upper bound on the amount of time any job can run- jobs are not allowed to request more than 12 hours of wall time.  Jobs are also not allowed to run over their wall time (in campus-new you are allowed to run over time by 36 hours).  Extensions are not available for jobs in the short partition.

Short jobs have the same priority as jobs in the campus partition and also contribute to your account's fairshare utilization at the same rate.

## Use

The short partition is requested with the `-p` option:

```
sbatch -p short -t 1:00:00 ...
```

Note that the default wall time for jobs submitted to the short partition is one hour.  If you request more than 12 hours your job will be held until modified.  With `srun` you will see the message `srun: Requested partition configuration not available now`.  Jobs submitted with `sbatch` will appear in the queue with the reason `PartitionTimeLimit`:

```
$ squeue -u mrg -p short
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          27075194     short     wrap      mrg PD       0:00      1 (PartitionTimeLimit)
```
