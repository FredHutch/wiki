---
title: Cloud Computing at Fred Hutch
last_modified_at: 2019-04-26
main_author: Sam Minot
primary_reviewers: dtenenba
---

The Hutch is just getting started with cloud computing.  Options like the `beagle` and `koshu` clusters, while built _in_ the cloud, are very much a simple extension of existing infrastructure into cloud providers but does not fully or particularly efficiently utilize the real capabilities and advantages provided by cloud services.

If you are at all interested or curious about cloud solutions and would like to talk over options, Scientific Computing hosts a cloud-specific office hours every week.  Dates and details for SciComp office hours can be found in
[CenterNet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html).

## AWS Batch Overview
The Amazon Web Service (AWS) is a "cloud" computing provider which sells access to computational resources on a minute-by-minute basis. The "cloud" is actually just a simple idea that you can buy *access* to computers, instead of buying the computers themselves. Anytime you have a bunch of computers sitting in a warehouse running code for a bunch of different users around the world, that's the "cloud."


Among the different products offered by AWS, the three most relevant to bioinformatics are:
- [Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/), or **EC2**: a service that provides access to cloud-based computers of various sizes that allow temporary use by researchers to run computing jobs that require larger processors (CPU's) or more memory than is typically available on a land-based computer.  The computing resources available for a task depend on the choices made about the CPU's or memory allocation in the specific EC2 instance (a virtual computing environment).  
- [Amazon Simple Storage Service](https://aws.amazon.com/s3/), or **S3**:
a service that provides cloud-based data storage in the form of "buckets", or a pool of data that can be accessed anywhere, anytime via the web by users with credentials allowing the access to that specific bucket. The size and particular security and credentials associated with individual S3 buckets are particularly well suited to scaling and flexibility with respect to access.
- [AWS Batch](https://aws.amazon.com/batch/): a service which wraps around AWS EC2 resources such that researchers can more easily do computing processes with EC2 instances on data stored in S3.  


### Essential terms

  * Docker image: lightweight operating system / virtual machine [see Docker documentation](https://docs.docker.com/glossary/?term=image)
  * CPU: Central processing unit, basically just a unit of computation. Your laptop probably has 4 CPUs, while large servers have dozens.

### How it works

The basic idea behind AWS Batch is that it allows you to run a job,
which consists of (1) a command, inside of a (2) Docker image on a machine,
with a (3) specified amount of compute resources. For example, a
trivial job that you could run would be:

  1. A command to print some text (`echo Hello World`), on
  2. A Docker image that's able to run the command (`ubuntu:16.04`), with
  3. A specified number of CPUs (e.g. 1) and memory (e.g. 1Gb)

Based on those parameters, Batch will **automatically**:

  1. Find a machine with the required number of CPUs and memory
  2. Download the Docker image
  3. Run the command within the Docker image
  4. Shut down the Docker container
  5. Shut down the machine if it is no longer needed

Batch will often combine multiple jobs onto a single machine, if that is
the most cost effective approach, with all jobs effectively isolated from
each other within their own Docker image.
The big idea here is that you can save money by only paying for compute
resources at the exact time you need it, without worrying about how to pick
the most cost effective combination of EC2 instances.

### Analyzing and storing data

Coming from Fred Hutch, one of the biggest things to transition is how you
access and store data. While we are very used to the shared filesystem on
`gizmo`, you have none of that available on Batch. Instead, you must download
your data from S3 before analyzing it, and then upload the results back to
S3 when you are done. All data within the Docker image when the command is
complete will be deleted -- we refer to this type of storage as "ephemeral."

It's very easy to download and upload from S3, but it just means that you
have to get used to keeping your data there in order to use AWS Batch
effectively. As a benefit, it's much cheaper to store data there compared
to `/fh/fast`, and just as stable.


### Using Docker images

In order to run your code, you must have it packaged up in a Docker image.
While this may be slightly difficult at first, it has the added benefit
that your analysis is highly reproducible. You never have to worry that
some dependency may have changed, and which would change the results. It
is also very easy to publish your results and cite the Docker image as the
definitive record of all of the dependencies and software needed to run your
analysis and generate the published results.

### When to Use AWS batch
AWS _Batch_ is an AWS service that uses Docker containers to build a batch
computing system.  Batch is made up of a queueing system where jobs are defined
and queued, and a computational resource made up of Docker containers to
process those jobs.  Resources are provisioned when there are jobs to be
processed and destroyed when the work is complete.  This results in a very
efficient and cost-effective solution for some work.

_Batch_ is useful if you have a fairly standard processing workflow or at least
a step which is fairly consistent.  The classic example for _Batch_ is image
processing: converting a raw image to some other format.  _Batch_ is capable of
much more complicated analyses and pipelines.

As _Batch_ is very much a cloud service, some familiar resources aren't
available when using this.  Our ubiquitous file systems (home directories,
fast-file, scratch) are not available- data used in _Batch_ is typically stored
in S3 or some other web-available source.  There have been some recent changes which
expand options for data storage which may make some workloads more accessible
to _Batch_.



## How do I use AWS Batch?

SciComp provides access to AWS Batch in two ways:

* Via the [AWS Command Line Interface (CLI)](https://docs.aws.amazon.com/cli/latest/reference/batch/index.html).
* Via programmatic interfaces such as Python's [boto3](https://boto3.readthedocs.io/en/latest/reference/services/batch.html#client). The
  earlier version of this library (`boto`) is deprecated and should not be used.

Access to the AWS Management Console (the web/GUI interface), is not available to end users at the Center. However, there is a customized, read-only [dashboard](https://batch-dashboard.fhcrc.org/) available which displays information about compute environments, queues, job definitions, and jobs.

Please report any problems you discover with this dashboard by describing the problem in an Issue in [this GitHub repository](https://github.com/FredHutch/batch-dashboard/issues/new).

## Get AWS Credentials

You will need AWS credentials in order to
use AWS Batch. You can get the credentials
[here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Getting%20AWS%20Credentials.aspx).

Initially, these credentials only allow you
to access your PI's S3 bucket. To use the
credentials with AWS Batch, you must request
access to Batch.

Request access by emailing `scicomp` with the subject
line **Request Access to AWS Batch**.  In your email, **include** the name of your PI.

SciComp will contact you when your access has been granted.

Note that you will not be able to create
compute environments or job queues. If you need a custom compute environment, please contact SciComp.

## Create and Deploy a Docker Image
See our detailed information in the Computing Resource Library [here](/compdemos/Docker/) about creating and deploying Docker images, as well as running your own Docker Host.  

## Create a Job Definition

[Job Definitions](https://docs.aws.amazon.com/batch/latest/userguide/job_definitions.html) specify how jobs are to be run. Some of the attributes specified in a job definition include:

* Which Docker image to use with the container in your job
* How many vCPUs and how much memory to use with the container †
* The command the container should run when it is started †
* What (if any) environment variables should be passed to the container when it starts †
* Any data volumes that should be used with the container (the compute
  environments provided by SciComp include 1TB of scratch space available
  at `/scratch`). (**Note**: the process of providing scratch space
  is going to change soon, check back for updated information).
* What (if any) IAM role your job should use for AWS permissions. This
  is important if your job requires permission to access your PI's
  [S3](https://aws.amazon.com/s3/) bucket.

† These items can be overridden in individual job submissions.



## Using secrets in jobs
More to come.
## Using scratch space

"Scratch space" refers to extra disk space that your job may
need in order to run. By default, not much disk space is
available (but you have infinite space for input and output
files in S3.

The provisioning of scratch space in AWS Batch turns out to
be a very complicated topic. There is no officially supported
way to get scratch space (though Amazon hopes to provide one
in the future), and there are a number of unsupported ways,
each with its own pros and cons.

If you need scratch space, email `scicomp` and we can discuss which approach will best meet your needs.  **But first**, determine if you **really** need scratch space.
Many simple jobs, where a single command is run on an input file
to produce an output file, can be *streamed*, meaning S3 can
serve as both the standard input and output of the command.
Here's an example that streams a file from S3 to the
command `mycmd`, which in turn streams it back to S3:

```
aws s3 cp s3://mybucket/myinputfile - | mycmd | aws s3 cp --sse AES256 - s3://mybucket/outputfile
```
In the first `aws` command, the `-` means "copy the file
to standard output", and in the second, it means
"copy standard input to S3". `mycmd` knows how to operate
upon its standard input. By using streams in this way, we don't require any extra disk
space. Not all commands can work with streaming, specifically
those which open files in random-access mode, allowing seeking
to random parts of the file.

If a program does not open files in random-access mode, but
does not explicitly accept input from `STDIN`, or writes more than one output file, it can still work with streaming input/output via the use of
[named pipes](https://github.com/FredHutch/s3uploader).More and more bioinformatics programs can read and write directly from/to S3 buckets, so this should reduce the need for scratch space.




## Submit your job

There are currently two ways to submit jobs:

1. via the AWS Command Line Interface (CLI): `aws batch submit-job`.
   Recommended for launching one or two jobs.
1. Using Python's `boto3` library. Recommended for launching
   larger numbers of jobs.


AWS Batch also supports [array jobs](https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html), which are collections of related jobs.
Each job in an array job has the exact same command line and
parameters, but has a different value for the
environment variable `AWS_BATCH_JOB_ARRAY_INDEX`.
So you could, for example, have a script which uses
that environment variable as an index into a list of files,
to determine which file to download and process. Array jobs
can be submitted by using either of the methods listed above.

We are looking into additional tools to orchestrate workflows and pipelines.

### Which queue to use?

No matter how you submit your job, you need to choose
a queue to submit to. At the present time, there are two:

* **mixed** - This queue uses a compute environment
  (also called **mixed**) which uses many
  [instance types](https://aws.amazon.com/ec2/instance-types/)
  from the `C` and `M` families. Each of the instance types
  used is one that the Center has high
  [limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
  for in our account.
* **optimal** - This queue uses a compute environment
  (also called **optimal**) which uses the instance type
  `optimal`, meaning Batch will choose from among the
  `C`, `M`, and `R` instance types. While the Center's
  account has high limits for most `C` and `M` types, its
  limits for the `R` types are lower. Batch has no awareness
  of per-account instance limits, so it may try to place
  jobs on `R` instances which could result in longer
  time-to-result.




### Submitting your job via the AWS CLI

The easiest way to submit a job is to generate a JSON skeleton
which can (after editing) be passed to  [`aws batch submit-job`](https://docs.aws.amazon.com/cli/latest/reference/batch/submit-job.html).
Generate it with this command:

```
aws batch submit-job --generate-cli-skeleton > job.json
```

Now edit `job.json`, being sure to fill in the following fields:

* `jobName` - a unique name for your job, which should include
  your HutchNet ID. . The first character must be alphanumeric, and up to 128 letters (uppercase and lowercase), numbers, hyphens, and underscores are allowed.
* `jobQueue` - the name of the job queue to submit to (which
   has the same name as the compute environment that will be used).
   In most cases, you can use the `mixed` queue.
* `jobDefinition` The name and version of the job definition to use.
   This will be a string followed by a colon and version number, for
   example: `myJobDef:7`. You can see all job definitions with
   [`aws batch describe-job-definitions`](https://docs.aws.amazon.com/cli/latest/reference/batch/describe-job-definitions.html),
  optionally passing a `--job-definitions` parameter with the name
  of one (or more) job definitions. This will show you each version
  of the specified definition(s). You can also view job
  definitions in the [dashboard](https://batch-dashboard.fhcrc.org).
* If you are using [fetch-and-run](https://aws.amazon.com/blogs/compute/creating-a-simple-fetch-and-run-aws-batch-job/), do NOT edit
  the `command` field. If you are not using `fetch-and-run` you may
  want to edit this field to override the default command.
* Set the `environment` field to pass environment variables to your jobs.
  This is particularly important when using `fetch-and-run` jobs; these
  require that several environment variables be set. Environment variables
  take the form of a list of key-value pairs with the values `name` and
  `value`, see the following example.

```json
"environment": [
  {
    "name": "FAVORITE_COLOR",
    "value": "blue"
  },
  {
    "name": "FAVORITE_MONTH",
    "value": "December"
  }
]
```  

Now, **delete** the following sections of the file, as we want to
use the default values for them:

* `dependsOn` - this job does not depend on any other jobs.
* `parameters` - we will not be passing parameters to this job.
* `vcpus` in the `containerOverrides` section.
* `memory` in the `containerOverrides` section.
* `retryStrategy` section.

With all these changes made, your `job.json` file will look something
like this:

```json
{
    "jobName": "jdoe-test-job",
    "jobQueue": "mixed",
    "jobDefinition": "myJobDef:7",
    "containerOverrides": {
        "command": [
            "echo",
            "hello world"
        ],
        "environment": [
            {
                "name": "FAVORITE_COLOR",
                "value": "blue"
            },
            {
                "name": "FAVORITE_MONTH",
                "value": "December"
            }
        ]
    }
}
```


Once your `job.json` file has been properly edited, you can
submit your job as follows:

```
aws batch submit-job --cli-input-json file://job.json
```

This will return some JSON that includes the job ID. Be sure and save
that as you will need it to track the progress of your job.

### Submitting your job via `boto3`

* We strongly encourage the use of Python 3. It has been the current
  version of the language since 2008. Python 2 will eventually no longer
  be supported.
* We recommend using [Virtual Environments](http://docs.python-guide.org/en/latest/dev/virtualenvs/),
  particularly [pipenv](https://docs.pipenv.org/),
  to keep the dependencies of your various projects isolated from each
  other.

Assuming `pipenv`  and `python3` are installed, create a virtual environment as follows:

```
pipenv --python $(which python3) install boto3
```

Activate the virtual environment with this command:

```
pipenv shell
```

You can now install more Python packages using `pipenv install`.
See the [pipenv documentation](https://docs.pipenv.org/) for more
information.

#### Submitting your job

Paste the following code into a file called `submit_job.py`:

```python
#!/usr/bin/env python3
"Submit a job to AWS Batch."

import boto3

batch = boto3.client('batch')

response = batch.submit_job(jobName='jdoe-test-job', # use your HutchNet ID instead of 'jdoe'
                            jobQueue='mixed', # sufficient for most jobs
                            jobDefinition='myJobDef:7', # use a real job definition
                            containerOverrides={
                                "command": ['echo', 'hello', 'world'], # optionally override command
                                "environment": [ # optionally set environment variables
                                    {"name": "FAVORITE_COLOR", "value": "blue"},
                                    {"name": "FAVORITE_MONTH", "value": "December"}
                                ]
                            })

print("Job ID is {}.".format(response['jobId']))

```

Run it with:

```
python3 submit_job.py
```

If you had dozens of jobs to submit, you could do it with a `for`
loop in python (but consider using
[array jobs](https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html)).


## Monitor job progress

Once your job has been submitted and you have a job ID, you can use it to
retrieve the job status.

### In the web dashboard

Go to the [jobs table](https://batch-dashboard.fhcrc.org/#jobs_header) in
the dashboard. Paste your job ID or job name into the **Search** box.
This will show the current status of your job. Click the job ID
to see more details.

### From the command line

The following command will give comprehensive information about your job,
given a job ID:

```
aws batch describe-jobs --jobs 2c0c87f2-ee7e-4845-9fcb-d747d5559370
```
If you are just interested in the status of the job, you can pipe
that command through `jq` (which you may have to
[install](https://stedolan.github.io/jq/download/) first) as follows:


```
aws batch describe-jobs --jobs  2c0c87f2-ee7e-4845-9fcb-d747d5559370 \
| jq -r '.jobs[0].status'
```

This will give you the status (one of `SUBMITTED, PENDING, RUNNABLE,
  STARTING, RUNNING, FAILED, SUCCEEDED`).

## View Job Logs

Note that you can only view job logs once a job has reached the `RUNNING`
state, or has completed (with the `SUCCEEDED` or `FAILED` state).

### In the web dashboard

Go to the [job table](https://batch-dashboard.fhcrc.org/#jobs_header) in the
web dashboard. Paste your job's ID into the **Search** box. Click on
the job ID. Under **Attempts**, click on the **View logs** link.

### On the command line

#### On Rhino or Gizmo

On the `rhino` machines or the `gizmo` cluster, there's a quick command
to get the job output. Be sure and use your actual job ID instead of
the example one below:

```
get_batch_job_log 2c0c87f2-ee7e-4845-9fcb-d747d5559370
```

You can also pass a log stream ID (see below) instead of a job ID.


#### On other systems

If you are on another system without the `get_batch_job_log` script
(such as your laptop), you can still monitor job logs, but you need to
get the log stream ID first.

To get the log stream for a job, run this command:


```
aws batch describe-jobs --jobs 2c0c87f2-ee7e-4845-9fcb-d747d5559370
```

(Note that you can add additional job IDs (separated by a space) to
get the status of multiple jobs.)

Once a job has reached
the `RUNNING` state, there will be a `logStreamName` field that
you can use to view the job's output. To extract only the `logStreamName`,
pipe the command through [jq](https://stedolan.github.io/jq/download/):

```
aws batch describe-jobs --jobs 2c0c87f2-ee7e-4845-9fcb-d747d5559370 \
jq -r '.jobs[0].container.logStreamName'
```

Once you have the log stream name, you can view the logs:

```
aws logs get-log-events --log-group-name /aws/batch/job \
--log-stream-name jobdef-name/default/522d32fc-5280-406c-ac38-f6413e716c86
```

This outputs other information (in JSON format) along with your log
messages and can be difficult to read. To read it like an ordinary
log file, pipe the command through `jq`:

```
aws logs get-log-events --log-group-name /aws/batch/job \
 --log-stream-name jobdef-name/default/522d32fc-5280-406c-ac38-f6413e716c86 \
| jq -r '.events[]| .message'
```

**NOTE**: `aws logs get-log-events` will only retrieve 1MB worth of
log entries at a time (up to 10,000 entries). If your job has created
more than 1MB of output, read the
[documentation](https://docs.aws.amazon.com/cli/latest/reference/logs/get-log-events.html)
of the `aws batch get-log-events` command to learn about retrieving multiple
batches of log output. (The [get_batch_job_log](#on-rhino-or-gizmo) script on rhino/gizmo automatically
handles multiple batches of job output, using the
[equivalent command](https://boto3.readthedocs.io/en/latest/reference/services/logs.html#CloudWatchLogs.Client.get_log_events)
in `boto3`.