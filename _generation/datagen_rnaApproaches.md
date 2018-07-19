---
title: RNA Analysis Approaches
last_modified_at: 2018-07-19
---

This page contains an outline of the platforms and approaches used to produce various types of large scale data sets from RNA that are available through the Fred Hutch Genomics Core. Please remember that this is a general resource and example cost estimates and read depth, etc will vary study to study. To answer any questions specific to your study, please contact the staff at the [Genomics Core](https://sharedresources.fredhutch.org/core-facilities/genomics) to describe the basics of your study, such as the sample types, numbers, goal datasets, and proposed platforms of interest.

## Quantitative Approaches: Gene Expression
Often, researchers want to answer what seems to be a very simple question--what is different between the treatment groups?  In an RNA context, this approach is called differential gene expression (DGE). DGE quantitatively measures differences in the levels of gene expression between two or more treatments or groups.

### RNA Sequencing
RNA sequencing is a common approach to assess DGE.  Simply stated, this involves comparing the counts for sequencing reads that come from each transcript. In practice, however, this involves a complex combination of RNA extraction, amplification, sequencing to get the raw sequence data, followed by a series of bioinformatic analysis steps to map those sequence data to regions of the transcript, then comparing the counts in each transcript region between treatment groups .

An important point to remember: the data output of RNA sequencing is a set of .fastq files, which are files that contain the sequence and read quality information for sequencing reads from each sample.  In order to get fully processed DGE results, there is a significant amount of bioinformatic support needed, as well as statistical support to assess gene expression differences among groups.

### Nanostring Gene Expression Panels
DGE is not exclusive to sequencing techniques.  Nanostring nCounter systems utilize nucleic acid probes, attached to fluorescent barcodes. The probes hybridize to a RNA in each sample, then the fluorescent barcodes are counted to quantify expression of each target.

From Nanostring's website:
*"Each color-coded barcode represents a single target molecule. Barcodes hybridize directly to your target molecules and can be individually counted without the need for amplification—providing sensitive digital data."*

The analysis of the resulting count data is processed via Nanostring's proprietary software.  Thus, Nanostring data requires little to no bioinformatic support, but still requires statistical analysis to assess gene expression differences among groups.


### Available Resources
  - Illumina has various options for RNA sequencing workflows. You might investigate some of their options.
    - Link:  [Illumina Differential Gene Expression Approaches ](https://www.illumina.com/techniques/popular-applications/gene-expression-transcriptome-analysis.html)


  - Nanostring has a selection of curated gene expression panels, as well as custom panels.
    - Link:  [Nanostring Gene Expression Panels](https://www.nanostring.com/products/gene-expression-panels)



## Qualitative Approaches: Transcript and Splicing Discovery
The goal of a qualitative approach is to identify (or annotate) genes and gene structures.  Here, the most important parameter is that the sequence reads evenly cover each transcript, including both ends.  One only needs to sequence at a depth that ensures all target areas are represented in the sequencing output.

Qualitative approaches allow the discovery of novel transcripts and alternatives splicing events.  But, to be clear:the design of such experiments will most likely be different from those aimed at quantification of transcripts. For novel transcripts and splicing, longer reads are often favored, at lower read depth.  This increases the probability  that reads will contain the alternative splicing sites.  

The raw files produced from this type of sequencing are similar to those made in quantitative analysis. However, bioinformatic analyses for transcript and splicing discovery will differ from quantitative analyses.


## Other RNA Based Research Approaches

### Example:  Small RNAs (e.g., miRNA)

The workflows necessary for small RNA sequencing often differ from other RNA sequencing protocols in a few ways:
1. RNA is isolated using methods that either retain or enrich small RNA molecule content. Often, total RNA isolation protocols (e.g.  phenol-chloroform isolation) or small RNA-specific column extractions.
2. Small RNAs are size-fractionated from total RNA, using either gel electrophoresis or size exclusion columns.  This step is sometimes performed as part of the library preparation.
3. Sequencing adapters are ligated onto the small RNAs, to allow library prep and sequencing.  There are varying methods for this ligation (e.g. RNA polyadenylation or T4 RNA ligase2 adapter ligation), depending on the library prep method.
4. The adapter-ligated small RNAs are amplified, during the process of library prep. Sometimes the size fractionation step follows this amplification.
5. NGS Sequencing is done, and specialized read alignment and bioinformatic approaches will be required.  


### Available Resources
- Genohub (a general resource for NGS information) has a short guide to special considerations for small RNA sequencing. [Genohub's Guide to Small RNA sequencing](https://genohub.com/services/sequencing/illumina-miRNA-sequencing-services/)
