---
title: Overview
last_modified_at: 2023-05-03
hdc: True
---

The Hutch Data Core is a group within the Shared Resources Department at the Fred
Hutchinson Cancer Center which works along the other core facilities at the Center.
The Data Core works to support the needs of researchers who utilize the types of
large-scale datasets produced by those facilities, such as genome sequencing, mass
spectrometry, high-throughput imaging, electron microscopy, etc.

While the needs of researchers vary widely by technical domain, scientific goals, and
computational complexity, the Data Core works to broadly provide support by developing
technological solutions which can be applied directly by researchers.
Those solutions are focused in three categories,
**data atlases** for publishing complex datasets to a broad audience,
a web-based **data portal** for large-scale data management and analysis,
and **bioinformatics workflows** to help automate complex
transformations of scientific data using high-performance computing systems.

## Data Atlases

To help present the results of complex, large-scale research projects to a general audience,
the Data Core and the Data Visualization Center have developed a number of **data atlases**
which accompany the publication of that work in peer reviewed journals.
By presenting large datasets in visual terms, complex results can be conveyed in a
more intuitive way to a general audience.

A current list of data atlases can be found at
[viz.fredhutch.org/projects/](https://viz.fredhutch.org/projects/).

![](/hdc/assets/data-atlases-screenshot.png)

If you are affiliated with The Fred Hutch / University of Washington Seattle Cancer Consortium
and have an interest in using this technology for your research, we would love to [hear from you](mailto:viz@fredhutch.org).

## Cirro Data Portal

Researchers are often confronted with the challenges of managing the large-scale datasets
which are produced by technical instrumentation (such as genome sequencers, flow cytometers,
microscopes, etc.).
Such datasets often consist of many different (large) files which need to be shared
among collaborators, and which can often be analyzed to produce new results.

The Hutch Data Core has developed the [Cirro data portal](https://cirro.bio) to help effectively
manage this type of research data, in particular the data generated from instrumentation
in the Shared Resources core facilities. Cirro provides functionality for:

- Cost-effectively storing large datasets
- Securely sharing data within a group of collaborators
- Running standardized bioinformatics analysis pipelines

For more information, [visit Cirro](https://data-portal.io/) or
[read the documentation](https://docs.data-portal.io/).

**Need Help?**  
Need help using the Cirro platform for data management and analysis?
Drop-in office hours with the Cirro team will be held every Tuesday at 2pm.
[Teams - Cirro Office Hours](https://teams.microsoft.com/l/message/19:c505778d20754d3fb7986ac7a9332481@thread.skype/1682457978043)

## Bioinformatics Workflows

The bioinformatic process of analyzing large datasets often requires a series of computational steps,
each of which may require a different set of software dependencies.
To help coordinate and streamline the execution of these workflows,
researchers around the world have started to adopt a set of software tools for workflow management,
such as Nextflow, Cromwell, and Snakemake.

One of the ways in which the Data Core works to provide support for bioinformatic analysis is by
helping to put these workflow management tools directly into the hands of Fred Hutch researchers.

This includes assistance with running computational workflows on different computational resources
(individual computers, the on-premise HPC cluster, or in the “cloud”),
curation of pre-existing workflows for commonly used tasks, and assistance with the development of
novel workflows to implement new scientific ideas.

Our [Workflow Resources](/hdc/hdc_workflows) include:
- Guidance for running automated workflows on Fred Hutch HPC resources (SLURM and AWS)
- A catalog of curated bioinformatics workflows (e.g. RNAseq, pan-genome analysis)
- Building your own automated workflows (e.g., from existing BASH scripts)

If you have any questions about using automated workflows for your research, please don't hesitate
to [get in touch](mailto:hutchdatacore@fredhutch.org).

## Other Support

### Bioinformatics Services

The process of analyzing datasets generated for a particular experiment or project can be complex, often requiring deep expertise in the technology used to generate the raw data as well as the computational tools needed to process them. The Bioinformatics Core provides researchers with support for this analysis, engaging on the basis of specific projects.

The staff of the Bioinformatics Core are available by appointment for one-on-one consultation.
They provide support to researchers for experimental design, directly analyzing complex datasets, consultation on choice of data analysis strategies and software tools, or to help with advice and troubleshooting as you conduct your own analyses.

We strongly encourage researchers to consult with a bioinformatics specialist at the earliest stages of a project to ensure an appropriate experimental design is in place prior to seeking data analysis support. 

To connect with the Bioinformatics Core, please visit [their webpage](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics/bioinformatics-services.html) or reach out directly [by email](mailto:bioinformatics@fredhutch.org).

### Online Trainings

While there are many resources available online for building skills in computational analysis of
complex datasets, it often be difficult for researchers to know where to start or what approaches
will be the most useful. To help provide some structure for researcher-driven skills development,
we work to provide a useful compendium of self-directed training resources.

For more information, browse our [information resources for learning opportunities](/hdc/hdc_training).

### Reference Genomes 

The Data Core and Bioinformatics Core work to maintain a core set of
data resources which are available to be used by the entire Fred Hutch
community. The primary set of data files which are currently available
are a collection of [frequently used reference genomes](/hdc/hdc_refgenomes) provided
for high-performance computing on the shared filesystem. Please
contact the Data Core if there are additional data resources which
could be added to provide value to researchers across multiple
research groups. 

For more information, browse our [documentation of the iGenomes reference genomes hosted in `/shared/biodata/`.](/hdc/hdc_refgenomes)
