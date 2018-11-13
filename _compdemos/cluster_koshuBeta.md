---
title: Instructions for Using Koshu (beta)
last_modified_at: 2018-11-07
---

## About Koshu

The cluster _Koshu_ is a cloud-based Slurm cluster based in Google's Cloud Platform.

> Koshu is currently under beta as it is currently not sized for large-scale work and may experience more maintenance time than other clusters or be missing some functionalities.  We're using this to "kick the tires," make sure everything functions before bringing it into production.  Check back frequently for updates or, as always, contact `SciComp` with any questions or to note any problems you experience when using Koshu.

At this time there are three partitions: the "campus" partition with smaller nodes, a "largenode" partition with nodes that have greater capacities (processors and memory), and a partition named "gpu" that has GPU capabilities.

Node Class  | Count | Processors  | Memory   | GPU 
------------| ------| ------------| ---------| -----
koshuf      | 70    | 4           | 32768 MB | none
koshug      | 10    | 8           | 262144 MB| none
koshuk      | 10    | 4           | 131072 MB| 1 NVIDIA Tesla v100

Note that the processors are hyperthreaded, which means that each physical CPU could be assigned two threads.  Whether this is an improvement for your tools will affect how you run them. 


## Using Koshu

Much like Beagle, jobs are routed to Koshu by use of the `-M` option when running Slurm commands on campus resources (e.g. rhinos):

    sbatch -M koshu ...

Note that `salloc` and `srun` do not support this.  To run interactive sesisons you need to log into the host _koshu-ctld_.

## Managing CPUS

As indicated, there are 4 CPUs indicated in Slurm while the host has 8 available CPUs.  If your workload benefits or at least does not suffer from hyperthreading, then you can use all 8 of the processors.  However, if your workload won't benefit from this, you need to adjust the way you launch your tools as many will default to using all configured processors on the node.

For example, _bowtie2_ has the option `-p` to control the number of threads it will use:

    bowtie2 -p 4 ...

would use four threads.  The best-practice for this would be to use the Slurm environment variable `SLURM_CPUS_ON_NODE` which will always contain the number of processors you have been assigned on the node:

    bowtie2 -p ${SLURM_CPUS_ON_NODE} ...

## Managing GPUs

Two options are required for using the GPUs in this cluster.  First you must select the _gpu_ partition and then you must select the number and type of GPU using Slurm's _gres_ options:

    sbatch -M koshu -p gpu --gres=gpu:V100-SXM2-16GB:1 ...

It is a bit cumbersome, but this will (as the cluster gains capabilities) allow greater flexibilty in selecting resources for your job as well as ensuring that GPU tools run correctly.

Technically, omitting the _gres_ option won't prevent the job from running.  However, the job won't have some necessary environment variables set and it would be possible that a node's GPU would get oversubscribed or that other failures will occur.

There are several environment variables set in a job:

Variable             | Purpose                                       |
----                 | ----                                          |
CUDA_VISIBLE_DEVICES | Tell CUDA capable tools which GPUs to use     |
GPU_DEVICE_ORDINAL   | Tell OpenLC capable tools which GPUs to use   |
SLURM_JOB_GPUS       | Environment variable set by Slurm with allocated GPUs |

These should automatically constrain most tools to the appropriate GPUS.  At this time, there's only a single GPU per host, but we will likely adjust that depending on needs and input from the community, so ensuring that scripts and tools use these variables to control which GPUs are used is important.

