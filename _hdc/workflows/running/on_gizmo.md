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

## Using Singularity

If you would like to use Singularity to run each individual step of a workflow
inside a container (which also supports native execution of Docker containers),
then you will need to specify a `cacheDir` location for those images to be stored.

Due to the large size of Singularity containers, we strongly recommend that
you use the `/fh/scratch/` filesystem for those image files.

A typical `cacheDir` may be `/fh/scratch/delete30/lastname_f/nextflow/cache/`.

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
Please make sure to replace every placeholder value (e.g. `<SINGULARITY_CACHE_DIR>`),
including the `<` and `>` characters.

```
workDir = '<WORK_DIR>'

singularity {
    enabled = true
    autoMounts = true
    cacheDir = '<SINGULARITY_CACHE_DIR>'
    runOptions = '--containall --no-home'
}

process {
    executor = 'slurm'
    queue = 'campus-new'
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
