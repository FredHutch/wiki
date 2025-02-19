---
title: Nextflow Workflow Run Script
---

Each workflow which you run with Nextflow should ideally be run from its own directory.
The reason we recommend this is that Nextflow uses a small database in the working directory
to keep track of what tasks it has run. This is particularly useful if your workflow
is interrupted and you want to re-run it while picking up from where you left off
[using the resume function](https://www.nextflow.io/blog/2019/demystifying-nextflow-resume.html).

To keep your workflows organized, we recommend creating a folder for each run of a workflow,
and placing in that folder a "run script" which contains the `nextflow run ...` command, along
with all of the flags and parameters you use. This makes it easy to come back to a workflow
and know exactly what you ran. It also allows you to re-run that workflow knowing that the
`-resume` function will work as intended.

Here is an example of a run script, with more details and explanation below:

```
#!/bin/bash

set -euo pipefail

# Nextflow Version
NXF_VER=21.10.6

# Nextflow Configuration File
NXF_CONFIG=/path/to/your/nextflow.config

# Workflow to Run (e.g. GitHub repository)
WORKFLOW_REPO=FredHutch/workflow-repository

# Workflow-Specific Options
INPUT_FOLDER=/path/to/input/folder/for/this/analysis/
OUTPUT_FOLDER=/path/to/output/folder/for/this/analysis/

# Load the Nextflow module (if running on rhino/gizmo)
ml Nextflow

# Load the Apptainer module (if running on rhino/gizmo with Apptainer)
ml Apptainer
# Make sure that the apptainer executables are in the PATH
export PATH=$APPTAINERROOT/bin/:$PATH

# Run the workflow
NXF_VER=$NXF_VER \
nextflow \
    run \
    -c ${NXF_CONFIG} \
    ${WORKFLOW_REPO} \
    --input_folder $INPUT_FOLDER \
    --output_folder $OUTPUT_FOLDER \
    -with-report nextflow.report.html \
    -resume

```

## Header: `set` directive

The line `set -euo pipefail` is used to ensure that any errors that are encountered
while executing the BASH script will cause the entire process to halt. This is particularly
useful if you happen to have a typo (e.g. `INPUT_FOLDER` vs. `INPT_FOLDER`) which would
otherwise result in an empty string being unintentionally passed in as an argument
to run the workflow.


## Nextflow Version

By setting `NXF_VER`, we control which version of Nextflow is used to execute the
workflow. By placing this directive in the run script we can ensure that future
attempts to re-run the same workflow will also use the same version of Nextflow
for an added level of reproducibility.


## Nextflow Configuration File

Use `NXF_CONFIG` to specify the configuration file used to run workflows either
[on SLURM/gizmo](/hdc/workflows/running/on_gizmo) or
[on AWS](/hdc/workflows/running/on_aws).


## Workflow Repository

The `WORKFLOW_REPO` variable indicates the GitHub repository being used to host the workflow.
For additional control over a particular release or branch to execute within that
repository, use the `-r` flag.


## Workflow Specific Options

Each workflow requires a different set of options or parameters.

NOTE: Parameters which are specific to a workflow have two dashes (`--`),
while parameters which modify the behavior of Nextflow itself have a single dash (`-`).

We recommend setting up all workflow parameters in a block of environment
variables as shown in this run script, as it makes it more readable when
modifying the script in the future.


## Load the Nextflow Module

When running on a `rhino` or `gizmo` node, the Nextflow codebase can be
loaded with `ml Nextflow`. If you are running locally this can be omitted,
but you will also need to [install Nextflow](https://www.nextflow.io/docs/latest/getstarted.html)
on that local machine


## Load the Apptainer Module

When running on `gizmo` and using Apptainer (formerly Singularity) to execute within containers,
you need to load Apptainer on the head node with `ml Apptainer`. If either
of those are not the case (not running on `gizmo` or not using Apptainer),
this can be omitted.

NOTE: You should not run any workflows which use Apptainer from any `rhino` node.
Instead use the `grabnode` command to reserve the appropriate head node
([more details](/compdemos/first_rhino/#logging-on-to-gizmo-via-grabnode)).


## Nextflow Run - Formatting

The run script template is set up in such a way that you will not have to
modify the `nextflow run` command itself, instead just modifying the environment
variables which are then populated into the command.

However, when adapting
this template for your own workflow you will necessarily have to format additional
parameters which are specific to your workflow. In other words, `--input_folder` and
`--output_folder` are only given as an example, and you will have to change those lines
(and add more) for your own workflow.

When modifying the run script, the single biggest source of errors has to do with
the backslashes used to escape the line endings. To break this down, everything
in the template script above between `NXF_VER` and `-resume` is actually on a
single line. While the command is written on multiple lines, the backslash (`\`)
character is used to [escape that line ending](https://tldp.org/LDP/abs/html/escapingsection.html)
and have the BASH interpreter treat those all as though they were on a single line.

The short summary is: when you modify the script, make sure to include a backslash
for any new lines that you add, and make doubly sure that there are no characters
(including spaces!) to the right of that backslash.


## Execution Report

The `-with-report` flag creates a simple HTML page which summarizes the execution
of the workflow. If you re-run a workflow, the previous report will be renamed
`"*.html.1"`, `"*.html.2"`, etc. This file is a very helpful summary of the complete
set of parameters, data, and code used to run a workflow.


## Other Useful Flags

### Limit the number of jobs with `-process.maxForks`

The flag `-process.maxForks` accepts an integer which specifies the maximum
number of jobs which will be submitted for execution concurrently _per process_.
This can be very helpful if you want to limit your use of a shared queue.

### Complete Documentation

For a complete list of the options available to invoke Nextflow, please
[read their online documentation](https://www.nextflow.io/docs/latest/cli.html).
