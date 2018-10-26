---
title: How to Beagle
main_author: Chao-Jen Wong
primary_reviewers: atombaby, TapscottLab
---

Beagle clusters serve as an extension of gizmo into AWS cloud infrastructure.
It is an alternative way to send your `sbatch` jobs to clusters other than gizmo.
The transition is easy: use `sbatch` in a similar manner as on `gizmo` and add
`-M beagle` to the command. The complete beagle cluster user guide is
[here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/beagle%20Cluster%20User%20Guide.aspx) on SciComp's wiki. Below is a just quick start.

## What is Beagle?

Beagle can be seen as an extension of our on-premise computing cluster `gizmo` into AWS cloud infrastructure.  To make transitioning as easy as possible for users, we've retained
the familiar Slurm workload manager as well as extending on-campus storage to
this system.  Thus, your files - shared fast directories, your home directory,
the shared app tools directory - are all available at the same paths as on the
`gizmo` compute nodes.

One significant difference in file systems is that the `scratch` file system is
unique to Beagle and is in a different path.  The scratch directory created by
slurm is in `/mnt/beagle/scratch`.  Temporary storage is available in
`/mnt/beagle/delete10` with subdirectories based on PI or group name.

Thus, all that is typically necessary are small changes to the Slurm commands to
enable your jobs to run on Beagle nodes.

>Note:  Access to data is much slower than access on campus.  On IO intensive workloads you may see up to a 3x slowdown on overall time to complete a job. See the section "Improving Data Performance" for further information on addressing this performance bottleneck.

## Basic use

To summit a job, use `sbatch` in a similar manner as on gizmo and add `-M beagle` to the command:

```
sbatch -M beagle -n1 my_job.sh
```

This will request one CPU on an F class node (16GB RAM and four cores).  This job will share CPU and memory with other jobs.

## Managing jobs

Similarly, use _squeue_, _sacct_ and _scancel_ and add `-M beagle` to the command.

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

Limits on Beagle are enforced in the same way as they are on `gizmo`: 300 core
limit per PI.  The limits are typically higher and can be increased upon
request.

## Improving Performance

### Cache-Fast

Access to data in Beagle is currently a significant bottleneck
for job performance.  To address this we are making available what we're
calling _cache-fast_ on the beagle nodes.  This is a _read only_ and _day old_
copy of some `fast` file directories.  The primary purpose of this file server is
as a disaster-recovery copy of data, but we've re-purposed it to improve data
access performance.  It's available under the path `/fh/cache-fast` and from that
point has the same structure as `fast` file.

The real problem with using `fast` file in Beagle is read performance as write
performance is actually quite reasonable.  Thus, you will see significant
improvement by using the `cache-fast` directory to read in data and the `fast`
directory to write out results.  The process would be something like:

 - read in data from `/fh/cache-fast/directory_p/path/to/data/file`
 - process data
 - write data out to `/fh/fast/directory_p/path/to/results`

Read performance is significantly improved, up to 10 times faster.  However, it
is important to note that this cached view can be up to 24 hours old.  There is
a nightly process that synchronizes `fast` file to the cache.

### Staging into Scratch

There is `scratch` space available in the path `/mnt/beagle/delete10` that can be
used to stage data into and out of Beagle.  This is a file server that is in
the same location as Beagle so we have much better performance compared to
accessing `fast` directly.


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

Note that when you add the memory request your job will be limited to that amount- if it should exceed 200GB, the job will be terminated.
