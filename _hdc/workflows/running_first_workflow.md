---
title: Running Your First Workflow
hdc: True
---

If you are working to run a workflow for the first time, you will need to:
1. Decide where you want the workflow to run
2. Set up your Nextflow configuration
3. Pick the workflow you want to run
4. Set up a run script
5. Run the workflow

## Decide where you want the workflow to run

When running a workflow you have the option to select where the processing
will take place. This can either be on your local machine, on the SLURM (gizmo),
or in the AWS cloud.

You may select which of these options based on:
- The size of the workflow - small workflow may run quickly on a local machine;
- The capacity available to your group in SLURM/gizmo and/or AWS or any associated cost;
- The location of the input data (see [Background on Workflows](/hdc/workflows/workflow_background)).

## Set up your Nextflow configuration

We recommend that you set up a small "configuration" file which records which type of
compute resources should be used to execute a workflow.

For example, if you would like to run a workflow on SLURM, then
[follow this guide](/hdc/workflows/running/on_gizmo) to create a file called
`nextflow.slurm.config`. Similarly, to [run a workflow on AWS](/hdc/workflows/running/on_aws)
you may create a file called `nextflow.aws.config`.

The appropriate config file can then be reused to specify compute resources
when running any number of workflows by pointing to it [in the run script](/hdc/workflows/running/run_script).

## Pick the workflow you want to run

Depending on your research goals, you may find a workflow which performs the
needed analysis either [in our workflow catalog](/hdc/workflows/workflow_catalog)
or in the community-developed [nf-core workflow catalog](https://nf-co.re/pipelines).

Depending on the workflow, you may find it useful to use one of the reference
databases which have been made available on the shared filesystem
([more details here](/hdc/hdc_refgenomes/)).

If you do not see any useful options available, please don't hesitate to
[reach out](mailto:sminot@fredhutch.org) so that we can find a solution which
meets your needs.

## Set up a run script

When you have an idea of (a) what workflow you want to run (b) on what computational
resources in order to process (c) which particular dataset (input files, parameters,
and outputs needed for that workflow); then we recommend that you create a folder
where the analysis will be run from (i.e., the working directory for the head node),
and create a "run script" in that folder.

The "run script" will contain the full `nextflow run ...` command, as well as all
of the settings and parameters used to run that particular workflow on your particular
dataset.

Follow [these instructions](/hdc/workflows/running/run_script) for setting up that run script.

## Run the workflow

Now you are ready to actually run your workflow!

A great workflow to run for the first time which will test that your configuration
has been set up correctly is `nextflow run hello`. This is a very simple "Hello World"
workflow which will simply print the word "hello" translated into different languages.
While workflows are usually references with some combination of `<organization>/<repository>`
syntax, the `hello` workflow is just a helpful utility which is bundled into the Nextflow
codebase for help with testing.

While the workflow is being executed, you will need to be able to keep the main process
running which is responsible for coordinating all of the various tasks.
If you are running the workflow from your local computer, just make sure to keep the
computer on and connected to the internet (if running on AWS).
If running a workflow on the SLURM, a good option is to use `sbatch` so that the head node
itself is run as a SLURM job.
Another good approach is to use [tmux](https://github.com/tmux/tmux/wiki)
to keep a session open on [a grabbed node](/compdemos/first_rhino) for running
the head node.

Regardless of where you run the workflow from, you can keep
and eye on its progress from anywhere (even your smartphone!)
if you make sure to set it up with [monitoring in Tower](/hdc/workflows/running/tower).

