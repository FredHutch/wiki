---
title: Nextflow - an Emerging Service for Workflow Management
last_modified_at: 2019-10-28
primary_reviewers: sminot
---

[Nextflow](https://www.nextflow.io/) is one of a handful of "workflow managers" that have become popular in the last few years. Other workflow managers that people may recognize are Snakemake, Cromwell, Toil, and CWL. Generally speaking, workflow managers are software tools that make it easier to run complex bioinformatic analyses that involve multiple steps, each of which may invoke a different piece of software with different environmental dependencies or resource requirements. The benefits of a workflow manager like Nextflow is that it should make it easier to run your analysis while transparently managing all of the issues that tend to crop up when running a shell script (missing dependencies, not enough resources, hard to tell where failures are coming from, not easily published or transferred to collaborators).

There is extensive documentation on how to write workflows and run Nextflow on [their documentation pages](https://www.nextflow.io/docs/latest/index.html), but in this page we will focus on the minimum requirements for running Nextflow at Fred Hutch using AWS for the execution.

## Getting up and running
### `Rhino` / `Gizmo`

On shared systems (`rhino`/`gizmo`), load the Nextflow module:

```
ml nextflow
```

Loading that module will place a working copy of `nextflow` in your PATH
which includes support for the full range of parameters needed
to run on AWS at Fred Hutch.

### Personal Desktop / Laptop

If, instead, you are on your own desktop/laptop, install Nextflow as follows:

```
curl -s https://get.nextflow.io | bash
```

This installation will leave the `nextflow` script in the current directory 
(where you ran the above command). Ideally
this script should be moved to a directory in your `PATH` so you do not need to type the full path to the command every time you invoke it.
We recommend creating a `bin` directory under your home directory and adding it to your 
`PATH` as described [here](https://kb.iu.edu/d/acar). Remember you'll probably need to log out or open a new terminal window before the change you made takes effect.



## How it works

A [workflow in Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#your-first-script) is a text file written in a particular format containing all of the details of the analysis that are generally true for _all_ of the times that you need to run that analysis. Any of the details specific to a single experiment or batch of samples can be specified as _parameters_, which are specified for each individual batch of data whenever you invoke the workflow.

The nice thing about Nextflow is that it can be used to run analyses on AWS, without having to know much about how AWS works. In other words, Nextflow will take care of running jobs on AWS, pulling data down from S3 into the job, running the analysis inside the appropriate Docker image, and pulling the results out of the job and returning them to the right place.

The overall setup for using Nextflow on AWS is:

  1. Input data is stored in AWS S3
  2. Analysis of the input data is run via Nextflow from your laptop or a `Rhino`
  3. Output of that analysis is stored on AWS S3, and can be pulled down for inspection and further analysis

### Call caching

One of the extremely powerful aspects of Nextflow is the call caching that it performs. This ensures that each workflow is run with complete reproducibility, while also being efficient and not rerunning analyses that don't need to be repeated. The operational steps are as follows:

  1. When you run a workflow, Nextflow checks to see what all of the processes are that have been run previously, including the Docker container that was used, all parameters, and the input file (MD5 checksum)
  2. For each process that is run, Nextflow checks to see if that command has been run previously with the exact same set of inputs and parameters. If no such command has been run previously, it goes ahead and runs the command. If the exact same command _has_ been run previously, it will use the outputs from that previous run. If as little as a single byte of the input file has changed, it will err on the side of caution and rerun the command.

Note that the call caching is coordinated from the working directory that you run Nextflow from. If you want to run a workflow using cached calls from a previous run, make sure that you are running Nextflow from the same directory as the previous run.

### Example workflows
Fred Hutch researchers are building and maintaining a set of Nextflow workflows for use by the general community [here](https://github.com/FredHutch/reproducible-workflows/tree/master/nextflow), while also providing an example of how to write your own workflows.

Some Nextflow-based tools used for microbiome analysis at Fred Hutch can be found in
[the accompanying documentation](https://sciwiki.fredhutch.org/compdemos/microbiome_tools/)

### Setup

  1. Get set up with [AWS Credentials](/scicomputing/access_credentials/#amazon-web-services-aws) and request access to [Batch](/scicomputing/access_credentials/#get-aws-credentials-and-access)
  2. Make a file named `nextflow.config` in your home directory

`nextflow.config` must contain a handful of elements in order to run correctly on AWS at Fred Hutch. You don't have to understand all of these things completely. Remember to [select the right job queue for your analysis.](/scicomputing/access_credentials/#choose-a-job-queue).  Also, you will be provided with the appropriate Job Role ARN when you get set up with your AWS credentials.

```
// Run the analysis on AWS Batch
process.executor = 'awsbatch'
// Run the analysis on the specified queue in AWS Batch
process.queue = 'optimal'
// Run in the correct AWS region
aws.region = 'us-west-2'

// Set a place to write temporary files which can be deleted after
// the workflow is completed. It can be useful to treat this as
// 'scratch' space which can be automatically deleted after 30 days
workDir = "s3://fh-pi-lastname-f/scratch-delete-30/nextflow/work/"

// Mount the host folder /docker_scratch to /tmp within the running job
// Use /tmp for scratch space to provide a larger working directory
// Replace with the Job Role ARN for your account
aws {
    region = 'us-west-2'
    batch {
        cliPath = '/home/ec2-user/miniconda/bin/aws'
        jobRole = '<YOUR JOB ROLE ARN HERE>'
        volumes = ['/docker_scratch:/tmp:rw']
    }
}
```



## Data Preparation

For each project, the two things you will need to do for each individual project
are to:

  1. Make sure to locate your input data in AWS S3 (or [move it there if needed](/scicomputing/store_objectstore/#economy-cloud-s3))
  2. Find / make the right Nextflow script for your analysis


## Running a workflow

Make a BASH script in your project folder with the parameters used to run the analysis. To run the analysis, simply run the BASH script. That way you don't have to remember what parameters you used if you want to rerun the same analysis on a different dataset, or tweak a parameter for another analysis.

Example script:

```
#!/bin/bash
set -e
BASE_BUCKET="s3://fh-pi-lastname-f/lab/user_name/project_name"

# Load the module
ml nextflow

nextflow \
    -c ~/nextflow.config \
    run \
    path-to-workflow.nf \
    --first_parameter ValueForFirstParameter \
    --second_parameter ValueForSecondParameter \
    --input_folder $BASE_BUCKET/input/ \
    --output_folder $BASE_BUCKET/output/ \
    -with-report nextflow_report.html \
    -work-dir $BASE_BUCKET/work/ \
    -resume
```

The command above will run the workflow in the file `path-to-workflow.nf`. Inside that script, the variable `${params.first_parameter}` will be replaced with `ValueForFirstParameter`, `${params.second_parameter}` will be replaced with `ValueForSecondParameter`, etc. Running any workflow with arguments prefixed by `--`, will provide that value as a parameter in that pattern. Specifying `-with-report` tells Nextflow to write a summary of the complete workflow execution to a human readable summary in `nextflow_report.html`. Specifying `-work-dir` tells Nextflow to use `s3://fh-pi-lastname-f/lab/user_name/project_name/work/` to store all temporary data (the inputs and outputs of each individual task). The `-resume` flag tells Nextflow to pick up with the results from any previous run on this workflow, in case there was a failure and you want to try to rerun the whole workflow without repeating any of the steps that succeeded and don't *need* to be run again.


## Grabnode vs. `Rhino`

While it is possible to run your nextflow script on one of the `rhinos`, we **strongly suggest**
using `grabnode` and running on a dedicated machine. In addition to the good practice of
keeping the `rhinos` clear for other users, we have found that the performance is much faster
on a gizmo node. This is possibly due to the number of requests that the nextflow process
must make in order to keep track of many concurrent tasks, but in the end the reason is 
less important than the result.


## Getting Results

One of the easiest practices for getting results out of a Nextflow workflow is to include the `publishDir` ([docs](https://www.nextflow.io/docs/latest/process.html#publishdir)) parameter for any process that you will want to access the results from. For example, if you include the line:

```
publishDir "${params.output_folder}"
```

In the script above, then the output will be copied to the folder specified with the input flag
`--output_folder`.

## FAQ

There are many "gotchas" and common issues with getting started with nextflow, or nuances of using nextflow here at Fred Hutch. Here is a non-comprehensive list of known solutions / best practices to help avoid getting caught up by these common issues:

### AWS Batch

**My workflow has started, but have my jobs started running?**

When you start your workflow, it will submit jobs to AWS Batch for execution. Sometimes it can
be hard to tell if those jobs have even started running, or if they have already been stalled.
The best way to check is to go to the convenient [Batch Dashboard](https://batch-dashboard.fhcrc.org/)
which is accessible from inside the Fred Hutch VPN. You can scroll down to the **Jobs** section
and search for one of your job names in the table. That will tell you if the jobs are stuck in
RUNNABLE, or if they are already RUNNING.

**Why are my jobs stuck in "RUNNABLE"?**

When a job is "RUNNABLE" in AWS Batch, this means that it is waiting to be scheduled onto a
machine for execution. There are a few potential reasons for this:

  - The queue is busy with other jobs (check the top of the Batch Dashboard for total numbers of jobs): try using another queue (see below)
  - Your job is configured with a combination of CPUs and memory which does not fit onto any known machine. This is likely only a problem encountered by workflow *developers*, and you can check [this link](https://aws.amazon.com/ec2/instance-types/) for a list of common instance configurations
  - If you do not believe that either of these are the case, please contact SciComp

**How do I pick which 'queue' to use in AWS Batch?**

A 'queue' is a concept in AWS Batch which specifies what line a job will go into to wait to 
be scheduled and executed. 

You can specify the queue with `process.queue = 'optimal'` in your `nextflow.config`, or with
`-process.queue optimal` at runtime (in the `nextflow run ...` command).

There are currently a handful of queues that you can use on AWS
Batch:

  - optimal
  - mixed
  - spot-test

These are essentially the same, except that 'spot-test' uses so-called SPOT instances, which
come at a lower cost, but run the risk of being pre-empted by more highly paying customers.
It is generally reasonable to just pick one and use it for everything, switching to another
queue if your usual queue is full.


### Working directory

**What is the working directory? What should I use?**

When a single task is run with Nextflow, all of the commands needed to run the task, as well
as the data output by that task, are written to a working directory. It is important to remember
while you are developing a Nextflow workflow that the working directory is different from the
output directory which you 'publish' to. In fact, when you add the `publishDir` option to a
process, it indicates that `nextflow` will ultimately copy files from the working directory
to the output directory upon successful completion of the workflow.

A good practice is to treat the working directory like scratch space which can be safely 
deleted once the workflow has been completed successfully. A good practice would be to set
a common location in an S3 bucket, and to set the working directory in your configuration
file so that it is used across all workflows. See the documentation above for an example.


### Publishing output data

**My workflow ran successfully, why don't I see anything in the output folder?**

tl;dr: Just run it again (and make sure to use the `-resume` flag).

The final step of a nextflow workflow is to copy the working copies of each final output file
to the specified output directory. For some reason this will sometimes just fail on the copy
step. But don't worry! You can just re-run the exact same workflow with the `-resume` flag,
and the whole workflow will re-run (fetching from the cached output for every step in the
workflow) copying over all of the final results to the output directory. 


### Input to / output from processes
**Why can't my process find the input files it needs?**

  - incomplete input download: Sometimes a task will fail to completely download an input file. Try running it again and see if it works. This will only be a consistent error if your process has thousands of inputs
  - input defined as variable: Sometimes you write a workflow expecting to be passing a file as an input, but if you don't use the `path()` or (older) `file()` on the file path then the file path will get passed in as a string. You can tell this is happening if `${input_file}` does not exist as a file, but you can still `echo ${input_file}` and it prints the file name


### Resource allocation

**How do I make sure that my processes have enough CPU and memory?**

For a bioinformatics workflow to run on AWS Batch, you generally have to define how much CPU
and RAM each job needs. One convenient way to do this is by adding all of the resource definitions
to the `nextflow.config` file associated with the workflow (in the workflow's repository) with 
either the `withLabel` or `withName` selectors. 

The reason you would take this approach is that it makes it easier for the user to just copy
the `nextflow.config` file and modify anything that they need (pointing to that new config
file with the `-c` flag at execution time), without having to modify `main.nf` directly. 

With the label-based approach, every process in `main.nf` has a label (e.g. `label 'io_limited'`)
at the top of the `process` block. Then, in the `nextflow.config` file you have a section like:

```
process {
    withLabel: 'io_limited' {
        cpus = 2
        memory = 8.GB
    }
}
```
The nice thing about this is that you can have many different processes which all have the
same set of resources.

If you only have a handful of processes in your workflow, it may be easier to use `withName`,
where you don't need the `label` in the workflow, and instead add something to your config like:

```
process {
    withName: 'trimmomatic' {
        cpus = 2
        memory = 8.GB
    }
}
```

Which will directly set the resources for the `trimmomatic` process.

### Random Errors

**Why am I getting an odd error around this `tuple` thing?**

The `tuple` was added to replace `set` in version 19.10.0. If you are getting an error, it's
possible that you're running an older version of Nextflow. Try using a newer version by
setting `NXF_VER` at runtime, e.g.:

```
NXF_VER=19.10.0 nextflow run -c ~/nextflow.config repo/workflow --help
```


### Advanced workflow patterns

**How do I keep track of matching data in two parallel channels?**

One of the first tricky parts of writing Nextflow workflows is the realization that channels
do not preserve the order of the data which passes through them. An example is the case where
you have two channels which need to execute something independently for multiple samples and 
then join together the results (e.g. running FASTQC in one channel and aligning to a reference 
in another). 

There is an easy fix for this, which is to include a unique sample ID with the file object as
a `tuple`, and then merge the channels on that key. Here's an example:

```
// Set up two input channels with the input files to process
Channel.fromPath("{params.input_folder}/*")
       .map { fp -> file(fp) }
       .into { input_ch_1; input_ch_2 }

// One process runs FASTQ, I will omit everything but the input and output blocks
process fastqc {
    input:
    file input_file from input_ch_1

    // Make the output a tuple with the name of the input file as a variable
    output:
    tuple val(input_file.name), file("${input_file}.fastqc") into output_ch_1
}

// Another process runs BWA
process bwa {
    input:
    file input_file from input_ch_2

    // Make the output a tuple with the name of the input file as a variable
    output:
    tuple val(input_file.name), file("${input_file}.bam") into output_ch_2
}

// Now we can set up a process which takes in the pairs of FASTQC output and
// BAM files which were generated from the same input file
process combine {
    input:
    tuple val(fn), file(fastqc), file(bam) from output_ch_1.join(output_ch_2)
}
```

In the example above, `output_ch_1.join(output_ch_2)` will yield tuples with
the input file name, the FASTQC output file, and the BAM file for every set
of outputs which share the unique common input file name. This ensures that
everything is nicely synchronized between processes without having to wait
around for `fastqc` and `bwa` to process all of the samples before starting
to `combine` the ones that are already finished.
