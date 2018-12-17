---
title: Scientific Computing Supported Resources
last_modified_at: 2018-12-17
---

## Proposal Preparation
A description of computational and storage resources from Scientific Computing for grant writers can be found [here.](/computing/grants_publications/)

<!-- ## Self Service Resources
Jupyterhub, RStudio, db4sci, Galaxy, etc.

## Available Resources
VMs, shiny, rancher, data transfer

## Community Resources (not specifically supported by IT)
Are there things people use that we don't really support?

-->


## Resource Table
This table is auto-generated based on the yaml in _data/scicomp_resources.yaml, and is a work in progress.  

Name|Type|Authentication|Authorization|Location
---|---|---|---|---
{%- for resource in site.data.scicomp_resources %}
{{ resource.name }}|{{ resource.type }}|{{ resource.access[0].type }}|{{ resource.access[0].auth }}|{{ resource.location }}
{%- endfor %}

## Cluster Node Table
This table is auto-generated based on the yaml in _data/cluster_nodes.yaml:

{%- for resource in site.data.cluster_nodes %}

### {{ resource.cluster_name | upcase }}
Location: {{ resource.location }}

|Partition|Node Name|Node Count|CPU|Cores|Memory|
|---|:---:|:---:|---:|:---:|:---:|
{%- for node in resource.nodes %}
{{ node.partition }}|{{ node.node_name }}|{{ node.node_count }}|{{ node.processor_manufacturer }} {{ node.processor_model }}|{{ node.cores }}|{{ node.memory_gb }}GB
{%- endfor %}

#### Additional resources

|Node Name|Network|Local Storage|
|---|---|---|
{%- for node in resource.nodes %}
{{ node.node_name }}|{{ node.network }}|{{ node.local_storage }}
{%- endfor %}

{%- endfor %}
