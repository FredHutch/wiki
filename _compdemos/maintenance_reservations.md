---
title: Cluster Maintenance Reservations
date: 2026-09-23
main_author: Michael Gutteridge

---

When it's necessary to interrupt cluster services (typically for maintenance reasons), we want to keep jobs from starting if the job would run into a maintance window.  Our maintenance typically involves actions like rebooting and powering down nodes and taking key services (like Slurm) offline, actions that would cause running jobs to fail or otherwise malfunction.

Because of this, when we plan a major outage we place a _maintenance reservation_ on affected cluster nodes.  This reservation prevents jobs from starting when the expected job run time overlaps with the maintenance reservation.

## What To Expect

When we have a maintenance reservation in place and your job's run time would extend into the time reserved, you will see the message "ReqNodeNotAvail, Reserved for maintenance" in the output of squeue:

```
  JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
1234567 campus-ne myjobnam username PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
```
This job will stay in the _pending_ state until the reservation completes or is released.

## Identifying Reservations

Reservations are shown with the command `scontrol`.  The output is not particularly user-friendly, but typically the important piece of information in the output is the `StartTime` field in the first line of output:

```
hostname[~/tutorial/run]: scontrol show reservation
ReservationName=name_of_the_reservation StartTime=2026-10-18T09:00:00 EndTime=2026-10-19T12:00:00 Duration=1-03:00:00
 ... other output ...
```

In this example we can see the reservation becomes active on the 18th of October at 9:00AM.  There may be multiple reservations active so you'll want to check the start time of each of those.

## Managing Pending Jobs

If you know that your job will complete before the reservation's start time, you can adjust the time limit of your pending job.  For example:

```
hostname[~/tutorial/run]: squeue --me -O jobid,timelimit,reason:25
JOBID               TIME_LIMIT          STATE               REASON
8895233             7-00:00:00          PENDING             ReqNodeNotAvail, Reserved
hostname[~/tutorial/run]: scontrol update jobid=8895233 timelimit=1-0
hostname[~/tutorial/run]: squeue --me -O jobid,timelimit,state,reason:25
JOBID               TIME_LIMIT          STATE               REASON
8895233             1-00:00:00          RUNNING             None
```

By adjusting the timelimit from seven days to one, we've reduced the run time to a point where the job will finish before the reservation starts.

Your job could still be running when the maintenance window starts when the partition allows jobs to run over their time.  _campus-new_ is such a partition.  If this happens your job may be cancelled.  The maintenance notice Scientific Computing sends out will indicate how running jobs will be handled.
{: .notice--info}
