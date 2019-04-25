---
title: Computing Job Management
last_modified_at: 2019-04-01
primary_reviewers: atombaby
---


## Batch Computing

_Batch_ computing allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop should be disconnected for any reason the job will be terminated.

The batch system used at the Hutch is [Slurm](http://schedmd.com).  Slurm provides a set of commands for submitting and managing jobs on the gizmo and beagle clusters as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.  For more detailed information about Slurm see the section below on [Using Slurm on Fred Hutch Systems](#using-slurm-on-fred-hutch-systems), which also links to a variety of detailed how-to's and examples to get you started using the on-premise HPC resources available



## Parallel Computing
There are many approaches to parallel computing (doing many jobs simultaneously rather than in series).  We have begun a Resource Library entry on [Parallel Computing with Slurm,](/compdemos/cluster_parallel/) as well as created the [FredHutch/slurm-examples repository](https://github.com/FredHutch/slurm-examples) containing community curated examples with additional documentation that can help you get started.  


## Using Slurm on Fred Hutch Systems

This section is intended to be a basic introduction to using the workload manager for Fred Hutch managed clusters for high performance computing.  Slurm is the workload manager that manages both your jobs and the resources available in the clusters available.  There are two main clusters in use today that rely on Slurm - the on-campus `Gizmo` cluster and the cloud-based `Beagle` cluster (see our [Technology page](/bioinfcomputing/compute_platforms/) for more information about those resources.  Commands work the same in either environment. 

### Examples of Use
A GitHub repository has been created that is an evolving resource for the community containing working examples of using Slurm at Fred Hutch.  Please see the [Slurm Examples repo](https://github.com/FredHutch/slurm-examples) for more specific guidance on using Slurm in variety of settings.  This is an evolving example repo that new users can refer to to begin to get into parallel computing and more adept use of Slurm.  If you are a Fred Hutch user and would like to contribute to the documentation or the examples there, to share with the community how you structure your interactions with Slurm, submit a pull request there.  

### Basic Slurm Terminology

#### Cluster

A cluster is a collection of compute resources (nodes) under the control of the workload manager (Slurm in our case).  At the Hutch we have two clusters, `Beagle` and `Gizmo`.  From most hosts the default cluster will be _gizmo_- selection of the target cluster is done via an argument to Slurm commands (see [Multi-Cluster Operation](#multicluster-operation) below)

#### Partition

A partition is a collection of resources (nodes) inside of a cluster.  There are defaults, so specifying a partition name is not required.  While the different clusters may have different partitions, there are two partitions- a default partition with smaller nodes named _campus_ and a partition with more capable nodes (more memory and CPUs) named _largenode_.

#### Node

A node is the basic computing unit that shares processors, memory, and some (limited) local disk.  As a rule, you don't want to worry about choosing a node for your jobs.

#### Job

A job is a collection of tasks, typically implemented as a shell script.  Jobs have an ID (just a number) and a name.  The ID is automatically assigned, but you can assign a name to your job.

#### Account

When we refer to an "account" in the context of Slurm, we are referring to the PI account used to enforce limits and priority and _not_ your HutchNet ID.  Your HutchNet ID is associated with an account.

### Commands for Managing Jobs

#### `squeue`

The `squeue` command allows you to see the jobs running and waiting in the job queue.  `squeue` takes many options to help you select the jobs displayed by the command

| option/argument     | function                                              |
|---------------------|--------------------------------------------------------
| -M _cluster_        | Only show jobs running on the indicated cluster       |
| -u _username_       | Limit jobs displayed to those owned by a user         |
| -A _account_        | Limit jobs displayed to those owned by an account     |
| -p _partition_      | Only show jobs in the indicated partition             |

```
rhino[~]: squeue -u edgar
      JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
   31071290    campus     wrap    edgar  R   19:03:13      1 gizmof404
```

The field `NODELIST(REASON)` will show either the name of the node(s) allocated for running jobs or the reason a job isn't running.

There are many ways to alter which jobs are shown and how the output is formatted- refer to the [`squeue` manpage](https://slurm.schedmd.com/squeue.html) for more details on using this command.

#### `scancel`

`scancel` allows you to signal jobs- most commonly this command is used to stop execution of a running job or remove a pending job from the job queue.  A job ID is the common argument though `scancel` will take many other arguments that allow bulk management of jobs- it shares many of the same arguments as `squeue`.  For example, the following command will cancel all jobs (pending or running) owned by the user `edgar`.

```
rhino[~]: scancel -u edgar
```

#### `salloc`

Obtain a Slurm job allocation (a set of nodes), execute a command, and then release the allocation when the command is finished.

#### `hitparade` (Fred Hutch homebrew)

The `hitparade` command will show a summary of all jobs running and queued on the cluster broken down by user and account.  Note that this isn't a Slurm command, rather something built in-house at Fred Hutch. 

`hitparade` takes the `-M` argument to select a cluster about which to generate the output. 

```
rhino[~]: hitparade -M beagle
loading Python/3.6.4-foss-2016b-fh2...

  === Queue: campus ======= (R / PD) ======
    poe_e (edgar) 300 / 72

  === Queue: largenode ======= (R / PD) ===
    schulz_cm (snoopy) 273 / 0

```

### Commands for Submitting Jobs

#### `sbatch` and `srun`

`sbatch` is used to submit a job script to the cluster.  These run jobs without your intervention or input (i.e. non-interactively). Common arguments are:

`srun` is used to run a task on the cluster.  This is an interactive session,
where you can directly view output as it's produced or provide input (if needed
by the task you are running).

These two take many of the same options:

 - `-M` select the cluster on which the job will run
 - `-p` change the partition
 - `-t` request a certain amount of time for the job.
 - `-n` request a number of tasks (default 1)
 - `-c` request a number of processors per task (default 1)
 - `-J` name a job

A useful option that is only applicable to `sbatch` is `-o`, which writes output to a different file.  The default will write the file _slurm-<jobid>.out_ in the directory in which you submitted the job.

##### Examples

Submit a batch job (`sbatch`), that will run in one day, six hours (with the flag `-t 1-6`) in the largenode partition (with the flag `-p largenode`) in Beagle (with the flag `-M beagle`).  This will run one instance of the job with one processor (because no flags were provided to tell it to ask for more than the default).  Name the job "quoth-the-raven" (with the `-J` flag) and list the script to use in the job `myscript.sh`.

```
sbatch -M beagle -p largenode -t 1-6 -J quoth-the-raven myscript.sh
```

Submit a job using 6 cores (with the flag `-c 6`) and redirect output to a file named "my-output":

```
sbatch -c 6 myscript.sh my-output
```

### MultiCluster Operation

Most Slurm commands can operate against remote clusters (i.e. _beagle_ from _gizmo_).  Typically the only change required is to add the argument `-M <cluster name>`.

```
sbatch -M beagle -c 6 myscript.sh my-output
scancel -M beagle 12345
```

`hitparade` also supports `-M` and can be used to show the queue on the different clusters.  At this time, multi-cluster operations using the commands `srun` and `salloc` will not work.  If use of those commands is necessary, please contact SciComp.


## External Slurm and HPC Reference and Learning Resources
For more information and education on how to use HPC resources from external sources see the following sites:

- Princeton's Introduction to [HPC systems and Bash.](https://princetonuniversity.github.io/hpc_beginning_workshop/slurm/)
- Harvard's [Wiki site Slurm page.](https://wiki.rc.hms.harvard.edu/display/O2/Using+Slurm+Basic)
- The Carpentries [lesson on HPC and job scheduling.](https://hpc-carpentry.github.io/hpc-intro/)
