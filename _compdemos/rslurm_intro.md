---
title: Introduction to rslurm
date: 2020-02-27
main_author: Michael Gutteridge
primary_reviewers: vortexing, atombaby, jennylsmith
---

The [`rslurm`](https://cran.r-project.org/web/packages/rslurm/index.html) library creates a mechanism for distributing R calcuations across a set of Slurm jobs.  `rslurm` creates and manages self-contained Slurm jobs, then combining the output from the various jobs as they complete.

## Purpose

- Learn basic use of `rslurm`
- Create a script for calculating &pi;

## Audience

You should know:

- How to use `sbatch` to submit jobs to a Slurm cluster
- Some R programming experience

## Using rslurm

### Requirements

You will need access to the Rhinos for submitting the job 

### Instructions on how to get set-up

Log into a rhino or in an NoMachine terminal session.  Use the module commands to load R- most later versions of R in our environment have the `rslurm` module ainstalled but it is also available for installation via CRAN

```
> module purge
> ml R/3.4.3-foss-2016b-fh2 #any R version will do. Just an example.
```

# `rslurm` Overview

`rslurm` is a library for parallelizing computations on a Slurm cluster.  It does this by creating scripts for each component of the workload.  `rslurm` is best used for pleasantly-parallel computations where each of the components do not communicate or share information.

The two primary functions for running jobs are `slurm_apply` and `slurm_call`, each of which create Slurm jobs.  The both take an R function to be run and the parameters for that function as arguments.  `slurm_apply` takes a set of multiple parameters whereas `slurm_call` takes only a single set of parameters.

## Workflow

The first step in using `rslurm` for parallelizing a computation is to create the function.  The function will get its arguments from the `slurm_apply` function.  For example, in our example of calculating $\pi we need a function that generates a random set of coordinates and determines which of those coordinates are inside a circle.

```
sim.pi <- function(iterations = 1000) {
  # Generate two vectors for random points in unit 
  # circle x.pos <- runif(iterations, min=-1, max=1)
  y.pos <- runif(iterations, min=-1, max=1)

  # Test if draws are inside the unit circle
  draw.pos <- ifelse(x.pos^2 + y.pos^2 <= 1, TRUE, FALSE)
  draws.in <- length(which(draw.pos == TRUE))

  result <- data.frame(iterations,draws.in)

  return(result)
}
```

This function returns a data frame containing the number of iterations and how many times the coordinates were inside this unit circle.

The next step is to create the data frame containing the parameters.  This example has a simple data frame with just a list of numbers (iterations):

```
params <- data.frame(iterations = rep(1000,100))
```

The last step is to then apply each row in the data frame to the function in the context of a job:

```
sjob1 <- slurm_apply(
  sim.pi, 
  params,
  jobname="rslurm-pi-example",
  nodes=10,
  cpus_per_node=1
)
```

This creates a job object (`sjob1`).  The arguments for this function are:

 - sim.pi - the function to be run in each Slurm job
 - params - a data frame containing the parameters for each call of the function
 - jobname - the name the jobs will have in Slurm
 - nodes - this is misleading- this is more correctly called "tasks" for Slurm The rows in the parameters will be distributed over these tasks
 - cpus_per_node - how many cores will be requested for each task
 
The job object is then what we will interact with for getting job state and results. `get_job_status` will show the jobs and their Slurm state.  `get_slurm_out` will return the output of the job in a data frame or list.

The function `get_slurm_out` will block until the jobs have completed.  The output can then be put into a data frame or list.  A list is default, so a data frame is selected by passing "table" in the `outtype` parameter:

```
res <- get_slurm_out(sjob1, outtype="table")
```

The resulting data frame can then be used by downstream calculations:

```
res <- get_slurm_out(sjob1, "table")
my_pi <- 4/(sum(res$iterations)/sum(res$draws.in))
cat("\n... done\n")
cat(
  paste0(
    "pi estimated to ", my_pi, " over ", sum(res$iterations), " iterations\n"
  )
)
```

This next step is technically optional but desirable as a practical matter.  The `slurm_apply` creates a bunch of temporary files- unless you want these for debugging remove them with `cleanup_files`:

```
cleanup_files(sjob1)
```

