---
title: Starting out on the Cluster
---

Starting out with working on the FH cluster can be a daunting process. In this article, we will point you to the right information you need to get started.

## When You're First Starting

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

### Find Your Software

Most software that you need is installed via modules. 

If you can't find a software module, there is Apptainer and other ways to get the software running in the HPC environment. 

## Batch Jobs with Workflow Managers

