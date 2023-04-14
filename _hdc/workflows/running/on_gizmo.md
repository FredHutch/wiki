---
title: Running Workflows on Gizmo
hdc: True
---

In order to execute a workflow using the `gizmo` SLURM cluster, follow these
instructions in order to create a Nextflow config file. We recommend creating
this file in a location that will be easy to reference for multiple projects,
since it will not contain any information that is specific to any particular
workflow or dataset.

In case you end up using multiple configuration files to coordinate execution
on other systems (e.g. AWS), we recommend naming this configuration file
something like `nextflow.gizmo.config`.

## Work Directory

You need to select a work directory (or `workDir`), which will contain the temporary
files produced during the course of workflow execution. This will not contain
any of the final output files, and so it should ideally be located on the
`/fh/scratch/` filesystem to minimize unnecessary storage costs.

A typical `workDir` may be `/fh/scratch/delete30/lastname_f/nextflow/work/`.

## Using Apptainer

If you would like to use Apptainer (formerly Singularity) to run each individual step of a workflow
inside a container (which also supports native execution of Docker containers),
then you will need to specify a `cacheDir` location for those images to be stored.

Due to the large size of Apptainer containers, we strongly recommend that
you use the `/fh/scratch/` filesystem for those image files.

A typical `cacheDir` may be `/fh/scratch/delete30/lastname_f/nextflow/cache/`.

NOTE: The single most common point of failure when running a new workflow
on gizmo with Apptainer is at the point of downloading the images for the
first time. The process by which Apptainer creates a local copy of a Docker
image to be used in a workflow is somewhat prone to random internet connection
failures. If this happens, you will see an error related to the `apptainer pull`
command. Fortunately, it is typically rather straightforward to just restart
the workflow, which will prompt Nextflow to just retry the download. In short,
if you see a `apptainer pull` error when running a workflow on gizmo with
Apptainer for the first time, just give it another try and see if it works
on the second attempt.

## Monitoring Workflow Progress with Tower

If you have set up an account in Nextflow Tower for monitoring workflow progress,
you can specify that access token directly in the configuration file below.
By placing that information in your configuration file, there is no need to
additionally specify that information for each individual run.

If you do not have a Tower account set up, you can easily omit the entire
`tower {}` section (all four lines including both brackets).

If you are interested in learning more about using Tower to monitor workflow progress,
[read our description](/hdc/workflows/running/tower).

## Nextflow Configuration - Gizmo

Below is a template configuration file which can be used as your `nextflow.gizmo.config`.
Please make sure to replace every placeholder value (e.g. `<APPTAINER_CACHEDIR>`),
including the `<` and `>` characters.

```
workDir = '<WORK_DIR>'

apptainer {
    enabled = true
    autoMounts = true
    cacheDir = '<APPTAINER_CACHEDIR>'
    runOptions = '--containall --no-home'
}

process {
    executor = 'slurm'
    queue = 'campus-new'
    errorStrategy = 'retry'
    maxRetries = 3
}

tower {
  accessToken = '<TOWER_ACCESS_TOKEN>'
  enabled = true
}
```

If you have any problems using this configuration, please don't hesitate to
[get in touch](mailto:sminot@fredhutch.org).

## Running the workflow

To run a workflow with this configuration, follow the guidance for formatting
the appropriate [run script](/hdc/workflows/running/run_script).

## Note: ERROR 151

When running workflows on the gizmo SLURM cluster with Apptainer, multiple users
have observed that sometimes jobs will fail for no obvious reason with an error
code of 151. This is more likely to happen for workflows with very large numbers
of jobs.

You can see this in the workflow execution report as:

```
Command exit status:
    151
```

After investigation, it seems that the root cause of this error is not actually
anything to do with the job or the content of the workflow, and if you were to
re-run the exact same workflow then the job would most likely succeed.

Instead of having to repeatedly re-start a workflow, you can set up Nextflow
to automatically retry any failed jobs with the directives `errorStrategy = 'retry'`
and `maxRetries = 3` in the `process` block of `nextflow.config`.

It is also worth noting that this automatic re-try configuration is also helpful
when running workflows in the AWS Batch job scheduler, due to a low rate of sporadic
job failures which can be caused by ECS worker recycling in that environment.
