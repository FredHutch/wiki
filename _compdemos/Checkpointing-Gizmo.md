---
title: Checkpointing on Gizmo (beta)
last_modified_at: 2020-05-10
main_author: Dirk Petersen
primary_reviewers: atombaby, vortexing 
---

Checkpointing is a technique that provides fault tolerance for computations. It basically consists of saving a snapshot of the application's state on persistent storage, so that applications can restart from that point in case of failure. This is particularly important for long running jobs as they are more likely to fail than short running jobs.

Besides fault tolerance, checkpointing can increase job throughput. Jobs that are scheduled for shorter run times are getting started sooner on average than jobs for which the user requests long run times. The mechanism that implements this prioritization is called [Backfill](https://www.zedat.fu-berlin.de/HPC/EN/Backfill)

## Gizmo checkpointing 

Checkpointing is available on Gizmo as a beta feature. The feature is currently only available on the new Gizmo K nodes that have Ubuntu 18.04 installed.
The current checkpointing implementation is geared towards increasing throughput as well as improving fault tolerance.  

## How to use Checkpointing

You can activate checkpointing by using the `checkpointer` command in the shell script that starts your job. After you launched `checkpointer` with your job, it waits in the background until the job run time is larger than the checkpoint time. The checkpoint time is set in an environment variable `SLURM_CHECKPOINT`. Then it will kill your compute process and flush it to disk and trigger a requeue of your slurm job. When the requeued job starts it will load all information from disk and continue the computation (likely on a different compute node).

Add the `checkpointer` command to your script and ensure it is executed *before* the actual compute script or binary is launched, for example:

```bash
> cat runscript.sh 

#SBATCH --requeue
#SBATCH --open-mode=append

export SLURM_CHECKPOINT=0-0:45

checkpointer 
Rscript /fh/fast/..../script.R
```

Setting the environment variable `SLURM_CHECKPOINT=0-0:45` means that the job will save a checkpoint every 45 min. Adding the directive `--requeue` is required for jobs that can be checkpointed and restarted multiple times. `--open-mode=append` ensures that the sbatch output file (e.g. `slurm-123456.out`) will not be truncated each time the job is restarted.

After this you launch the script with sbatch. Please ensure that the SLURM_CHECKPOINT is smaller than the wall clock time you request as maximum run time. If you request 6 hours (e.g. `sbatch -t 0-6:00`) your job may be restarted 7 times if you set `SLURM_CHECKPOINT` to 45 min.


```bash
sbatch -o out.txt -t 0-6:00 runscript.sh
tail -f out.txt
```

## a simple example 

create a simple Python script called `looper.py` and make it executable with `chmod +x looper.py`. The script will simply count to 100 and write each iteration to a new line in a text file:

```python
#! /usr/bin/env python3

import os, time, socket

outfile='%s/looper.txt' % os.environ['TMPDIR']
print('writing to %s ...' % outfile)
for i in range(1, 101):
    pid = os.getpid()
    ppid = os.getppid()
    line="%s  node:%s  pid:%s  parent-pid:%s" % (str(i),socket.gethostname(),pid,ppid)
    fh=open(outfile, 'a')
    fh.write(line+'\n')
    fh.flush()
    fh.close()
    print(line, flush=True)
    time.sleep(1)

```

now add `looper.py` to your submission script and set your checkpoint time to 10 sec.

```bash
> cat runscript.sh 

#SBATCH --requeue
#SBATCH --open-mode=append

export SLURM_CHECKPOINT=0-0:00:10

checkpointer
./looper.py
```

run it and tail the output file 

```bash
sbatch -o out.txt -t 0-1:00 runscript.sh
tail -f out.txt
```

we see that `looper.py` is running and then successfully checkpointed to disk and requeued:

```
### ****************************** #######
SLURM_RESTART_COUNT: 
SLURMD_NODENAME: gizmok28
writing to looper.txt ...
1  node:gizmok28  pid:6862  parent-pid:6850
2  node:gizmok28  pid:6862  parent-pid:6850
.
.
60  node:gizmok28  pid:6862  parent-pid:6850
61  node:gizmok28  pid:6862  parent-pid:6850
62  node:gizmok28  pid:6862  parent-pid:6850
Dumping checkpoint for pid  6862 to 
/fh/scratch/delete10/_HDC/SciComp/.checkpointer/petersen/47503490/0
Dump done, Exit code: 0
Requeueing ... 47503490
slurmstepd-gizmok28: error: *** JOB 47503490 ON gizmok28 CANCELLED AT 2020-05-11T00:47:23 DUE TO JOB REQUEUE ***

```
Currently `looper.py` writes to a network share. Unfortunatelty checkpointing does not support open file handles to network shares. This does not seem to be a problem because `looper.py` opens and closes the output file in each loop. But what if `looper.py` needed to have a file handle open for longer ? Let's have a look at a slightly modified version:

```python
#! /usr/bin/env python3

import os, time, socket

outfile='%s/looper.txt' % os.environ['TMPDIR']
print('writing to %s ...' % outfile)
fh=open(outfile, 'a')
for i in range(1, 101):
    pid = os.getpid()
    ppid = os.getppid()
    line="%s  node:%s  pid:%s  parent-pid:%s" % (str(i),socket.gethostname(),pid,ppid)
    fh.write(line+'\n')
    fh.flush()
    print(line, flush=True)
    time.sleep(1)
fh.close()

```

In this case the file handle is open almost for the entire time the script runs. If we were to checkpoint while the file handle was open, checkpointing would not work properly. As a workaround we can temporarily write the file to a local scratch space. The root of the local scratch space of this compute job is accessible as environment variable $TMPDIR so we write looper.txt to TMPDIR. TMPDIR will be deleted when the compute job ends.
But if `looper.py` is writing to a local disk and that data goes away when the job ends how can we ensure that we save the result data to a network share? If you set an existing network directory to environment variable RESULT_FOLDER checkpointer will copy local data to this network location after the job is finished. For example, use this command to set the result folder to the current working directory before you submit a job.

```
export RESULT_FOLDER=$(pwd)
sbatch -o out.txt -t 0-1:00 runscript.sh
```


## Current limitations

* checkpointer supports only simple jobs that run on a single node. 
* The submission script should not contain complex structures or multiple steps. 



## Future 

We have tested this process with R and Python and would like to continue testing with other tools


Please email `SciComp` to request assistance and discuss which environment is best for your needs.
