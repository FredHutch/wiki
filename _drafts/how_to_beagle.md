---
title: How to Beagle 
main_author: Chao-Jen Wong
---

Beagle clusters serve as an extension of gizmo into AWS cloud infrastructure.
It is an alternative way to send your sbatch jobs to clusters other than gizmo.
The transition is easy: use `sbatch` in a similar manner as on gizmo and add
`-M beagle` to the command. The complete beagle cluster user guide is
[here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/beagle%20Cluster%20User%20Guide.aspx) on SciComp's wiki. Below is a just quick start. 

## About

Beagle can be seen as an extension of gizmo into AWS cloud infrastructure.  For
this we intended to make transitioning as easy as possible, so we've retained
the familiar Slurm workload manager as well as extending on-campus storage to
this system.  Thus, your files- shared fast directories, your home directory,
the shared app tools directory- are all available at the same paths as on the
gizmo compute nodes.

Thus, all that is typically necessary are small changes to the Slurm commands to
enable your jobs to run on beagle nodes.  

However: it needs to be noted that as access to data is much slower than your
access here on campus.  On IO intensive workloads you may see up to a 3x
slowdown on overall time to complete a job.  ```

## Basic use

To summit a job, use `sbatch` in a similar manner as on gizmo and add `-M beagle` to the commend:

```
sbatch -M beagle -n1 my_job.sh
```

This will request one CPU on an F class node (16GB RAM and four cores).  This
job will share CPU and memory with other jobs.

## Managing jobs

Similarly, use _squeue_, _sacct_ and _scancel_ and add `-M beagle` to the commend..

```
squeue -M beagle -u <my_username>
```

> Note that `srun` and `salloc` do not support the `-M` option: for interactive
use you need to first log into the host fitzroy where you can run any of the
Slurm commands without `-M`.

## Partitions

There are three classes available: F, G  and H, each of which has 16GB, 60GB
and 244GB of RAM, respectively. The default partition is _campus_ which
contains only F class nodes.  The other two classes of nodes are in the
_largenode_ partition.

| Class |CPUs | RAM   | Partition             |
|:------|:----|:------|:----------------------|
|F      | 4   | 16GB  | campus, c5.2xlarge    |
|G      | 18  | 60 GB | largenode, c5.9xlarge |
|H      | 16  | 244GB | largenode, r4.8xlarge |

Use `-p <partition name>` to select the partition.  When selecting the
largenode partition you will get a G node unless you request more memory than
available on the G class.

## Limits

Limits on beagle are enforced in the same way as they are on gizmo: 300 core
limit per PI.  The limits are typically higher and can be increased upon
request.

## Examples

### Basic: partition on _campus_  (F class)

```
sbatch -M beagle my_job.sh
```

### Partition on G class without sharing

```
sbatch -M beagle --exclusive -n1 -p largenode my_job.sh
```

If `--exclusive` and `-p largenode` are set, you get the whole computer with 18
cores and 60 GB RAM (if assigned a G class node) and will not share with
others.

### Partition on G class with one task and a few cores:

```
sbatch -M beagle -n1 -c4 -p largenode my_job.sh
```

This assigns four cores to your job.  Without using `--exclusive` the job may share CPU and memory with other jobs.

### Get a larger allocation on an H node

```
sbatch -M beagle --mem=200G -p largenode my_job.sh
```

Please edit this page if you have more useful information.

