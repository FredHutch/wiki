---
title: Computing with GPUs
last_modified_at: 2023-03-31
primary_reviewer: atombaby
---

## Requesting GPUs

GPUs are requested via the `--gpus` option:

    sbatch --gpus=1 ...

Specific GPU models (see table below) can be requested by indicating _model_ and _count_:

    sbatch --gpus=rtx2080ti:1 ...

### Nodes GPUs

|Location|Partition|Node Name|GPU|
|---|:---:|:---:|---:|
{%- for resource in site.data.cluster_nodes %}
{%- for node in resource.nodes %}
{%- if node.gpu != 'none' %}
{{resource.location}}|{{ node.partition }}|{{ node.node_name }}|{{ node.gpu }}
{%- endif %}
{%- endfor %}
{%- endfor %}

## Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable
CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU-
most CUDA tools (e.g. tensorflow) use this to restrict execution to that
device.
