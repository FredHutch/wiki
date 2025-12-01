---
title: Using the Gizmo Cluster
primary_reviewers: atombaby
---

### Rhino

`Rhino`, or more specifically the `Rhinos`, are three locally managed HPC servers all accessed via the name `rhino`. Together, they function as a data and compute hub for a variety of data storage resources and high performance computing (HPC) such as those in the table above. The specific guidance for the use of each of the approaches to HPC access are slightly different, but will all require the user to learn how to access and interact with `rhino`.

More information on the topic of ssh configurations for access to `rhino` can be found [here](/scicomputing/access_methods/). More information on specific guidance for using `rhino` is in our [Resource Library](/compdemos/howtoRhino/).


### Gizmo Cluster

While we generally don't recommend interactive computing on the HPC clusters- interactive use can limit the amount of work you can do and introduce "fragility" into your computing- there are many scenarios where interactively using cluster nodes is a valid approach.  For example, if you have a single task that is too much for a `rhino`, opening a session on a cluster node is the way to go.

If you need an interactive session with dedicated resources, you can start a job on the cluster using the command `grabnode`.  The `grabnode` command will start an interactive login session on a cluster node.  This command will prompt you for how many cores (probably 1 unless you know your task is multi-threaded), how much memory, and how much time you estimate will be required. This command can be run from any `rhino` host.  

While most users will follow the interactive screen prompts to execute `grabnode`,
the command will also take some common `sbatch` options and flags. 
Contact `scicomp` if you need options beyond those offered by `grabnode` prompts.

For non-interactive use of `gizmo`, see our pages on [Computing Environments and Software](/scicomputing/compute_environments/) and [Job Management](/scicomputing/compute_jobs/) and perhaps [Parallel Computing](/scicomputing/compute_parallel/).  

Access to the Gizmo cluster requires both a HutchNet ID and an association to a PI account on the cluster.  If you get errors like "Invalid account" when using `grabnode` or Slurm commands like `sbatch`, please contact `scicomp`.

