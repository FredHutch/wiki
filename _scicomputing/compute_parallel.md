---
title: Parallel Computing on Slurm Clusters
last_modified_at: 2019-05-02
primary_reviewer: atombaby
---

Parallel computing is an approach to computing where many tasks are done
simultaneously- either on a single device or on multiple independent devices.
These tasks can be dependent or independent of each other requiring varying
degrees of ordering and orchestration.  Parallel computing can be quite
complicated to set up but can improve job throughput when done correctly.

Parallel computing starts with breaking a larger task into smaller steps- the
"size" and relationship of those steps is highly dependent on the task at hand
but determines much about how the job can be "parallelized". Because of the
variety of approaches to large tasks, often there can be multiple strategies to
consider using to identify the most effective approach to use for the
particular task at hand.

When steps are highly dependent on each other (e.g. the output of one step is
used for input into the next) that job is said to be "serial" and it won't
benefit greatly from parallel processing.  At the other end, "embarrassingly" or
"pleasantly" parallel work has individual steps that do not depend on each
other and can occur in at the same time, often in great numbers.

Once you've determined how your work can be parallelized, there are two ways
to distribute those steps.  The first uses the capabilities of multi-core
CPUs- modern CPUs have multiple cores, each of which are capable of processing
independent steps.  This technique is typically referred to as "threading."

Another approach to using multiple processors is to spread the work over
multiple different computers.  This approach has the advantage of being
able to scale up the amount of computation being done concurrently.  This
approach is often described as "distributed".

> Note: It is also possible to combine those techniques- using multiple cores
> on multiple computers.  This can add a little complexity, but many tools will
> handle this neatly.

## Choosing an Approach

The primary drivers for choosing between the two approaches is how much
communication between individual steps is necessary and how many steps there
are.  Communication between steps is computationally expensive, and if that
communication needs to cross a network (as in a distributed solution) there can
be a degradation in performance compared to keeping all of the steps on the
same system (as in the threaded solution).  However, if there are many steps
the resources on a single system will be a bottleneck, which makes a
distributed solution more appealing.

## An Atlas of Parallel Workloads

### Pleasantly Parallel

"Pleasantly parallel" work (AKA "embarrassingly parallel") is typically made up
of many _completely_ independent steps.  By independent we mean that:

  - any one step does not depend on the output or completion of any other step
  - steps do not need to exchange information with other steps

Examples: simulations, GWAS, chromosome by chromosome analyses

### Sequential

This is one opposite of pleasantly parallel.  In sequential workloads each step
is dependent on another step- step "B" cannot proceed until step "A" is
complete. This kind of workload is nearly impossible to speed up with
additional processors.

### Highly Connected

Another opposite of the pleasantly parallel workload is workload where steps
communicate information between other steps.  Weather and climate forecasts are
notorious for this kind of workload- each step represents a block of atmosphere
which is affected by its neighbors, thus step needs to look at the state of
another step and vice-versa.

These problems require very low-latency, high-speed communication between steps
and are typically better served when run on a single system (or one of the
exotic supercomputers).  That said, modern networks are fairly good and can
provide usable service for this communication if the number of steps greatly
exceeds the number of cores available on a single system.

## Techniques for Parallel Computation

### Workflow Managers
If desired, one way to manage jobs, environments, and data transfers particularly in a series of linked tasks or jobs is to use a [workflow manager](/datascience/using_workflows/). Workflow managers allow you to describe a workflow as a series of individual tasks.  Then the workflow manager software does the work of:
- sending the jobs to the compute resources, 
- deciding what tasks can be done in parallel, 
- staging data for use and keeping track of inputs and outputs,
- environment management (via docker containers or environment modules)
- monitoring jobs and providing you with metadata about them and the workflow itself.   

