---
title: How to `Gizmo`
last_modified_at: 2019-02-27
primary_reviewers: atombaby, bmcgough
---

Gizmo is a capability cluster maintained by Center IT's Scientific Computing group for use in Hutch research.  Presented here is some basic information about the cluster and how to use it.

gizmo is the compute cluster that you should use for most "production" computational tasks. Use of the cluster is a topic for another course, but you can try it by using one of the grabnode commands on either the NX servers or one of the rhino nodes.

Access to gizmo nodes requires the use of Slurm commands- Slurm is the software suite that queues and dispatches jobs to the cluster.

## Batch Computing with `Gizmo`

Batch computing describes a method of computing where a job is designed to run without interaction with the user. Batch jobs are submitted to the resource manager which manages execution of the job on the node and notifies the user of the job's state as well as capturing any input or output.

Batch jobs are written as shell scripts.

## Capacities

### Public Resources

There are 3 types of nodes in the current configuration- F, G and H class nodes.  The class of node is reflected in the node's host name: gizmof100 is an F class, gizmog10 is a G class.  Without specifying other contstraints, you will be assigned cores from any available node (though F nodes are assigned preferentially if there are nodes of both class available).

### Private Resources

These resources are dedicated to PIs and/or projects but have been made available for use by the general community when workload can be preempted.  Access to these nodes is automatic- if you are a member of the group, your jobs can use those nodes without special commands.

## Usage Limits

The `gizmo` nodes are available for all Fred Hutch users and as it is a community resource, Fred Hutch IT creates and manages a set of usage limits that aim to manage all the needs on campus.  These limits focus on walltime of jobs, the number of cores and nodes per PI group, the amount of memory and the total number of running jobs at a time.

### Campus Partition
The campus partition is the default- jobs submitted to this will have shared, non-exclusive, access to assigned nodes.

### Largenode Partition
The largenode partition must be specifically requested by adding "--partition=largenode" to your job submission. 

running jobs     |     5 per account     |          |     

## Simple Use
In its most simple form your script will use a single CPU core, for example start a simple Python script using sbatch:

```
jdoe@rhino:~$ sbatch myscript.py
Submitted batch job 11111
```

now you want to see if the job is running for user jdoe and using the squeue command we see it is pending / waiting  (ST=PD) 

```
jdoe@rhino:~$ squeue -u jdoe

            
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
             11111    campus     wrap     jdoe PD       0:00      1 (Resources)
```

When the job starts running (wait for a few minutes) squeue will show ST=R and you can see if the job produces any output or errors to STDOUT/STDERR by checking file slurm-<jobid>.out :

```
jdoe@rhino:~$ tail -f slurm-11111.out
reading in file bla bla....
```

Then you submit more and more jobs and after a while you decide you want to cancel some of them, let's say 11112 and 11113:

```
jdoe@rhino:~$ scancel 11112 11113
```

or you just want to cancel all your jobs (all the jobs submitted by user jdoe): 

```
jdoe@rhino:~$ scancel -u jdoe
```

## Tasks

Tasks are the basic unit of work- a "task" requires cores and memory all on the same node.  A job may have multiple tasks- in this case, a job may be assinged multiple nodes.

Use the "-n" or "--ntasks" option to specify the number of tasks in the job. This example shows a job that requests 6 tasks (which may be assigned up to 6 different nodes).

```
sbatch -n 6 bin/job.sh
```

Note that your job must handle communication between and startup of multiple tasks. 

### CPUs per Task

Indicates the number of CPUs required for each task.  Defaults to one, so one task (above) would get one CPU.  When this is specified, Slurm will assign each of the tasks CPUs from the same host- so indicating 1 task with 3 CPUs per task will result in three CPUs on the same node allocated to the task.

Use -c/--cpus-per-task to change this.

### Examples:

```
sbatch -n 6 bin/job.sh  # <- requests six tasks, may run on up to 6 different nodes
sbatch -n 1 -c 6 bin/job.sh # <- requests one task that requires 6 cores, will run only on one node
sbatch -n 6 -c 2 bin/job.sh # <- requests 6 tasks of two cores each (12 total). May run on up to six nodes
```

## Wall Time

Wall time indicates the length of time you expect your job to run.  If no wall time is specified, a default value (three days) will be used.  After a grace period of 72 hours (during which time you can ask SciComp to increase your wall time) your job will be killed 

To add this information to your job use the argument -t/--time.  Different time formats are supported:

- minutes 
- minutes:seconds
- hours:minutes:seconds
- days-hours
- days-hours:minutes
- days-hours:minutes:seconds

```
sbatch -n 1 -c 12 -t 1-12 # 12 cores on one node for 1 day and 12 hours
sbatch -n 1 -c 4 -t 8:00:00 # 4 cores for 8 hours
```

