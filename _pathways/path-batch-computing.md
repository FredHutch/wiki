---
title: Pathway for Batch Computing
main_author: Michael Gutteridge
primary_reviewers: vortexing
---

This pathway will get you to a first batch job on Gizmo using command-line interfaces

## Pre-requisites

## Concepts and Vocabulary

 - Batch job
 - Shell
 - Scripts
 - Session
 - Workload manager
 - Slurm
 - Hutchnet ID

## Steps

### Getting a HutchNet ID

[Obtaining a HutchNet ID](_scicomputing/access_credentials.md#hutchnet-id)

### Connecting to the Campus Network

[When on campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/connecting-to-wifi.html)

[When off campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html)

### Starting a Terminal

A terminal provides a text-based interface to computers.

Macintosh OSX has a built in terminal application- it can be found in _Applications->Utilities->Terminal_.  Other options are available- [iterm2](https://iterm2.com/) is one free option (please consider [donating](https://iterm2.com/donate.html)!)

Windows has a few different terminals built in, but many of these are unsuitable for accessing Linux systems.  Two easy options are the Microsoft Terminal app (available in the App Store) and [PuTTY](_scicomputing/access_methods.md#windows).

### Shell Connections to Login Nodes

Once you have a connection to the Hutch network and a suitable terminal, the next step is to [connect to the login nodes known as "rhino".](_scicomputing/access_methods.md#ssh-connections)

### Home Directory

The "home" directory on Linux is used for storing user-specific data and as a starting point for logins.

If you get an error like `home directory not found` when you log in, please email SciComp to get that set up.

### Cluster Association

An association to a PI cluster account is required to submit jobs. [See](_scicomputing/access_credentials.md#accessing-slurm-clusters)

### Navigating the Compute Environment

The [common storage options](_scicomputing/store_posix.md) are available in the Rhino-Gizmo compute environment. These paths are available in the same location on each of these hosts.

You'll be started (by default) with a bash shell and most of the common [GNU/Linux utilities](https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/index.html)

### Familiarize Yourself with Slurm

Review the documentation for [basic information about Slurm](_scicomputing/compute_jobs.md#basic-slurm-terminology)

### Create a Script

For the purpose of this pathway we will use the pre-existing script [here](https://github.com/FredHutch/slurm-examples/blob/master/introduction/1-hello-world/01.sh). Copy this into a file on rhino.

### Submit the Script

Use the [sbatch command](_scicomputing/compute_jobs.md#submitting-jobs) to submit the script to gizmo.  Output should appear in short order if everything has gone well

## Where to go from here

### Managing Jobs

[This documentation](_scicomputing/compute_jobs.md#managing-jobs) provides more information on managing jobs that are queued and running on the cluster, including steps to take when jobs don't run.

### Writing More Complicated Scripts

This was a simple script- you'll need more advanced scripts to run workload on the cluster. These resources are great starting points:

 - The [Linux Documentation Project manual on bash scripting](https://tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
 - The [Advanced Guide](https://tldp.org/LDP/abs/html/index.html) for bash scripting

### Larger Compute Needs

We've described a single job- when your work requires many jobs or many steps, more advanced tools are necessary:

 - Slurm [job arrays](link tbd) provide an easy mechanism for submitting thousands of homogenous jobs
 - [Workflow managers](link tbd) are the gold-standard for managing computational workflows, particularly valuable for managing multi-step analyses
