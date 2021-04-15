---
title: Workflow Background
hdc: True
---

# The Workflow Concept

A [workflow in Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#your-first-script) is a text file written in a particular format containing all of the details of the analysis that are generally true for _all_ of the times that you need to run that analysis. 
Any of the details specific to a single experiment or batch of samples can be specified as _parameters_, which are specified for each individual batch of data whenever you invoke the workflow.

The nice thing about Nextflow is that it can be used to run analyses on your local computer, SLURM (gizmo), AWS, Azure, etc., without having to change the workflow at all when switching between systems.
This makes it particularly convenient for running analyses at different institutions, each of which most likely uses a different system for high-performance computing.
The settings which are applied to instruct Nextflow in the appropriate computational resource to use for the execution are referred to as the _configuration_.

# Behind the Scenes

When a users invokes a workflow on the command line (e.g. `nextflow run ...`), the workflow manager will:

- Parse the user's configuration file(s) to connect to the appropriate systems for file storage and job execution
- Parse the indicated workflow file (or repository) for the series of steps which need to be executed
- Parse the parameters provided by the user (e.g., indicating the location of the input data or optional flags)
- Begin to process the input data as indicated

### Call caching

One of the extremely powerful aspects of Nextflow is the call caching that it performs. 
This ensures that each workflow is run with complete reproducibility, while also being efficient and not rerunning analyses that don't need to be repeated. 
The operational steps are as follows:

  1. When you run a workflow, Nextflow checks to see what all of the processes are that have been run previously, including the Docker container that was used, all parameters, and the input file (MD5 checksum)
  2. For each process that is run, Nextflow checks to see if that command has been run previously with the exact same set of inputs and parameters. 
  If no such command has been run previously, it goes ahead and runs the command. 
  If the exact same command _has_ been run previously, it will use the outputs from that previous run. 
  If as little as a single byte of the input file has changed, it will err on the side of caution and rerun the command.

Note that the call caching is coordinated from the working directory that you run Nextflow from. 
If you want to run a workflow using cached calls from a previous run, make sure that you are running Nextflow from the same directory as the previous run.
