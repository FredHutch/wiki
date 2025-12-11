---
title: Cirro.bio

---


While researchers’ needs vary widely across technical domains, scientific goals, and
computational complexity, the Data Core provides broad support by developing
technological solutions that can be directly applied by researchers.
These solutions are centered around three areas,
**data atlases** for publishing complex datasets to a broad audience,
a web-based **data portal** for large-scale data management and analysis,
and **bioinformatics workflows** that help automate complex
transformations of scientific data using high-performance computing systems.

## Cirro Data Portal

Managing large-scale datasets produced by technical instrumentation, such as genome sequencers,
flow cytometers, and microscopes, can be a challenge for researchers. Such datasets often
consist of many large and files that need to be shared among collaborators, and which can
often be analyzed to produce new results.

Cirro is a service provided by Shared Resources tohelp address these challenges. It offers:

- Cost-effective storage for large datasets
- Secure data sharing among collaborators
- Standardized bioinformatics analysis pipelines

Fred Hutch researchers can log in directly to Cirro at
[cirro.bio](https://fredhutch.cirro.bio).

A series of seminars on how Cirro can be used at Fred Hutch are available as recordings
[on the Cirro CenterNet page](https://centernet.fredhutch.org/u/hutch-data-core/cirro.html#pastseminars).

Walkthrough videos on Cirro are provided for:

- [Getting started with the platform](https://docs.cirro.bio/overview/videos/#getting-started)
- [Uploading datasets](https://docs.cirro.bio/overview/videos/#adding-datasets)
- [Running analysis pipelines](https://docs.cirro.bio/overview/videos/#running-analysis)

### Accessing Cirro from the Command Line

The Cirro command-line interface (CLI) is available on the Fred Hutch computing
cluster as as a [pre-built module](/scicomputing/compute_environments/#interactively)
which can be loaded with the command `ml cirro`.
This can make it easier to download and work with files produced by
a Shared Resources Core Facility using the Fred Hutch computing cluster.

To install the Cirro command-line client on your local system, use
the command `pip install cirro` (requires Python).

More extensive documentation on the Cirro CLI can be found
[in the Cirro Documentation](https://docs.cirro.bio/cli-sdk/getting-started-cli-sdk/).

**Downloading Files from Cirro**

To download the files from a dataset from Cirro to a local working directory:

```{shell}
# Load the Cirro CLI module on a rhino/gizmo session
ml cirro

# Interactive prompt to select the dataset to download
cirro download -i
```

**Uploading Files to Cirro**

To upload a local folder of files as a dataset to Cirro:

```{shell}
# Load the Cirro CLI module on a rhino/gizmo session
ml cirro

# Interactive prompt to select the folder to upload, and
# the destination Cirro project / dataset
cirro upload -i
```

When uploading paired-end FASTQ datasets (e.g. from sequencing
RNA or DNA samples), it is extremely helpful to provide a samplesheet
listing any metadata available for that batch of samples.
To annotate a dataset of FASTQ files with that sample-level metadata
in Cirro, [provide a samplesheet](https://docs.cirro.bio/features/samples/#providing-a-sample-sheet)
in a file named `samplesheet.csv` in the same folder as those FASTQ files
with the format below (using the example of a dataset with two sample groups, `treatment` and `control`):

```{csv}
sample,fastq_1,fastq_2,example_grouping
batch1_sampleA,batch1_sampleA_R1.fastq.gz,batch1_sampleA_R2.fastq.gz,treatment
batch1_sampleB,batch1_sampleB_R1.fastq.gz,batch1_sampleB_R2.fastq.gz,treatment
batch1_sampleC,batch1_sampleC_R1.fastq.gz,batch1_sampleC_R2.fastq.gz,control
batch1_sampleD,batch1_sampleD_R1.fastq.gz,batch1_sampleD_R2.fastq.gz,control
```

### Adding Custom Workflows (WDL / Nextflow)

In addition to a catalog of [pre-configured workflows](https://docs.cirro.bio/pipelines/overview/#pipelines-in-cirro),
Cirro can be used to run custom [WDL workflows](/datascience/wdl_workflows/) or [Nextflow](https://www.nextflow.io/) workflows.
The code for those workflows can be used from public or private GitHub repositories,
including official repositories from projects like GATK.

Guidance on adding an existing WDL or Nextflow workflow to Cirro
can be found [in the Cirro documentation](https://docs.cirro.bio/pipelines/adding-pipelines/).

**Need Help?**  
Need help using the Cirro platform for data management and analysis?
Drop-in office hours with the Cirro team will be held every Tuesday at 2pm.
[Teams - Cirro Office Hours](https://teams.microsoft.com/l/message/19:c505778d20754d3fb7986ac7a9332481@thread.skype/1682457978043)


### Bioinformatics Services

The process of analyzing datasets generated for a particular experiment or project can be complex, often requiring deep expertise in the technology used to generate the raw data as well as the computational tools needed to process them. The Bioinformatics Core provides researchers with support for this analysis, engaging on the basis of specific projects.

The staff of the Bioinformatics Core are available by appointment for one-on-one consultation.
They provide support to researchers for experimental design, directly analyzing complex datasets, consultation on choice of data analysis strategies and software tools, or to help with advice and troubleshooting as you conduct your own analyses.

We strongly encourage researchers to consult with a bioinformatics specialist at the earliest stages of a project to ensure an appropriate experimental design is in place prior to seeking data analysis support. 

To connect with the Bioinformatics Core, please visit [their webpage](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics/bioinformatics-services.html) or reach out directly [by email](mailto:bioinformatics@fredhutch.org).


