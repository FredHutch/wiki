---
title: Using Workflows

---
>Note: this page is under re-construction as we clean up our various components of documentation around workflow managers.  Please pardon our dust or schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-running-and-scaling-your-analyses) with a staff member if you have questions about workflow managers.

## Understanding Workflows

When performing bioinformatic analysis, scientists often need to perform a series of interconnected
computational transformations of the raw input data. While it is possible to coordinate multiple tasks
using BASH scripts or batch submission to a SLURM cluster, it can be far more convenient to use
software which has been specifically designed to coordinate these types of workflows. Some examples
of those workflow managers are:

[Cromwell/WDL](https://cromwell.readthedocs.io/en/stable/), 
and [Nextflow](https://nextflow.io/).


## Getting Started with WDL

You can find a wealth of information on getting started using WDL workflows at Fred Hutch on our [WDL Workflows guide](/datascience/wdl_workflows/) and [WDL Execution Engines guide](/datascience/wdl_execution_engines/). For running WDL workflows at Fred Hutch, check out our [PROOF page](/datascience/proof/) - PROOF is a user-friendly tool that wraps the Cromwell workflow manager for use on our cluster.  



## Getting Started with Nextflow

Check our our various [Resource Library entries](/datademos/) related to Nextflow workflows.  


While there are many workflows developed by researchers around the world, the Data Core is also working
to maintain a catalog of workflows for Fred Hutch researchers. If you have any questions about using these
workflows, or if you run into any issues, the Data Core can help provide help with troubleshooting and
enhancements as needed.

See the [Nextflow Catalog](/datascience/nextflow_catalog) for a list of existing workflows you can run.

For a longer list of workflows developed by the worldwide community of Nextflow developers, visit the
[nf-core workflow catalog](https://nf-co.re/pipelines).

