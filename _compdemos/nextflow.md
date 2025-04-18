---
title: Nextflow - an Emerging Service for Workflow Management
last_modified_at: 2021-04-14
primary_reviewers: sminot
---

[Nextflow](https://www.nextflow.io/) is one of a handful of "workflow managers" that have become popular in the last few years. 
Other workflow managers that people may recognize are Snakemake, Cromwell and Toil. 
Generally speaking, workflow managers are software tools that make it easier to run complex bioinformatic analyses that involve multiple steps, each of which may invoke a different piece of software with different environmental dependencies or resource requirements. 
The benefits of a workflow manager like Nextflow is that it should make it easier to run your analysis while transparently managing all of the issues that tend to crop up when running a shell script (missing dependencies, not enough resources, hard to tell where failures are coming from, not easily published or transferred to collaborators).

For more details on Nextflow and workflow managers overall, please visit the workflow documentation available [here](/datascience/using_workflows).

### Example workflows
Fred Hutch researchers are building and maintaining a set of Nextflow workflows for use by the general community [here](https://github.com/FredHutch/reproducible-workflows/tree/master/nextflow), while also providing an example of how to write your own workflows.

Some Nextflow-based tools used for microbiome analysis at Fred Hutch can be found in [the accompanying documentation](/compdemos/microbiome_tools/)

### Setup

  1. Get set up with [AWS Credentials](/scicomputing/access_credentials/#amazon-web-services-aws) and request access to [Batch](/compdemos/aws-batch/)
  2. Make a file named `nextflow.config` in your home directory

`nextflow.config` must contain a handful of elements in order to run correctly on AWS at Fred Hutch. 
You don't have to understand all of these things completely. 


```
// Run the analysis on AWS Batch
process.executor = 'awsbatch'
// Run the analysis on the specified queue in AWS Batch
process.queue = 'default'

// Set a place to write temporary files which can be deleted after
// the workflow is completed. It can be useful to treat this as
// 'scratch' space which can be automatically deleted after 10 days
workDir = "s3://fh-pi-lastname-f-nextflow-scratch/delete10/nextflow/work/"

// Mount the host folder /var/lib/docker to /tmp within the running job
// Use /tmp for scratch space to provide a larger working directory


// The use of aws.client.maxConnections = 4 is intended to prevent
// any errors resulting from too many requests to S3. Some users have
// noticed that while this may slow the rate of job submission, it
// can help prevent errors when running workflows with many thousands
// of tasks.
aws {
    // Run in the correct AWS region
    region = 'us-west-2'
    batch {
        cliPath = '/home/ec2-user/miniconda/bin/aws'
        volumes = ['/var/lib/docker:/tmp:rw']
    }
    client {
        maxConnections = 4
    }
}
```

## Data Preparation

For each project, the two things you will need to do for each individual project
are to:

  1. Make sure to locate your input data in AWS S3 (or [move it there if needed](/scicomputing/store_objectstore/#aws-s3))
  2. Find / make the right Nextflow script for your analysis

## Running a workflow

Make a BASH script in your project folder with the parameters used to run the analysis. 
To run the analysis, simply run the BASH script. 
That way you don't have to remember what parameters you used if you want to rerun the same analysis on a different dataset, or tweak a parameter for another analysis.

Example script:

```
#!/bin/bash
set -e
BASE_BUCKET="s3://fh-pi-lastname-f-eco/lab/user_name/project_name"

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

### Workflow script
The command above will run the workflow in the file `path-to-workflow.nf`. 
You can also [run a workflow directly from github](https://www.nextflow.io/docs/latest/sharing.html#running-a-pipeline) without a local copy like `nextflow run https://github.com/foo/bar
`
### Params
Inside that script, the variable `${params.first_parameter}` will be replaced with `ValueForFirstParameter`, `${params.second_parameter}` will be replaced with `ValueForSecondParameter`, etc. 
Running any workflow with arguments prefixed by `--`, will provide that value as a parameter in that pattern. 
### Report
Specifying `-with-report` tells Nextflow to write a summary of the complete workflow execution to a human readable summary in `nextflow_report.html`.
Beware that running `-with-report` depends on some utilities which must be installed in the environment you are running your process in (e.g. in your Docker container); [more details in the Nextflow docs](https://www.nextflow.io/docs/latest/tracing.html#tasks).
### Working directory
Specifying `-work-dir` tells Nextflow to use `s3://fh-pi-lastname-f/lab/user_name/project_name/work/` to store all temporary data (the inputs and outputs of each individual task). 
### Resume
The `-resume` flag tells Nextflow to pick up with the results from any previous run on this workflow, in case there was a failure and you want to try to rerun the whole workflow without repeating any of the steps that succeeded and don't *need* to be run again.

## Grabnode vs. `Rhino`

While it is possible to run your nextflow script on one of the `rhinos`, we **strongly suggest** using `grabnode` and running on a dedicated machine. 
In addition to the good practice of keeping the `rhinos` clear for other users, we have found that the performance is much faster on a gizmo node. 
This is possibly due to the number of requests that the nextflow process must make in order to keep track of many concurrent tasks, but in the end the reason is less important than the result.

## Getting Results

One of the easiest practices for getting results out of a Nextflow workflow is to include the `publishDir` ([docs](https://www.nextflow.io/docs/latest/process.html#publishdir)) parameter for any process that you will want to access the results from. 
For example, if you include the line:

```
publishDir "${params.output_folder}"
```

In the script above, then the output will be copied to the folder specified with the input flag `--output_folder`.

## FAQ

There are many "gotchas" and common issues with getting started with nextflow, or nuances of using nextflow here at Fred Hutch. 
Here is a non-comprehensive list of known solutions / best practices to help avoid getting caught up by these common issues:

### AWS Batch

**My workflow has started, but have my jobs started running?**

When you start your workflow, it will submit jobs to AWS Batch for execution. 
Sometimes it can be hard to tell if those jobs have even started running, or if they have already been stalled. 
The best way to check is to log into the AWS Console for your lab, select "Batch" from the list of AWS Services, and then click the compute environment or queue to see job status.

**Why are my jobs stuck in "RUNNABLE"?**

When a job is "RUNNABLE" in AWS Batch, this means that it is waiting to be scheduled onto a machine for execution. 
There are a few potential reasons for this:

  - The queue is busy with other jobs.  Submit a ticket if you need additional queues or a vCPU limit increase.
  - Your job is configured with a combination of CPUs and memory which does not fit onto any known machine. 
  This is likely only a problem encountered by workflow *developers*, and you can check [this link](https://aws.amazon.com/ec2/instance-types/) for a list of common instance configurations
  - If you do not believe that either of these are the case, please contact SciComp or CLD for assistance.

**How do I pick which 'queue' to use in AWS Batch?**

<!--FIXME JEFF:  we need to update this but should we just remove instead?-->
A 'queue' is a concept in AWS Batch which specifies what line a job will go into to wait to be scheduled and executed.  In your account, by default you should only have one queue that will use spot instances.  If you require additional queues, different instance types, or cannot use spot instances for some reason then please contact CLD to discuss your needs.

If you do have additional queues, you can specify the queue with `process.queue = 'cpu-spot-30'` in your `nextflow.config`, or with `-process.queue cpu-spot-30` at runtime (in the `nextflow run ...` command).

### Montoring running jobs

**How can I see the debug output of my jobs?**

The output is logged in CloudTrail automatically in most cases.  To view this, go to the AWS Console and view your jobs on the job queue.  Click the job and you will be able to see information about the job, including a link that will open up the appropriate log stream that should enable you to see any output.

**How much debug output should I use?**

There is no hard and fast recommendation since the amount of output you add will vary depending on your needs.  However, please be advised that CloudWatch costs a very small amount of money for parsing the output of your job.  Under normal circumstances, this will fall under Free Tier and be negligible.  However, if you are printing a very large amount of debug info to the console then this can potentially add up.  For example, printing the contents of each line of a CSV file that you're processing that has 100,000 rows or outputting the entire contents of some large file will likely result in increased cost.  Please be sure to disable or at least minimize your debug output prior to running any large jobs.

**Is there a better way to monitor a running workflow?**

While you *can* just watch the output on the command line to see how your workflow is progressing, another great option is to use a service called Nextflow Tower.
If you set up Nextflow Tower *before* starting a workflow, then you will be able to log in to [tower.nf](https://tower.nf) and see how your workflow is progressing. 
Nextflow Tower is a service set up and maintained by the developers of Nextflow.
Keep in mind that this service is not hosted by Fred Hutch, and so you have to trust a third-party system to keep your data safe. 
**It is not advised to user Nextflow Tower with sensitive or private information.**
That said, only the metadata describing a given task is sent to Tower, not the actual data being analyzed.

To get set up, go to [tower.nf](https://tower.nf) and follow their instructions. 
This setup will consist of verifying your email address, and then copying some configuration information into your Nextflow configuration file. 

**Gottcha**: Make sure that you are using Nextflow version 19.10.0 or later.


### Working directory

**What is the working directory? What should I use?**

When a single task is run with Nextflow, all of the commands needed to run the task, as well as the data output by that task, are written to a working directory. 
It is important to remember while you are developing a Nextflow workflow that the working directory is different from the output directory which you 'publish' to.
In fact, when you add the `publishDir` option to a process, it indicates that `nextflow` will ultimately copy files from the working directory to the output directory upon successful completion of the workflow.

A good practice when running on AWS is to treat the working directory like scratch space which can be safely deleted once the workflow has been completed successfully.
However, it is important to note that when running nextflow locally (with `executor 'local'`), links will be created from files in the working directory to the `publishDir`.
This means that if you remove the working directory, you will remove the only copy of your output and it will be gone from `publishDir` as well.
A good practice when running on AWS would be to set a common location in an S3 bucket, and to set the working directory in your configuration file so that it is used across all workflows. See the documentation above for an example.

### Publishing output data

**My workflow ran successfully, why don't I see anything in the output folder?**

tl;dr: Just run it again (and make sure to use the `-resume` flag).

The final step of a nextflow workflow is to copy the working copies of each final output file to the specified output directory. 
For some reason this will sometimes just fail on the copy step. 
But don't worry! You can just re-run the exact same workflow with the `-resume` flag, and the whole workflow will re-run (fetching from the cached output for every step in the workflow) copying over all of the final results to the output directory. 

### Input to / output from processes
**Why can't my process find the input files it needs?**

  - incomplete input download: Sometimes a task will fail to completely download an input file. 
  Try running it again and see if it works.
    - This will only be a consistent error if your process has thousands of inputs.
    - This can also happen if you have an individual file which exceeds the memory limit of your process.
      - The fix in that case is to add more memory to the process.
      - On AWS, this can also result from the temp space filling up, which can be fixed by using [`afterScript "rm *"`](https://www.nextflow.io/docs/latest/process.html?highlight=afterscript#afterscript) directive in these processes
      As noted above, you should only use that `afterScript` approach for workflows which are run on AWS, since it will break things if you’re just running locally.
  - input defined as variable: Sometimes you write a workflow expecting to be passing a file as an input, but if you don't use the `path()` or (older) `file()` on the file path then the file path will get passed in as a string. 
  You can tell this is happening if `${input_file}` does not exist as a file, but you can still `echo ${input_file}` and it prints the file name

### Resource allocation

**How do I make sure that my processes have enough CPU and memory?**

For a bioinformatics workflow to run on AWS Batch, you generally have to define how much CPU and RAM each job needs. 
One convenient way to do this is by adding all of the resource definitions to the `nextflow.config` file associated with the workflow (in the workflow's repository) with either the `withLabel` or `withName` selectors. 

The reason you would take this approach is that it makes it easier for the user to just copy the `nextflow.config` file and modify anything that they need (pointing to that new config file with the `-c` flag at execution time), without having to modify `main.nf` directly. 

With the label-based approach, every process in `main.nf` has a label (e.g. `label 'io_limited'`) at the top of the `process` block. 
Then, in the `nextflow.config` file you have a section like:

```
process {
    withLabel: 'io_limited' {
        cpus = 2
        memory = 8.GB
    }
}
```
The nice thing about this is that you can have many different processes which all have the same set of resources.

If you only have a handful of processes in your workflow, it may be easier to use `withName`, where you don't need the `label` in the workflow, and instead add something to your config like:

```
process {
    withName: 'trimmomatic' {
        cpus = 2
        memory = 8.GB
    }
}
```

Which will directly set the resources for the `trimmomatic` process.

### Iterative Resource Allocation
Jobs within a batch may have different resource requirements. Thus, the user may wish to specify resources (e.g., Memory) based on the typical file size within a batch but worry that a few exceptionally large files may fail due to insufficient memory. 

This scenario can be accommodated with a flexible error handling, using a conditional Nextflow [errorStrategy](https://www.nextflow.io/docs/latest/process.html), where either 'retry' or 'finish' is implemented based on the number of times a given task is attempted up to some maximum number of retries .  That is, it is possible to 'retry' failed jobs with more memory requested on each subsequent attempt. **Make sure to limit the number retries ('maxRetries'), so the job will eventually fail before trying to run on the largest available EC2 instance.**

For example, consider a portion of a Nextflow configuration file shown below. When process1 is initially run, Nextflow requests 2 CPUs and only 4 GB of memory, an allocation the user-determined was sufficient for most of the files in a batch. When an exceptionally large input file causes a job failure due to insufficient allocated memory, the config tells Nextflow to try again. In this case, when the task.attempt is less than or equal to 3 (the specified maximum number of retries), the errorStrategy will 'retry' the task with stepwise larger memory allocations. After one job failure, 8GB (4*2 attempts) will be requested for the second attempt. If that attempt fails, the third attempt with 12GB will be made. Crucially, after three failed attempts, the errorStrategy will be switched from 'retry' to 'finish' (initiating an orderly pipeline shutdown when an error condition is raised, waiting for the completion of other submitted jobs). 

```
process {
    withName: 'process1' {
        cpus = 2
        maxRetries = 3
        errorStrategy = {task.attempt <= 3 ? 'retry' : 'finish'}
        memory = {4.GB * task.attempt}
    }
    withName: 'process2' {
        cpus = 1
        memory = 2.GB
        errorStrategy = 'finish'
    }
}
```

### Container issues

When specifying a Docker image to use for a process, there are a number of things that you have to do for it to successfully run in that container:

- Before investigating issues with running a process using Docker, be sure to carefully read [the Nextflow docs about how to set up running with Docker](https://www.nextflow.io/docs/latest/docker.html#how-it-works)
- Make your container public / make sure you have the permissions to access it: some registries, such as [quay.io](https://quay.io/), default to making repositories private and if you try to run a workflow using an image from such a repository, it will give a cryptic message like: `terminated for an unknown reason -- Likely it has been terminated by the external system`
- Entrypoints: You may get the same error as above "when Batch is unable to execute the process script. A common cause of this problem is that the Docker container image you have specified uses a non standard [entrypoint](https://docs.docker.com/engine/reference/builder/#entrypoint) which does not allow the execution of the Bash launcher script required by Nextflow to run the job." - [Nextflow docs](https://www.nextflow.io/docs/latest/awscloud.html?highlight=entrypoint#troubleshooting)

### Bash scripts in processes

It can be tricky to keep track of which variables in your `script` directive are Nextflow variables and which belong to the bash code (or scripting language you are using) in your `process.script`. 
One way to deal with this in the case of bash is to [use the `shell` directive](https://www.nextflow.io/docs/latest/process.html#shell) instead.

### Random Errors

**Why am I getting an odd error around this `tuple` thing?**

The `tuple` was added to replace `set` in version 19.10.0. If you are getting an error, it's possible that you're running an older version of Nextflow. Try using a newer version by setting `NXF_VER` at runtime, e.g.:

```
NXF_VER=19.10.0 nextflow run -c ~/nextflow.config repo/workflow --help
```


### Advanced workflow patterns

**How do I keep track of matching data in two parallel channels?**

One of the first tricky parts of writing Nextflow workflows is the realization that channels do not preserve the order of the data which passes through them. 
An example is the case where you have two channels which need to execute something independently for multiple samples and then join together the results (e.g. running FASTQC in one channel and aligning to a reference in another). 

There is an easy fix for this, which is to include a unique sample ID with the file object as a `tuple`, and then merge the channels on that key. 
Here's an example:

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

In the example above, `output_ch_1.join(output_ch_2)` will yield tuples with the input file name, the FASTQC output file, and the BAM file for every set of outputs which share the unique common input file name. 
This ensures that everything is nicely synchronized between processes without having to wait around for `fastqc` and `bwa` to process all of the samples before starting to `combine` the ones that are already finished.
