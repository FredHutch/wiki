---
title: Nextflow - an Emerging Service for Workflow Management
last_modified_at: 2019-05-02
primary_reviewers: sminot
---

[Nextflow](https://www.nextflow.io/) is one of a handful of "workflow managers" that have become popular in the last few years. Other workflow managers that people may recognize are Snakemake, Cromwell, Toil, and CWL. Generally speaking, workflow managers are software tools that make it easier to run complex bioinformatic analyses that involve multiple steps, each of which may invoke a different piece of software with different environmental dependencies or resource requirements. The benefits of a workflow manager like Nextflow is that it should make it easier to run your analysis while transparently managing all of the issues that tend to crop up when running a shell script (missing dependencies, not enough resources, hard to tell where failures are coming from, not easily published or transferred to collaborators).

There is extensive documentation on how to write workflows and run Nextflow on [their documentation pages](https://www.nextflow.io/docs/latest/index.html), but in this page we will focus on the minimum requirements for running Nextflow at Fred Hutch using AWS for the execution.

>Note:  The latest release of Nextflow **does not** include support for the full range of parameters needed to run on AWS at Fred Hutch as of April 2019. However, that support has been added to the codebase and will soon be available at Fred Hutch via the `module load` system under the name `nextflow/devel`.  Docs will be updated as this module becomes available.

### How it works

A [workflow in Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#your-first-script) is a text file written in a particular format containing all of the details of the analysis that are generally true for _all_ of the times that you need to run that analysis. Any of the details specific to a single experiment or batch of samples can be specified as _parameters_, which are specified for each individual batch of data whenever you invoke the workflow.

The nice thing about Nextflow is that it can be used to run analyses on AWS, without having to know much about how AWS works. In other words, Nextflow will take care of running jobs on AWS, pulling data down from S3 into the job, running the analysis inside the appropriate Docker image, and pulling the results out of the job and returning them to the right place.

The overall setup for using Nextflow on AWS is:

  1. Input data is stored in AWS S3
  2. Analysis of the input data is run via Nextflow from your laptop or a Rhino
  3. Output of that analysis is stored on AWS S3, and can be pulled down for inspection and further analysis

#### Call caching

One of the extremely powerful aspects of Nextflow is the call caching that it performs. This ensures that each workflow is run with complete reproducibility, while also being efficient and not rerunning analyses that don't need to be repeated. The operational steps are as follows:

  1. When you run a workflow, Nextflow checks to see what all of the processes are that have been run previously, including the Docker container that was used, all parameters, and the input file (MD5 checksum)
  2. For each process that is run, Nextflow checks to see if that command has been run previously with the exact same set of inputs and parameters. If no such command has been run previously, it goes ahead and runs the command. If the exact same command _has_ been run previously, it will use the outputs from that previous run. If as little as a single byte of the input file has changed, it will err on the side of caution and rerun the command.

Note that the call caching is coordinated from the working directory that you run Nextflow from. If you want to run a workflow using cached calls from a previous run, make sure that you are running Nextflow from the same directory as the previous run.

#### Example workflows
Fred Hutch researchers are building and maintaining a set of Nextflow workflows for use by the general community [here](https://github.com/FredHutch/reproducible-workflows/tree/master/nextflow), while also providing an example of how to write your own workflows.

### Setup

  1. Get set up with [AWS Credentials](/scicomputing/access_credentials/#amazon-web-services-aws) and request access to [Batch](/scicomputing/access_credentials/#get-aws-credentials-and-access)
  2. Make a file named `nextflow.config` in your home directory

`nextflow.config` must contain a handful of elements in order to run correctly on AWS at Fred Hutch. You don't have to understand all of these things completely. Remember to [select the right job queue for your analysis.](/scicomputing/access_credentials/#choose-a-job-queue).  Also, you will be provided with the appropriate Job Role ARN when you get set up with your AWS credentials.

```
// Run the analysis on AWS Batch
process.executor = 'awsbatch'
// Run the analysis on the specified queue in AWS Batch
process.queue = 'mixed'
// Run in the correct AWS region
aws.region = 'us-west-2'
// Location of the AWS executable in the host machine image
executor.awscli = '/home/ec2-user/miniconda/bin/aws'

// Mount the host folder /docker_scratch to /tmp within the running job
// Use /tmp for scratch space to provide a larger working directory
// Replace with the Job Role ARN for your account
aws {
    region = 'us-west-2'
    batch {
        jobRole = '<YOUR JOB ROLE ARN HERE>'
        volumes = ['/docker_scratch:/tmp:rw']
    }
}
```



### Data Preparation

For each project, the two things you will need to do for each individual project
are to:

  1. Make sure to locate your input data in AWS S3 (or [move it there if needed](/scicomputing/store_objectstore/#economy-cloud-s3))
  2. Find / make the right Nextflow script for your analysis


### Running a workflow

Make a BASH script in your project folder with the parameters used to run the analysis. To run the analysis, simply run the BASH script. That way you don't have to remember what parameters you used if you want to rerun the same analysis on a different dataset, or tweak a parameter for another analysis.

Example script:

```
#!/bin/bash
set -e
BASE_BUCKET="s3://fh-pi-lastname-f/lab/user_name/project_name"

# CURRENTLY UNDER DEVELOPMENT
ml nextflow/devel

nextflow \
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


### Getting Results

One of the easiest practices for getting results out of a Nextflow workflow is to include the `publishDir` ([docs](https://www.nextflow.io/docs/latest/process.html#publishdir)) parameter for any process that you will want to access the results from. For example, if you include the line:

```
publishDir "${params.output_folder}"
```

In the script above, then the output will be copied to the folder specified with the input flag
`--output_folder`.
