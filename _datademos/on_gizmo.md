---
title: Running Nextflow Workflows on Gizmo
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
`/hpc/temp/` filesystem to minimize unnecessary storage costs.

A typical `workDir` may be `/hpc/temp/delete30/lastname_f/nextflow/work/`.

## Using Apptainer

If you would like to use Apptainer (formerly Singularity) to run each individual step of a workflow
inside a container (which also supports native execution of Docker containers),
then you will need to specify a `cacheDir` location for those images to be stored.

Due to the large size of Apptainer containers, we strongly recommend that
you use the `/hpc/temp/` filesystem for those image files.

A typical `cacheDir` may be `/hpc/temp/delete30/lastname_f/nextflow/cache/`.

### Recommendation: Retry on `apptainer pull` error

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
    runOptions = '--containall -B \$TMPDIR'
}

env {
    TMPDIR="\$TMPDIR"
}

process {
    executor = 'slurm'
    queue = 'campus-new'
    errorStrategy = 'retry'
    maxRetries = 3
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

## Job Local Storage

An essential element of using the cluster effectively is making sure to use the
temporary storage volume associated with each individual task, and not filling up
the `/tmp` directory which is shared across all nodes. 
More background on this topic is available on the [job local storage page](/compdemos/store_job_local).

The config file above accomplishes this task in two steps:

- The `env` block with `TMPDIR="\$TMPDIR"` ensures that the `TMPDIR` variable
in the execution scope is populated with the value that is set on the worker
node (instead of the head node)
- The `-B \$TMPDIR` flag in the Singularity `runOptions` ensures that the
volume is mounted into the container and can be accessed by the task process

> Note: If the code running inside the task writes to `/tmp` instead of using
`$TMPDIR` as recommended, then any large files will cause errors as it fills
up the volume within the container.

tl; dr - Use the config above and make sure that all tasks are using `$TMPDIR`
for their temporary files and _not_ hardcoding `/tmp`.
