---
title: Computational Workflows
hdc: True
---

## Understanding Workflows

When performing bioinformatic analysis, scientists often need to perform a series of interconnected
computational transformations of the raw input data. While it is possible to coordinate multiple tasks
using BASH scripts or batch submission to a SLURM cluster, it can be far more convenient to use
software which has been specifically designed to coordinate these types of workflows. Some examples
of those workflow managers are 
[Snakemake](https://snakemake.readthedocs.io/en/stable/), 
[Cromwell](https://cromwell.readthedocs.io/en/stable/), 
[Galaxy](https://galaxyproject.org/), 
and [Nextflow](https://nextflow.io/).

At the moment, the documentation we provide is focused on [Nextflow](https://nextflow.io/), a
[published](https://www.nature.com/articles/nbt.3820.epdf?author_access_token=NR5Sw5j7DhVJhsvhZX3O8NRgN0jAjWel9jnR3ZoTv0O-x-SaU0X4rrftBAum396PO2HW7nu_CY6WUD5BczKSljFiztaC_YS4qiOe1WqLsYegnGM2iRixif0sggcgrW7Y) 
workflow management software which has been adopted by many core facilities around the world supporting
a catalog of [community-supported bioinformatics workflows](https://nf-co.re/). As we continue to expand
the documentation available for running workflows, we hope to add content supporting users of
[Snakemake](https://snakemake.readthedocs.io/en/stable/) and [Cromwell](https://cromwell.readthedocs.io/en/stable/).

We welcome the contribution of any additional workflow documentation, which can be added following these
[guidelines for contribution to the SciWiki](https://github.com/FredHutch/wiki/blob/main/README.md).

For further details on the concepts of workflow managers, see [Background on Workflows](/hdc/workflows/workflow_background).

## Getting Started

If you're new to workflows, follow this guide to [run your first workflow](/hdc/workflows/running_first_workflow).

## Workflow Configuration

One of the nice things about using a workflow manager is that you have the ability to change the way
that a workflow is run (on what computers, using what resources, analyzing what files), without changing
the workflow itself. This includes:

- [Running a workflow on SLURM (gizmo)](/hdc/workflows/running/on_gizmo)
- [Running a workflow on AWS](/hdc/workflows/running/on_aws)
- [Setting up a run script](/hdc/workflows/running/run_script)
- [Specifying computational resources](/hdc/workflows/running/process_resources)
- [Monitoring workflows on Tower](/hdc/workflows/running/tower)

## Workflow Catalog

While there are many workflows developed by researchers around the world, the Data Core is also working
to maintain a catalog of workflows for Fred Hutch researchers. If you have any questions about using these
workflows, or if you run into any issues, the Data Core can help provide help with troubleshooting and
enhancements as needed.

See the [Workflow Catalog](/hdc/workflows/workflow_catalog) for a list of existing workflows you can run.

For a longer list of workflows developed by the worldwide community of Nextflow developers, visit the
[nf-core workflow catalog](https://nf-co.re/pipelines).
