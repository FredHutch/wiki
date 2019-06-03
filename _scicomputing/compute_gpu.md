---
title: Computing with GPUs
last_modified_at: 2019-06-03
primary_reviewer: atombaby
---

# Requesting GPUs

GPUs are requested via the GRES option:

    sbatch --gres=gpu ...

Additional options allow you to specify the GPU model:

    sbatch --gres=gpu:gtx1080ti

Number of GPUs:

    sbatch --gres=gpu:2

Or both:

    sbatch --gres=gpu:gtx1080ti:2

At this time we have just a single model and only one GPU per node- the other examples are provided for the sake of completeness.

## Requesting GPUs on Gizmo

The GPUs are currently installed only on nodes in the _largenode_ partition, thus it is necessary to request the minimums required for _largenode_ jobs:

    sbatch -p largenode --mem=21500 -c 6 --gres=gpu ...


## Requesting GPUs on Koshu

The GPU configured nodes on koshu are in the partition "gpu".  Jobs requiring GPUs need to request this partition and the GPUs:

    sbatch -p gpu --gres=gpu ...

# Using GPUs

When your job is assigned a GPU, Slurm sets the environment variable
CUDA_VISIBLE_DEVICES.  This environment variable indicates the assigned GPU-
most CUDA tools (e.g. tensorflow) use this to restrict execution to that
device.
