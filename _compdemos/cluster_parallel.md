---
title: Parallel Computing on Slurm Clusters
last_modified_at: 2019-01-30
---

_Parallel computing_ is an approach to computing where many tasks are done
simultaneously- either on a single device or on multiple independent devices.
These tasks can be dependent or independent of each other requiring varying
degreees of ordering and orchestration.  Parallel computing can be quite
complicated to set up but can improve job throughput when done correctly. 

Parallel computing starts with breaking a larger task into smaller steps- the
"size" and relationship of those steps is highly dependent on the task at hand
but determines much about how the job can be "parallelized". Because of the
variety of approaches to large tasks, often there can be multiple strategies to
consider using to identify the most effective approach to use for the
particular task at hand. 

When steps are highly dependent on each other (e.g. the output of one step is
used for input into the next) that job is said to be "serial" and it won't
benefit greatly from parallel processing.  At the other end, "embarassingly" or
"pleasantly" parallel work has individual steps that do not depend on each
other and can occur in at the same time, often in great numbers. 

Once you've determined how your work can be parallelized, there are two ways
to distribute those steps.  The first uses the capabilities of multi-core
CPUs- modern CPUs have multiple cores, each of which are capable of processing
independent steps.  This technique is typically referred to as "threading."

Another approach to using multiple processors is to spread the work over
multiple different computers.  This approach has the advantage of being
able to scale up the amount of computation being done concurrently.  This
approach is often described as "distributed"

> Note: It is also possible to combine those techniques- using multiple cores
> on multiple computers.  This can add a little complexity, but many tools will
> handle this neatly.

## Choosing an Approach

The primary drivers for choosing between the two approaches is how much
communication between individual steps is necessary and how many steps there
are.  Communication between steps is computationally expensive, and if that
communication needs to cross a network (as in a distributed solution) there can
be a degredation in performance compared to keeping all of the steps on the
same system (as in the threaded solution).  However, if there are many steps
the resources on a single system will be a bottleneck, which makes a
distributed solution more appealing.

## An Atlas of Parallel Workloads

### Pleasantly Parallel

"Pleasantly parallel" work (AKA "embarassingly parallel") is typically made up
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

### Task Marshalling and Coordination

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
threading some tasks easier.

### Message Passing

Message passing allows processes to share memory and communicate with each
other across multiple computers using a network.  The most common standard for
message passing is the [Message Passing Interface
(MPI)](https://www.mpi-forum.org/) which defines the high-level interfaces used
to communicate between different hosts. OpenMPI is the most common
implementation of MPI and the one used here.

MPI is well-suited to scaling up highly-connected algorithms to run across
computers.  MPI can also be used for marshalling independent (i.e. plesantly
parallel) work though this approach is overkill in most cases.

## Parallel Operations in Slurm

Slurm has two concepts important when looking at implementing a parallel
workload: _jobs_ and _steps_.  The step is the atomic unit of a job- a job can
be made up of multiple steps.  In general, the steps are independent and don't
directly communicate with each other. Steps can execute across many CPUs and
hosts and many steps can run simultaneously within the job. For example,
suppose I need to do three things to a data set:

 - divide it into pieces
 - run a calculation on each of those pieces
 - summarize those calculations

In Slurm, I can create a job made up of three steps.  The first step is
sequential- it will use one CPU on one host.  The second step can be run on
multiple CPUs as these calculations are independent.  The last step is, again,
a sequential task that can only use a single CPU.  The job would need to
request as many CPUs as could be used (or is practical) by the second step- the
first and last step would only use a single CPU.

## Examples

We have begun consolidating examples of parallel computing approaches in the
[FredHutch/slurm-examples
repository.](https://github.com/FredHutch/slurm-examples)  Please refer to that
repository for more community curated exmaple approaches and associated
documentation to see if someone has approached a problem similar to yours so
you don't have to start from scratch. 
