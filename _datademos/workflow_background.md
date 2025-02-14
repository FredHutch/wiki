---
title: Nextflow Workflow Background
---


A [workflow in Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#your-first-script) 
is (at the minimum) a text file written in a particular format containing all of the details of
the analysis that are generally true for _all_ of the times that you need to run that analysis.

Workflows are most commonly saved as [code repositories](https://en.wikipedia.org/wiki/Comparison_of_source-code-hosting_facilities)
(e.g. [on GitHub](https://github.com/FredHutch/)) in order to keep track of any changes to that
workflow over time. Nextflow can execute a workflow directly from a GitHub repository, which also
allows the user to specify a particular version (or snapshot) of the code to run. With this approach,
it is very easy to be sure that the version of the workflow which is being run at different times or by
different users is in fact the same.

Any of the details specific to a single experiment or batch of samples can be specified as _parameters_,
which are specified for each individual batch of data whenever you invoke the workflow.

A very helpful feature of workflow managers like Nextflow is that they can be used to run analyses
on your local computer, SLURM (gizmo), AWS, Azure, etc., without having to change the workflow
when switching between systems.
This makes it particularly convenient for running analyses at different institutions, each of which most
likely uses a different system for high-performance computing.

The settings which are applied to instruct Nextflow in the appropriate computational resource to use for
the execution are referred to as the _configuration_.

## Behind the Scenes

When a users invokes a workflow on the command line (e.g. `nextflow run ...`), the workflow manager will:

- Parse the user's configuration file(s) to connect to the appropriate systems for file storage and job execution
- Parse the indicated workflow file (or repository) for the series of steps which need to be executed
- Parse the parameters provided by the user (e.g., indicating the location of the input data or optional flags)
- Begin to process the input data as indicated

### Using Compute Resources

When running a workflow, the user has the option of deciding where the actual processing will happen.
This is distinct from the location where the primary `nextflow run ...` process is invoked (which we call the "head node").

For example, you may run a workflow:
- From your laptop or local computer;
- From one of the `rhino` machines; or 
- From a node on `gizmo`.

Independently, the execution of that workflow may be carried out:
- From your laptop or local computer;
- On the `gizmo` cluster; or
- On an AWS Batch queue.

When deciding how to run a workflow, one of the primary considerations is where you would like the
actual execution to take place. Nextflow makes it easy to use the same workflow in different places,
so that a workflow developed for the `gizmo` cluster can be transitioned to AWS relatively easily
(and vice versa).

### Task Execution

After parsing the workflow, configuration, and parameters, Nextflow will begin to launch each of the tasks
which have been specified by the workflow. When an individual task is run, it will:

1. Establish a connection to the input data files (if any). When running on a local filesystem or SLURM, those files are symlinked to the working directory for the process. When running on a cloud computing service, the files are downloaded from object storage into the working directory for the running task.
2. Run the command specified for the task, either (a) in the local environment, (b) in a Docker container, or (c) in an Apptainer image. Local execution on your individual computer can be performed with or without Docker or Apptainer. Execution on SLURM (gizmo) can be done with or without Apptainer. Execution on cloud services (i.e. AWS) is natively performed within a specified Docker image.
3. After execution, all outputs are reported back to the head node which is running the workflow. Those outputs include any files produced as well as the logs or errors that may have been encountered.
4. After parsing the output of a task, the workflow may then specify that a downstream task is launched, in which case the process is repeated.

### Work Directory

One of the most important parameters that you will set up in your Nextflow configuration
is the working directory (`-w` or `-workDir`). This is the directory in which a set of files
will be created for every task which is executed as part of a workflow. Because this will
often create many temporary files which will not be needed after the workflow is complete,
we strongly suggest that scratch storage be used for this directory.

### Data Locality

The phrase "data locality" is used to refer to the general principal that the location of the data storage
should generally be adjacent to (or easily accessed by) the compute resource being used. For large data files
being processed by a workflow, execution on SLURM/gizmo is best using files stored in our local filesystem 
while execution on AWS is best using files stored in AWS S3.

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
If you want to run a workflow using cached calls from a previous run, make sure that you are running Nextflow from the same directory as the previous run,
and that the `-resume` flag is present.

More details [demystifying the resume function in Nextflow](https://www.nextflow.io/blog/2019/demystifying-nextflow-resume.html).

### Software Containers

One of the biggest benefits of using a workflow manager is reproducibility -- it's easy to know exactly what
commands were run to generate a given set of outputs. However, the same command may result in a different outcome
when the version of a piece of software changes. For that reason, some method of software versioning is needed
for a reliable level of reproducibility in bioinformatics analysis.

One method for controlling a version of software is to use the [Environment Module system](/scicomputing/compute_environments/)
maintained in the Fred Hutch shared computing system. However, that system is only available for use with 
on-premise computing at Fred Hutch. For robust software versioning across institutions or with cloud computing resources,
software containers are an extremely useful approach. Conveniently, software containers can also be used
with on-premise resources.

When referring to software containers, people usually use the term "Docker" or "Apptainer" (formerly known as Singularity). While there are
nuanced differences to these two systems, the general summary is that Apptainer is a system which allows
users to run Docker images inside shared computing systems. Docker is more commonly used in local execution,
cloud computing, or any setting in which a user can assume root access (which is not allowed in a shared setting).

To use a software container in Nextflow, simply use the `container` field when defining a process. This will ensure that
the code defined in the process is executed inside the specified software container. You can also specify a container
which can be used to run _all_ of the processes in a workflow (although this is less useful for complex workflows).
For more details on the use of containers in Nextflow, see [this documentation](https://www.nextflow.io/docs/latest/docker.html).

There are two options for using a container in your workflow -- use a public image or make your own. The best public resource
for Docker images is the [BioContainers Registry](https://biocontainers.pro/registry), which has images available for
a large number of bioinformatics tools. To build your own Docker container search this site for more guidance using search function.  