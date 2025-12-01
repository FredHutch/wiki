---
title: Supported Technologies and Platforms
primary_reviewers: bmcgough, atombaby
---

The Fred Hutch provides researchers on-campus access to high performance computing using on-premise resources for computing needs that rise above those that can be met using your desktop computer.  The various technologies provided are outlined on here along with the basic information required for researchers to identify which resource might be best suited to their work.

Often reasons to move to these high performance computing (HPC) resources include:
- reproducible compute jobs
- version controlled, Linux-only and/or specialized software
- increased compute capability
- rapid access to large data sets in central data storage locations

## Overview of On-Premise Resources

|Compute Resource | About |
|-----------------|-------|
{%- for resource in site.data.cluster_nodes %}
|{{ resource.cluster_name }}|{{ resource.description }}|
{%- endfor %}

If you're new to remote cluster usage, please see [this tutorial](/pathways/path-interactive/) for step-by-step instructions.

{% include_relative gizmo/using.md %}

## Resource and Node Description information

Below we describe the current basic configurations available for node types, numbers, and memory for a variety of `scicomp` supported computing resources.  These tables are useful when deciding on what type of resources you need to request when using HPC resources.  These tables are auto-generated and are a work in progress so that we can provide the most up to date information on the Wiki for your use.  Please file an Issue in our [GitHub repository](https://github.com/FredHutch/wiki/issues) if you notice something amiss or need clarification.

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
