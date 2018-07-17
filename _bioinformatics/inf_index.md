---
title: Bioinformatics Overview
last_modified_at: 2018-06-14
---

Bioinformatics refers to the computational analysis of raw biological
data, typically those generated within the context of a scientific experiment or
research project. One of the most rapidly expanding and heavily
used application of bioinformatics is genomic sequence analysis,
in which some form of high-throughput, large scale data collection instrument
(such as a genome sequencer or a DNA microarray) is used to collect
a large amount of information about such biological entities as
genes, organisms, transcripts, etc.  Large scale data generation approaches like this can be referred to as molecular profiling, and can be applied to a variety of biological and biomedical research contexts from model organism studies (e.g., yeast strains) to human specimens in the context of a clinical assay.  

## Best Practices for Research Data Management
    children:
      - title: "Overview"
        url: /bioinformatics/dm_overview/
      - title: "Data Storage"
        url: /bioinformatics/dm_storage/
      - title: "Data Ingestion and Public Datasets"
        url: /bioinformatics/dm_ingest/
      - title: "Data Archiving"
        url: /bioinformatics/dm_archive/
      - title: "Data Privacy and Security"
        url: /bioinformatics/dm_privacy/

## Programming and Bioinformatics
    children:
      - title: "Overview"
        url: /bioinformatics/prog_overview/
      - title: "R, RStudio"
        url: /bioinformatics/prog_R/
      - title: "Bioconductor"
        url: /bioinformatics/prog_bioconductor/
      - title: "Python and the Condas"
        url: /bioinformatics/prog_python/
      - title: "Unix/Bash"
        url: /bioinformatics/prog_unixbash/
      - title: "Other Common Languages"
        url: /bioinformatics/prog_other/

## Working with Compute Resources
    children:
      - title: "Overview"
        url: /bioinformatics/compute_overview/
      - title: "Docker"
        url: /bioinformatics/compute_docker/
      - title: "AWS Batch"
        url: /bioinformatics/compute_awsbatch/

## Training and How-To's
    children:
      - title: "Overview"
        url: /bioinformatics/howto_overview/
      - title: "How-To's Collection"
        url: /bioinformaticsdemos/
      - title: "Human Genetic Variant Calling and Analysis"
        url: /bioinformatics/aa_humanvariant/
      - title: "Gene Expression and Transcript Analysis"
        url: /bioinformatics/aa_geneexpression/
      - title: "Microbiome Analysis and Microbial Genomics"
        url: /bioinformatics/aa_microbiome/
      - title: "Traditional GWAS"
        url: /bioinformatics/aa_tradgwas/
      - title: "Mammalian Copy Number Analysis"
        url: /bioinformatics/aa_mammcopynumber/


<!--
## Sequencing
Genome sequencing can be used for a variety of purposes (RNA sequencing,
whole exome sequencing, microbiome profiling, etc.), but all of
those applications result in a large amount of genomic sequence
data that is produced. It can be highly time-consuming and resource
intensive to analyze those datasets, each of which may represent
hundreds or thousands of samples, with a single sample ranging from
10Mb to 10Gb depending on the experiment.

Given the size and complexity of these genomic datasets, the
software used for analysis is typically highly specialized for each
data type and output format. To execute those bioinformatic software
tools it is often necessary to use a large amount of computational
resources, such as High-Performance Computing (HPC) clusters or
cloud-based resources (Azure, AWS EC2, Google Cloud, etc.). This
wiki will provide details and guidance on using those bioinformatic
software tools, as well as the computational resources needed to
execute those tools.

## Imaging and Arrays-->
