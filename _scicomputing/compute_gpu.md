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

Different options are required to access the different capability GPUs.  The newer GPUs are only available in a new partition containing just those nodes.

GPUs are requested via the `--gpus` option:

```
sbatch --gpus=1 ...
```

Specific GPU models (except for the L40s GPUs) can be requested by indicating _model_ and _count_:

```
sbatch --gpus=rtx2080ti:1 ...
```

Access to the L40s GPUs is more complex.  These systems have a different processor and a newer version of operating system- this requires a new set of environment modules specific to this new architecture.  These nodes also reside in a separate partition:

```
sbatch --partition=concord --gpus=1 ...
```

When submitting jobs make sure that your current environment does not have modules loaded (i.e. `module purge`) and that you are loading the new modules in your script.  You may run into conflicts with modules built for rhino/gizmo compute platforms.
{: .notice--info}

## Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable
CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU-
most CUDA tools (e.g. tensorflow) use this to restrict execution to that
device.
