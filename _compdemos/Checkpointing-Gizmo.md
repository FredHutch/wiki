---
title: Checkpointing on Gizmo (beta)
last_modified_at: 2020-04-20
main_author: Dirk Petersen
primary_reviewers: atombaby, vortexing 
---

Checkpointing is a technique that provides fault tolerance for computations. It basically consists of saving a snapshot of the application's state on persistent storage, so that applications can restart from that point in case of failure. This is particularly important for long running jobs as they are more likely to fail than short running jobs.

Besides fault tolerance, checkpointing can increase job throughput. Jobs that are scheduled for shorter run times are getting started sooner on average than jobs for which the user requests long run times. The mechanism that implements this prioritization is called [Backfill](https://www.zedat.fu-berlin.de/HPC/EN/Backfill)

## Gizmo checkpointing 

Checkpointing is available on Gizmo as a beta feature. The feature is currently only available on the new Gizmo K nodes that have Ubuntu 18.04 installed.
The current checkpointing implementation is geared towards increasing throughput rather than improving fault tolerance.  

## How to use Checkpointing

You can activate checkpointing by using the `checkpointer` command in the shell script that starts your job. When checkpointer is launched it waits in the background until there are only 10 min scheduled time left for your compute job. Then it will kill your compute process and flush it to disk and at the same time it will submit another job with the same parameters as the first one (e.g. number of cpus, partition, wall clock time). When that next job starts it will load all information from disk and continue the computation on a different compute node.

Add the `checkpointer` command to your script:
```
cat runscript.sh

checkpointer 
R CMD BATCH /fh/fast/..../script.R
```

After this you launch the script with sbatch. If you request 1h then one more hour will be requested after the job has been restore.


```
sbatch -t 0-1 runscript.sh
```

## Limitations

currently we support only simple jobs that run on a single node. The submission script should not contain complex structures or multiple steps.


Please email `SciComp` to request assistance and discuss which environment is best for your needs.
