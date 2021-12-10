---
title: Running Workflows on AWS
hdc: True
---


In order to execute a workflow on AWS, follow these instructions in order to
create a Nextflow config file.
We recommend creating this file in a location that will be easy to reference
for multiple projects, since it will not contain any information that is
specific to any particular workflow or dataset.

In case you end up using multiple configuration files to coordinate execution
on other systems (e.g. SLURM), we recommend naming this configuration file
something like `nextflow.aws.config`.


## Setting up AWS Credentials

In order to run jobs on AWS Batch and access data in AWS S3, Nextflow can
directly use the credentials set up for you by the Cloud and Data team.

You should have received an encrypted email containing your 
AWS credentials (if not contact `helpdesk`).
Those credentials will be used by Nextflow when executing a workflow.


### Expert Level: Multiple AWS Profiles

If you have multiple profiles in your AWS configuration, you can set
the environment variable `AWS_PROFILE` to indicate which should be
used for a particular workflow.


## Work Directory

You need to select a work directory (or `workDir`), which will contain the temporary
files produced during the course of workflow execution. This will not contain
any of the final output files, and so it should be located in a path which is
easy to clean up and delete on an as-needed basis. It is also possible to set up
folders in AWS S3 which are automatically deleted after a set period of time
(similar to the `delete*` folders in `/fh/scratch/`), which may be appropriate
for your group.

A typical `workDir` may be `s3://fh-pi-lastname-f-eco/nextflow/work/`.


## Monitoring Workflow Progress with Tower

If you have set up an account in Nextflow Tower for monitoring workflow progress,
you can specify that access token directly in the configuration file below.
By placing that information in your configuration file, there is no need to
additionally specify that information for each individual run.

If you do not have a Tower account set up, you can easily omit the entire
`tower {}` section (all four lines including both brackets).

If you are interested in learning more about using Tower to monitor workflow progress,
[read our description](/hdc/workflows/running/tower).


## Nextflow Configuration - AWS

Below is a template configuration file which can be used as your `nextflow.aws.config`.
Please make sure to replace every placeholder value (e.g. `<WORK_DIR>`),
including the `<` and `>` characters.

```
docker.temp = '/var/lib/docker'

aws {
    region = 'us-west-2'
    batch {
        maxTransferAttempts = 3
        cliPath = '/home/ec2-user/miniconda/bin/aws'
        volumes = ['/var/lib/docker:/tmp:rw']
        maxParallelTransfers = 3
    }
    client {
        maxConnections = 4
    }
}

workDir = "<WORK_DIR>"

tower {
  accessToken = '<TOWER_ACCESS_TOKEN>'
  enabled = true
}
```

If you have any problems using this configuration, please don't hesitate to
[get in touch](mailto:sminot@fredhutch.org).

