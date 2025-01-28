---
title: Using Workflows

---

## Understanding Workflows

When performing bioinformatic analysis, scientists often need to perform a series of interconnected
computational transformations of the raw input data. While it is possible to coordinate multiple tasks
using BASH scripts or batch submission to a SLURM cluster, it can be far more convenient to use
software which has been specifically designed to coordinate these types of workflows. Some examples
of those workflow managers are 

[Cromwell/WDL](https://cromwell.readthedocs.io/en/stable/), 
and [Nextflow](https://nextflow.io/).


## Getting Started with WDL





## Getting Started with Nextflow

If you're new to workflows, follow this guide to [run your first workflow](/hdc/workflows/running_first_workflow).

### Workflow Configuration

One of the nice things about using a workflow manager is that you have the ability to change the way
that a workflow is run (on what computers, using what resources, analyzing what files), without changing
the workflow itself. This includes:

- [Running a workflow on SLURM (gizmo)](/dasldemos/workflows/running/on_gizmo)
- [Running a workflow on AWS](/dasldemos/workflows/running/on_aws)
- [Setting up a run script](/dasldemos/workflows/running/run_script)
- [Specifying computational resources](/dasldemos/workflows/running/process_resources)

### Workflow Catalog

While there are many workflows developed by researchers around the world, the Data Core is also working
to maintain a catalog of workflows for Fred Hutch researchers. If you have any questions about using these
workflows, or if you run into any issues, the Data Core can help provide help with troubleshooting and
enhancements as needed.

See the [Nextflow Catalog](/datascience/nextflow_catalog) for a list of existing workflows you can run.

For a longer list of workflows developed by the worldwide community of Nextflow developers, visit the
[nf-core workflow catalog](https://nf-co.re/pipelines).

Many of the nf-core workflows use a common set of [reference genomes](https://nf-co.re/usage/reference_genomes),
such as the [iGenomes](https://support.illumina.com/sequencing/sequencing_software/igenome.html) resource.
For more convenient use of the nf-core workflows at Fred Hutch, a set of commonly used reference genomes
including both the iGenomes and the human STAR-Fusion alignment index have been made available in a
public volume on the shared filesystem ([more details here](/datascience/refgenomes)).
