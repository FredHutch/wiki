---
title: Run a Non-Interactive Job on the Cluster
main_author: Michael Gutteridge
primary_reviewers: atombaby, vortexing
---

This pathway will get you to a first non-interactive computing job on the `gizmo` computing cluster using the command-line interface at the Fred Hutch.

## Pre-requisites

A desktop computer, access to the internet, a good text editor.

If you are unfamiliar with any of these terms or subjects, hover over them to find more information.

 - [Interactive sessions on a login node](/pathways/path-interactive)
 - {% glossary Node %}
 - {% glossary Shell %}
 - {% glossary Scripts %}
 - {% glossary Session %}
 - {% glossary Workload manager %}
 - {% glossary SLURM %}
 - {% glossary HutchNet ID %}
 - {% glossary Workflow manager %}
 - {% glossary rhino %}
 - {% glossary gizmo %}

## Steps

### Familiarize Yourself with SLURM
SLURM is the workload manager for our `gizmo` computing cluster.  Review the documentation for basic information about how [SLURM works](/scicomputing/compute_jobs/#basic-slurm-terminology).  Once you have logged into the login nodes (`rhino`), you will be sending non-interactive instructions to the compute nodes (`gizmo`) via these instructions.

### Create a Script

For the purpose of this pathway we will use a pre-existing script [in this template GitHub repository](https://github.com/FredHutch/slurm-examples/blob/master/introduction/1-hello-world/01.sh). Copy this file to a location you can access from `rhino` by using:
```
wget https://github.com/FredHutch/slurm-examples/blob/master/introduction/1-hello-world/01.sh .
```

### Submit the Script

Use the [sbatch command](/scicomputing/compute_jobs/#submitting-jobs) to submit the script to `gizmo`.  Output should appear in the form of a log file in the current driectory with the jobID in the filename.

## Where to go from here

### Managing Jobs

[This documentation](/scicomputing/compute_jobs/#managing-jobs) provides more information on managing jobs that are queued and running on the cluster, including steps to take when jobs don't run.

### Writing More Complicated Scripts

This was a simple script - you'll need more advanced scripts to run workload on the cluster. These resources are great starting points:

 - The [Linux Documentation Project manual on bash scripting](https://tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
 - The [Advanced Guide](https://tldp.org/LDP/abs/html/index.html) for bash scripting

### Larger Compute Needs

We've described a single job - when your work requires many jobs or many steps, more advanced tools are necessary, and you begin to delve into [parallel computing](/scicomputing/compute_parallel/).  Two commonly used approaches at the Fred Hutch include:

 - SLURM job arrays provide an easy mechanism for submitting thousands of homogenous jobs
 - [Workflow managers](/scicomputing/compute_parallel/#workflow-managers) are the gold-standard for managing computational workflows, particularly valuable for managing multi-step analyses.  [Cromwell](/compdemos/Cromwell/) and [Nextflow](/compdemos/nextflow/) are the two preferred workflow manager tools at the Hutch.
