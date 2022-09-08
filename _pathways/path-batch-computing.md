---
title: Run a Non-Interactive Job on the Cluster
main_author: Michael Gutteridge
primary_reviewers: atombaby, vortexing
---

This pathway will get you to a first non-interactive computing job on the `gizmo` computing cluster using the command-line interface at the Fred Hutch.

## Pre-requisites
A desktop computer, access to the internet, a good text editor.

If you are unfamiliar with any of these terms, hover over them to find more information.
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

### Get a Hutchnet ID
In order to use Fred Hutch batch computing resources you must have valid Fred Hutch credentials.  Sepcicially a [HutchNet ID](/scicomputing/access_credentials/#hutchnet-id).

This HutchNet ID needs to be associated with a [PI account](/scicomputing/access_credentials/#accessing-slurm-clusters) in order to submit jobs. 


### Connect to the Campus Network
Batch computing resources require that your local computer be connected to the campus network.  This authenticaiton process happens differently when you're on vs off campus. 

[When on campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/connecting-to-wifi.html)

[When off campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html)

### Start a Terminal

A terminal provides a text-based interface to computers (the "command line").

Macintosh OSX has a built in terminal application. It can be found in _Applications->Utilities->Terminal_.  Other options are available that are more full featured such as [iterm2](https://iterm2.com/), which is one free option (please consider [donating](https://iterm2.com/donate.html)!)

Windows has a few different terminals built in, but many of these are unsuitable for accessing Linux systems.  Two easy options are the Microsoft Terminal app (available in the App Store) and [PuTTY](/scicomputing/access_methods/#windows).

### Shell Connections to the 'rhino' Login Nodes

Once you have a connection to the Hutch network and a suitable terminal, the next step is to [connect to the login nodes known as `rhino`.](/scicomputing/access_methods/#ssh-connections)

### Home Directory

The "home" directory on Linux is used for storing user-specific data and is the directory you will begin in when you login to `rhino`.

If you get an error like `Home directory not found` when you log in, please email `SciComp` to get that set up.


### Navigating the Compute Environment

The [common storage options](/scicomputing/store_posix) are available in the `rhino`-`gizmo` compute environment. These paths are available in the same location on each of these hosts.

You'll be started (by default) with a bash shell and most of the common [GNU/Linux utilities](https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/index.html)

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
