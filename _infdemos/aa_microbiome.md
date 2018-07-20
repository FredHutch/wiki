---
title: Microbiome Analysis and Microbial Genomics
last_modified_at: 2018-06-14
---

The microbiome is the collection of microbes that live in a community, such as the
microbes that live within and upon the human body. These microbes primarily consist
of bacteria and the viruses which infect bacteria, but also contain minority membership
from archaea, fungi, and protists. Scientific study of the microbiome has rapidly
expanded in recent years with the application of genome sequencing technologies for
detecting and quantifying the different microbes present in a sample without the need
for time-consuming and inefficient culturing techniques.

The experimental methods for microbiome analysis are dominated by two techniques:

  * 16S ribosomal marker gene sequencing
  * Whole-genome shotgun (WGS) metagenomic sequencing

### 16S Sequencing

All life encodes ribosomal RNA, which is necessary for creating proteins from RNA
transcripts. One of the ribosomal RNA genes present in bacteria (called "16S rRNA")
is used as a marker gene to identify the bacterial genus and species. This marker gene
is useful because (a) it is possible to use a set of primers to amplify a wide range
of bacterial isolates, and (b) there are large reference databases which you can
compare against to identify your organism of interest. 

There are many different tools used to analyze 16S data from high-throughput sequencing
instruments, but they can be generally summarized into two different analysis frameworks:

  * [QIIME](http://qiime.org/)
  * [Mothur](https://www.mothur.org/)

Each of these analysis frameworks can help you with the following analytical steps:

1. Generating "sequence variants" from raw reads (or OTUs)
2. Building phylogenetic trees from sequence variants (or OTUs)
3. Assigning taxonomic labels to 16S sequences (SVs or OTUs)
4. Comparing across samples to find differentially abundant organisms

### WGS Sequencing

Whole-Genome Shotgun (WGS) metagenomic sequencing consists of randomly fragmenting and
sequencing the complete collection of DNA (or RNA) present in a biological sample. While
there is much less work that goes into generating the sample for sequencing, the analysis
of the resulting data is much more complex. The number of reads generated for each sample
also tends to be rather large (2-25M reads per sample) compared to 16S (5-150k reads per
sample). 

The most commonly used software for analyzing WGS data comes from the Huttenhower lab,
and is compiled as part of the [bioBakery](https://bitbucket.org/biobakery/biobakery/wiki/Home).

  * Taxonomic profiling: MetaPhlAn2
  * Functional analysis: HUMAnN2

Another tactic you can take with WGS data is _de novo_ genome assembly, in which the
genomes present in a given sample are assembled from scratch. For that approach, assembly
software such as [SPAdes](http://cab.spbu.ru/software/spades/) can be very useful.

Finally, the Banfield group has pioneered the concept of "genome-resolved metagenomics,"
in which whole genomes are reconstructed from complex mixtures of samples using an
integrated analysis approach. Their method has been summarized as [DAS Tool](https://www.nature.com/articles/s41564-018-0171-1).

Another useful tool is [Anvi'o](http://merenlab.org/software/anvio/), from the Meren Lab
at Chicago, which includes a large amount of useful functionality for visualization,
assembly, and binning from WGS data. 
