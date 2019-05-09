---
title: Supported Resources and Technologies
last_modified_at: 2019-02-21
---

The Fred Hutch provides researchers on campus access to high performance computing using on-premise resources.  The various technologies provided are outlined on here along with the basic information required for researchers to identify which resource might be best suited to their particular computing needs.

The Fred Hutch managed systems listed serve needs that rise above those that can be met using your desktop computer or web-based services. Often reasons to move
to these high performance computing (HPC) resources include:

  - reproducible compute jobs
  - version controlled and/or specialized software
  - increased compute capability
  - rapid access to large data sets in central data storage locations

## Overview of On-Premise Resources

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Gizmo | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, AWS-S3, and Beagle-specific _scratch_
Koshu | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, Google Cloud Storage, and koshu-specific _scratch_
NoMachine | NX Client, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types

### The Compute Clusters

Scientific computing support three different clusters: the on-campus _gizmo_ cluster and two clusters based in different cloud providers, _beagle_ (in Amazon's Web Services) and _koshu_ (in Google's Compute Platform).

Compute clusters are managed by a _workload manager_, in this case Slurm.  Clusters are primarily intended for _batch computing_, where jobs are submitted to the workload manager which then takes over management of the job.

## Available Resources
VMs, shiny, rancher, data transfer

## Community Resources (not specifically supported by IT)
Are there things people use that we don't really support?

## Proposal Preparation
A description of computational and storage resources from Scientific Computing for grant writers can be found [here.](/computing/grants_publications/)

<!-- ## Self Service Resources
Jupyterhub, RStudio, db4sci, Galaxy, etc.

## Details on Cluster Nodes

### Resources 
This table is a work in progress.  

Name|Type|Authentication|Authorization|Location
---|---|---|---|---
{%- for resource in site.data.scicomp_resources %}
{{ resource.name }}|{{ resource.type }}|{{ resource.access[0].type }}|{{ resource.access[0].auth }}|{{ resource.location }}
{%- endfor %}

### Cluster Node Tables
{%- for resource in site.data.cluster_nodes %}

### {{ resource.cluster_name | upcase }}
Location: {{ resource.location }}

|Partition|Node Name|Node Count|CPU|Cores|Memory|
|---|:---:|:---:|---:|:---:|:---:|
{%- for node in resource.nodes %}
{{ node.partition }}|{{ node.node_name }}|{{ node.node_count }}|{{ node.processor_manufacturer }} {{ node.processor_model }}|{{ node.cores }}|{{ node.memory_gb }}GB
{%- endfor %}

#### Additional resources

|Node Name|GPU|Network|Local Storage|
|---|---|---|
{%- for node in resource.nodes %}
{{ node.node_name }}|{{node.gpu}}|{{ node.network }}|{{ node.local_storage }}
{%- endfor %}

{%- endfor %}
