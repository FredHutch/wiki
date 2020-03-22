---
title: Scientific Software Modules
primary_reviewers: fitzwit
---

On the command line and in scripts, we use the Environment Module system to make software versions available in a modular and malleable way. Environment Modules provide modular access to one version of one or more software packages to help improve reproducibility. We use a system called EasyBuild to create modules for everyone to use - there are over a thousand modules already available. The modules listed here are the software modules available currently on `gizmo` and `beagle` compute clusters.
You can read more about how to use these modules and manage your compute environment on our [Compute Environments](/scicomputing/compute_environments/) page.  

## R Modules
Specific information about which R Modules are available, including more information about packages installed in them can be found on our dedicated [R Module page](/rModules/).

## Python Modules
Specific information about which Python Modules are available, including more information about packages installed in them can be found on our dedicated [Python Module page](/pythonModules/).

## Life Science/Bio Software Modules
Other software for life sciences that are available as modules can be found below.  If you do not see the software you are looking for, email `scicomp` to request it or add your own GitHub issue in the [easybuild-life-sciences repo](https://github.com/FredHutch/easybuild-life-sciences).  Either way, please be specific about the source and version of the software you are interested in.  

 - [AMOS/3.1.0-foss-2016b](http://sourceforge.net/apps/mediawiki/amos/index.php?title=AMOS)
The AMOS consortium is committed to the development of open-source whole genome assembly software
 - [BBMap/38.44-foss-2016b](https://sourceforge.net/projects/bbmap/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BBMap/BBMap-38.44-foss-2016b.eb)
BBMap short read aligner, and other bioinformatic tools.
 - [BCFtools/1.9-foss-2016b](http://www.htslib.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BCFtools/BCFtools-1.9-foss-2016b.eb)
Samtools is a suite of programs for interacting with high-throughput sequencing data.
 BCFtools
 - [BEDOPS/2.4.35-foss-2016b](http://bedops.readthedocs.io/en/latest/index.html)
BEDOPS is an open-source command-line toolkit that performs highly efficient and
 scalable Boolean and other set operations, statistical calculations, archiving, conversion and
 other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for
 distributing whole-genome analyses across a computational cluster.
 - [BEDTools/2.29.1-foss-2016b](https://github.com/arq5x/bedtools2)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BEDTools/BEDTools-2.29.1-foss-2016b.eb)
The BEDTools utilities allow one to address common genomics
 tasks such as finding feature overlaps and computing coverage. The utilities
 are largely based on four widely-used file formats: BED, GFF/GTF, VCF,
 and SAM/BAM.
 - [BLAST/2.2.26-Linux_x86_64](http://blast.ncbi.nlm.nih.gov/ )

 - [BLAST+/2.7.1-foss-2016b](http://blast.ncbi.nlm.nih.gov/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BLAST+/BLAST+-2.7.1-foss-2016b.eb)
Basic Local Alignment Search Tool, or BLAST, is an algorithm
 for comparing primary biological sequence information, such as the amino-acid
 sequences of different proteins or the nucleotides of DNA sequences.
 - [BWA/0.7.17-foss-2016b](http://bio-bwa.sourceforge.net)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BWA/BWA-0.7.17-foss-2016b.eb)
BWA is a software package for mapping DNA sequences against a large reference genome,
 such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The
 first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer
 sequences ranged from 70bp to a few megabases. BWA-MEM and BWA-SW share similar features such as the
 support of long reads and chimeric alignment, but BWA-MEM, which is the latest, is generally
 recommended as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack
 for 70-100bp Illumina reads.
 - [BamTools/2.4.1-foss-2016b](https://github.com/pezmaster31/bamtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BamTools/BamTools-2.4.1-foss-2016b.eb)
BamTools provides both a programmer's API and an end-user's toolkit for handling BAM files.
 - [Beast/2.5.1-foss-2016b](http://beast2.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Beast/Beast-2.5.1-foss-2016b.eb)
BEAST is a cross-platform program for Bayesian MCMC analysis of molecular 
 sequences. It is entirely orientated towards rooted, time-measured phylogenies inferred using 
 strict or relaxed molecular clock models. It can be used as a method of reconstructing phylogenies 
 but is also a framework for testing evolutionary hypotheses without conditioning on a single 
 tree topology. BEAST uses MCMC to average over tree space, so that each tree is weighted 
 proportional to its posterior probability. 
 - [Bio-DB-HTS/2.11-foss-2018b-Perl-5.28.0](https://metacpan.org/release/Bio-DB-HTS)
Read files using HTSlib including BAM/CRAM, Tabix and BCF database files
 - [BioPerl/1.7.2-foss-2016b-Perl-5.28.0](http://www.bioperl.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BioPerl/BioPerl-1.7.2-foss-2016b-Perl-5.28.0.eb)
Bioperl is the product of a community effort to produce Perl code which is useful in biology.
 Examples include Sequence objects, Alignment objects and database searching objects.
 - [Biopython/1.74-foss-2016b-Python-3.7.4](http://www.biopython.org)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Biopython/Biopython-1.74-foss-2016b-Python-3.7.4.eb)
Biopython is a set of freely available tools for biological
 computation written in Python by an international team of developers. It is
 a distributed collaborative effort to develop Python libraries and
 applications which address the needs of current and future work in
 bioinformatics. 
 - [Bismark/0.22.3-foss-2016b](https://www.bioinformatics.babraham.ac.uk/projects/bismark/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Bismark/Bismark-0.22.3-foss-2016b.eb)
A tool to map bisulfite converted sequence reads and determine cytosine methylation states
 - [Bowtie/1.2.1.1-foss-2016b](http://bowtie-bio.sourceforge.net/index.shtml)
Bowtie is an ultrafast, memory-efficient short read aligner.
 It aligns short DNA sequences (reads) to the human genome.
 - [Bowtie2/2.3.4.3-foss-2016b](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Bowtie2/Bowtie2-2.3.4.3-foss-2016b.eb)
Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads
 to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s
 of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes.
 Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome,
 its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes.
 - [CAP3/20150211](http://seq.cs.iastate.edu/)
CAP3 assembly program 
 - [CITE-seq-Count/1.4.2-foss-2016b-Python-3.6.6](https://hoohm.github.io/CITE-seq-Count)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CITE-seq-Count/CITE-seq-Count-1.4.2-foss-2016b-Python-3.6.6.eb)
A python package that allows to count antibody TAGS from a CITE-seq and/or cell hashing experiment.
 - [CNVnator/0.4.1-foss-2016b](https://github.com/abyzovlab/CNVnator)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CNVnator/CNVnator-0.4.1-foss-2016b.eb)
A tool for CNV discovery and genotyping from depth-of-coverage by mapped reads

 - [Cgl/0.60.2-foss-2016b](https://github.com/coin-or/Clg)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Cgl/Cgl-0.60.2-foss-2016b.eb)
The COIN-OR Cut Generation Library (Cgl) is a collection of cut generators that can be used with other COIN-OR packages that make use of cuts, such as, among others, the linear solver Clp or the mixed integer linear programming solvers Cbc or BCP. Cgl uses the abstract class OsiSolverInterface (see Osi) to use or communicate with a solver. It does not directly call a solver.
 - [Circos/0.69-6-GCCcore-7.3.0-Perl-5.28.0](http://www.circos.ca/)
Circos is a software package for visualizing data and information.
 It visualizes data in a circular layout
 - [Clairvoyante/1.02-foss-2016b-Python-3.6.6](https://github.com/aquaskyline/Clairvoyante)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Clairvoyante/Clairvoyante-1.02-foss-2016b-Python-3.6.6.eb)
Clairvoyante, a multi-task five-layer convolutional neural network model
 for predicting variant type, zygosity, alternative allele and Indel length.
 - [Clp/1.17.3-foss-2016b](https://github.com/coin-or/Clp)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Clp/Clp-1.17.3-foss-2016b.eb)
Clp (Coin-or linear programming) is an open-source linear programming solver
 - [CoinUtils/2.11.2-foss-2016b](https://www.coin-or.org/Doxygen/CoinUtils/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CoinUtils/CoinUtils-2.11.2-foss-2016b.eb)
CoinUtils (Coin-OR Utilities) is an open-source collection of classes
 and functions that are generally useful to more than one COIN-OR project. A collection
 of routines for manipulating sparse matrices and other matrix operations
 - [DANPOS2/2.2.2-foss-2016b-Python-2.7.12](https://sites.google.com/site/danposdoc)
A toolkit for Dynamic Analysis of Nucleosome and Protein Occupancy by Sequencing, version 2
 - [DIAMOND/0.9.22-foss-2016b](https://github.com/bbuchfink/diamond)
Accelerated BLAST compatible local sequence aligner
 - [EMBOSS/6.6.0-foss-2016b](http://emboss.sourceforge.net/)
EMBOSS is 'The European Molecular Biology Open Software Suite'.
 EMBOSS is a free Open Source software analysis package specially developed for
 the needs of the molecular biology (e.g. EMBnet) user community.
 - [EPACTS/a5209db-foss-2016b-R-3.4.1-fh1](http://github.com/statgen/EPACTS)
EPACTS is a versatile software pipeline to perform various statistical tests for identifying genome-wide association from sequence data through a user-friendly interface, both to scientific analysts and to method developer.s
 - [Eigen/3.3.5-foss-2016b](http://eigen.tuxfamily.org/index.php?title=Main_Page)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/e/Eigen/Eigen-3.3.5-foss-2016b.eb)
Eigen is a C++ template library for linear algebra:
 matrices, vectors, numerical solvers, and related algorithms.

 - [FASTX-Toolkit/0.0.14-foss-2016b](http://hannonlab.cshl.edu/fastx_toolkit/)
The FASTX-Toolkit is a collection of command line tools for 
 Short-Reads FASTA/FASTQ files preprocessing.
 - [FLASH/2.2.00-foss-2016b](https://ccb.jhu.edu/software/FLASH/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FLASH/FLASH-2.2.00-foss-2016b.eb)
FLASH (Fast Length Adjustment of SHort reads) is a very fast and accurate software
  tool to merge paired-end reads from next-generation sequencing experiments. FLASH is designed to
  merge pairs of reads when the original DNA fragments are shorter than twice the length of reads.
  The resulting longer reads can significantly improve genome assemblies. They can also improve
  transcriptome assembly when FLASH is used to merge RNA-seq data.
 - [FastANI/1.1-foss-2016b](http://www.iodbc.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FastANI/FastANI-1.1-foss-2016b.eb)
FastANI is developed for fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI). ANI is defined as mean nucleotide identity of orthologous gene pairs shared between two microbial genomes. FastANI supports pairwise comparison of both complete and draft genome assemblies.
 - [FastQC/0.11.8-Java-1.8](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FastQC/FastQC-0.11.8-Java-1.8.eb)
FastQC is a quality control application for high throughput
sequence data. It reads in sequence data in a variety of formats and can either
provide an interactive application to review the results of several different
QC checks, or create an HTML based report which can be integrated into a
pipeline.
 - [FastTree/2.1.9-foss-2016b](http://www.microbesonline.org/fasttree/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FastTree/FastTree-2.1.9-foss-2016b.eb)
FastTree infers approximately-maximum-likelihood phylogenetic trees from alignments of nucleotide  or protein sequences. FastTree can handle alignments with up to a million of sequences in a reasonable amount of  time and memory. 
 - [GATK/4.1.4.1-foss-2016b-Python-3.7.4](http://www.broadinstitute.org/gatk/)
The Genome Analysis Toolkit or GATK is a software package
developed at the Broad Institute to analyse next-generation resequencing
data. The toolkit offers a wide variety of tools, with a primary focus on
variant discovery and genotyping as well as strong emphasis on data quality
assurance. Its robust architecture, powerful processing engine and
high-performance computing features make it capable of taking on projects
of any size.
 - [GCTA/1.92.3beta3](https://cnsgenomics.com/software/gcta)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GCTA/GCTA-1.92.3beta3.eb)
GCTA (Genome-wide Complex Trait Analysis) was originally designed to
 estimate the proportion of phenotypic variance explained by all genome-wide SNPs for
 complex traits (the GREML method), and has subsequently extended for many other analyses
 to better understand the genetic architecture of complex traits.
 - [GD/2.69-GCCcore-7.3.0-Perl-5.28.0](https://github.com/lstein/Perl-GD)
GD.pm
 - [GEOS/3.7.2-foss-2016b-Python-3.7.4](http://trac.osgeo.org/geos)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GEOS/GEOS-3.7.2-foss-2016b-Python-3.7.4.eb)
GEOS (Geometry Engine
 - [GISTIC/2.0.23](www.broadinstitute.org/cancer/cga/gistc)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GISTIC/GISTIC-2.0.23.eb)
GISTIC is a tool to identify genes targeted by somatic copy-number alterations (SCNAs) that drive cancer growth. By separating SCNA profiles into underlying arm-level and focal alterations, GISTIC estimates the background rates for each category as well as defines the boundaries of SCNA regions.
 - [GMAP-GSNAP/2017-02-25-foss-2016b](http://research-pub.gene.com/gmap/)
GMAP: A Genomic Mapping and Alignment Program for mRNA and EST Sequences
 GSNAP: Genomic Short-read Nucleotide Alignment Program
 - [GMP/6.1.2-GCCcore-7.3.0](http://gmplib.org/)
GMP is a free library for arbitrary precision arithmetic, operating on signed
 integers, rational numbers, and floating point numbers.

 - [GTDBTk/0.1.3-foss-2016b-Python-2.7.15](https://github.com/Ecogenomics/GTDBTk)
GTDB-Tk is a software toolkit for assigning objective
 taxonomic classifications to bacterial and archaeal genomes. It is
 computationally efficient and designed to work with recent advances that
 allow hundreds or thousands of metagenome-assembled genomes (MAGs) to be
 obtained directly from environmental samples. It can also be applied to
 isolate and single-cell genomes.
 - [HISAT2/2.0.4-foss-2016b](https://ccb.jhu.edu/software/hisat2/index.shtml)
HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads
 (both DNA and RNA) against the general human population (as well as against a single reference genome).
 - [HMMER/3.2.1-foss-2016b](http://hmmer.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/HMMER/HMMER-3.2.1-foss-2016b.eb)
HMMER is used for searching sequence databases for homologs
 of protein sequences, and for making protein sequence alignments. It
 implements methods using probabilistic models called profile hidden Markov
 models (profile HMMs).  Compared to BLAST, FASTA, and other sequence
 alignment and database search tools based on older scoring methodology,
 HMMER aims to be significantly more accurate and more able to detect remote
 homologs because of the strength of its underlying mathematical models. In the
 past, this strength came at significant computational expense, but in the new
 HMMER3 project, HMMER is now essentially as fast as BLAST.
 - [HTSlib/1.10-foss-2016b](http://www.htslib.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/HTSlib/HTSlib-1.10-foss-2016b.eb)
A C library for reading/writing high-throughput sequencing data.
 HTSlib also provides the bgzip, htsfile, and tabix utilities
 - [Homer/v4.9-foss-2016b](http://homer.ucsd.edu/homer/download.html)
HOMER (Hypergeometric Optimization of Motif EnRichment) is a suite of tools for Motif Discovery and ChIP-Seq analysis. It is a collection of command line programs for unix-style operating systems written in mostly perl and c++. Homer was primarily written as a de novo motif discovery algorithm that is well suited for finding 8-12 bp motifs in large scale genomics data.
 - [IGV/2.5.0-Java-11](http://www.broadinstitute.org/software/igv/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/IGV/IGV-2.5.0-Java-11.eb)
This package contains command line utilities for
 preprocessing, computing feature count density (coverage),  sorting, and
 indexing data files.
 - [IGVTools/2.4.16-Java-1.8](http://www.broadinstitute.org/software/igv/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/IGVTools/IGVTools-2.4.16-Java-1.8.eb)
This package contains command line utilities for
 preprocessing, computing feature count density (coverage),  sorting, and
 indexing data files. 
 - [IQ-TREE/1.6.12-GCCcore-5.4.0](http://www.iqtree.org/)
A fast and effective stochastic algorithm to infer phylogenetic
 trees by maximum likelihood.
 - [ImmunediveRsity/1.0.9-foss-2016b](https://bitbucket.org/ImmunediveRsity/immunediversity)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/ImmunediveRsity/ImmunediveRsity-1.0.9-foss-2016b.eb)
Evaluation of the antibody repertoire by analyzing HTS data. Manipulation and processing of HTS reads to identify VDJ usage and clonal origin to gain insight of the antibody repertoire of a given organism.
 - [JAGS/4.2.0-foss-2016b](http://mcmc-jags.sourceforge.net/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/j/JAGS/JAGS-4.2.0-foss-2016b.eb)
JAGS is Just Another Gibbs Sampler.  It is a program for analysis   of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation  
 - [Kent_tools/20181218-linux.x86_64](http://genome.cse.ucsc.edu/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/Kent_tools/Kent_tools-20181218-linux.x86_64.eb)
Kent tools: collection of tools used by the UCSC genome browser.
 - [Keras/2.3.0-foss-2016b-Python-3.7.4](https://keras.io/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/Keras/Keras-2.3.0-foss-2016b-Python-3.7.4.eb)
Keras is a minimalist, highly modular neural networks library, written in Python and
capable of running on top of either TensorFlow or Theano.
 - [Kraken2/2.0.7-beta-foss-2016b-Perl-5.28.0](http://www.ccb.jhu.edu/software/kraken2/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/Kraken2/Kraken2-2.0.7-beta-foss-2016b-Perl-5.28.0.eb)
Kraken is a system for assigning taxonomic labels to short DNA sequences,
 usually obtained through metagenomic studies. Previous attempts by other
 bioinformatics software to accomplish this task have often used sequence
 alignment or machine learning techniques that were quite slow, leading to
 the development of less sensitive but much faster abundance estimation
 programs. Kraken aims to achieve high sensitivity and high speed by
 utilizing exact alignments of k-mers and a novel classification algorithm.
 - [LAST/926-foss-2016b](http://last.cbrc.jp/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/LAST/LAST-926-foss-2016b.eb)
LAST finds similar regions between sequences.
 - [MACS2/2.2.6-foss-2016b-Python-3.7.4](http://liulab.dfci.harvard.edu/MACS)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MACS2/MACS2-2.2.6-foss-2016b-Python-3.7.4.eb)
Model Based Analysis for ChIP-Seq data
 - [MAFFT/7.305-foss-2016b-with-extensions](http://mafft.cbrc.jp/alignment/software/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MAFFT/MAFFT-7.305-foss-2016b-with-extensions.eb)
MAFFT is a multiple sequence alignment program 
 for unix-like operating systems.  It offers a range of multiple
 alignment methods, L-INS-i (accurate; for alignment of <∼200 sequences), 
 FFT-NS-2 (fast; for alignment of <∼10,000 sequences), etc.
 - [MAFFT/7.305-foss-2016b-with-extensions](http://mafft.cbrc.jp/alignment/software/)
MAFFT is a multiple sequence alignment program 
 for unix-like operating systems.  It offers a range of multiple
 alignment methods, L-INS-i (accurate; for alignment of <∼200 sequences), 
 FFT-NS-2 (fast; for alignment of <∼10,000 sequences), etc.
 - [MPFR/3.1.4-foss-2016b](http://www.mpfr.org)
The MPFR library is a C library for multiple-precision 
 floating-point computations with correct rounding.
 - [MUMmer/3.23-foss-2016b](http://mummer.sourceforge.net/)
MUMmer is a system for rapidly aligning entire genomes,
 whether in complete or draft form. AMOS makes use of it.
 - [MUSCLE/3.8.31-foss-2016b](http://drive5.com/muscle/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MUSCLE/MUSCLE-3.8.31-foss-2016b.eb)
MUSCLE is one of the best-performing multiple alignment programs   according to published benchmark tests, with accuracy and speed that are consistently   better than CLUSTALW. MUSCLE can align hundreds of sequences in seconds. Most users   learn everything they need to know about MUSCLE in a few minutes—only a handful of   command-line options are needed to perform common alignment tasks.
 - [MiXCR/3.0.3-Java-1.8](https://milaboratory.com/software/mixcr/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MiXCR/MiXCR-3.0.3-Java-1.8.eb)
MiXCR processes big immunome data from raw sequences 
to quantitated clonotypes 
 - [MultiQC/1.8-foss-2016b-Python-3.7.4](http://multiqc.info)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MultiQC/MultiQC-1.8-foss-2016b-Python-3.7.4.eb)
Aggregate results from bioinformatics analyses across many samples into a single 
 report.

 MultiQC searches a given directory for analysis logs and compiles a HTML report. It's a general
 use tool, perfect for summarising the output from numerous bioinformatics tools.
 - [MutSig/2](http://software.broadinstitute.org/cancer/cga/mutsig)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MutSig/MutSig-2.eb)
MutSig stands for "Mutation Significance".  MutSig analyzes lists of mutations
 discovered in DNA sequencing, to identify genes that were mutated more often than expected by
 chance given background mutation processes.
 - [NGS/1.2.5-foss-2016a](https://github.com/ncbi/ngs )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/NGS/NGS-1.2.5-foss-2016a.eb)
NGS is a new, domain-specific API for accessing reads, alignments and pileups produced from  Next Generation Sequencing.
 - [NanoOk/1.26-foss-2016b](http://nanook.readthedocs.io/en/latest/)
NanoOK (pronounced na-nook) is a tool for extraction, alignment and analysis of Nanopore reads. NanoOK will extract reads as FASTA or FASTQ files, align them (with a choice of alignment tools), then generate a comprehensive multi-page PDF report containing yield, accuracy and quality analysis. Along the way, it generates plain text files which can be used for further analysis, as well as graphs suitable for inclusion in presentations and papers.
 - [NiftyNet/0.2.2-foss-2016b-Python-3.6.5-fh1](https://http://www.niftynet.io/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/NiftyNet/NiftyNet-0.2.2-foss-2016b-Python-3.6.5-fh1.eb)
NiftyNet is a TensorFlow-based open-source convolutional neural networks (CNNs) platform for research in medical image analysis and image-guided therapy.
 - [Osi/0.108.4-foss-2016b](https://github.com/coin-or/Osi)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/Osi/Osi-0.108.4-foss-2016b.eb)
Osi (Open Solver Interface) provides an abstract base class to a generic linear programming (LP) solver, along with derived classes for specific solvers. Many applications may be able to use the Osi to insulate themselves from a specific LP solver.
 - [PAINTOR/3.1-GCCcore-7.3.0](https://github.com/gkichaev/PAINTOR_V3.0)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PAINTOR/PAINTOR-3.1-GCCcore-7.3.0.eb)
PAINTOR Probabilistic Annotation INtegraTOR. PAINTOR is a statistical
 fine-mapping method that integrates functional genomic data with association strength
 from potentially multiple populations (or traits) to prioritize variants for follow-up
 analysis
 - [PANDAseq/2.11-foss-2016b](https://github.com/neufeld/pandaseq)
PANDAseq assembles Illumina Solexa overlapping pair-end reads.
 - [PEAR/0.9.11-foss-2016b](http://sco.h-its.org/exelixis/web/software/pear/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PEAR/PEAR-0.9.11-foss-2016b.eb)
PEAR is an ultrafast, memory-efficient and highly accurate pair-end read merger. 
 It is fully parallelized and can run with as low as just a few kilobytes of memory.
 - [PHASE/2.1.1](http://stephenslab.uchicago.edu/phase/download.html)
The program PHASE implements a Bayesian statistical 
method for reconstructing haplotypes from population genotype data.
Documentation: http://stephenslab.uchicago.edu/assets/software/phase/instruct2.1.pdf
 - [PRINSEQ/0.20.4-foss-2016b-Perl-5.28.0](http://prinseq.sourceforge.net)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PRINSEQ/PRINSEQ-0.20.4-foss-2016b-Perl-5.28.0.eb)
A bioinformatics tool to PRe-process and show INformation of SEQuence data.
 - [ParMETIS/4.0.3-foss-2016b](http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/ParMETIS/ParMETIS-4.0.3-foss-2016b.eb)
ParMETIS is an MPI-based parallel library that implements a variety of algorithms for partitioning
 unstructured graphs, meshes, and for computing fill-reducing orderings of sparse matrices. ParMETIS extends the
 functionality provided by METIS and includes routines that are especially suited for parallel AMR computations and
 large scale numerical simulations. The algorithms implemented in ParMETIS are based on the parallel multilevel k-way
 graph-partitioning, adaptive repartitioning, and parallel multi-constrained partitioning schemes.
 - [Pindel/0.2.5b8-foss-2016b](http://gmt.genome.wustl.edu/packages/pindel/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/Pindel/Pindel-0.2.5b8-foss-2016b.eb)
Pindel can detect breakpoints of large deletions, medium sized 
 insertions, inversions, tandem duplications and other structural variants at single-based 
 resolution from next-gen sequence data. It uses a pattern growth approach to identify the 
 breakpoints of these variants from paired-end short reads. 
 - [Pysam/0.15.3-foss-2016b-Python-3.7.4](https://github.com/pysam-developers/pysam)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/Pysam/Pysam-0.15.3-foss-2016b-Python-3.7.4.eb)
Pysam is a python module for reading and manipulating Samfiles. 
 It's a lightweight wrapper of the samtools C-API. Pysam also includes an interface for tabix.
 - [Pysamstats/1.1.2-foss-2016b-Python-3.7.4](https://github.com/alimanfoo/pysamstats)
A Python utility for calculating statistics against genome positions based on
 sequence alignments from a SAM or BAM file.
 - [Queue/3.5-Java-1.8.0_66](http://www.broadinstitute.org/gatk/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/q/Queue/Queue-3.5-Java-1.8.0_66.eb)
The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute   to analyse next-generation resequencing data. The toolkit offers a wide variety of tools,  with a primary focus on variant discovery and genotyping as well as strong emphasis on   data quality assurance. Its robust architecture, powerful processing engine and   high-performance computing features make it capable of taking on projects of any size.
 - [R-bundle-Bioconductor/3.5-foss-2016b-R-3.4.0-fh1](http://www.r-project.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/R-bundle-Bioconductor/R-bundle-Bioconductor-3.5-foss-2016b-R-3.4.0-fh1.eb)
R is a free software environment for statistical computing and graphics.
 - [RAxML/8.2.11-foss-2016b-hybrid-avx2](https://github.com/stamatak/standard-RAxML)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RAxML/RAxML-8.2.11-foss-2016b-hybrid-avx2.eb)
RAxML search algorithm for maximum likelihood based inference of phylogenetic trees.
 - [RELION/3.0_beta-foss-2018b](http://www2.mrc-lmb.cam.ac.uk/relion/index.php/Main_Page)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RELION/RELION-3.0_beta-foss-2018b.eb)
RELION (for REgularised LIkelihood OptimisatioN, pronounce
rely-on) is a stand-alone computer program that employs an empirical Bayesian
approach to refinement of (multiple) 3D reconstructions or 2D class averages in
electron cryo-microscopy (cryo-EM).
 - [RNA-SeQC/2.3.4-foss-2016b](https://software.broadinstitute.org/cancer/cga/rna-seqc)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RNA-SeQC/RNA-SeQC-2.3.4-foss-2016b.eb)
RNA-SeQC is a java program which computes a series of quality control metrics for
 RNA-seq data. The input can be one or more BAM files. The output consists of HTML reports and tab
 delimited files of metrics data. This program can be valuable for comparing sequencing quality
 across different samples or experiments to evaluate different experimental parameters. It can
 also be run on individual samples as a means of quality control before continuing with downstream
 analysis.
 - [RSeQC/3.0.0-foss-2016b-Python-3.6.6](http://rseqc.sourceforge.net/)
RSeQC provides a number of useful modules that can 
 comprehensively evaluate high throughput sequence data especially RNA-seq 
 data. Some basic modules quickly inspect sequence quality, nucleotide 
 composition bias, PCR bias and GC bias, while RNA-seq specific modules 
 evaluate sequencing saturation, mapped reads distribution, coverage 
 uniformity, strand specificity, transcript level RNA integrity etc.
 - [RepeatMasker/4-0-7-foss-2016b](www.repeatmasker.org)
RepeatMasker is a program that screens DNA sequences for interspersed repeats and low complexity DNA sequences. The output of the program is a detailed annotation of the repeats that are present in the query sequence as well as a modified version of the query sequence in which all the annotated repeats have been masked
 - [SAMtools/1.10-foss-2016b](http://www.htslib.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SAMtools/SAMtools-1.10-foss-2016b.eb)
SAM Tools provide various utilities for manipulating alignments in the SAM format, 
 including sorting, merging, indexing and generating alignments in a per-position format.
 - [SPRING_dev/1.6-foss-2016b-Python-2.7.15](http://https://github.com/AllonKleinLab/SPRING_dev)
SPRING is a collection of pre-processing scripts and a web
browser-based tool for visualizing and interacting with high dimensional data.
View an example dataset here. SPRING was developed for single cell RNA-Seq data
but can be applied more generally. The minimal input is a matrix of high
dimensional data points (cells) and a list of dimension names (genes).
 - [SRA-Toolkit/2.9.6-ubuntu64](http://trace.ncbi.nlm.nih.gov/Traces/sra)
The NCBI SRA Toolkit enables reading (dumping) of sequencing files 
 from the SRA database and writing (loading) files into the .sra format 
 - [STAR/2.7.1a-foss-2016b](https://github.com/alexdobin/STAR)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/STAR/STAR-2.7.1a-foss-2016b.eb)
STAR aligns RNA-seq reads to a reference genome using uncompressed suffix arrays.
 - [STAR-Fusion/1.5.0-foss-2016b-Perl-5.28.0](https://github.com/STAR-Fusion/STAR-Fusion)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/STAR-Fusion/STAR-Fusion-1.5.0-foss-2016b-Perl-5.28.0.eb)
STAR-Fusion uses the STAR aligner to identify candidate fusion transcripts 
 supported by Illumina reads. STAR-Fusion further processes the output generated by the STAR aligner 
 to map junction reads and spanning reads to a reference annotation set.
 - [SUGEN/8.3-foss-2016b](https://github.com/dragontaoran/SUGEN/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SUGEN/SUGEN-8.3-foss-2016b.eb)
SUGEN is a command-line software program written in C++ to implement the weighted and unweighted approaches described by Lin et al. (2014) for various types of association analysis under complex survey sampling. The current version of the program can accommodate continuous, binary, and right-censored time-to-event traits.
 - [SYMPHONY/5.6.17-foss-2016b](https://github.com/coin-or/SYMPHONY/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SYMPHONY/SYMPHONY-5.6.17-foss-2016b.eb)
SYMPHONY is an open-source solver for mixed-integer linear programs (MILPs) written in C. It can be used in four different main modes.
 - [Sniffles/1.0.8-foss-2016b](https://github.com/fritzsedlazeck/Sniffles)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/Sniffles/Sniffles-1.0.8-foss-2016b.eb)
Sniffles is a structural variation caller using third generation sequencing (PacBio or Oxford Nanopore). It detects all types of SVs (10bp+) using evidence from split-read alignments, high-mismatch regions, and coverage analysis.
 - [TRF/4.09-linux64-fh](https://tandem.bu.edu/trf/trf.html)
Tandem repeats finder: a program to analyze DNA sequences. Legacy version.
 - [Theano/1.0.4-foss-2016b-Python-3.7.4](http://deeplearning.net/software/theano)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/Theano/Theano-1.0.4-foss-2016b-Python-3.7.4.eb)
Theano is a Python library that allows you to define, optimize,
and evaluate mathematical expressions involving multi-dimensional arrays efficiently.
 - [TopHat/2.1.2-foss-2016b](http://ccb.jhu.edu/software/tophat/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/TopHat/TopHat-2.1.2-foss-2016b.eb)
TopHat is a fast splice junction mapper for RNA-Seq reads.
 - [TraCeR/0.6.0-foss-2016b-Python-3.7.4](https://github.com/Teichlab/tracer)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/TraCeR/TraCeR-0.6.0-foss-2016b-Python-3.7.4.eb)
TraCeR reconstructs the sequences of rearranged and expressed T cell receptor
 genes from single-cell RNA-seq data. It then uses the TCR sequences to identify cells that
 have the same receptor sequences and so derive from the same original clonally-expanded cell.
 - [Tracer/v1.6](http://beast.bio.ed.ac.uk/tracer )

 - [Trimmomatic/0.36-Java-1.8.0_121](http://www.usadellab.org/cms/?page=trimmomatic)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/Trimmomatic/Trimmomatic-0.36-Java-1.8.0_121.eb)
Trimmomatic performs a variety of useful trimming tasks for illumina 
 paired-end and single ended data.The selection of trimming steps and their associated 
 parameters are supplied on the command line. 
 - [Trinity/2.5.1-foss-2016b](http://trinityrnaseq.github.io)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/Trinity/Trinity-2.5.1-foss-2016b.eb)
Trinity represents a novel method for the efficient and robust de novo reconstruction
 of transcriptomes from RNA-Seq data. Trinity combines three independent software modules: Inchworm,
 Chrysalis, and Butterfly, applied sequentially to process large volumes of RNA-Seq reads.
 - [UMI-tools/1.0.0-foss-2016b-Python-3.7.4](https://umi-tools.readthedocs.io)
Tools for handling Unique Molecular Identifiers in NGS data sets
 - [VCFtools/0.1.15-foss-2016b-Perl-5.24.1](https://vcftools.github.io)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/VCFtools/VCFtools-0.1.15-foss-2016b-Perl-5.24.1.eb)
The aim of VCFtools is to provide 
 easily accessible methods for working with complex 
 genetic variation data in the form of VCF files.
 - [VEP/96.0-foss-2016b-Perl-5.24.0](https://www.ensembl.org/info/docs/tools/vep)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/VEP/VEP-96.0-foss-2016b-Perl-5.24.0.eb)
Variant Effect Predictor (VEP) determines the effect of your variants (SNPs, insertions, deletions,
 CNVs or structural variants) on genes, transcripts, and protein sequence, as well as regulatory regions.
 - [VariationHunter/0.4-foss-2016b](http://variationhunter.sourceforge.net/Home )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/VariationHunter/VariationHunter-0.4-foss-2016b.eb)
Variation Hunter
 - [ViennaRNA/2.4.13-foss-2016b-Python-3.6.6](http://www.tbi.univie.ac.at/RNA/)
The Vienna RNA Package consists of a C code library and several
stand-alone programs for the prediction and comparison of RNA secondary structures.
 - [Wandy/Feb2_2015-foss-2016b-Java-1.8.0_92](http://bioinformaticstools.mayo.edu/research/wandy/ )
Wandy is designed for Copy Number Variation (CNV) and Aneuploidy detection from large genomes such as human. It takes a sorted BAM file as input and report predicted chromosome regions that have amplifications or deletions using LOG2 ratio, generate graphic reports.
 - [Wandy/Feb2_2015-foss-2016b-Java-1.8.0_92](http://bioinformaticstools.mayo.edu/research/wandy/ )
Wandy is designed for Copy Number Variation (CNV) and Aneuploidy detection from large genomes such as human. It takes a sorted BAM file as input and report predicted chromosome regions that have amplifications or deletions using LOG2 ratio, generate graphic reports.
 - [assembly-stats/1.0.0-foss-2016b](https://github.com/sanger-pathogens/assembly-stats)
Get assembly statistics from FASTA and FASTQ files
 - [ataqv/0.9.5-foss-2016b](https://github.com/ParkerLab/ataqv)
A toolkit for measuring and comparing ATAC-seq results, made in the
`Parker lab`_ at the University of Michigan. We wrote it to help us
understand how well our ATAC-seq assays had worked, and to make it
easier to spot differences that might be caused by library prep or
sequencing.
 - [bam2wig/1.4](https://github.com/MikeAxtell/bam2wig)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bam2wig/bam2wig-1.4.eb)
Conversion of a BAM alignment to wiggle and bigwig coverage files, with flexible reporting options.
 - [bamUtil/1.0.14-foss-2016a](http://genome.sph.umich.edu/wiki/BamUtil )
BamUtil is a repository that contains several programs   that perform operations on SAM/BAM files. All of these programs   are built into a single executable, bam.
 - [bcl2fastq2/2.20.0-foss-2016b](https://support.illumina.com/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bcl2fastq2/bcl2fastq2-2.20.0-foss-2016b.eb)
Illumina conversion Software bcl2fastq can be used to
both demultiplex data and convert BCL files to FASTQ file formats for
downstream analysis.
 - [biobambam2/2.0.95-foss-2016b](https://github.com/gt1/biobambam2)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/biobambam2/biobambam2-2.0.95-foss-2016b.eb)
Tools for processing BAM files; 
 bamsormadup, bamcollate2, bammarkduplicates, bammaskflags, bamrecompress,
 bamsort, bamtofastq
 - [breakdancer/1.4.5-foss-2014b](http://gmt.genome.wustl.edu/packages/breakdancer/index.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/breakdancer/breakdancer-1.4.5-foss-2014b.eb)
BreakDancerMax predicts five types of structural variants: insertions, deletions, inversions, inter- and intra-chromosomal translocations from next-generation short paired-end sequencing reads using read pairs that are mapped with unexpected separation distances or orientation.
 - [bx-python/0.8.2-foss-2016b-Python-3.6.6](https://github.com/bxlab/bx-python)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bx-python/bx-python-0.8.2-foss-2016b-Python-3.6.6.eb)
The bx-python project is a Python library and associated set of scripts to allow for rapid
 implementation of genome scale analyses.
 - [canu/1.8-foss-2016b](http://canu.readthedocs.io)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/canu/canu-1.8-foss-2016b.eb)
Canu is a fork of the Celera Assembler designed for
 high-noise single-molecule sequencing
 - [cas-offinder/2.4-foss-2016b]()
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cas-offinder/cas-offinder-2.4-foss-2016b.eb)
Cas-OFFinder is OpenCL based, ultrafast and versatile program that searches for potential off-target sites of CRISPR/Cas-derived RNA-guided endonucleases (RGEN).
 - [cellranger/3.1.0](https://support.10xgenomics.com/single-cell-gene-expression/software/overview/welcome)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cellranger/cellranger-3.1.0.eb)
Chromium Single Cell Software Suite is a set of software applications for analyzing and visualizing single cell 3’ RNA-seq data produced by the 10x Genomics Chromium Platform.
 - [cellranger-atac/1.1.0-foss-2016b](https://support.10xgenomics.com/single-cell-atac/software/overview/welcome)
The Chromium Single Cell ATAC Software Suite is a complete package for analyzing and visualizing single cell chromatin accessibility data produced by the Chromium Single Cell ATAC Solution on the 10x Chromium Platform.
 - [conifer/0.2.2-foss-2016b-Python-2.7.12-fh2](https://sourceforge.net/projects/conifer )
CoNIFER uses exome sequencing data to find copy number variants (CNVs) and genotype the copy-number of duplicated genes.
 - [cromwell/47-Java-1.8](https://github.com/broadinstitute/cromwell)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cromwell/cromwell-47-Java-1.8.eb)
Scientific workflow engine designed for simplicity & scalability.
 - [ctffind/4.1.10-foss-2018b](http://grigoriefflab.janelia.org/ctf)
CTFFIND is a programing for finding CTFs of electron
micrographs
 - [cutadapt/2.7-foss-2016b-Python-3.7.4](http://opensource.scilifelab.se/projects/cutadapt/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cutadapt/cutadapt-2.7-foss-2016b-Python-3.7.4.eb)
Cutadapt finds and removes adapter sequences, primers, poly-A tails and
 other types of unwanted sequence from your high-throughput sequencing reads.
 - [deepTools/3.3.1-foss-2016b-Python-3.7.4](https://deeptools.readthedocs.io/)
deepTools is a suite of python tools particularly developed for the efficient analysis of
 high-throughput sequencing data, such as ChIP-seq, RNA-seq or MNase-seq.
 - [delly/0.7.6-foss-2016b](https://github.com/tobiasrausch/delly)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/d/delly/delly-0.7.6-foss-2016b.eb)
DELLY2: Structural variant discovery by integrated paired-end and split-read analysis
 - [factera/1.4.4-foss-2016b-Perl-5.24.1](https://factera.stanford.edu/)
(Fusion And Chromosomal Translocation Enumeration and Recovery Algorithm) is a tool for detection of genomic fusions in paired-end targeted (or genome-wide) sequencing data.
 - [fast5/0.6.2](http://simpsonlab.github.io/2017/02/27/packing_fast5/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fast5/fast5-0.6.2.eb)
A lightweight C++ library for accessing Oxford Nanopore Technologies sequencing data.
 - [fastqc/0.11.3](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ )

 - [fermi-lite/0.1-foss-2016b](https://github.com/lh3/fermi-lite)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fermi-lite/fermi-lite-0.1-foss-2016b.eb)
Fermi-lite is a standalone C library as well as a command-line tool
 for assembling Illumina short reads in regions from 100bp to 10 million bp in size. It
 is largely a light-weight in-memory version of fermikit without generating any intermediate
 files.
 - [fgbio/1.1.0-foss-2016b](https://github.com/fulcrumgenomics/fgbio)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fgbio/fgbio-1.1.0-foss-2016b.eb)
A set of tools to analyze genomic data with a focus on Next Generation Sequencing.
 - [fiji/1.0.0-Java-1.8.0_66](http://imagej.net/Fiji )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fiji/fiji-1.0.0-Java-1.8.0_66.eb)
Fiji is a distribution of ImageJ which includes many useful plugins contributed by the community.
 - [gbench/2.12.0-foss-2016b](https://www.ncbi.nlm.nih.gov/tools/gbench/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/gbench/gbench-2.12.0-foss-2016b.eb)
NCBI Genome Workbench is an integrated application for viewing and analyzing sequence data. With Genome Workbench, you can view data in publically available sequence databases at NCBI, and mix this data with your own private data.
 - [generic-metal/2011-03-25-foss-2016b](http://csg.sph.umich.edu/abecasis/Metal/download/)
The METAL software is designed to facilitate meta-analysis of large datasets (such as several whole genome scans) in a convenient, rapid and memory efficient manner. 
 - [hivmmer/0.1.2-foss-2016b-Python-3.6.6](https://github.com/kantorlab/hivmmer)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/hivmmer/hivmmer-0.1.2-foss-2016b-Python-3.6.6.eb)
An alignment and variant-calling pipeline for Illumina deep
 sequencing of HIV-1, based on the probabilistic aligner HMMER
 - [hmmcopy/master-foss-2016b](https://github.com/shahcompbio/hmmcopy_utils/tree/master)
Tools for extracting read counts and gc and mappability statistics in preparation for running HMMCopy.
 - [imrep/0.8-foss-2016b](https://github.com/mandricigor/imrep/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/imrep/imrep-0.8-foss-2016b.eb)
ImReP is a method for rapid and accurate profiling of the adaptive immune repertoires from regular RNA-Seq data
 - [intro-bio-bundle/2.0-foss-2016b-fh1](http://scicomp.fhcrc.org )
Bundle used for CompBio teaching at FredHutch.
 - [kallisto/0.46.0-foss-2016b](http://pachterlab.github.io/kallisto/)
kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally
 of target sequences using high-throughput sequencing reads.
 - [kentUtils/302.1.0-foss-2016b](http://genome.cse.ucsc.edu/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/kentUtils/kentUtils-302.1.0-foss-2016b.eb)
Jim Kent tools: collection of tools used by the UCSC genome browser.
 - [lemon/1.3.1-foss-2016b](http://lemon.cs.elte.hu/trac/lemon)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/lemon/lemon-1.3.1-foss-2016b.eb)
LEMON stands for Library for Efficient Modeling and
 Optimization in Networks. It is a C++ template library providing efficient
 implementations of common data structures and algorithms with focus on
 combinatorial optimization tasks connected mainly with graphs and networks.
 - [libcerf/1.5-foss-2016b](http://gnuplot.sourceforge.net/)
libcerf is a self-contained numeric library that provides an efficient and accurate
 implementation of complex error functions, along with Dawson, Faddeeva, and Voigt functions.
 - [libgtextutils/0.7-GCCcore-5.4.0](http://hannonlab.cshl.edu/fastx_toolkit/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/libgtextutils/libgtextutils-0.7-GCCcore-5.4.0.eb)
ligtextutils is a dependency of fastx-toolkit and is provided
 via the same upstream
 - [libpll/0.3.2-GCCcore-5.4.0](https://github.com/xflouris/libpll/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/libpll/libpll-0.3.2-GCCcore-5.4.0.eb)
libpll is a versatile high-performance software library for phylogenetic analysis.
 - [lumpy/0.2.13-foss-2016a](https://github.com/pezmaster31/bamtools )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/lumpy/lumpy-0.2.13-foss-2016a.eb)
A probabilistic framework for structural variant discovery.
 - [magicblast/1.0.0-foss-2016b](http://blast.ncbi.nlm.nih.gov/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/magicblast/magicblast-1.0.0-foss-2016b.eb)
Magic-BLAST is a new tool for mapping large sets of next-generation RNA or DNA sequencing runs against a whole genome or transcriptome.
 - [medaka/0.10.0-foss-2016b-Python-3.6.6](https://nanoporetech.github.io/medaka)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/medaka/medaka-0.10.0-foss-2016b-Python-3.6.6.eb)
medaka is a tool to create a consensus sequence of nanopore sequencing data.
 - [megalodon/1.0.0-alpha.1-foss-2016b-Python-3.7.4](https://github.com/nanoporetech)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/megalodon/megalodon-1.0.0-alpha.1-foss-2016b-Python-3.7.4.eb)
Megalodon provides "basecalling augmentation" for raw nanopore
 sequencing reads, including direct, reference-guided SNP and modified base calling.
 - [minimap2/2.13-foss-2016b](https://lh3.github.io/minimap2)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/minimap2/minimap2-2.13-foss-2016b.eb)
A versatile pairwise aligner for genomic and spliced nucleotide sequences.
 - [misopy/0.5.4-foss-2016b-Python-2.7.15](https://www.genes.mit.edu/burgelab/miso/)
MISO (Mixture of Isoforms) is a probabilistic framework that quantitates the expression level of alternatively spliced genes from RNA-Seq data, and identifies differentially regulated isoforms or exons across samples. By modeling the generative process by which reads are produced from isoforms in RNA-Seq, the MISO model uses Bayesian inference to compute the probability that a read originated from a particular isoform.
 - [mixcr/2.1.5-foss-2016b](https://github.com/milaboratory/mixcr)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/mixcr/mixcr-2.1.5-foss-2016b.eb)
MiXCR is a universal software for fast and accurate analysis of T- and B- cell receptor repertoire sequencing data.
 - [mofapy/1.2-foss-2016b-Python-3.7.4](https://github.com/bioFAM/MOFA)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/mofapy/mofapy-1.2-foss-2016b-Python-3.7.4.eb)
Multi-Omics Factor Analysis, a statistical framework for the integration of multi-omics data
 - [monocle3/0.2.0-foss-2016b-R-3.6.1](https://cole-trapnell-lab.github.io/monocle3)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/monocle3/monocle3-0.2.0-foss-2016b-R-3.6.1.eb)
Single-cell transcriptome sequencing (sc-RNA-seq) experiments allow us to discover new cell types and help us understand how they arise in development. The Monocle 3 package provides a toolkit for analyzing single-cell gene expression experiments.
 - [mrsFAST/3.3.11-foss-2016b](http://sfu-compbio.github.io/mrsfast/ )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/mrsFAST/mrsFAST-3.3.11-foss-2016b.eb)
mrsFAST is designed to map short reads to reference genome assemblies; in a fast and memory-efficient manner. mrsFAST is a cache-oblivous short read mapper that optimizes cache usage to get higher performance.
 - [nanofilt/2.6.0-foss-2016b-Python-3.7.4](https://github.com/wdecoster/nanofilt)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/nanofilt/nanofilt-2.6.0-foss-2016b-Python-3.7.4.eb)
Filtering and trimming of long read sequencing data.
 - [nanopolish/0.11.1-foss-2018b-Python-2.7.15](https://github.com/jts/nanopolish)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/nanopolish/nanopolish-0.11.1-foss-2018b-Python-2.7.15.eb)
Software package for signal-level analysis of Oxford Nanopore sequencing data.
 - [ncbi-blast/2.6.0-foss-2016b](http://blast.ncbi.nlm.nih.gov/)
Basic Local Alignment Search Tool, or BLAST, is an algorithm
 for comparing primary biological sequence information, such as the amino-acid
 sequences of different proteins or the nucleotides of DNA sequences.
 - [ncbi-vdb/2.7.0-foss-2016b](https://github.com/ncbi/ncbi-vdb)
The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for
 using data in the INSDC Sequence Read Archives.
 - [newick-utils/1.6-foss-2016b](http://cegg.unige.ch/newick_utils )
The Newick Utilities are a suite of Unix shell tools for processing phylogenetic trees. We distribute the package under the BSD License. Functions include re-rooting, extracting subtrees, trimming, pruning, condensing, drawing (ASCII graphics or SVG).
 - [ngmlr/0.2.7-foss-2016b](https://github.com/philres/ngmlr)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/ngmlr/ngmlr-0.2.7-foss-2016b.eb)
Ngmlr is a long-read mapper designed to align PacBilo or Oxford Nanopore to a
 reference genome with a focus on reads that span structural variations.
 - [oncotator/1.9.3.0-foss-2016b-Python-2.7.14-bare](http://portals.broadinstitute.org/oncotator/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/oncotator/oncotator-1.9.3.0-foss-2016b-Python-2.7.14-bare.eb)
Oncotator is a web application for annotating human genomic point mutations and indels with data relevant to cancer researchers.
 - [oncotator_v1_ds/April052016](http://portals.broadinstitute.org/oncotator/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/oncotator_v1_ds/oncotator_v1_ds-April052016.eb)
Oncotator is a web application for annotating human genomic point mutations and indels with data relevant to cancer researchers.
 - [ont-guppy-cpu/2.3.7](https://nanoporetech.com/products/minit)
Guppy software supports MinIT and MinION instruments from
 Nanopore Technologies
 - [parasail/2.4-foss-2016b](https://github.com/jeffdaily/parasail)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/parasail/parasail-2.4-foss-2016b.eb)
parasail is a SIMD C (C99) library containing implementations
 of the Smith-Waterman (local), Needleman-Wunsch (global), and semi-global
 pairwise sequence alignment algorithms. 
 - [peer-master/1.0.0-foss-2016b](https://www.sanger.ac.uk/science/tools/peer)
PEER is a collection of Bayesian approaches to infer hidden
 determinants and their effects from gene expression profiles using factor
 analysis methods. 
 - [philosopher/2.0.0](https://github.com/Nesvilab/philosopher/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/philosopher/philosopher-2.0.0.eb)
Philosopher provides easy access to third-party tools and custom algorithms
 allowing users to develop proteomics analysis, from Peptide Spectrum Matching to annotated
 protein reports. Philosopher is also tuned for Open Search analysis, providing a modified
 version of the prophets for peptide validation and protein inference. To this date, Philosopher
 is the only proteomics toolkit that allows you to process and analyze close and
 open search results.
 - [picard/2.18.29-Java](http://sourceforge.net/projects/picard)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/picard/picard-2.18.29-Java.eb)
A set of tools (in Java) for working with next generation sequencing data in the BAM format.
 - [plink/1.9b_4.6-x86_64](https://www.cog-genomics.org/plink/1.9)
plink-1.9-x86_64: Whole-genome association analysis toolset
 - [plink2/20190910](https://www.cog-genomics.org/plink/2.0)
plink2 Whole-genome association analysis toolset
 - [pplacer/1.1.alpha19-foss-2016b](['https://matsen.fhcrc.org/pplacer/'])
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pplacer/pplacer-1.1.alpha19-foss-2016b.eb)
Pplacer places reads on a phylogenetic tree. guppy (Grand
 Unified Phylogenetic Placement Yanalyzer) yanalyzes them. rppr is a helpful
 tool for working with reference packages.
 - [prodigal/2.6.3-GCC-5.4.0-2.26](http://prodigal.ornl.gov/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/prodigal/prodigal-2.6.3-GCC-5.4.0-2.26.eb)
Prodigal (Prokaryotic Dynamic Programming Genefinding
   Algorithm) is a microbial (bacterial and archaeal) gene finding program
   developed at Oak Ridge National Laboratory and the University of
   Tennessee.
 - [prokka/1.13-foss-2016b-BioPerl-1.7.0](http://www.vicbioinformatics.com/software.prokka.shtml)
Prokka is a software tool for the rapid annotation of prokaryotic genomes.
 - [psipred/4.01-foss-2016b](http://bioinf.cs.ucl.ac.uk/psipred/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/psipred/psipred-4.01-foss-2016b.eb)
The PSIPRED Protein Sequence Analysis Workbench aggregates several UCL structure prediction methods into one location.
 - [pyBigWig/0.3.13-foss-2016b-Python-3.6.6](https://github.com/deeptools/pyBigWig)
A python extension, written in C, for quick access to bigBed files and access to and creation of
 bigWig files.
 - [pyEGA3/3.0.44-foss-2016b-Python-3.7.4](https://github.com/EGA-archive/ega-download-client)
A basic Python-based EGA download client 
 - [pybedtools/0.8.0-foss-2016b-Python-3.7.4](https://daler.github.io/pybedtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pybedtools/pybedtools-0.8.0-foss-2016b-Python-3.7.4.eb)
pybedtools wraps and extends BEDTools and offers feature-level manipulations from
 within Python.
 - [python-Levenshtein/0.12.0-foss-2016b-Python-3.6.6](https://github.com/ztane/python-Levenshtein)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/python-Levenshtein/python-Levenshtein-0.12.0-foss-2016b-Python-3.6.6.eb)
The Levenshtein Python C extension module contains functions for fast computation of;
 Levenshtein (edit) distance, and edit operations
 string similarity
 approximate median strings, and generally string averaging
 string sequence and set similarity.
 - [qcat/1.0.5-foss-2016b-Python-3.6.6](https://github.com/nanoporetech/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/q/qcat/qcat-1.0.5-foss-2016b-Python-3.6.6.eb)
Qcat is Python command-line tool for demultiplexing Oxford
 Nanopore reads from FASTQ files.
 - [samblaster/0.1.22-foss-2016a](https://github.com/GregoryFaust/samblaster )
samblaster is a fast and flexible program for marking duplicates in read-id grouped1 paired-end SAM files.
 - [seqtk/1.3-foss-2016b](https://bitbucket.org/statgen/xhmm/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/seqtk/seqtk-1.3-foss-2016b.eb)
Seqtk is a fast and lightweight tool for processing sequences in the FASTA or FASTQ format. It seamlessly parses both FASTA and FASTQ files which can also be optionally compressed by gzip.
 - [smallgenomeutilities/1.0-foss-2016b-Python-3.6.6](https://github.com/cbg-ethz/smallgenomeutilities)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/smallgenomeutilities/smallgenomeutilities-1.0-foss-2016b-Python-3.6.6.eb)
The smallgenomeutilities are a collection of scripts that is
 useful for dealing and manipulating NGS data of small viral genomes. They
 are written in Python 3 with a small number of dependencies.
 - [smithwaterman/1.1-foss-2016b](https://github.com/mengyao/Complete-Striped-Smith-Waterman-Library)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/smithwaterman/smithwaterman-1.1-foss-2016b.eb)
Overview SSW is a fast implementation of the Smith-Waterman
 algorithm, which uses the Single-Instruction Multiple-Data (SIMD)
 instructions to parallelize the algorithm at the instruction level.
 - [snippy/4.4.1-foss-2016b-Perl-5.28.0](https://github.com/tseemann/snippy)
Snippy finds SNPs between a haploid reference genome and your NGS sequence
 reads. It will find both substitutions (snps) and insertions/deletions (indels).
Rapid haploid variant calling and core genome alignment.
 - [strelka/2.9.9-foss-2016b](https://github.com/Illumina/strelka)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/strelka/strelka-2.9.9-foss-2016b.eb)
Strelka2 is a fast and accurate small variant caller
 optimized for analysis of germline variation in small cohorts and
 somatic variation in tumor/normal sample pairs.
 - [summovie/1.0.2-binary](http://grigoriefflab.janelia.org/unblur)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/summovie/summovie-1.0.2-binary.eb)
Unblur is used to align the frames of movies recorded on an
 electron microscope to reduce image blurring due to beam-induced motion. Movie
frame sums can also be calculated using Summovie, which uses the alignment
results from a prior run of Unblur. 
 - [svtoolkit/2.00.1678-foss-2016a](http://www.broadinstitute.org/software/genomestrip/ )
Genome STRiP (Genome STRucture In Populations) is a suite of tools for discovering and genotyping structural variations using sequencing data. The methods are designed to detect shared variation using data from multiple individuals.
 - [svtyper/0.0.4-foss-2016b-Python-2.7.12-fh1](https://github.com/hall-lab/svtyper )
Bayesian genotyper for structural variants
 - [tabix/0.2.6-foss-2016b](http://samtools.sourceforge.net )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/tabix/tabix-0.2.6-foss-2016b.eb)
Generic indexer for TAB-delimited genome position files 
 - [tandem/17-01-01-2-foss-2016b](http://www.thegpm.org/TANDEM/instructions.html )
X! Tandem open source is software that can match tandem mass spectra with peptide sequences, in a process that has come to be known as protein identification.
 - [tcr-dist/0.0.2-foss-2016b-Python-2.7.15](https://github.com/phbradley/tcr-dist)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/tcr-dist/tcr-dist-0.0.2-foss-2016b-Python-2.7.15.eb)
Quantifiable predictive features define epitope-specific T cell receptor repertoires
 - [terraphast/master-foss-2016b](https://github.com/xflouris/libpll/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/terraphast/terraphast-master-foss-2016b.eb)
libpll is a versatile high-performance software library for phylogenetic analysis.
 - [unblur/1.0.2-binary](http://grigoriefflab.janelia.org/unblur)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/u/unblur/unblur-1.0.2-binary.eb)
Unblur is used to align the frames of movies recorded on an
 electron microscope to reduce image blurring due to beam-induced motion.
 - [v-pipe/1.0-foss-2016b](https://github.com/cbg-ethz/V-pipe)
V-pipe is a workflow designed for analysis of next generation
 sequencing (NGS) data from viral pathogens. It produces a number of results
 in a curated format.
 - [vdjpuzzle2/3771ca670a3a-foss-2016b](https://bitbucket.org/kirbyvisp/vdjpuzzle2)
TCR and BCR reconstruction from scRNA-seq data
 - [vdjtools/1.1.5-foss-2016b](https://github.com/milaboratory/mixcr)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/vdjtools/vdjtools-1.1.5-foss-2016b.eb)
VDJtools is an open-source Java/Groovy-based framework
designed to facilitate analysis of immune repertoire sequencing (RepSeq)
data. VDJtools computes a wide set of statistics and is able to perform
various forms of cross-sample analysis.
 - [vt/0.57721-foss-2016b](http://genome.sph.umich.edu/wiki/Vt)
A tool set for short variant discovery in genetic sequence data.
 - [wham/1.8.0-foss-2016a](https://github.com/zeeev/wham )
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/w/wham/wham-1.8.0-foss-2016a.eb)
The wham suite consists of two programs, wham and whamg. wham, the original tool, is a very sensitive method with a high false discovery rate. The second program, whamg, is more accurate and better suited for general structural variant (SV) discovery.
 - [womtool/36-Java-1.8](https://github.com/broadinstitute/cromwell)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/w/womtool/womtool-36-Java-1.8.eb)
Scientific workflow engine designed for simplicity &
scalability.
