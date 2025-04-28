---
title: Starting out on the Cluster
---

Starting out with working on the FH cluster can be a daunting process. In this article, we will point you to the right information you need to get started.

We'll start with three FASTA files and align them with with `bwa-mem`. 

We'll run 

## When You're First Starting

Here is a visual index of the steps you need to get up and running on the cluster

```mermaid
G[Get Credentials] --> A
A[Logging into the Cluster] --> B
B[Uploading Your Data] --> H
H[Find Your Software] --> C
C[Write a Bash Script] --> D
D[Run your script using sbatch] --> E
E[Check job status] --> F
F[Locate your outputs]
click G "#credentials"
click A "#logging-in"
click B "https://sciwiki.fredhutch.org/scicomputing/store_collaboration/"
click C "https://sciwiki.fredhutch.org/scicomputing/software_linux101/#shell-scripting"
click D "https://sciwiki.fredhutch.org/pathways/path-batch-computing/#steps"
click E "https://sciwiki.fredhutch.org/scicomputing/compute_jobs/#managing-jobs"
click F ""
```

### Credentials

The first thing you'll need to do is request credentials for the FH cluster.

https://sciwiki.fredhutch.org/scicomputing/access_credentials/

### Logging In

https://sciwiki.fredhutch.org/scicomputing/access_credentials/#accessing-slurm-clusters

### Upload Data

The next thing to do is to move your files to either:

- `/temp` 
- `/working`

You can use Motuz to move files back and forth from your computer, from other Fred Hutch storage (such as `/fast/`), or from Fred Hutch's S3 bucket.

### Find the Reference Genome

- There are a number of [reference genomes](https://sciwiki.fredhutch.org/datascience/refgenomes/) that are available for use. 

- We'll need the BWAIndex file that is available here: `/shared/biodata/reference/iGenomes/Homo_sapiens/UCSC/hg19/Sequence/BWAIndex` in our work. 

### Find Your Software

Most software that you need is [installed via modules on the system](https://sciwiki.fredhutch.org/scicomputing/compute_environments/#environment-modules). How do we find them? We can use `module avail bwa` to look for the proper module:

```bash
module avail bwa
```

We will get the following response:

```
------------------------------- /app/modules/all -------------------------------
   BWA/0.7.17-GCC-8.3.0     BWA/0.7.17-GCCcore-11.2.0
   BWA/0.7.17-GCC-10.2.0    BWA/0.7.17-GCCcore-12.2.0 (D)

  Where:
   D:  Default Module

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys"
```

So now we can load the module up using:

```bash
module load BWA/0.7.17-GCCcore-12.2.0
```

If you can't find a software module, there is Apptainer and other ways to get the software running in the HPC environment. 


## Batch Processing Files

At this point, we have two main paths to run the software:

1. We can use the built in job scheduler, SLURM, to batch process our files. 
    - Pros: fastest way to get things running
    - Cons: may not 
2. We can automate our batching using a WDL (Workflow Description Language) file and 

## Batch Jobs with Workflow Managers

