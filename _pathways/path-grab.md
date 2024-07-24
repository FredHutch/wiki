---
title: Getting an Interactive Session on a Gizmo Node
main_author: Michael Gutteridge
primary_reviewers: atombaby, vortexing
---

This pathway will get you an interactive, login session on a _gizmo_ compute node.  This can be useful when developing and prototyping larger compute jobs and when your tasks exceed the capacity of the _rhino_ login nodes.

## Pre-requisites

A desktop computer, access to the internet, a good text editor.

If you are unfamiliar with any of these terms or subjects, hover over them to find more information.

 - [Interactive sessions on a login node](/pathways/path-interactive)
 - {% glossary Node %}
 - {% glossary Shell %}
 - {% glossary Scripts %}
 - {% glossary Session %}
 - {% glossary Workload manager %}
 - {% glossary Slurm %}
 - {% glossary HutchNet ID %}
 - {% glossary rhino %}
 - {% glossary gizmo %}

## Steps

### Start a Session on a Login Node

[Follow these instructions](/pathways/path-interactive) to get login session on a _rhino_ node

### Familiarize Yourself with Slurm

Slurm is the workload manager for the `gizmo` computing cluster.  Review the documentation for basic information about how [SLURM works](/scicomputing/compute_jobs/#basic-slurm-terminology).

> As this is a job, it will be subject to allocation policies that can cause delays in starting this interactive session- refer to ["Why is my Job not Running"](/scicomputing/compute_jobs/#why-isnt-my-job-running) for more information.

### "Grab" a Node

"Grabbing" a node will launch a new login session on a cluster node.  For this we have [the custom command `grabnode`](/compdemos/grabnode).  This will allocate resources on a cluster node and start a session there.

## Where to go from here

### Convert Your Interactive Tasks to a Job

If you find yourself repeatedly running the same or similar commands in a `grabnode` session, it's likely time to look at [moving this to a job](/pathways/path-batch-computing).
