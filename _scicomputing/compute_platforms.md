---
title: Supported Technologies and Platforms
primary_reviewers: mbcgough, dirkpetersen, atombaby
---

The Fred Hutch provides researchers on-campus access to high performance computing using on-premise resources for computing needs that rise above those that can be met using your desktop computer.  The various technologies provided are outlined on here along with the basic information required for researchers to identify which resource might be best suited to their work.

Often reasons to move to these high performance computing (HPC) resources include:
- reproducible compute jobs
- version controlled, Linux-only and/or specialized software
- increased compute capability
- rapid access to large data sets in central data storage locations

## Overview of On-Premise Resources

Compute Resource | About |
--- |--- |
{%- for resource in site.data.cluster_nodes %}
{{ resource.cluster_name }}|{{ resource.description }}
{%- endfor %}

If you're new to remote cluster usage, please see [this tutorial](/pathways/path-interactive/) for step-by-step instructions for logging on to `rhino` and `gizmo`.

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

### NoMachine Access

[NoMachine](https://www.nomachine.com/) is a software suite that allows you to run a Linux desktop session remotely.  The session runs on the NoMachine server but is displayed on your desktop or laptop using the NoMachine client.  NoMachine (also abbreviated _NX_) is installed on Center IT supported PC desktops and laptops.

NX has the particular advantage of maintaining your session even when you disconnect or lose connectivity.  All that is required is to restart the client and your session will be as you'd last left it.

The three rhino hosts are available for NX sessions: _rhino01_, _rhino02_, and _rhino03_.  The name _rhino_ is an alias that returns one of those three names and should not be used for NoMachine sessions

## Resource and Node Description information

Below we describe the current basic configurations available for node types, numbers, and memory for a variety of `scicomp` supported computing resources.  These tables are useful when deciding on what type of resources you need to request when using `rhino` and `gizmo` for interactive and non-interactive jobs.  These tables are auto-generated and are a work in progress so that we can provide the most up to date information on the Wiki for your use.  Please file an Issue in our [GitHub repository](https://github.com/FredHutch/wiki/issues) if you notice something amiss or need clarification.

### Resource Information
<!--This table is auto-generated based on the yaml in _data/scicomp_resources.yaml, and is a work in progress.  -->


Name|Type|Authentication|Authorization|Location
---|---|---|---|---
{%- for resource in site.data.scicomp_resources %}
{{ resource.name }}|{{ resource.type }}|{{ resource.access[0].type }}|{{ resource.access[0].auth }}|{{ resource.location }}
{%- endfor %}

### Cluster Node Information
<!--This table is auto-generated based on the yaml in _data/cluster_nodes.yaml-->
The particular number and resources of cluster nodes available to Fred Hutch researchers depend on the resource and are described here. Details include:
- Partition: All nodes of a given generation are in one or more partitions to facilitate resource use efficiency
- Node Gen: Nodes are named after the their cluster + generation + sequential ID (ex: gizmoj23)

{%- for resource in site.data.cluster_nodes %}

#### {{ resource.cluster_name | upcase }}
Location: {{ resource.location }}

|Partition|Node Gen|Node Count|CPU|Cores|Memory|
|---|:---:|:---:|---:|:---:|:---:|
{%- for node in resource.nodes %}
{{ node.partition }}|{{ node.node_name }}|{{ node.node_count }}|{{ node.processor_manufacturer }} {{ node.processor_model }}|{{ node.cores }}|{{ node.memory_gb }}GB
{%- endfor %}

|Partition | Node Gen | GPU Count | GPU | Compute Capability | GPU Memory|
|---|:---:|:---:|---:|:---:|
{%- for node in resource.nodes %}
{{ node.partition }}|{{ node.node_name }}|{{ node.gpu_count }}|{{ node.gpu }}|{{ node.gpu_compute_capability }}|{{ node.gpu_memory }}|
{%- endfor %}
{%- endfor %}

### Resource Detail
Specific details about our cluster(s):
- Network: The underlying network fabric may affect jobs that rely on inter-node messaging
- Local Storage: The amount and type of storage on each node, used as `TMPDIR` during jobs, but also available for other job use

{%- for resource in site.data.cluster_nodes %}

#### {{ resource.cluster_name | upcase }}
Location: {{ resource.location }}

|Node Gen|Network|Local Storage|
|---|---|---|
{%- for node in resource.nodes %}
{{ node.node_name }}|{{ node.network }}|{{ node.local_storage }}
{%- endfor %}

{%- endfor %}
