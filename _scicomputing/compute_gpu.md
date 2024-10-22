---
title: Computing with GPUs
last_modified_at: 2023-03-31
primary_reviewer: atombaby
---

There are currently two capabilities available for GPUs in the gizmo.  The _J_ and _K_ class nodes have consumer-grade RTX cards.  We have recently (fall 2024) added more capable _harmony_ nodes with NVIDIA L40s cards.  These are significantly more capable systems.

### GPU Nodes

|Location|Partition|Node Name|GPU|
|---|:---:|:---:|---:|
{%- for resource in site.data.cluster_nodes %}
{%- for node in resource.nodes %}
{%- if node.gpu != 'none' %}
{{resource.location}}|{{ node.partition }}|{{ node.node_name }}|{{ node.gpu }}
{%- endif %}
{%- endfor %}
{%- endfor %}

## Accessing GPUs

GPUs are available in multiple partitions- the newest GPUs are in the _chorus_ partition.  Refer to [this page](/compdemos/gizmo_partition_index/) for limits and other details about the partitions.

### In _campus_, _short_, and _restart-new_ partitions

GPUs are requested via the `--gpus` option:

```
sbatch --gpus=1 ...
```

Specific GPU models can be requested by indicating _model_ and _count_:

```
sbatch --gpus=rtx2080ti:1 ...
```

### In the _chorus_ partition

The new GPU systems have a different processor and a newer version of operating system- this requires a new set of environment modules specific to this new architecture.  Because of this, these nodes are separated into new partition, _chorus_:

```
sbatch --partition=chorus --gpus=1 ...
```

When submitting jobs make sure that your current environment does not have modules loaded (i.e. `module purge`) and that you are loading the new modules in your script.  You may run into conflicts with modules built for rhino/gizmo compute platforms.
{: .notice--info}

## Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU- most CUDA tools (e.g. tensorflow) use this to restrict execution to that device.
