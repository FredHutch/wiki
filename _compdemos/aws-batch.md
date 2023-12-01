---
title: Using AWS Batch
main_author: Jeff Tucker
primary_reviewers: jefftucker, dtenenba
---


SciComp provides direct access to AWS Batch in two ways:

* Via the [AWS Command Line Interface (CLI)](https://docs.aws.amazon.com/cli/latest/reference/batch/index.html).
* Via programmatic interfaces such as Python's [boto3](https://boto3.readthedocs.io/en/latest/reference/services/batch.html#client). 

>Note:  For the great majority of users, using AWS Batch is best done by using a workflow manager such as [Cromwell](/compdemos/Cromwell/) or[Nextflow](/compdemos/nextflow/) both of which are supported at the Hutch and can allow you to leverage cloud computing resources such as AWS Batch without creating a workflow that will ONLY work on AWS Batch.  

## AWS Console
Access to the AWS Management Console (the web/GUI interface), is now available to end users at the Center.  You can use the AWS Batch service within the console to see your jobs, job queues, compute environments, and job configurations.  Additionally, you will be able to see the outputs and any errors using CloudTrail.  Typically, the job itself will have a link to the CloudTrail Logstream.  Please be aware that debug output can sometimes substantially increase the cost of running a job, since all output must also be processed by CloudTrail and CloudWatch.  Outputting some debug statements or a few values from calculations within a job is fine, however outputing an entire BAM file on every task would be extremely bad.  Once you're confident that your job runs correctly, it is strongly recommended to remove all output statements except those which are absolutely necessary such as error handling.

Please report any problems you discover with this dashboard by describing the problem in an Issue in [this GitHub repository](https://github.com/FredHutch/batch-dashboard/issues/new).

### Essential terms

  * Docker image: lightweight operating system / virtual machine [see Docker documentation](https://docs.docker.com/glossary/?term=image)
  * CPU: Central processing unit, basically just a unit of computation. Your laptop probably has 4 CPUs, while large servers have dozens.

## How it works

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


## AWS Batch Walk-Through 

### Get AWS Credentials

You will need to obtain [AWS credentials](/scicomputing/access_credentials/#amazon-web-services-aws) first in order to use AWS Batch. By default, users will have access to run Batch jobs on the default queue in the compute environment, which has been pre-configured to run workflows based on the AWS Genomics Pipeline (e.g. NextFlow, Illumina Dragon, etc).  It is however possible to restrict access to Batch to only certain users or even to deny access to it entirely if the lab has requested their account to be configured in that way.  Note that you will not be able to create compute environments or job queues, thus if you need a custom compute environment, please email `scicomp`.

SciComp will contact you when your access has been granted.

### Create and Deploy a Docker Image
See our detailed information in the Computing Resource Library [here](/compdemos/Docker/) about creating and deploying Docker images, as well as running your own Docker Host.  

### Create a Job Definition

[Job Definitions](https://docs.aws.amazon.com/batch/latest/userguide/job_definitions.html) specify how jobs are to be run. Some of the attributes specified in a job definition include:

* Which Docker image to use with the container in your job
* How many vCPUs and how much memory to use with the container †
* The command the container should run when it is started †
* What (if any) environment variables should be passed to the container when it starts †
* Any data volumes that should be used with the container (the compute
  environments provided by SciComp auto-scaling scratch space available
  at `/tmp` inside the container). 
* What (if any) IAM role your job should use for AWS permissions. This
  is important if your job requires permission to access your PI's
  [S3](https://aws.amazon.com/s3/) bucket.  Typically the default role that is pre-configured in your compute environment will be suitable for this.

† These items can be overridden in individual job submissions.

### Using scratch space

"Scratch space" refers to extra disk space that your job may
need in order to run. 

Ensure that you write all output files to the `/tmp` directory inside your container.

This is an auto-scaling volume that will expand before it can fill up. If you write files to any other directories you may run out of space.


You will also need to make sure that you mount `/docker_scratch` on the host to `/tmp` inside the container. If you are using Nextflow, the correct configuration is shown [here](/compdemos/nextflow/#setup).




### Submit your job

There are currently three ways to submit jobs:

1. via the AWS Command Line Interface (CLI): `aws batch submit-job`.
   Recommended for launching one or two jobs.
1. Using Python's `boto3` library. Recommended for launching
   larger numbers of jobs.
1. Using the AWS Batch Service from the AWS Management Console in your web browser.  This way is useful for retrying a failed job or debugging a test version of your job, but typically the other methods are preferable.

AWS Batch also supports [array jobs](https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html), which are collections of related jobs.
Each job in an array job has the exact same command line and
parameters, but has a different value for the
environment variable `AWS_BATCH_JOB_ARRAY_INDEX`.
So you could, for example, have a script which uses
that environment variable as an index into a list of files,
to determine which file to download and process. Array jobs
can be submitted by using either of the methods listed above.

#### Submitting your job via the AWS CLI

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
   will typically be called "default").
* `jobDefinition` The name and version of the job definition to use.
   This will be a string followed by a colon and version number, for
   example: `myJobDef:7`. You can see all job definitions with
   [`aws batch describe-job-definitions`](https://docs.aws.amazon.com/cli/latest/reference/batch/describe-job-definitions.html),
  optionally passing a `--job-definitions` parameter with the name
  of one (or more) job definitions. This will show you each version
  of the specified definition(s). You can also view job
  definitions in the AWS Batch service within the AWS Management Console in your browser.
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
    "jobQueue": "default",
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

#### Submitting your job via `boto3`

* We strongly encourage the use of Python 3. It has been the current
  version of the language since 2008. Python 2 will eventually no longer
  be supported.
* We recommend using [Virtual Environments](https://docs.python-guide.org/en/latest/dev/virtualenvs/),
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

Paste the following code into a file called `submit_job.py`:

```python
#!/usr/bin/env python3
"Submit a job to AWS Batch."

import boto3

batch = boto3.client('batch')

response = batch.submit_job(jobName='jdoe-test-job', # use your HutchNet ID instead of 'jdoe'
                            jobQueue='default', # sufficient for most jobs
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

### Choose a Job Queue

No matter how you submit your job, you need to choose
a queue to submit to. By default your account will only have a single compute environment with a default queue, however if you need a particular type of compute environment then you can contact SciComp for assistance.  The default vCPU limit in AWS is 128, however this can be increased by submitting a request to AWS support.  SciComp can do this for you, however Admins in your lab also have permission to make such requests.  The default queue uses SPOT instances with instance type "optimal" and a bid of 50 percent.  

#### Understanding your Job queue and compute environment settings:

* **SPOT** refers to a [pricing scheme](https://aws.amazon.com/ec2/spot/) in the AWS cloud. SPOT instances (virtual machines) are cheaper than normal (known as "on-demand") instances. When a spot instance is started, a **Bid Percentage** is chosen. If the spot price rises above the chosen percentage of the on-demand price, the spot instance is terminated. This is infrequent, and if your AWS Batch job is set up to automatically retry failed jobs, you will likely not even notice. Practically speaking, a bid of 50 percent should generally be available around the clock, while a bid of 30 percent may only become available on nights and weekends. However, that availability pattern may vary by instance type, and with regional demand.  Your compute environment is set to a bid of 50 percent by default.
* **Maximum CPUs** Each queue is tied to a compute environment which
  has a maximum number of CPUs defined. No more than this number of CPUs can be in use at any given time. As an example, the total number of CPUs needed for a set of 10 jobs which each request 16 CPUs is the same as the total number of CPUs needed for a set of 160 jobs each requesting 1 CPU.
* **Instance Types** *optimal* means that AWS Batch will choose between the C, M, and R [instance type families](https://aws.amazon.com/ec2/instance-types/).  Often, these will be the previous generation of AWS instance types e.g. m4.large instead of m5.large.  The reason for this is to maximize the ability to allocate Spot instances, as the newer generations of EC2 instance types are not always as abundant as previous generations.

Note that choosing a queue involves a tradeoff between capacity (maximum CPUs) and availability (lower bid percentages may result in spot instances being terminated and jobs retried).

### Monitor job progress

Once your job has been submitted and you have a job ID, you can use it to
retrieve the job status.

#### In the AWS Management Console

Go to the [Batch Service ](https://us-west-2.console.aws.amazon.com/batch/v2/home?region=us-west-2#) in
the dashboard. Select the "Jobs" item in the menu on the right-hand side and then click on your job.
This will show the current status of your job. Click the job ID
to see more details.

#### From the command line

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

### View Job Logs

Note that you can only view job logs once a job has reached the `RUNNING`
state, or has completed (with the `SUCCEEDED` or `FAILED` state).

#### In the web dashboard

Go to the [job section](https://us-west-2.console.aws.amazon.com/batch/v2/home?region=us-west-2#jobs) in the
AWS Batch service from the AWS Management Console and click on the job you wish to view.  The job will have a substantial amount of detail, however the logs will be viewable under the section *Log stream name* that should take you into AWS CloudTrail where you can see the logs for that particular job.

#### On the command line

You can still monitor job logs, but you need to
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

> Note: `aws logs get-log-events` will only retrieve 1MB worth of
log entries at a time (up to 10,000 entries). If your job has created
more than 1MB of output, read the
[documentation](https://docs.aws.amazon.com/cli/latest/reference/logs/get-log-events.html)
of the `aws batch get-log-events` command to learn about retrieving multiple
batches of log output. 
