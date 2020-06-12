---
title: Computing with GPUs
last_modified_at: 2019-06-03
primary_reviewer: atombaby
---

## Requesting GPUs

GPUs are requested via the GRES option:

    sbatch --gres=gpu ...

Request multiple GPUs with:

    sbatch --gres=gpu:2

At this time we have one GPU per node.

### Nodes with GPUs

|Location|Partition|Node Name|GPU|
|---|:---:|:---:|---:|
{%- for resource in site.data.cluster_nodes %}
{%- for node in resource.nodes %}
{%- if node.gpu != 'none' %}
{{resource.location}}|{{ node.partition }}|{{ node.node_name }}|{{ node.gpu }}
{%- endif %}
{%- endfor %}
{%- endfor %}

### Requesting GPUs on Gizmo

The GPUs are currently installed only on nodes in the _largenode_ partition, thus it is necessary to request the minimums required for _largenode_ jobs:

    sbatch -p largenode --mem=21500 -c 6 --gres=gpu ...

### Requesting GPUs on Koshu

The GPU configured nodes on koshu are in the partition "gpu".  Jobs requiring GPUs need to request this partition and the GPUs:

    sbatch -p gpu --gres=gpu ...

## Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable
CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU-
most CUDA tools (e.g. tensorflow) use this to restrict execution to that
device.
