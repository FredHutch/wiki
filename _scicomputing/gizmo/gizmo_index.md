---
title: Overview of the Gizmo Compute Environment
last_modified_at: 2025-05-19
primary_reviewers: atombaby
---

This is the overview page for the gizmo compute environment.  It will contain information and links to gizmo-specific stuff.

#### Gizmo Specifications
{% assign resource = site.data.cluster_nodes[0] %}
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
