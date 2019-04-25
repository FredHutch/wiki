---
title: Supported Technologies and Platforms
last_modified_at: 2019-04-01
primary_reviewers: 
---

The Fred Hutch provides researchers on campus access to high performance computing using on-premise resources.  The various technologies provided are outlined on here along with the basic information required for researchers to identify which resource might be best suited to their particular computing needs.  

The Fred Hutch managed systems listed serve needs that rise above
those that can be met using your desktop computer or web-based services. Often reasons to move
to these high performance computing (HPC) resources include:
- reproducible compute jobs
- version controlled and/or specialized software
- increased compute capability
- rapid access to large data sets in central data storage locations

## Overview of On-Premise Resources

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Gizmo | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, AWS-S3, and Beagle-specific _scratch_
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
NoMachine | NX Client, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types

### Gizmo and Beagle Cluster

While we generally don't recommend interactive computing on the HPC clusters-
interactive use can limit the amount of work you can do and introduce
"fragility" into your computing- there are many scenarios where interactively
using cluster nodes is a valid approach.  For example, if you have a single
task that is too much for a rhino, opening a session on a cluster node is the
way to go.

If you need an interactive session with dedicated resources, you can start a
job on the cluster using the command `grabnode`.  The `grabnode` command will
start an interactive login session on a cluster node.  This command will prompt
you for how many cores, how much memory, and how much time is required

This command can be run from any NoMachine or rhino host.

> Note: At this time we aren't running interactive jobs on Beagle nodes.  If
> you have a need for this, please email `scicomp`.

### Rhino
`Gizmo` is actually not a stand alone system; instead, access to the resource is based on the `Rhino` platform supported by Center IT.  `Rhino`, or more specifically the Rhinos, are three locally managed HPC servers all accessed via the name `rhino`. Together, they function as a data and compute hub for a variety of data storage resources and high performance computing (HPC). The specific guidance for the use of each of the approaches to HPC access are slightly different, but will all require the user to learn how to access and interact with `rhino`.  

> Note: Any user interacting with the following systems will be dependent on being proficient with the care and keeping of the Rhinos.

More information on the topic of ssh configurations for access to `rhino` can be found [here.](/compdemos/ssh/)

### The NoMachine Cluster

[NoMachine](https://www.nomachine.com/) is a software suite that allows you to run a Linux desktop session remotely.  The session runs on the NoMachine server but is displayed on your desktop or laptop using the NoMachine client.  NoMachine (also abbreviated _NX_) is installed on CIT supported PC desktops and laptops.

NX has the particular advantage of maintaining your session even when you disconnect or lose connectivity.  All that is required is to restart the client and your session will be as you'd last left it.

There are three systems you can use for NX sessions: _lynx_, _manx_, and _sphinx_.  These are not computational systems but rather these hosts are used solely as launch-points for sessions on `gizmo` or `rhino`. Running computational tools on this system will get you a warning from SciComp.


## Available Resources
VMs, shiny, rancher, data transfer

## Community Resources (not specifically supported by IT)
Are there things people use that we don't really support?

<!-- ## Self Service Resources
Jupyterhub, RStudio, db4sci, Galaxy, etc.

## Gory Details on Node Classes

### Resource Table
This table is auto-generated based on the yaml in _data/scicomp_resources.yaml, and is a work in progress.  

Name|Type|Authentication|Authorization|Location
---|---|---|---|---
{%- for resource in site.data.scicomp_resources %}
{{ resource.name }}|{{ resource.type }}|{{ resource.access[0].type }}|{{ resource.access[0].auth }}|{{ resource.location }}
{%- endfor %}

### Cluster Node Table
This table is auto-generated based on the yaml in _data/cluster_nodes.yaml:

{%- for resource in site.data.cluster_nodes %}

### {{ resource.cluster_name | upcase }}
Location: {{ resource.location }}

|Partition|Node Name|Node Count|CPU|Cores|Memory|
|---|:---:|:---:|---:|:---:|:---:|
{%- for node in resource.nodes %}
{{ node.partition }}|{{ node.node_name }}|{{ node.node_count }}|{{ node.processor_manufacturer }} {{ node.processor_model }}|{{ node.cores }}|{{ node.memory_gb }}GB
{%- endfor %}

### Additional resources

|Node Name|Network|Local Storage|
|---|---|---|
{%- for node in resource.nodes %}
{{ node.node_name }}|{{ node.network }}|{{ node.local_storage }}
{%- endfor %}

{%- endfor %}
