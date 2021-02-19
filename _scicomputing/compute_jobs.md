---
title: Computing Job Management
primary_reviewers: atombaby
---

Batch computing allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system and performing tasks one by one.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop should be disconnected for any reason the job will be terminated.

The batch system used at the Hutch is [Slurm](http://schedmd.com).  Slurm provides a set of commands for submitting and managing jobs on SciComp clusters as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.  For more detailed information about Slurm see the section below on [Using Slurm on Fred Hutch Systems](#using-slurm-on-fred-hutch-systems), which also links to a variety of detailed how-to's and examples to get you started using the on-premise HPC resources available

## Using Slurm on Fred Hutch Systems

This section is intended to be a basic introduction to using the workload manager for Fred Hutch managed clusters for high performance computing.  Slurm is the workload manager that manages both your jobs and the resources available in the gizmo cluster.

### Examples of Use
A GitHub repository has been created that is an evolving resource for the community containing working examples of using Slurm at Fred Hutch.  Please see the [Slurm Examples repo](https://github.com/FredHutch/slurm-examples) for more specific guidance on using Slurm in variety of settings.  This is an evolving example repo that new users can refer to to begin to get into parallel computing and more adept use of Slurm.  If you are a Fred Hutch user and would like to contribute to the documentation or the examples there, to share with the community how you structure your interactions with Slurm, submit a pull request there.

### Using SLURM with Workflow Managers
If desired, one way to manage jobs, environments, and data transfers particularly in a series of linked tasks or jobs is to use a workflow manager.  Workflow managers allow you to describe a workflow as a series of individual tasks.  Then the workflow manager software does the work of:
- sending the jobs to the compute resources, 
- deciding what tasks can be done in parallel, 
- staging data for use and keeping track of inputs and outputs,
- environment management (via docker containers or environment modules)
- monitoring jobs and providing you with metadata about them and the workflow itself. 

Two workflow managers in use on the Fred Hutch campus are [Nextflow](/compdemos/nextflow/) and [Cromwell](/compdemos/Cromwell/) and users are actively curating more shared support and resources at those pages as well as in GitHub.  Workflow manager related information is collected as a GitHub [Workflow Manager Project](https://github.com/orgs/FredHutch/projects/8) as well as specific [Nextflow repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=nf+OR+nextflow&type=&language=) or [Cromwell/WDL repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=wdl+OR+cromwell&type=&language=) which often contain shared workflows or configuration information.


## Basic Slurm Terminology

### Cluster

A cluster is a collection of compute resources (nodes) under the control of the workload manager (Slurm in our case).

### Partition

A partition is a collection of resources (nodes) inside of a cluster.  There are defaults, so specifying a partition name is not required.  Gizmo resources are in the partition _campus-new_.

### Node

A node is the basic computing unit that shares processors, memory, and some (limited) local disk.  As a rule, you don't want to worry about choosing a node for your jobs.

### Job

A job is a collection of tasks, typically implemented as a shell script.  Jobs have an ID (just a number) and a name.  The ID is automatically assigned, but you can assign a name to your job.

### Account

When we refer to an "account" in the context of Slurm, we are referring to the PI account used to enforce limits and priority and _not_ your HutchNet ID.  Your HutchNet ID is associated with an account.

### Limits

A variety of limits are used to ensure equitable access to computing resources,  The primary limit is a maximum on the number of CPUs in use by any account or user.

### Priority

Priority (the "priority score") is used to order pending jobs in the queue with jobs having a higher score run before those with a lower score.  The priority calculation is based primarily on the historical usage of cluster resources by an account- accounts with high utilization (i.e. lots of jobs and lots of CPUs) have lower priority scores than those accounts with lower usage.  

Time queued does factor in to the priority score but is a relatively minor component of the priority score

## Submitting Jobs

### `sbatch` and `srun`

`sbatch` is used to submit a job script to the cluster.  These run jobs without your intervention or input (i.e. non-interactively). Common arguments are:

`srun` is used to run a task on the cluster.  This is an interactive session,
where you can directly view output as it's produced or provide input (if needed
by the task you are running).

### Common Options

These two take many of the same options:

 - `-p` change the partition
 - `-t` request a certain amount of time for the job.
 - `-n` request a number of tasks (default 1)
 - `-c` request a number of processors per task (default 1)
 - `-J` name a job

### Job Output

Output (stdout and stderr) from your job script, steps, tasks, and processes is
captured by Slurm and written to a file named _slurm-<jobid>.out_ in the
directory from which you submitted the job.

The option `-o` will redirect this output (errors as well) to the file indicated as the argument to this option.  For example, `-o myjob.out` redirects to _myjob.out_ in the submission directory.  Adding `%j` in this file name will include the job ID.  `-o myjob-%j.out` would create a file like _myjob-12345.out_.

### Memory

Currently memory (or RAM) is not scheduled by Slurm.  This means that requesting memory has little effect on the job or its available resources.  Memory is currently only advisory: Slurm will only ensure that the node allocated to the job has more memory installed than the amount requested by the job- it does not look at memory availability or what is consumed by yours or other jobs on the node.

When your job needs "a lot" of memory use CPUs as a proxy for the memory you expect to be needed.  If you think your job will need more than 4GB of memory, request one CPU for every 4GB required.  For example, if you think your job will need 6GB of RAM, you would request 2 CPUs (adjust upward when the desired memory isn't a multiple of four).

If you still want to add a memory request, use the `--mem` option.  This option takes an argument: a number indicating the amount of memory required on the node.  The default unit is megabytes- to specify the unit, append `K`, `M`, `G`, or `T` for kilobytes, megabytes, gigabytes, or terabytes.

### GPU

GPUs are available on some nodes- [this page](/scicomputing/compute_gpu/)
describes the Slurm options required to request GPUs with your job.

### Environment Variables 

When you submit your script using sbatch you will be able to use a number of Slurm environment variables inside that script. It allows you to customize the behavior of your script dependent on the resources you are getting. For example, you realize that you cannot get an entire node (the K-Nodes have 36 cores) and request fewer resources, say 30 cores. Now you launch a software that uses all cores that are available and this software will now try to attempt to use all 36 cores and will take away resources from other users who may have jobs on this machine. To prevent this you can use the the environment variable `SLURM_JOB_CPUS_PER_NODE`. It is set to the number of CPU cores that have been allocated to your job on the current machine. Many tools allow you to set the maximum number of cores they will use for computing (e.g. `bowtie -p ${SLURM_JOB_CPUS_PER_NODE}`) other useful environment variables are here https://slurm.schedmd.com/sbatch.html, for example: 

| SLURM output variables  | Description                                           |
|-------------------------| ------------------------------------------------------------|
| SLURM_JOB_CPUS_PER_NODE | Number of cores allocated for the current job on this node |
| SLURM_JOB_ID            | Job ID, Primary identifier of a job |
| SLURM_MEM_PER_CPU       | Memory allocated per CPU (unit: MB)
| SLURM_JOB_NODELIST      | list of node names allocated to the current job |
| SLURM_SUBMIT_DIR        | directory from which the job was submitted |
| SLURMD_NODENAME         | The hostname of the node the job runs on |

In addition to these Slurm specific environment vars the sbatch command will forward all environment variables from the host where you submit your job (typically `rhino`). To start your jobs with a clean environment you can use `sbatch --export=NONE`. 

### Examples

#### Use multiple cores
Submit a job using 6 cores (with the flag `-c 6`) and redirect output to a file named "my-output":

```
sbatch -c 6 myscript.sh my-output
```

## Managing Jobs

### Job Priority

A job's priority determines when it will be run.  The fair-share algorithm is the primary method by which your jobs' priority is determined, but this currently only works at the account level- when you have a cluster account used by many different people or if you have different work you wish to prioritize, the current priority algorithm doesn't work as well.

There is an additional factor- the "niceness" factor- which can be used to reduce the priority of some jobs allowing jobs without that factor to run ahead of those "niced" jobs.  This can be done at job submit time, with the option "--nice=<factor>" or adjusted after job submit with `scontrol update jobid=<jobid> nice=<factor>`

At this time, "nice" values in the thousands should be more than sufficient to provide ordering.  Note too that `grabnode` will pass along the `--nice` flag:

    grabnode --nice=1000

though typically you'd prefer that grabnode has the higher priority (being an interactive process).  The strategy here is if you have a large number of batch jobs, submit those with a nice value.  Then, if you need to grab a node the grabnode jobs will have a higher priority and run ahead of the batch jobs.

Some things to consider:

 - too nice a factor may inhibit any jobs running.  Smaller values are effective
 - jobs can only be nicer- adjustments can only reduce total priority
 - thus, adding a general "middle-of-the-road" factor for all jobs will allow greater flexibility in ordering your jobs
 - the command `sprio` can be used to see the impact of these nice factors

### Wall Time

A job's "wall time" refers to the amount of time a job uses based on the clock-on-the-wall (compare to CPU time, which is time multiplied by the number of CPUs in use).  Wall time is requested using `-t` when submitting a job.  The default and the maximum time for submitted jobs depends on the cluster and partition.  The attributes of cluster partitions can be viewed with the command `scontrol show partition` or `scontrol show partition <partition name>` to see only the attributes of a single partition.

In the `campus-new` partition the default wall time is 3 days and the maximum is 30 days.  Special attention should be given if you think a job requires a long wall time (around 7 days and above) as individual cluster nodes are optimized for cost-effective performance, not robust operation.  For example, nodes have a single network interface and non-redundant power.  Nodes are often shared which presents its own share of challenges as well.  If you have long-running jobs look at options like splitting the task into smaller chunks or checkpointing to mitigate potential failures.

Determining how much time to request for your job is something of an art-form.  You can review historical time use for similar jobs using `sacct` to make an estimate on how much time will be required.  Erring on the side of safety- that is, requesting significantly more time than you think necessary- is usually the better way to go to avoid your job getting terminated should it run over that requested time.

If you should need to increase the wall time for a running job (or jobs), email Scientific Computing at `scicomp`.  If a job has not started, you can update this yourself.  For example, to increase a job's time limit by two days:

```
scontrol update jobid=<job ID> timelimit=+2-0
```

### Why isn't my job running?

There are any number of reasons why your job may not be running.  When you run `squeue` you will see the job's state as `PD` with a reason code (in the column headed with `NODELIST(REASON)`)  As suggested by the heading, this column contains the reason that the job isn't running.

The most common reasons are:
 - there are no idle resources for your job
 - jobs running under your account are already consuming the maximum amount of resources available- the account is "at its limit"

The reason code "Resources" indicates that the job has a node (or nodes) reserved for it (a "priority reservation") and should run next when the nodes become available.

If the job is held because of a limit (i.e "at its limit") you will see something like "MaxCPUPerAccount" or "MaxCPUPerUser":

```
39435170 campus-new        R   username PD       0:00      1 (MaxCpuPerAccount)
```

Indicates that the job is running under an account that is already using the maximum number of CPUs available to an account.

| Reason                | Possible Cause(s)                                    |
|---------------------- | -----------------------------------------------------|
| Priority              | The job is waiting for higher-priority jobs to run |
| Resources             | The job will run as soon as enough compute resources become available |
| PartitionTimeLimit    | The job is requesting more time than allowed for the partition |
| MaxCpuPerAccount      | Account has reached the limit on the number of CPUs available to it |
| QOSMinCpuNotSatisfied | The job isn't requesting enough CPUs for the requested partition. See [Limits](#limits) |
| QOSMinMemory          | The job isn't requesting enough memory for the requested partition. See [Limits](#limits) |
| MaxMemPerLimit        | The job has requested more memory than available in the partition |

There are other reason codes that are less-common in our environment.  Email Scientific Computing for more information.

### Useful Commands

#### Notifications
`sbatch` has a variety of parameters that allow for notifications to users which can be found on the [Slurm manual page](http://schedmd.com).  An exmaple of this is if, for instance, you wanted to receive an email when your job finished.  You can include these `SBATCH` options when sending your job to make that happen. 
```
#SBATCH --mail-user=fred@fredhutch.org
#SBATCH --mail-type=END
```

#### `squeue`

The `squeue` command allows you to see the jobs running and waiting in the job queue.  `squeue` takes many options to help you select the jobs displayed by the command.


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
The following command will cancel a single job, with jobID 12345.
```
rhino[~]: scancel 12345
```

#### `salloc`

Obtain a Slurm job allocation (a set of nodes), execute a command, and then release the allocation when the command is finished.

#### `hitparade`

The `hitparade` command will show a summary of all jobs running and queued on the cluster broken down by user and account.  Note that this isn't a Slurm command, rather something built in-house at Fred Hutch. 

## External Slurm and HPC Reference and Learning Resources
For more information and education on how to use HPC resources from external sources see the following sites:

- SchedMD's [Documentation for Version 18.08](https://slurm.schedmd.com/archive/slurm-18.08.3/)
- Slurm [cheat sheet](https://slurm.schedmd.com/pdfs/summary.pdf)
- University of Utah's [Slurm Docs](https://www.chpc.utah.edu/documentation/software/slurm.php)
- Princeton's Introduction to [HPC systems and Bash.](https://princetonuniversity.github.io/hpc_beginning_workshop/slurm/)
- Harvard's [Wiki site Slurm page.](https://wiki.rc.hms.harvard.edu/display/O2/Using+Slurm+Basic)
- The Carpentries [lesson on HPC and job scheduling.](https://hpc-carpentry.github.io/hpc-intro/)
