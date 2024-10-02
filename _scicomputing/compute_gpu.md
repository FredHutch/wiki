---
title: Computing with GPUs
last_modified_at: 2023-03-31
primary_reviewer: atombaby
---

There are currently two capabilities available for GPUs in the gizmo.  The _J_ and _K_ class nodes have consumer-grade RTX cards.  We have recently (fall 2024) added more capable _harmony_ nodes with NVIDIA L40s cards.  These are significantly more capable systems.

## Requesting GPUs

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

### Requesting GPUs on J and K class nodes

GPUs are requested via the `--gpus` option:

    sbatch --gpus=1 ...

Specific GPU models (see table below) can be requested by indicating _model_ and _count_:

    sbatch --gpus=rtx2080ti:1 ...

### Requesting GPUs on Harmony Nodes

Access to Harmony nodes is more complex as these systems have a newer version of operating system.  These nodes also reside in a separate partition:

```
sbatch --partition=harmony --gpus=1 ...
```

Jobs can be submitted from any gizmo node.

These nodes have a different set of environment modules- when submitting jobs make sure that your current environment does not have modules loaded (i.e. `module purge`) and that you are loading the new modules in your script.
{: .notice--info}

## Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable
CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU-
most CUDA tools (e.g. tensorflow) use this to restrict execution to that
device.