At Fred Hutch, [Nextflow](/compdemos/nextflow/) and [WDL workflows](/datascience/wdl_workflows/) are the primary workflow systems in use. WDL workflows can be executed using [multiple engines](/datascience/wdl_execution_engines/) including Cromwell, miniWDL, and Sprocket, while Nextflow has its own execution engine. Users are actively curating shared support and resources, with the [WILDS WDL Library](/datascience/wilds_wdl/) being a key resource for WDL workflows, and the [Fred Hutch NextFlow catalog](/datascience/nextflow_catalog/) being a key resource for Nextflow workflows. See the [Using Workflows](/datascience/using_workflows/) page for more information on workflow systems.


### Task Marshaling and Coordination

For pleasantly parallel work its primarily necessary to track the independent
steps within the job.  If you divide your work into 1000 steps, you need some
way to track and ensure each step was completed prior to proceeding.  These
techniques sometimes require integration with the workload manager depending on
the level of tracking required.

R has libraries such as _Rslurm_ which can provide back ends to the parallel
library, enabling you to write simple loops with _Rslurm_ managing the jobs
which are sent to cluster nodes.  _make_ has also been used to track tasks,
though this requires that you write a little more code for job submission

### Threading

"Threading" is an approach where tasks or computations are divided amongst the
compute resources available on a computer- this allows a single process to use
multiple compute cores.  More information on threads is available
[here](https://en.wikipedia.org/wiki/Thread_(computing)).

Threading is very useful for highly-connected tasks that communicate with each
other or share memory- as all of the threads are on the same system there is
little delay in communications between thread (commonly referred to as "low
latency communication".  Threading typically involves fairly low-level
programming skills though both Python and R have tools and libraries that make
threading some tasks easier. If you run a software that is multi-threaded please 
ensure that it only uses the number of cpu cores that are assigned to your job on
the current node. This number is kept in environment variable SLURM_JOB_CPUS_PER_NODE
and you can use it like this : 
```
    bowtie2 -p ${SLURM_JOB_CPUS_PER_NODE} ...
```

### Message Passing

Message passing allows processes to share memory and communicate with each
other across multiple computers using a network.  The most common standard for
message passing is the [Message Passing Interface
(MPI)](https://www.mpi-forum.org/) which defines the high-level interfaces used
to communicate between different hosts. OpenMPI is the most common
implementation of MPI and the one used here.

MPI is well-suited to scaling up highly-connected algorithms to run across
computers.  MPI can also be used for marshaling independent (i.e. pleasantly
parallel) work though this approach is overkill in most cases.

## Parallel Operations in Slurm

Slurm allows a single job to request multiple CPUs both on a single host and
across multiple hosts.  The fundamental unit is the _task_ which can use one or
many CPUs but cannot span multiple nodes.

The simplest method of running parallel computations in Slurm is _srun_.  With _srun_, you can run multiple copies of an indicated program on multiple hosts by specifying the number of tasks to run:

    srun --ntasks=6 myprogram


This will run six independent copies of `myprogram` on six different CPUs (though the assigned CPUs may be on one or more nodes.

If your task uses threading, you will want a single node, but multiple CPUs on
that node.  In these cases, you'll need a single task that uses multiple CPUs
per task.

    srun --ntasks=1 --cpus-per-task=6 myprogram


will run a single copy of `myprogram`, but will allocate 6 CPUs to `myprogram`.
Note that `myprogram` is "responsible" for figuring out how many CPUs are
available and running within that allocation.

If your task uses message passing you can use specify multiple tasks each using one or more CPUs (one CPU per task is most typical):

    srun --ntasks=6 --cpus-per-task=1 mpirun myprogram


In this case `myprogram` needs to be compiled using the MPI compilers or use MPI aware libraries.  Since OpenMPI and Slurm support each other well, it's not necessary to tell the _mpirun_ about the nodes and CPUs assigned.  Note that 1 is the default for `cpus-per-task` and can be safely omitted.

## Examples

We have begun consolidating examples of parallel computing approaches in the
[FredHutch/slurm-examples
GitHub repository.](https://github.com/FredHutch/slurm-examples)  Please refer to that
repository for more community curated example approaches and associated
documentation to see if someone has approached a problem similar to yours so
you don't have to start from scratch.