## Local Scratch

All systems have local scratch.  Each node you are assigned will have a temporary directory created in this scratch space- the path to this is available via the "TMPDIR" environment variable in the job.

If you require large volumes of local scratch, use "--tmp" to specify (in megabytes) the volume of disk you think you'll require to make sure you are assigned a node with sufficient space:

```
sbatch --tmp=300000 # requires node configured with at least 300GB disk
```

Note that this only ensures that the node is configured with that amount of disk- that file system may not have that space available due to use by others.

## RAM

If you require a significant amount of RAM (over 1-2GB per core requested), you'll want to specify this to ensure there's enough available.  Similar to requesting local scratch, specify the megabytes required using the argument "--mem"

```
sbatch --mem=8096  # Requests 8GB available RAM
```

Note that this also places an upper limit on the RAM you can use- if your job uses more than requested, it will be killed by the resource manager.

### Examples 

Submit a job with wall time using the sbatch command:

```
gizmo: sbatch --ntasks=1 --time=1-0 --output=out.txt --wrap="echo Hello World"
Submitted batch job 1254

gizmo: cat out.txt 
Hello World
```

or you can use the short form for arguments:
```
gizmo: sbatch -n 1 -t 24:00:00 -o out.txt --wrap="echo Hello World"
Submitted batch job 1255

gizmo: cat out.txt
Hello World
```

In this case, one task is requested for one day. As we don't specify the number of CPUs required per task, we are given one CPU for the task.  The other arguments handle where output is saved and how the command is run (the --wrap argument takes the value and "wraps" it in a bash wrapper for execution on the node.

## Specialized Partitions

The term "partition" refers to a logical grouping of resources within the cluster.  Jobs queued in a partition may have different nodes, services, restrictions, and defaults. 

### Restart

The "restart" partition is for jobs that can be preempted by other workload, meaning that a job running in this partition can be killed by jobs that are queued in the other partitions.  These jobs are not requeued by default- they are removed from the system, unless you use the --restart flag. In that case they would move to the end of the waiting line and be restarted when there are enough resources.

The advantage to using this partition is that you can use more nodes than in the default partition.  The jobs that have the highest degree of success running in this partition are jobs that use a single core and run quickly- in the scope of hours.

You will likely need to "clean up" after jobs that are killed- partial output files, temporary files in network locations, etc.  Checkpointing is one strategy for effective use of the restart queue- there are many different methods available to checkpoint an application- contact us to determine a) if checkpointing is an appropriate strategy and b) what the most effective checkpointing technology would be.

#### Example:
```
gizmo: sbatch -n 1 -p restart -t 1-0 bin/job.sh  # <--- this job will not restart
gizmo: sbatch -n 1 -p restart -t 1-0 --restart bin/job.sh  # <--- this will automatically re-enter the queue 
```

### Boneyard
The "boneyard" partition is intended for those wanted to take advantage of legacy nodes which are no longer officially supported:

nodes may fail at any time 
scicomp will not prepare / compaile software running on boneyard nodes 
only "D" class nodes are available
Overall throughput will be less than in the default queue
#### Example:
```
gizmo: 
         sbatch -n 1 -p boneyard ​-t 12:00:00 bin/job.sh  # Will use a whole node even
gizmo: 
         sbatch -n 6 -p boneyard -t 12:00:00 bin/job.sh  # though not all cores are consumed
gizmo: 
         sbatch -n 12 -N 2 -p boneyard bin/job.sh # <--- this will fail
gizmo: 
         sbatch -n 50 -p boneyard bin/job.sh # <--- as will this
```

### Boneyard_Restart
The "boneyard_restart" partition is for jobs that can be preempted by other workload, meaning that a job running in this partition can be killed by jobs that are queued in the other partitions.  These jobs are not requeued by default- they are removed from the system, unless you use the --restart flag. In that case they would move to the end of the waiting line and be restarted when there is enough resources

The advantage to using this partition is that you can use more nodes than in the default partition.  The jobs that have the highest degree of success running in this partition are jobs that use a single core and run quickly- in the scope of hours.

You will likely need to "clean up" after jobs that are killed- partial output files, temporary files in network locations, etc.  Checkpointing is one strategy for effective use of the restart queue- there are many different methods available to checkpoint an application- contact us to determine a) if checkpointing is an appropriate strategy and b) what the most effective checkpointing technology would be.

#### Example:
```
gizmo: sbatch -n 1 -p boneyard_restart -t 1-0 bin/job.sh  # <--- this job will not restart
gizmo: sbatch -n 1 -p boneyard_restart -t 1-0 --restart bin/job.sh  # <--- this will automatically re-enter the queue 
```


