---
title: Scientific Software Modules
primary_reviewers: fitzwit
---

On the command line and in scripts, we use the Environment Module system to make software versions available in a modular and malleable way. Environment Modules provide modular access to one version of one or more software packages to help improve reproducibility. We use a system called EasyBuild to create modules for everyone to use - there are over a thousand modules already available. The modules listed here are the software modules available currently on the `gizmo` compute cluster.
You can read more about how to use these modules and manage your compute environment on our [Compute Environments](/scicomputing/compute_environments/) page.

## R Modules
Specific information about which R Modules are available, including more information about packages installed in them can be found on our dedicated [R Module page](/rModules/).

## Python Modules
Specific information about which Python Modules and Bundles are available, including more information about packages installed in them can be found on our dedicated [Python Module page](/pythonModules/).

## Life Science/Bio Software Modules
Other software for life sciences that are available as modules can be found below.  If you do not see the software you are looking for, email `scicomp` to request it or add your own GitHub issue in the [easybuild-life-sciences repo](https://github.com/FredHutch/easybuild-life-sciences).  Either way, please be specific about the source and version of the software you are interested in.  

<!---DO NOT EDIT BELOW HERE, content comes from easybuild-life-science/docs/bio-modules-18.04.md--->

 - [ASE/3.22.0-foss-2020b](https://wiki.fysik.dtu.dk/ase)
ASE is a python package providing an open source Atomic Simulation Environment
 in the Python scripting language.

From version 3.20.1 we also include the ase-ext package, it contains optional reimplementations
in C of functions in ASE.  ASE uses it automatically when installed.
 - [AUGUSTUS/3.4.0-foss-2020b](https://bioinf.uni-greifswald.de/augustus/)
AUGUSTUS is a program that predicts genes in eukaryotic genomic sequences
 - [AdapterRemoval/2.2.2-foss-2018b](https://github.com/MikkelSchubert/adapterremoval)
AdapterRemoval searches for and removes remnant adapter sequences
 from High-Throughput Sequencing (HTS) data and (optionally) trims low quality bases
 from the 3' end of reads following adapter removal.
 - [AlphaFold/2.1.1-fosscuda-2020b](https://deepmind.com/research/case-studies/alphafold)
AlphaFold can predict protein structures with atomic accuracy even where no similar structure is known
 - [Arriba/2.1.0-GCC-10.2.0](https://github.com/suhrig/arriba)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/a/Arriba/Arriba-2.1.0-GCC-10.2.0.eb)
Arriba is a command-line tool for the detection of gene fusions from RNA-Seq data.
 It was developed for the use in a clinical research setting. Therefore, short runtimes and high
 sensitivity were important design criteria.
 - [BAli-Phy/3.6.0](http://www.bali-phy.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BAli-Phy/BAli-Phy-3.6.0.eb)
BAli-Phy estimates multiple sequence alignments and evolutionary trees from DNA, amino acid, 
or codon sequences.
 - [BBMap/38.91-GCC-10.2.0](https://sourceforge.net/projects/bbmap/)
BBMap short read aligner, and other bioinformatic tools.
 - [BCFtools/1.11-GCC-10.2.0](https://www.htslib.org/)
Samtools is a suite of programs for interacting with high-throughput sequencing data.
 BCFtools
 - [BEDOPS/2.4.35-foss-2018b](http://bedops.readthedocs.io/en/latest/index.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BEDOPS/BEDOPS-2.4.35-foss-2018b.eb)
BEDOPS is an open-source command-line toolkit that performs highly efficient and
 scalable Boolean and other set operations, statistical calculations, archiving, conversion and
 other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for
 distributing whole-genome analyses across a computational cluster.
 - [BEDTools/2.30.0-GCC-10.2.0](https://bedtools.readthedocs.io/)
BEDTools: a powerful toolset for genome arithmetic.
The BEDTools utilities allow one to address common genomics tasks such as finding feature overlaps and
computing coverage.
The utilities are largely based on four widely-used file formats: BED, GFF/GTF, VCF, and SAM/BAM.
 - [BLAST+/2.10.1-gompi-2020a](https://blast.ncbi.nlm.nih.gov/)
Basic Local Alignment Search Tool, or BLAST, is an algorithm
 for comparing primary biological sequence information, such as the amino-acid
 sequences of different proteins or the nucleotides of DNA sequences.
 - [BLAT/3.5-GCC-8.3.0](https://genome.ucsc.edu/FAQ/FAQblat.html)
BLAT on DNA is designed to quickly find sequences of 95% and
greater similarity of length 25 bases or more.
 - [BUStools/0.40.0-foss-2019b](https://github.com/BUStools/bustools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BUStools/BUStools-0.40.0-foss-2019b.eb)
bustools is a program for manipulating BUS files for single cell RNA-Seq datasets.
 It can be used to error correct barcodes, collapse  UMIs, produce gene count or transcript compatibility
 count matrices, and is useful for many other tasks. See the kallisto | bustools  website for examples
 and instructions on how to use bustools as part of a single-cell RNA-seq workflow.
 - [BWA/0.7.17-GCC-10.2.0](http://bio-bwa.sourceforge.net/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BWA/BWA-0.7.17-GCC-10.2.0.eb)
Burrows-Wheeler Aligner (BWA) is an efficient program that aligns
 relatively short nucleotide sequences against a long reference sequence such as the human genome.
 - [BamTools/2.5.1-GCC-10.2.0](https://github.com/pezmaster31/bamtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BamTools/BamTools-2.5.1-GCC-10.2.0.eb)
BamTools provides both a programmer's API and an end-user's toolkit for handling BAM files.
 - [BaseSpaceCLI/1.5.1](https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-overview)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BaseSpaceCLI/BaseSpaceCLI-1.5.1.eb)
BaseSpace is a powerful website where biologists and informaticians can easily store,
 analyze, and share genetic data. BaseSpace is a commerical product from Illumina.
 - [Beagle/5.2.1](https://faculty.washington.edu/browning/beagle/beagle.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Beagle/Beagle-5.2.1.eb)
Beagle is a software package for phasing genotypes and for imputing ungenotyped markers.
 - [Beast/2.6.3-GCC-10.2.0](http://beast2.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Beast/Beast-2.6.3-GCC-10.2.0.eb)
BEAST is a cross-platform program for Bayesian MCMC analysis of molecular 
 sequences. It is entirely orientated towards rooted, time-measured phylogenies inferred using 
 strict or relaxed molecular clock models. It can be used as a method of reconstructing phylogenies 
 but is also a framework for testing evolutionary hypotheses without conditioning on a single 
 tree topology. BEAST uses MCMC to average over tree space, so that each tree is weighted 
 proportional to its posterior probability. 
 - [Bio-DB-HTS/3.01-GCC-10.2.0](https://metacpan.org/release/Bio-DB-HTS)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Bio-DB-HTS/Bio-DB-HTS-3.01-GCC-10.2.0.eb)
Read files using HTSlib including BAM/CRAM, Tabix and BCF database files
 - [BioPerl/1.7.8-GCCcore-10.2.0](https://bioperl.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/BioPerl/BioPerl-1.7.8-GCCcore-10.2.0.eb)
Bioperl is the product of a community effort to produce Perl code which is useful in biology.
 Examples include Sequence objects, Alignment objects and database searching objects.
 - [Biopython/1.78-foss-2020b-Python-3.8.6](https://www.biopython.org)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Biopython/Biopython-1.78-foss-2020b-Python-3.8.6.eb)
Biopython is a set of freely available tools for biological
 computation written in Python by an international team of developers. It is
 a distributed collaborative effort to develop Python libraries and
 applications which address the needs of current and future work in
 bioinformatics. 
 - [Bowtie/1.3.0-GCC-10.2.0](http://bowtie-bio.sourceforge.net/index.shtml)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/Bowtie/Bowtie-1.3.0-GCC-10.2.0.eb)
Bowtie is an ultrafast, memory-efficient short read aligner.
 It aligns short DNA sequences (reads) to the human genome.
 - [Bowtie2/2.4.2-GCC-10.2.0](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads
 to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s
 of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes.
 Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome,
 its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes.
 - [CD-HIT/4.8.1-foss-2018b](http://weizhong-lab.ucsd.edu/cd-hit/)
CD-HIT is a very widely used program for clustering and 
 comparing protein or nucleotide sequences.
 - [CITE-seq-Count/1.4.2-foss-2018b-Python-3.6.6](https://hoohm.github.io/CITE-seq-Count)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CITE-seq-Count/CITE-seq-Count-1.4.2-foss-2018b-Python-3.6.6.eb)
A python package that allows to count antibody TAGS from a CITE-seq and/or
 cell hashing experiment.
 - [CNVkit/0.9.7-foss-2019b-Python-3.7.4-R-3.6.2](http://github.com/etal/cnvkit)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CNVkit/CNVkit-0.9.7-foss-2019b-Python-3.7.4-R-3.6.2.eb)
A command-line toolkit and Python library for detecting copy
 number variants and alterations genome-wide from high-throughput sequencing.
 - [CRISPRCasTyper/1.2.1-foss-2020a-Python-3.8.2](https://github.com/Russel88/CRISPRCasTyper)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CRISPRCasTyper/CRISPRCasTyper-1.2.1-foss-2020a-Python-3.8.2.eb)
Detect CRISPR-Cas genes and arrays, and predict the subtype based on both Cas genes and CRISPR repeat sequence.
 - [CellProfiler/4.1.3-foss-2020b](http://cellprofiler.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CellProfiler/CellProfiler-4.1.3-foss-2020b.eb)
CellProfiler is a free open-source software designed to enable biologists without training in computer vision or programming to quantitatively measure phenotypes from thousands of images automatically.
 - [CellRanger/6.1.1](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CellRanger/CellRanger-6.1.1.eb)
Cell Ranger is a set of analysis pipelines that process Chromium
 single-cell RNA-seq output to align reads, generate gene-cell matrices and perform
 clustering and gene expression analysis.
 - [CellRanger-ARC/2.0.0](https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/pipelines/latest/what-is-cell-ranger-arc)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CellRanger-ARC/CellRanger-ARC-2.0.0.eb)
Cell Ranger ARC is a set of analysis pipelines that process
 Chromium Single Cell Multiome ATAC + Gene Expression sequencing data to generate a
 variety of analyses pertaining to gene expression, chromatin accessibility and
 their linkage. Furthermore, since the ATAC and gene expression measurements are on
 the very same cell, we are able to perform analyses that link chromatin
 accessibility and gene expression.
 - [CellRanger-ATAC/2.0.0](https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/what-is-cell-ranger-atac)
Cell Ranger ATAC is a set of analysis pipelines that process 
Chromium Single Cell ATAC data.
 - [Cellpose/0.6.5-fosscuda-2020b](http://cellpose.org/)
Cellpose is an anatomical segmentation algorithm written in Python 3 by Carsen 
Stringer and Marius Pachitariu.
 - [Cgl/0.60.3-GCCcore-10.2.0](https://github.com/coin-or/Clg)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Cgl/Cgl-0.60.3-GCCcore-10.2.0.eb)
The COIN-OR Cut Generation Library (Cgl) is a collection of cut generators that
 can be used with other COIN-OR packages that make use of cuts, such as, among others, the linear
 solver Clp or the mixed integer linear programming solvers Cbc or BCP. Cgl uses the abstract class
 OsiSolverInterface (see Osi) to use or communicate with a solver. It does not directly call
 a solver.
 - [Circos/0.69-6-GCCcore-7.3.0-Perl-5.28.0](http://www.circos.ca/)
Circos is a software package for visualizing data and information.
 It visualizes data in a circular layout
 - [Clp/1.17.6-GCCcore-10.2.0](https://github.com/coin-or/Clp)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Clp/Clp-1.17.6-GCCcore-10.2.0.eb)
Clp (Coin-or linear programming) is an open-source linear programming solver
 - [Clustal-Omega/1.2.4-GCC-8.3.0](http://www.clustal.org/omega/)
Clustal Omega is a multiple sequence alignment
 program for proteins. It produces biologically meaningful multiple
 sequence alignments of divergent sequences. Evolutionary relationships
 can be seen via viewing Cladograms or Phylograms 
 - [ClustalW2/2.1-foss-2019b](https://www.ebi.ac.uk/Tools/msa/clustalw2/)
ClustalW2 is a general purpose multiple sequence alignment program for DNA or proteins.
 - [CoinUtils/2.11.4-GCCcore-10.2.0](https://github.com/coin-or/CoinUtils)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/CoinUtils/CoinUtils-2.11.4-GCCcore-10.2.0.eb)
CoinUtils (Coin-OR Utilities) is an open-source collection of classes and
functions that are generally useful to more than one COIN-OR project.
 - [Control-FREEC/11.5-GCC-8.3.0](https://github.com/BoevaLab/FREEC)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Control-FREEC/Control-FREEC-11.5-GCC-8.3.0.eb)
Copy number and genotype annotation from whole 
genome and whole exome sequencing data.
 - [Cufflinks/2.2.1-foss-2018b](http://cole-trapnell-lab.github.io/cufflinks/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/Cufflinks/Cufflinks-2.2.1-foss-2018b.eb)
Transcript assembly, differential expression, and differential regulation for RNA-Seq
 - [DIAMOND/0.9.22-foss-2018b](https://github.com/bbuchfink/diamond)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/d/DIAMOND/DIAMOND-0.9.22-foss-2018b.eb)
Accelerated BLAST compatible local sequence aligner
 - [Delly/0.9.1-gompi-2020b](https://github.com/dellytools/delly/)
Delly is an integrated structural variant (SV) prediction
method that can discover, genotype and visualize deletions, tandem duplications,
inversions and translocations at single-nucleotide resolution in short-read
massively parallel sequencing data. It uses paired-ends, split-reads and
read-depth to sensitively and accurately delineate genomic rearrangements
throughout the genome.
 - [EIGENSOFT/7.2.1-foss-2019b](https://www.hsph.harvard.edu/alkes-price/software/)
The EIGENSOFT package combines functionality from our population genetics methods (Patterson et al. 
2006)  and our EIGENSTRAT stratification correction method (Price et al. 2006). The EIGENSTRAT method uses principal 
components  analysis to explicitly model ancestry differences between cases and controls along continuous axes of 
variation;  the resulting correction is specific to a candidate marker’s variation in frequency across ancestral 
populations,  minimizing spurious associations while maximizing power to detect true associations. The EIGENSOFT 
package has a built-in plotting script and supports multiple file formats and quantitative phenotypes.
 - [EMAN2/2.3-foss-2019b-Python-2.7.16](https://blake.bcm.edu/emanwiki/EMAN2)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/e/EMAN2/EMAN2-2.3-foss-2019b-Python-2.7.16.eb)
EMAN2 is the successor to EMAN1. It is a broadly based greyscale scientific image processing suite
 with a primary focus on processing data from transmission electron microscopes. 
 - [EMBOSS/6.6.0-foss-2018b](http://emboss.sourceforge.net/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/e/EMBOSS/EMBOSS-6.6.0-foss-2018b.eb)
EMBOSS is 'The European Molecular Biology Open Software Suite'
 EMBOSS is a free Open Source software analysis package specially developed for
 the needs of the molecular biology (e.g. EMBnet) user community.
 - [EPACTS/3.3.2-foss-2020b](http://github.com/statgen/EPACTS)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/e/EPACTS/EPACTS-3.3.2-foss-2020b.eb)
EPACTS is a versatile software pipeline to perform various statistical tests for identifying genome-wide association from sequence data through a user-friendly interface, both to scientific analysts and to method developer.s
 - [Eigen/3.3.9-GCCcore-10.2.0](https://eigen.tuxfamily.org)
Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers,
 and related algorithms.
 - [FASTX-Toolkit/0.0.14-GCCcore-8.3.0](http://hannonlab.cshl.edu/fastx_toolkit/)
The FASTX-Toolkit is a collection of command line tools for 
 Short-Reads FASTA/FASTQ files preprocessing.
 - [FLASH/2.2.00-foss-2018b](https://ccb.jhu.edu/software/FLASH/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FLASH/FLASH-2.2.00-foss-2018b.eb)
FLASH (Fast Length Adjustment of SHort reads) is a very fast
and accurate software tool to merge paired-end reads from next-generation
sequencing experiments. FLASH is designed to merge pairs of reads when the
original DNA fragments are shorter than twice the length of reads. The
resulting longer reads can significantly improve genome assemblies. They can
also improve transcriptome assembly when FLASH is used to merge RNA-seq data.

 - [FSL/5.0.11-foss-2018b-Python-3.6.6](http://www.fmrib.ox.ac.uk/fsl/)
FSL is a comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data.
 - [FastANI/1.1-foss-2018b](http://www.iodbc.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FastANI/FastANI-1.1-foss-2018b.eb)
FastANI is developed for fast alignment-free computation of
 whole-genome Average Nucleotide Identity (ANI). ANI is defined as mean
 nucleotide identity of orthologous gene pairs shared between two microbial
 genomes. FastANI supports pairwise comparison of both complete and draft
 genome assemblies.
 - [FastQC/0.11.9-Java-11](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
FastQC is a quality control application for high throughput
sequence data. It reads in sequence data in a variety of formats and can either
provide an interactive application to review the results of several different
QC checks, or create an HTML based report which can be integrated into a
pipeline.
 - [FastTree/2.1.10-foss-2018b](http://www.microbesonline.org/fasttree/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/FastTree/FastTree-2.1.10-foss-2018b.eb)
FastTree infers approximately-maximum-likelihood phylogenetic
 trees from alignments of nucleotide or protein sequences. FastTree can handle
 alignments with up to a million of sequences in a reasonable amount of
 time and memory. 
 - [FlashPCA2/2.0-GCC-10.2.0](https://github.com/gabraham/flashpca)
FlashPCA performs fast principal component analysis (PCA) of single nucleotide
 polymorphism (SNP) data.
 - [GATK/4.2.2.0-GCCcore-10.2.0-Java-11](https://www.broadinstitute.org/gatk/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GATK/GATK-4.2.2.0-GCCcore-10.2.0-Java-11.eb)
The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute
 to analyse next-generation resequencing data. The toolkit offers a wide variety of tools,
 with a primary focus on variant discovery and genotyping as well as strong emphasis on
 data quality assurance. Its robust architecture, powerful processing engine and
 high-performance computing features make it capable of taking on projects of any size.
 - [GCTA/1.92.2beta](https://cnsgenomics.com/software/gcta)
GCTA (Genome-wide Complex Trait Analysis) was originally designed to
 estimate the proportion of phenotypic variance explained by all genome-wide SNPs for
 complex traits (the GREML method), and has subsequently extended for many other analyses
 to better understand the genetic architecture of complex traits.
 - [GD/2.69-GCCcore-7.3.0-Perl-5.28.0](https://github.com/lstein/Perl-GD)
GD.pm
 - [GEOS/3.9.1-GCC-10.2.0](https://trac.osgeo.org/geos)
GEOS (Geometry Engine
 - [GISTIC/2.0.23-GCCcore-8.3.0](www.broadinstitute.org/cancer/cga/gistc)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GISTIC/GISTIC-2.0.23-GCCcore-8.3.0.eb)
GISTIC is a tool to identify genes targeted by somatic copy-number alterations (SCNAs) that drive cancer growth. By separating SCNA profiles into underlying arm-level and focal alterations, GISTIC estimates the background rates for each category as well as defines the boundaries of SCNA regions.
 - [GMAP-GSNAP/2018-07-04-foss-2018b](http://research-pub.gene.com/gmap/)
GMAP: A Genomic Mapping and Alignment Program for mRNA and EST Sequences
 GSNAP: Genomic Short-read Nucleotide Alignment Program
 - [GMP/6.2.0-GCCcore-10.2.0](https://gmplib.org/)
GMP is a free library for arbitrary precision arithmetic, operating on signed
 integers, rational numbers, and floating point numbers.

 - [GRIDSS/2.12.0-foss-2020b](https://github.com/PapenfussLab/gridss/wiki/GRIDSS-Documentation)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GRIDSS/GRIDSS-2.12.0-foss-2020b.eb)
GRIDSS is a module software suite containing tools useful for
the detection of genomic rearrangements. GRIDSS includes a genome-wide
break-end assembler, as well as a structural variation caller for Illumina
sequencing data. GRIDSS calls variants based on alignment-guided positional de
Bruijn graph genome-wide break-end assembly, split read, and read pair
evidence.
 - [GROMACS/2021-foss-2020b-CUDA-11.1.1-PLUMED-2.7.2](https://www.gromacs.org)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/GROMACS/GROMACS-2021-foss-2020b-CUDA-11.1.1-PLUMED-2.7.2.eb)
GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the
Newtonian equations of motion for systems with hundreds to millions of
particles.

This is a GPU enabled build, containing both MPI and threadMPI builds.

It also contains the gmxapi extension for the single precision MPI build.

 - [GenomeSTRiP/2.00.1958-GCCcore-8.3.0-Java-11](https://www.broadinstitute.org/software/genomestrip)
Genome STRiP (Genome STRucture In Populations) is a suite of
tools for discovery and genotyping of structural variation using whole-genome
sequencing data. The methods used in Genome STRiP are designed to find shared
variation using data from multiple individuals. Genome STRiP looks both across
and within a set of sequenced genomes to detect variation.
 - [HH-suite/3.3.0-gompi-2020b](https://github.com/soedinglab/hh-suite)
The HH-suite is an open-source software package 
for sensitive protein sequence searching based on the pairwise 
alignment of hidden Markov models (HMMs).
 - [HISAT2/2.1.0-foss-2018b](https://ccb.jhu.edu/software/hisat2/index.shtml)
HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads
 (both DNA and RNA) against the general human population (as well as against a single reference genome).
 - [HMMER/3.3.2-gompi-2020b](http://hmmer.org/)
HMMER is used for searching sequence databases for homologs
 of protein sequences, and for making protein sequence alignments. It
 implements methods using probabilistic models called profile hidden Markov
 models (profile HMMs).  Compared to BLAST, FASTA, and other sequence
 alignment and database search tools based on older scoring methodology,
 HMMER aims to be significantly more accurate and more able to detect remote
 homologs because of the strength of its underlying mathematical models. In the
 past, this strength came at significant computational expense, but in the new
 HMMER3 project, HMMER is now essentially as fast as BLAST.
 - [HOME/1.0.0-foss-2019b-Python-3.7.4](https://github.com/ListerLab/HOME)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/HOME/HOME-1.0.0-foss-2019b-Python-3.7.4.eb)
HOME (histogram of methylation) is a python package for differential methylation region (DMR)
 identification. The method uses histogram of methylation features and the linear Support Vector Machine (SVM)
 to identify DMRs from whole genome bisulfite sequencing (WGBS) data.
 - [HTSeq/0.11.0-foss-2018b-Python-2.7.15](http://www-huber.embl.de/users/anders/HTSeq/)
A framework to process and analyze data from high-throughput sequencing (HTS) assays
 - [HTSlib/1.11-GCC-10.2.0](https://www.htslib.org/)
A C library for reading/writing high-throughput sequencing data.
 This package includes the utilities bgzip and tabix
 - [Hail/0.2.64-foss-2020b](https://hail.is/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/Hail/Hail-0.2.64-foss-2020b.eb)
Hail is an open-source, general-purpose, Python-based data analysis tool with
 additional data types and methods for working with genomic data.
 - [IDBA-UD/1.1.3-foss-2018b](http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/)
IDBA-UD is a iterative De Bruijn Graph De Novo Assembler for Short Reads
 Sequencing data with Highly Uneven Sequencing Depth. It is an extension of IDBA algorithm.
 IDBA-UD also iterates from small k to a large k. In each iteration, short and low-depth
 contigs are removed iteratively with cutoff threshold from low to high to reduce the errors
 in low-depth and high-depth regions. Paired-end reads are aligned to contigs and assembled
 locally to generate some missing k-mers in low-depth regions. With these technologies, IDBA-UD
 can iterate k value of de Bruijn graph to a very large value with less gaps and less branches
 to form long contigs in both low-depth and high-depth regions.
 - [IGV/2.9.4-Java-11](https://www.broadinstitute.org/software/igv/)
This package contains command line utilities for
 preprocessing, computing feature count density (coverage),  sorting, and
 indexing data files.
 - [IGVTools/2.4.16-Java-1.8](http://www.broadinstitute.org/software/igv/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/IGVTools/IGVTools-2.4.16-Java-1.8.eb)
This package contains command line utilities for preprocessing, 
 computing feature count density (coverage),  sorting, and indexing data files.
 See also http://www.broadinstitute.org/software/igv/igvtools_commandline. 
 - [ISL/0.23-GCCcore-10.2.0](http://isl.gforge.inria.fr/)
isl is a library for manipulating sets and relations of integer points bounded by linear constraints.
 - [IgBLAST/1.15.0-x64-linux](https://ncbi.github.io/igblast)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/IgBLAST/IgBLAST-1.15.0-x64-linux.eb)
IgBLAST faclilitates the analysis of immunoglobulin and T cell receptor variable domain sequences.
 - [JAGS/4.3.0-foss-2018b](http://mcmc-jags.sourceforge.net/)
JAGS is Just Another Gibbs Sampler.  It is a program for analysis 
 of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation  
 - [Jellyfish/2.3.0-GCC-10.2.0](http://www.genome.umd.edu/jellyfish.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/j/Jellyfish/Jellyfish-2.3.0-GCC-10.2.0.eb)
Jellyfish is a tool for fast, memory-efficient counting of k-mers in DNA.
 - [Kalign/3.3.1-GCCcore-10.2.0](https://github.com/TimoLassmann/kalign)
Kalign is a fast multiple sequence alignment program for biological sequences.
 - [Kent_tools/20201201-linux.x86_64](http://genome.cse.ucsc.edu/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/Kent_tools/Kent_tools-20201201-linux.x86_64.eb)
Jim Kent's tools: collection of tools used by the UCSC genome browser.
 - [Keras/2.4.3-foss-2020b](https://keras.io/)
Keras is a deep learning API written in Python, running on top of the machine learning platform TensorFlow.

 - [Kraken2/2.0.9-beta-gompi-2020a-Perl-5.30.2](http://www.ccb.jhu.edu/software/kraken2/)
Kraken is a system for assigning taxonomic labels to short DNA sequences,
 usually obtained through metagenomic studies. Previous attempts by other
 bioinformatics software to accomplish this task have often used sequence
 alignment or machine learning techniques that were quite slow, leading to
 the development of less sensitive but much faster abundance estimation
 programs. Kraken aims to achieve high sensitivity and high speed by
 utilizing exact alignments of k-mers and a novel classification algorithm.
 - [LAST/963-foss-2018b](http://last.cbrc.jp/)
LAST finds similar regions between sequences.
 - [LoFreq/2.1.3.1-foss-2018b-Python-2.7.15](http://csb5.github.io/lofreq)
Fast and sensitive variant calling from next-gen sequencing data
 - [MACS2/2.2.6-foss-2019b-Python-3.7.4](https://github.com/taoliu/MACS/)
Model Based Analysis for ChIP-Seq data
 - [MAESTRO/1.2.1-foss-2019b-Python-3.7.4](https://github.com/liulab-dfci/MAESTRO)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MAESTRO/MAESTRO-1.2.1-foss-2019b-Python-3.7.4.eb)
MAESTRO(Model-based AnalysEs of Single-cell Transcriptome and RegulOme) is a comprehensive
 single-cell RNA-seq and ATAC-seq analysis suit built using snakemake. MAESTRO combines several dozen tools and
 packages to create an integrative pipeline, which enables scRNA-seq and scATAC-seq analysis from raw sequencing
 data (fastq files) all the way through alignment, quality control, cell filtering, normalization, unsupervised
 clustering, differential expression and peak calling, celltype annotation and transcription regulation analysis.
 - [MAFFT/7.453-GCC-8.3.0-with-extensions](https://mafft.cbrc.jp/alignment/software/source.html)
MAFFT is a multiple sequence alignment program 
 for unix-like operating systems.  It offers a range of multiple
 alignment methods, L-INS-i (accurate; for alignment of <∼200 sequences), 
 FFT-NS-2 (fast; for alignment of <∼10,000 sequences), etc.
 - [MAGeCK-VISPR/0.5.5-Python-3.7.4](https://bitbucket.org/liulab/mageck-vispr/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MAGeCK-VISPR/MAGeCK-VISPR-0.5.5-Python-3.7.4.eb)
MAGeCK-VISPR is a comprehensive quality control, analysis and visualization workflow for CRISPR/Cas9
  screens The workflow combines the MAGeCK algorithm to identify essential genes from CRISPR/Cas9 screens considering
  multiple conditions with VISPR to interactively explore results and quality control in a web-based frontend.
 - [MAGeCK-VISPR/0.5.5-Python-3.7.4](https://bitbucket.org/liulab/mageck-vispr/)
MAGeCK-VISPR is a comprehensive quality control, analysis and visualization workflow for CRISPR/Cas9
  screens The workflow combines the MAGeCK algorithm to identify essential genes from CRISPR/Cas9 screens considering
  multiple conditions with VISPR to interactively explore results and quality control in a web-based frontend.
 - [MEME/5.1.1-foss-2019b-Perl-5.30.0-Python-3.7.4](http://meme-suite.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MEME/MEME-5.1.1-foss-2019b-Perl-5.30.0-Python-3.7.4.eb)
The MEME Suite allows you to: * discover motifs using MEME, DREME (DNA only) or
  GLAM2 on groups of related DNA or protein sequences, * search sequence databases with motifs using
  MAST, FIMO, MCAST or GLAM2SCAN, * compare a motif to all motifs in a database of motifs, * associate
  motifs with Gene Ontology terms via their putative target genes, and * analyse motif enrichment
  using SpaMo or CentriMo.
 - [METIS/5.1.0-GCCcore-10.2.0](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview)
METIS is a set of serial programs for partitioning graphs, partitioning
 finite element meshes, and producing fill reducing orderings for sparse
 matrices. The algorithms implemented in METIS are based on the multilevel
 recursive-bisection, multilevel k-way, and multi-constraint partitioning
 schemes.

 - [MPC/1.2.1-GCCcore-10.2.0](http://www.multiprecision.org/)
Gnu Mpc is a C library for the arithmetic of
 complex numbers with arbitrarily high precision and correct
 rounding of the result. It extends the principles of the IEEE-754
 standard for fixed precision real floating point numbers to
 complex numbers, providing well-defined semantics for every
 operation. At the same time, speed of operation at high precision
 is a major design goal.
 - [MPFR/4.1.0-GCCcore-10.2.0](https://www.mpfr.org)
The MPFR library is a C library for multiple-precision floating-point
 computations with correct rounding.

 - [MUMPS/5.3.5-foss-2020b-metis](https://graal.ens-lyon.fr/MUMPS/)
A parallel sparse direct solver
 - [MUMmer/4.0.0beta2-foss-2018b](http://mummer.sourceforge.net/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MUMmer/MUMmer-4.0.0beta2-foss-2018b.eb)
MUMmer is a system for rapidly aligning entire genomes,
 whether in complete or draft form. AMOS makes use of it.
 - [MUSCLE/3.8.31-foss-2018b](http://drive5.com/muscle/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MUSCLE/MUSCLE-3.8.31-foss-2018b.eb)
MUSCLE is one of the best-performing multiple alignment programs 
 according to published benchmark tests, with accuracy and speed that are consistently 
 better than CLUSTALW. MUSCLE can align hundreds of sequences in seconds. Most users 
 learn everything they need to know about MUSCLE in a few minutes—only a handful of 
 command-line options are needed to perform common alignment tasks.
 - [Magic-BLAST/1.5.0-Linux_x86_64](https://ncbi.github.io/magicblast/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/Magic-BLAST/Magic-BLAST-1.5.0-Linux_x86_64.eb)
Magic-BLAST is a tool for mapping large next-generation RNA or DNA sequencing runs
 against a whole genome or transcriptome.
 - [MaxQuant/1.6.17.0-foss-2019b](https://www.maxquant.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MaxQuant/MaxQuant-1.6.17.0-foss-2019b.eb)
MaxQuant is a quantitative proteomics software package designed for analyzing large
 mass-spectrometric data sets. It is specifically aimed at high-resolution MS data. Several labeling
 techniques as well as label-free quantification are supported.
 - [Metal/2020-05-05-GCC-10.2.0](http://csg.sph.umich.edu/abecasis/Metal/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/Metal/Metal-2020-05-05-GCC-10.2.0.eb)
Metal
 - [MethGo/24c9319-foss-2018b-Python-2.7.15](https://methgo.readthedocs.io/en/latest/index.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MethGo/MethGo-24c9319-foss-2018b-Python-2.7.15.eb)
DNA methylation is a major epigenetic modification regulating several biological
 processes. A standard approach in the study of DNA methylation is bisulfite sequencing (BS-Seq).
 MethGo is a simple and effective tool designed for the analysis of data from whole genome bisulfite
 sequencing (WGBS) and reduced representation bisulfite sequencing (RRBS).
 - [MiXCR/3.0.3-Java-1.8](https://milaboratory.com/software/mixcr/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MiXCR/MiXCR-3.0.3-Java-1.8.eb)
MiXCR processes big immunome data from raw sequences 
to quantitated clonotypes 
 - [MinCED/0.4.2-GCCcore-8.3.0-Java-11](https://github.com/ctSkennerton/minced)
Mining CRISPRs in Environmental Datasets
 - [MoreRONN/4.9-foss-2019b](https://github.com/varun-ramraj/MoreRONN)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MoreRONN/MoreRONN-4.9-foss-2019b.eb)
MoreRONN is the spiritual successor of RONN and is useful for surveying disorder in proteins as well as designing expressible constructs for X-ray crystallography.
 - [Mothur/1.41.0-foss-2018b-Python-2.7.15](http://www.mothur.org/)
Mothur is a single piece of open-source, expandable software
 to fill the bioinformatics needs of the microbial ecology community.
 - [MotionCor2/1.4.2-gcccuda-2020b](https://msg.ucsf.edu/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MotionCor2/MotionCor2-1.4.2-gcccuda-2020b.eb)
MotionCor2 correct anisotropic image motion at the
single pixel level across the whole frame, suitable for both single
particle and tomographic images. Iterative, patch-based motion detection
is combined with spatial and temporal constraints and dose weighting.

Cite publication: Shawn Q. Zheng, Eugene Palovcak, Jean-Paul Armache,
Yifan Cheng and David A. Agard (2016) Anisotropic Correction of
Beam-induced Motion for Improved Single-particle Electron
Cryo-microscopy, Nature Methods, submitted.
BioArxiv: https://biorxiv.org/content/early/2016/07/04/061960

 - [MultiQC/1.9-foss-2019b-Python-3.7.4](https://multiqc.info)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MultiQC/MultiQC-1.9-foss-2019b-Python-3.7.4.eb)
Aggregate results from bioinformatics analyses across many samples into a single 
 report.

 MultiQC searches a given directory for analysis logs and compiles a HTML report. It's a general
 use tool, perfect for summarising the output from numerous bioinformatics tools.
 - [MutSig/2](http://software.broadinstitute.org/cancer/cga/mutsig)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/MutSig/MutSig-2.eb)
MutSig stands for "Mutation Significance".  MutSig analyzes lists of mutations
 discovered in DNA sequencing, to identify genes that were mutated more often than expected by
 chance given background mutation processes.
 - [NAMD/2.14-foss-2020a-mpi](https://www.ks.uiuc.edu/Research/namd/)
NAMD is a parallel molecular dynamics code designed for high-performance simulation of
 large biomolecular systems.
 - [NGS/2.10.9-GCCcore-10.2.0](https://github.com/ncbi/ngs)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/NGS/NGS-2.10.9-GCCcore-10.2.0.eb)
NGS is a new, domain-specific API for accessing reads, alignments and pileups
produced from Next Generation Sequencing.
 - [OpenMM/7.5.1-foss-2020b](https://openmm.org)
OpenMM is a toolkit for molecular simulation.
 - [OptiType/1.3.5-foss-2019b-Python-2.7.16](https://github.com/FRED-2/OptiType)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/OptiType/OptiType-1.3.5-foss-2019b-Python-2.7.16.eb)
OptiType is a novel HLA genotyping algorithm based on integer linear programming,
 capable of producing accurate 4-digit HLA genotyping predictions from NGS data
 by simultaneously selecting all major and minor HLA Class I alleles. 
 - [Osi/0.108.6-GCCcore-10.2.0](https://github.com/coin-or/Osi)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/Osi/Osi-0.108.6-GCCcore-10.2.0.eb)
Osi (Open Solver Interface) provides an abstract base class to a generic linear
programming (LP) solver, along with derived classes for specific solvers. Many
applications may be able to use the Osi to insulate themselves from a specific
LP solver. That is, programs written to the OSI standard may be linked to any
solver with an OSI interface and should produce correct results. The OSI has
been significantly extended compared to its first incarnation. Currently, the
OSI supports linear programming solvers and has rudimentary support for integer
programming.
 - [PANDAseq/2.11-foss-2018b](https://github.com/neufeld/pandaseq)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PANDAseq/PANDAseq-2.11-foss-2018b.eb)
PANDASEQ is a program to align Illumina reads, optionally
 with PCR primers embedded in the sequence, and reconstruct an overlapping
 sequence.
 - [PDBFixer/1.7-foss-2020b](https://github.com/openmm/pdbfixer)
PDBFixer is an easy to use application for fixing problems in Protein Data Bank files in preparation
for simulating them.
 - [PEAR/0.9.11-foss-2018b](http://sco.h-its.org/exelixis/web/software/pear/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PEAR/PEAR-0.9.11-foss-2018b.eb)
PEAR is an ultrafast, memory-efficient and highly accurate pair-end read merger. 
 It is fully parallelized and can run with as low as just a few kilobytes of memory.
 - [PHASE/2.1.2-GCCcore-8.3.0](http://stephenslab.uchicago.edu/phase/download.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PHASE/PHASE-2.1.2-GCCcore-8.3.0.eb)
PHASE is a program implementing the method for reconstructing haplotypes
 from population data
 - [PLINK/2.00-alpha1-x86_64](https://www.cog-genomics.org/plink/1.9/)
Whole-genome association analysis toolset
 - [PLINK2/20210826-linux_x86_64](https://www.cog-genomics.org/plink/2.0)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PLINK2/PLINK2-20210826-linux_x86_64.eb)
PLINK is a free, open-source whole genome association analysis toolset, designed to
 perform a range of basic, large-scale analyses in a computationally efficient manner.
 The focus of PLINK is purely on analysis of genotype/phenotype data.
 - [PLUMED/2.7.2-foss-2020b](https://www.plumed.org)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/PLUMED/PLUMED-2.7.2-foss-2020b.eb)
PLUMED is an open source library for free energy calculations in molecular systems which
 works together with some of the most popular molecular dynamics engines. Free energy calculations can be
 performed as a function of many order parameters with a particular  focus on biological problems, using
 state of the art methods such as metadynamics, umbrella sampling and Jarzynski-equation based steered MD.
 The software, written in C++, can be easily interfaced with both fortran and C/C++ codes.

 - [PLUMED/2.7.2-foss-2020b](https://www.plumed.org)
PLUMED is an open source library for free energy calculations in molecular systems which
 works together with some of the most popular molecular dynamics engines. Free energy calculations can be
 performed as a function of many order parameters with a particular  focus on biological problems, using
 state of the art methods such as metadynamics, umbrella sampling and Jarzynski-equation based steered MD.
 The software, written in C++, can be easily interfaced with both fortran and C/C++ codes.

 - [Pindel/0.2.5b9-20170508-foss-2018b](http://gmt.genome.wustl.edu/packages/pindel/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/Pindel/Pindel-0.2.5b9-20170508-foss-2018b.eb)
Pindel can detect breakpoints of large deletions, medium sized
 insertions, inversions, tandem duplications and other structural variants at single-based
 resolution from next-gen sequence data. It uses a pattern growth approach to identify the
 breakpoints of these variants from paired-end short reads. 
 - [Porechop/0.2.4-foss-2018b-Python-3.6.6](https://github.com/rrwick/Porechop)
Porechop is a tool for finding and removing adapters from Oxford Nanopore reads.
 Adapters on the ends of reads are trimmed off, and when a read has an adapter in its middle,
 it is treated as chimeric and chopped into separate reads. Porechop performs thorough alignments
 to effectively find adapters, even at low sequence identity
 - [Pyomo/5.7.3-foss-2019b-Python-3.7.4](http://www.pyomo.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/Pyomo/Pyomo-5.7.3-foss-2019b-Python-3.7.4.eb)
Pyomo is a Python-based open-source software package that supports a diverse set of optimization
 capabilities for formulating and analyzing optimization models. 
 - [Pysam/0.16.0.1-GCC-10.2.0](https://github.com/pysam-developers/pysam)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/Pysam/Pysam-0.16.0.1-GCC-10.2.0.eb)
Pysam is a python module for reading and manipulating Samfiles. 
 It's a lightweight wrapper of the samtools C-API. Pysam also includes an interface for tabix.
 - [QIIME2/2020.11](http://qiime2.org/)
QIIME is an open-source bioinformatics pipeline for performing microbiome analysis
 from raw DNA sequencing data.
 - [QUAST/5.1.0rc1-foss-2020b](https://github.com/ablab/quast)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/q/QUAST/QUAST-5.1.0rc1-foss-2020b.eb)
QUAST evaluates genome assemblies by computing various metrics.
It works both with and without reference genomes. The tool accepts multiple
assemblies, thus is suitable for comparison.
 - [R-bundle-Bioconductor/3.10-foss-2019b-R-3.6.2](https://bioconductor.org)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/R-bundle-Bioconductor/R-bundle-Bioconductor-3.10-foss-2019b-R-3.6.2.eb)
Bioconductor provides tools for the analysis and coprehension
 of high-throughput genomic data.
 - [R-keras/2.2.5.0-foss-2019b-Python-3.7.4-R-3.6.2](https://cran.r-project.org/web/packages/keras)
Interface to 'Keras' <https://keras.io>, a high-level neural networks 'API'. 
 - [RAxML/8.2.12-GCC-10.2.0-pthreads-avx2](https://github.com/stamatak/standard-RAxML)
RAxML search algorithm for maximum likelihood based inference of phylogenetic trees.
 - [RAxML-NG/1.0.3-GCC-10.2.0](https://github.com/amkozlov/raxml-ng)
RAxML-NG is a phylogenetic tree inference tool which uses maximum-likelihood (ML)
 optimality criterion. Its search heuristic is based on iteratively performing a series of Subtree
 Pruning and Regrafting (SPR) moves, which allows to quickly navigate to the best-known ML tree.
 - [RELION/3.1.2-fosscuda-2019b](https://github.com/3dem/relion)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RELION/RELION-3.1.2-fosscuda-2019b.eb)
RELION (for REgularised LIkelihood OptimisatioN) is a stand-alone computer
 program for Maximum A Posteriori refinement of (multiple) 3D reconstructions or 2D class
 averages in cryo-electron microscopy.
 - [RNA-SeQC/2.3.4-foss-2019b](https://software.broadinstitute.org/cancer/cga/rna-seqc)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RNA-SeQC/RNA-SeQC-2.3.4-foss-2019b.eb)
RNA-SeQC is a java program which computes a series of quality control metrics for
 RNA-seq data. The input can be one or more BAM files. The output consists of HTML reports and tab
 delimited files of metrics data. This program can be valuable for comparing sequencing quality
 across different samples or experiments to evaluate different experimental parameters. It can
 also be run on individual samples as a means of quality control before continuing with downstream
 analysis.
 - [ROSE/1-GCCcore-8.3.0-Python-2.7.16](http://younglab.wi.mit.edu/super_enhancer_code.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/ROSE/ROSE-1-GCCcore-8.3.0-Python-2.7.16.eb)
To create stitched enhancers, and to separate super-enhancers from typical enhancers using sequencing data (.bam) given a file of previously identified constituent enhancers (.gff)
 - [RSEM/1.3.3-foss-2019b](http://deweylab.github.io/RSEM/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RSEM/RSEM-1.3.3-foss-2019b.eb)
RNA-Seq by Expectation-Maximization
 - [RSeQC/3.0.0-foss-2018b-Python-3.6.6](http://rseqc.sourceforge.net/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RSeQC/RSeQC-3.0.0-foss-2018b-Python-3.6.6.eb)
RSeQC provides a number of useful modules that can 
 comprehensively evaluate high throughput sequence data especially RNA-seq 
 data. Some basic modules quickly inspect sequence quality, nucleotide 
 composition bias, PCR bias and GC bias, while RNA-seq specific modules 
 evaluate sequencing saturation, mapped reads distribution, coverage 
 uniformity, strand specificity, transcript level RNA integrity etc.
 - [Racon/1.4.13-GCCcore-8.3.0](https://github.com/lbcb-sci/racon)
Ultrafast consensus module for raw de novo genome assembly of long uncorrected reads.
 - [RepeatMasker/4.0.8-foss-2018b-Perl-5.28.0-HMMER](http://www.repeatmasker.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RepeatMasker/RepeatMasker-4.0.8-foss-2018b-Perl-5.28.0-HMMER.eb)
RepeatMasker is a program that screens DNA sequences for interspersed repeats
 and low complexity DNA sequences.
 - [RevBayes/1.1.1-GCC-10.2.0](https://revbayes.github.io/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/r/RevBayes/RevBayes-1.1.1-GCC-10.2.0.eb)
RevBayes provides an interactive environment for statistical computation in
 phylogenetics. It is primarily intended for modeling, simulation, and Bayesian inference in
 evolutionary biology, particularly phylogenetics.
 - [SAMtools/1.11-GCC-10.2.0](https://www.htslib.org/)
SAM Tools provide various utilities for manipulating alignments in the SAM format, 
 including sorting, merging, indexing and generating alignments in a per-position format.
 - [SCOTCH/6.1.0-foss-2020b](http://gforge.inria.fr/projects/scotch/)
Software package and libraries for sequential and parallel graph partitioning,
static mapping, and sparse matrix block ordering, and sequential mesh and hypergraph partitioning.
 - [SHAPEIT4/4.2.2-foss-2020b](https://odelaneau.github.io/shapeit4/)
SHAPEIT4 is a fast and accurate method for estimation of haplotypes
(aka phasing) for SNP array and high coverage sequencing data.

 - [SKESA/2.3.0-foss-2018b](https://github.com/ncbi/SKESA)
SKESA is a de-novo sequence read assembler for cultured single isolate genomes based on DeBruijn graphs.
 - [SPAdes/3.13.0-foss-2018b](http://cab.spbu.ru/software/spades/)
Genome assembler for single-cell and isolates data sets
 - [SPRING/1.6-foss-2018b-Python-2.7.15](http://https://github.com/AllonKleinLab/SPRING_dev)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SPRING/SPRING-1.6-foss-2018b-Python-2.7.15.eb)
SPRING is a collection of pre-processing scripts and a web
browser-based tool for visualizing and interacting with high dimensional data.
View an example dataset here. SPRING was developed for single cell RNA-Seq data
but can be applied more generally. The minimal input is a matrix of high
dimensional data points (cells) and a list of dimension names (genes).
 - [SQANTI3/1.0-foss-2019b-Python-3.7.4](https://github.com/ConesaLab/SQANTI3)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SQANTI3/SQANTI3-1.0-foss-2019b-Python-3.7.4.eb)
SQANTI3 is the first module of the Functional IsoTranscriptomics (FIT) framework,
 that also includes IsoAnnot and tappAS. Used for new long read-defined transcriptome.
 - [SRA-Toolkit/2.11.0-gompi-2020b](https://github.com/ncbi/sra-tools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SRA-Toolkit/SRA-Toolkit-2.11.0-gompi-2020b.eb)
The SRA Toolkit, and the source-code SRA System Development
 Kit (SDK), will allow you to programmatically access data housed within SRA
 and convert it from the SRA format
 - [STAR/2.7.7a-GCC-10.2.0](https://github.com/alexdobin/STAR)
STAR aligns RNA-seq reads to a reference genome using uncompressed suffix arrays.
 - [STAR-Fusion/1.10.0-foss-2020b-Perl-5.32.0](https://github.com/STAR-Fusion/STAR-Fusion)
STAR-Fusion uses the STAR aligner to identify candidate fusion transcripts
 supported by Illumina reads. STAR-Fusion further processes the output generated by the STAR aligner
 to map junction reads and spanning reads to a reference annotation set.
 - [SYMPHONY/5.6.17-GCCcore-10.2.0](https://github.com/coin-or/SYMPHONY/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SYMPHONY/SYMPHONY-5.6.17-GCCcore-10.2.0.eb)
SYMPHONY is an open-source solver for mixed-integer linear programs (MILPs)
 written in C. It can be used in four different main modes.
 - [Salmon/1.4.0-gompi-2020b](https://github.com/COMBINE-lab/salmon)
Salmon is a wicked-fast program to produce a highly-accurate,
 transcript-level quantification estimates from RNA-seq data.
 - [Seaborn/0.11.1-foss-2020b](https://seaborn.pydata.org/)
Seaborn is a Python visualization library based on matplotlib.
 It provides a high-level interface for drawing attractive statistical graphics. 
 - [SeqAn/2.4.0-GCCcore-8.3.0](https://github.com/seqan/seqan)
SeqAn is an open source C++ library of efficient algorithms and data structures
 for the analysis of sequences with the focus on biological data.

 - [SeqLib/1.2.0-GCC-10.2.0](https://github.com/walaj/SeqLib)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SeqLib/SeqLib-1.2.0-GCC-10.2.0.eb)
C++ interface to HTSlib, BWA-MEM and Fermi
 - [SeqPrep/1.3.2-GCCcore-8.3.0](https://github.com/jstjohn/SeqPrep)
Tool for stripping adaptors and/or merging paired reads with overlap into single reads.
 - [Seqmagick/0.6.2-foss-2018b-Python-2.7.15](https://fhcrc.github.io/seqmagick/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/Seqmagick/Seqmagick-0.6.2-foss-2018b-Python-2.7.15.eb)
We often have to convert between sequence formats and do
 little tasks on them, and it's not worth writing scripts for that. Seqmagick
 is a kickass little utility built in the spirit of imagemagick to expose the
 file format conversion in Biopython in a convenient way. Instead of having a
 big mess of scripts, there is one that takes arguments.
 - [Seurat/4.0.0-foss-2019b-R-4.0.2](https://satijalab.org/seurat)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/Seurat/Seurat-4.0.0-foss-2019b-R-4.0.2.eb)
Seurat is an R package designed for QC, analysis, and exploration of single cell RNA-seq data.
 - [Sniffles/1.0.8-foss-2018b](https://github.com/fritzsedlazeck/Sniffles)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/Sniffles/Sniffles-1.0.8-foss-2018b.eb)
Sniffles is a structural variation caller using third
 generation sequencing (PacBio or Oxford Nanopore). It detects all types of
 SVs (10bp+) using evidence from split-read alignments, high-mismatch regions,
 and coverage analysis.
 - [SpaceRanger/1.3.0-GCC-10.2.0](https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/SpaceRanger/SpaceRanger-1.3.0-GCC-10.2.0.eb)
Space Ranger is a set of analysis pipelines that process Visium spatial RNA-seq output
and brightfield microscope images in order to detect tissue, align reads, generate feature-spot matrices,
perform clustering and gene expression analysis, and place spots in spatial context on the slide image. 
 - [SparK/2.6.2-GCCcore-10.2.0](https://github.com/harbourlab/SparK)
SparK
 - [SpectrA/1.0.0-GCC-10.2.0](https://spectralib.org/)
Spectra stands for Sparse Eigenvalue Computation Toolkit as a Redesigned ARPACK. It is a C++
 library for large scale eigenvalue problems, built on top of Eigen, an open source linear algebra library.
 - [Stacks/2.53-foss-2019b](https://catchenlab.life.illinois.edu/stacks/)
Stacks is a software pipeline for building loci from short-read sequences, such as those generated on
 the Illumina platform. Stacks was developed to work with restriction enzyme-based data, such as RAD-seq,
 for the purpose of building genetic maps and conducting population genomics and phylogeography.

 - [StringTie/2.1.4-GCC-8.3.0](https://ccb.jhu.edu/software/stringtie/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/StringTie/StringTie-2.1.4-GCC-8.3.0.eb)
StringTie is a fast and highly efficient assembler of RNA-Seq alignments into potential transcripts
 - [Subread/2.0.0-GCC-8.3.0](http://subread.sourceforge.net/)
High performance read alignment, quantification and mutation discovery
 - [TOPAZ/0.2.4-foss-2020b](http://cb.csail.mit.edu/cb/topaz/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/TOPAZ/TOPAZ-0.2.4-foss-2020b.eb)
Topaz is a pipeline for particle picking in cryo-electron micrographs using neural networks and positive-unlabeled learning
 - [TRF/4.09-linux64](https://tandem.bu.edu/trf/trf.html)
Tandem repeats finder: a program to analyze DNA sequences. Legacy version.
 - [TagDust/2.33-GCCcore-10.2.0](http://tagdust.sourceforge.net/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/TagDust/TagDust-2.33-GCCcore-10.2.0.eb)
Raw sequences produced by next generation sequencing (NGS) machines may contain adapter,
 linker, barcode and fingerprint sequences. TagDust2 is a program to extract and correctly label the
 sequences to be mapped in downstream pipelines.
 - [Theano/1.1.2-foss-2020b-PyMC](https://deeplearning.net/software/theano)
Theano is a Python library that allows you to define, optimize,
and evaluate mathematical expressions involving multi-dimensional arrays efficiently.
 - [TopHat/2.1.2-foss-2018b](http://ccb.jhu.edu/software/tophat/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/TopHat/TopHat-2.1.2-foss-2018b.eb)
TopHat is a fast splice junction mapper for RNA-Seq reads.
 - [Tracer/1.7.1](http://beast.community/tracer)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/Tracer/Tracer-1.7.1.eb)
Tracer is a program for analysing the trace files generated
 by Bayesian MCMC runs (that is, the continuous parameter values sampled from
 the chain). It can be used to analyse runs of BEAST, MrBayes, LAMARC and
 possibly other MCMC programs.
 - [Trim_Galore/0.6.5-GCCcore-8.3.0-Java-11-Python-3.7.4](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
Trim Galore is a wrapper around Cutadapt and FastQC to
consistently apply adapter and quality trimming to FastQ files, with extra
functionality for RRBS data.
 - [Trimmomatic/0.39-Java-11](http://www.usadellab.org/cms/?page=trimmomatic)
Trimmomatic performs a variety of useful trimming tasks for illumina 
 paired-end and single ended data.The selection of trimming steps and their associated 
 parameters are supplied on the command line. 
 - [Trinity/2.12.0-foss-2020b](https://trinityrnaseq.github.io)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/Trinity/Trinity-2.12.0-foss-2020b.eb)
Trinity represents a novel method for the efficient and robust de novo reconstruction
 of transcriptomes from RNA-Seq data. Trinity combines three independent software modules: Inchworm,
 Chrysalis, and Butterfly, applied sequentially to process large volumes of RNA-Seq reads.
 - [UMI-tools/1.0.1-foss-2019b-Python-3.7.4](https://umi-tools.readthedocs.io)
Tools for handling Unique Molecular Identifiers in NGS data sets
 - [VCFtools/0.1.16-GCC-10.2.0](https://vcftools.github.io)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/VCFtools/VCFtools-0.1.16-GCC-10.2.0.eb)
The aim of VCFtools is to provide 
 easily accessible methods for working with complex 
 genetic variation data in the form of VCF files.
 - [VEP/103.1-GCC-10.2.0](https://www.ensembl.org/info/docs/tools/vep)
Variant Effect Predictor (VEP) determines the effect of your
 variants (SNPs, insertions, deletions, CNVs or structural variants) on genes,
 transcripts, and protein sequence, as well as regulatory regions.
 Includes EnsEMBL-XS, which provides pre-compiled replacements for frequently
 used routines in VEP.
 - [VSEARCH/2.9.1-foss-2018b](https://github.com/torognes/vsearch)
VSEARCH supports de novo and reference based chimera detection,
 clustering, full-length and prefix dereplication, rereplication,
 reverse complementation, masking, all-vs-all pairwise global alignment,
 exact and global alignment searching, shuffling, subsampling and sorting.
 It also supports FASTQ file analysis, filtering,
 conversion and merging of paired-end reads.
 - [ViennaRNA/2.4.11-foss-2018b-Python-3.6.6](http://www.tbi.univie.ac.at/RNA/)
The Vienna RNA Package consists of a C code library and several
stand-alone programs for the prediction and comparison of RNA secondary structures.
 - [WiggleTools/1.2.4-GCC-8.3.0]()
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/w/WiggleTools/WiggleTools-1.2.4-GCC-8.3.0.eb)
The WiggleTools package allows genomewide data files to be manipulated as numerical functions, equipped with all the standard functional analysis operators (sum, product, product by a scalar, comparators), and derived statistics (mean, median, variance, stddev, t-test, Wilcoxon's rank sum test, etc).
 - [ancestry/1.0.0-GCCcore-8.3.0-Python-2.7.16](https://github.com/vibansal)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/a/ancestry/ancestry-1.0.0-GCCcore-8.3.0-Python-2.7.16.eb)
Fast individual ancestry inference from DNA sequence data leveraging allele frequencies
 from multiple populations. iAdmix Using population allele frequencies for computing individual admixture
 estimates
 - [angsd/0.933-GCC-8.3.0](http://www.popgen.dk/angsd)
Program for analysing NGS data.
 - [angsd/0.933-GCC-8.3.0](http://www.popgen.dk/angsd)
Program for analysing NGS data.
 - [arcasHLA/0.2.0-foss-2019b-Python-3.7.4](https://github.com/RabadanLab/arcasHLA)
arcasHLA performs high resolution genotyping for HLA class I and class II
genes from RNA sequencing, supporting both paired and single-end samples.
 - [bam2fastx/1.3.0](https://github.com/pacificbiosciences/bam2fastx)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bam2fastx/bam2fastx-1.3.0.eb)
Conversion of PacBio BAM files into gzipped fasta and fastq files, including splitting of barcoded data
 - [bam2wig/1.5](https://github.com/MikeAxtell/bam2wig)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bam2wig/bam2wig-1.5.eb)
Conversion of a BAM alignment to wiggle and bigwig coverage files, with flexible reporting options.
 - [basicfiltering/1.0.7-foss-2020a-Python-3.8.2](https://github.com/rhshah/basicfiltering)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/basicfiltering/basicfiltering-1.0.7-foss-2020a-Python-3.8.2.eb)
Basic Filtering for; Variant Allele Frequency, Variat Reads, tumor-Normal Variant Allele Frequencey Ratio.
 - [bcl2fastq2/2.20.0-GCC-10.2.0](https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html)
bcl2fastq Conversion Software both demultiplexes data and converts BCL files generated by
 Illumina sequencing systems to standard FASTQ file formats for downstream analysis.
 - [bioawk/1.0-foss-2018b](https://github.com/lh3/bioawk)
Bioawk is an extension to Brian Kernighan's awk,
 adding the support of several common biological data formats,
 including optionally gzip'ed BED, GFF, SAM, VCF, FASTA/Q and TAB-delimited formats with column names. 
 - [biobambam2/2.0.95-foss-2018b](https://github.com/gt1/biobambam2)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/biobambam2/biobambam2-2.0.95-foss-2018b.eb)
Tools for processing BAM files; 
 bamsormadup, bamcollate2, bammarkduplicates, bammaskflags, bamrecompress,
 bamsort, bamtofastq
 - [bx-python/0.8.8-foss-2019b-Python-3.7.4](https://github.com/bxlab/bx-python)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/b/bx-python/bx-python-0.8.8-foss-2019b-Python-3.7.4.eb)
The bx-python project is a Python library and associated set of scripts to allow for rapid
 implementation of genome scale analyses.
 - [cDNA_Cupcake/12.4.0-foss-2019b-Python-3.7.4](https://github.com/Magdoll/cDNA_Cupcake)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cDNA_Cupcake/cDNA_Cupcake-12.4.0-foss-2019b-Python-3.7.4.eb)
cDNA_Cupcake is a miscellaneous collection of Python and R scripts used for analyzing sequencing data.
 - [canu/1.8-foss-2018b-Perl-5.28.0](http://canu.readthedocs.io)
Canu is a fork of the Celera Assembler designed for high-noise single-molecule sequencing
 - [cas-offinder/2.4-foss-2018b]()
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cas-offinder/cas-offinder-2.4-foss-2018b.eb)
Cas-OFFinder is OpenCL based, ultrafast and versatile program that searches
 for potential off-target sites of CRISPR/Cas-derived RNA-guided endonucleases (RGEN).
 - [cellranger/3.0.2-foss-2018b](https://support.10xgenomics.com/single-cell-gene-expression/software/overview/welcome)
Chromium Single Cell Software Suite is a set of software applications for analyzing and visualizing single cell 3’ RNA-seq data produced by the 10x Genomics Chromium Platform.
 - [cellranger-atac/1.1.0-foss-2018b](https://support.10xgenomics.com/single-cell-atac/software/overview/welcome)
The Chromium Single Cell ATAC Software Suite is a complete package for analyzing and visualizing single cell chromatin accessibility data produced by the Chromium Single Cell ATAC Solution on the 10x Chromium Platform.
 - [cromwell/73](https://github.com/broadinstitute/cromwell)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cromwell/cromwell-73.eb)
Scientific workflow engine designed for simplicity & scalability.
 - [ctffind/4.1.14-foss-2019b](https://grigoriefflab.umassmed.edu/ctffind4)
Program for finding CTFs of electron micrographs.
 - [cutadapt/2.9-foss-2019b-Python-3.7.4](http://opensource.scilifelab.se/projects/cutadapt/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/c/cutadapt/cutadapt-2.9-foss-2019b-Python-3.7.4.eb)
Cutadapt finds and removes adapter sequences, primers, poly-A tails and
 other types of unwanted sequence from your high-throughput sequencing reads.
 - [deepTools/3.3.1-foss-2018b-Python-3.6.6](https://deeptools.readthedocs.io/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/d/deepTools/deepTools-3.3.1-foss-2018b-Python-3.6.6.eb)
deepTools is a suite of python tools particularly developed for the efficient analysis of
 high-throughput sequencing data, such as ChIP-seq, RNA-seq or MNase-seq.
 - [delly/0.8.3](https://github.com/dellytools/delly)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/d/delly/delly-0.8.3.eb)
DELLY2: Structural variant discovery by integrated paired-end and split-read analysis
 - [edlib/1.3.8.post1-GCC-8.3.0-Python-3.7.4](https://martinsos.github.io/edlib)
Lightweight, super fast library for sequence alignment using edit (Levenshtein) distance.
 - [factera/1.4.4-foss-2018b-Perl-5.28.0](https://factera.stanford.edu/)
(Fusion And Chromosomal Translocation Enumeration and Recovery Algorithm) is a tool for detection of genomic fusions in paired-end targeted (or genome-wide) sequencing data.
 - [fastNGSadmix/dda93a4-GCC-10.2.0](http://www.popgen.dk/software/index.php/FastNGSadmix)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fastNGSadmix/fastNGSadmix-dda93a4-GCC-10.2.0.eb)
Program for infering admixture proportions and doing PCA with a single NGS
 sample. Inferences based on reference panel.
 - [fastp/0.20.0-GCC-8.3.0](https://github.com/OpenGene/fastp)
A tool designed to provide fast all-in-one preprocessing for FastQ files.
 This tool is developed in C++ with multithreading supported to afford high performance.
 - [fastq-tools/0.8-foss-2018b](https://homes.cs.washington.edu/~dcjones/fastq-tools/)
This package provides a number of small and efficient programs to perform
 common tasks with high throughput sequencing data in the FASTQ format. All of the programs
 work with typical FASTQ files as well as gzipped FASTQ files.
 - [fermi-lite/0.1-GCC-10.2.0](https://github.com/lh3/fermi-lite)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/f/fermi-lite/fermi-lite-0.1-GCC-10.2.0.eb)
Fermi-lite is a standalone C library as well as a command-line tool
 for assembling Illumina short reads in regions from 100bp to 10 million bp in size. It
 is largely a light-weight in-memory version of fermikit without generating any intermediate
 files.
 - [fhR/4.1.2-foss-2020b](http://www.r-project.org/)
R is a free software environment for statistical computing and graphics.
 - [fhSeurat/4.0.0-foss-2019b-R-4.0.2](https://satijalab.org/seurat)
Seurat is an R package designed for QC, analysis, and exploration of single cell RNA-seq data.
 - [freebayes/1.3.2-GCCcore-8.3.0](https://github.com/ekg/freebayes)
Bayesian haplotype-based polymorphism discovery and genotyping.
 - [gffread/0.11.6-GCCcore-8.3.0](https://github.com/gpertea/gffread)
GFF/GTF parsing utility providing format conversions,
region filtering, FASTA sequence extraction and more.
 - [ggVennDiagram/3484e8-foss-2019b-R-4.0.2](https://cran.r-project.org/package=VennDiagram)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/ggVennDiagram/ggVennDiagram-3484e8-foss-2019b-R-4.0.2.eb)
A set of functions to generate high-resolution Venn and Euler plots. Includes handling for several special cases, including two-case scaling, and extensive customization of plot shape and structure.
 - [guidescan/1.2-foss-2018b-Python-2.7.15](http://www.guidescan.com)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/g/guidescan/guidescan-1.2-foss-2018b-Python-2.7.15.eb)
A generalized CRISPR guideRNA design tool.
 - [hivmmer/0.1.2-foss-2018b-Python-3.6.6](https://github.com/kantorlab/hivmmer)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/h/hivmmer/hivmmer-0.1.2-foss-2018b-Python-3.6.6.eb)
An alignment and variant-calling pipeline for Illumina deep
 sequencing of HIV-1, based on the probabilistic aligner HMMER
 - [iCount/20180820-foss-2018b-Python-3.6.6](https://github.com/tomazc/iCount)
iCount: protein-RNA interaction analysis
 is a Python module and associated command-line interface (CLI),
 which provides all the commands needed to process iCLIP data on protein-RNA interactions.
 - [interop/1.1.10-foss-2019b-Python-3.7.4](https://github.com/Illumina/interop)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/interop/interop-1.1.10-foss-2019b-Python-3.7.4.eb)
The Illumina InterOp libraries are a set of common routines used for reading InterOp metric files produced by Illumina sequencers including NextSeq 1k/2k. These libraries are backwards compatible and capable of supporting prior releases of the software, with one exception: GA systems have been excluded.
 - [intervene/0.6.4-foss-2019b-Python-3.7.4](https://intervene.readthedocs.io/en/latest/index.html)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/intervene/intervene-0.6.4-foss-2019b-Python-3.7.4.eb)
Intervene a tool for intersection and visualization of multiple genomic region sets
 - [itpp/4.3.1-foss-2019b](https://sourceforge.net/projects/itpp/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/i/itpp/itpp-4.3.1-foss-2019b.eb)
IT++ is a C++ library of mathematical, signal processing and communication
 classes and functions. Its main use is in simulation of communication systems and for
 performing research in the area of communications.
 - [kallisto/0.48.0-foss-2020b](https://pachterlab.github.io/kallisto/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/kallisto/kallisto-0.48.0-foss-2020b.eb)
kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally
 of target sequences using high-throughput sequencing reads.
 - [king/2.2.5](https://people.virginia.edu/~wc9c/KING/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/k/king/king-2.2.5.eb)
KING is a toolset that makes use of high-throughput 
SNP data typically seen in a genome-wide association study (GWAS) or 
a sequencing project. Applications of KING include family relationship 
inference and pedigree error checking, quality control, population 
substructure identification, forensics, gene mapping, etc.
 - [leidenalg/0.8.3-foss-2020b](https://github.com/vtraag/leidenalg)
Implementation of the Leiden algorithm for various quality
functions to be used with igraph in Python.
 - [libcerf/1.14-GCCcore-10.2.0](https://jugit.fz-juelich.de/mlz/libcerf)
libcerf is a self-contained numeric library that provides an efficient and
 accurate implementation of complex error functions, along with Dawson,
 Faddeeva, and Voigt functions.

 - [libgtextutils/0.7-GCCcore-7.3.0](http://hannonlab.cshl.edu/fastx_toolkit/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/libgtextutils/libgtextutils-0.7-GCCcore-7.3.0.eb)
ligtextutils is a dependency of fastx-toolkit and is provided
 via the same upstream
 - [libpll/0.3.2-GCCcore-7.3.0](https://github.com/xflouris/libpll/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/libpll/libpll-0.3.2-GCCcore-7.3.0.eb)
libpll is a versatile high-performance software library for phylogenetic analysis.
 - [lpsolve/5.5.2.11-GCC-10.2.0](https://sourceforge.net/projects/lpsolve/)
Mixed Integer Linear Programming (MILP) solver
 - [lumpy/0.2.13-foss-2018b](https://github.com/pezmaster31/bamtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/l/lumpy/lumpy-0.2.13-foss-2018b.eb)
A probabilistic framework for structural variant discovery.
 - [magma/2.5.4-fosscuda-2020b](https://icl.cs.utk.edu/magma/)
The MAGMA project aims to develop a dense linear algebra library similar to
 LAPACK but for heterogeneous/hybrid architectures, starting with current Multicore+GPU systems.
 - [manta/1.6.0](https://github.com/Illumina/manta)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/manta/manta-1.6.0.eb)
Manta calls structural variants (SVs) and indels from mapped paired-end sequencing reads.
It is optimized for analysis of germline variation in small sets of individuals and 
somatic variation in tumor/normal sample pairs. Manta discovers, assembles and 
scores large-scale SVs, medium-sized indels and large insertions within a 
single efficient workflow. 

 - [medaka/1.2.3-foss-2019b-Python-3.7.4](https://github.com/nanoporetech/medaka)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/medaka/medaka-1.2.3-foss-2019b-Python-3.7.4.eb)
medaka is a tool to create a consensus sequence from nanopore sequencing data.
 - [minimap2/2.17-GCC-8.3.0](https://github.com/lh3/minimap2)
Minimap2 is a fast sequence mapping and alignment
program that can find overlaps between long noisy reads, or map long
reads or their assemblies to a reference genome optionally with detailed
alignment (i.e. CIGAR). At present, it works efficiently with query
sequences from a few kilobases to ~100 megabases in length at an error
rate ~15%. Minimap2 outputs in the PAF or the SAM format. On limited
test data sets, minimap2 is over 20 times faster than most other
long-read aligners. It will replace BWA-MEM for long reads and contig
alignment.
 - [monocle3/0.2.2-foss-2019b-R-4.0.2](https://cole-trapnell-lab.github.io/monocle3)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/m/monocle3/monocle3-0.2.2-foss-2019b-R-4.0.2.eb)
Single-cell transcriptome sequencing (sc-RNA-seq) experiments allow us to discover new cell types and help us understand how they arise in development. The Monocle 3 package provides a toolkit for analyzing single-cell gene expression experiments.
 - [nanofilt/2.5.0-foss-2018b-Python-3.6.6](https://github.com/wdecoster/nanofilt)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/nanofilt/nanofilt-2.5.0-foss-2018b-Python-3.6.6.eb)
Filtering and trimming of long read sequencing data.
 - [nanopolish/0.11.1-foss-2018b-Python-2.7.15](https://github.com/jts/nanopolish)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/nanopolish/nanopolish-0.11.1-foss-2018b-Python-2.7.15.eb)
Software package for signal-level analysis of Oxford Nanopore sequencing data.
 - [ncbi-vdb/2.9.3-foss-2018b](https://github.com/ncbi/ncbi-vdb)
The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for
 using data in the INSDC Sequence Read Archives.
 - [ncdf4/1.17-foss-2019b](https://cran.r-project.org/web/packages/ncdf4)
ncdf4: Interface to Unidata netCDF (version 4 or earlier) format data files
 - [nullarbor/2.0.20191013](https://github.com/tseemann/nullarbor)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/nullarbor/nullarbor-2.0.20191013.eb)
Pipeline to generate complete public health microbiology reports from sequenced isolates

 - [numexpr/2.7.1-foss-2019b-Python-2.7.16](https://numexpr.readthedocs.io/en/latest/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/n/numexpr/numexpr-2.7.1-foss-2019b-Python-2.7.16.eb)
The numexpr package evaluates multiple-operator array expressions many times faster than NumPy can.
 It accepts the expression as a string, analyzes it, rewrites it more efficiently, and compiles it on the fly into
 code for its internal virtual machine (VM). Due to its integrated just-in-time (JIT) compiler, it does not require a
 compiler at runtime.
 - [oncosnpseq/2.01](https://sites.google.com/site/oncosnpseq)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/o/oncosnpseq/oncosnpseq-2.01.eb)
OncoSNP-SEQ is an analytical tool for characterising copy number alterations
 and loss-of-heterozygosity (LOH) events in cancer samples from whole genome sequencing data.
 - [ont-guppy-cpu/2.3.7](https://nanoporetech.com/products/minit)
Guppy is a production basecaller provided by Oxford Nanopore,
 and uses a command-line interface.
 - [packmol/20.2.2-GCC-10.2.0](http://m3g.iqm.unicamp.br/packmol)
Packing Optimization for Molecular Dynamics Simulations
 - [parasail/2.4-foss-2018b](https://github.com/jeffdaily/parasail)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/parasail/parasail-2.4-foss-2018b.eb)
parasail is a SIMD C (C99) library containing implementations
 of the Smith-Waterman (local), Needleman-Wunsch (global), and semi-global
 pairwise sequence alignment algorithms. 
 - [philosopher/3.3.11](https://github.com/Nesvilab/philosopher/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/philosopher/philosopher-3.3.11.eb)
Philosopher provides easy access to third-party tools and custom algorithms
 allowing users to develop proteomics analysis, from Peptide Spectrum Matching to annotated
 protein reports. Philosopher is also tuned for Open Search analysis, providing a modified
 version of the prophets for peptide validation and protein inference. To this date, Philosopher
 is the only proteomics toolkit that allows you to process and analyze close and
 open search results.
 - [picard/2.25.0-Java-11](https://broadinstitute.github.io/picard/)
A set of tools (in Java) for working with next generation sequencing data in the BAM format.
 - [plink/1.9-20200616](https://www.cog-genomics.org/plink/1.9)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/plink/plink-1.9-20200616.eb)
Whole-genome association analysis toolset
 - [popscle/0.1-beta-foss-2019b](https://github.com/statgen/popscle)
A suite of
population scale analysis tools for single-cell genomics data including
implementation of Demuxlet / Freemuxlet methods and auxilary tools 
 - [pplacer/1.1.alpha19-foss-2018b](['https://matsen.fhcrc.org/pplacer/'])
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pplacer/pplacer-1.1.alpha19-foss-2018b.eb)
Pplacer places reads on a phylogenetic tree. guppy (Grand
 Unified Phylogenetic Placement Yanalyzer) yanalyzes them. rppr is a helpful
 tool for working with reference packages.
 - [prodigal/2.6.3-GCCcore-7.3.0](http://prodigal.ornl.gov/)
Prodigal (Prokaryotic Dynamic Programming Genefinding
   Algorithm) is a microbial (bacterial and archaeal) gene finding program
   developed at Oak Ridge National Laboratory and the University of
   Tennessee.
 - [prokka/1.14.5-gompi-2019b](https://www.vicbioinformatics.com/software.prokka.shtml)
Prokka is a software tool for the rapid annotation of prokaryotic genomes.
 - [psipred/4.02-foss-2018b](http://bioinf.cs.ucl.ac.uk/psipred/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/psipred/psipred-4.02-foss-2018b.eb)
The PSIPRED Protein Sequence Analysis Workbench aggregates
 several UCL structure prediction methods into one location.
 - [pyBigWig/0.3.17-foss-2019b-Python-3.7.4](https://github.com/deeptools/pyBigWig)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pyBigWig/pyBigWig-0.3.17-foss-2019b-Python-3.7.4.eb)
A python extension, written in C, for quick access to bigBed files and access to and creation of
 bigWig files.
 - [pyGenomeTracks/3.5-foss-2019b-Python-3.7.4](https://github.com/deeptools/pyGenomeTracks)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pyGenomeTracks/pyGenomeTracks-3.5-foss-2019b-Python-3.7.4.eb)
pyGenomeTracks aims to produce high-quality genome browser tracks that are highly customizable.
 - [pybedtools/0.8.1-GCC-10.2.0](https://daler.github.io/pybedtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/p/pybedtools/pybedtools-0.8.1-GCC-10.2.0.eb)
pybedtools wraps and extends BEDTools and offers feature-level manipulations from
 within Python.
 - [pyclone/0.13.1-foss-2019b-Python-2.7.16](https://github.com/Roth-Lab/pyclone)
PyClone is a Bayesian clustering method for grouping sets of deeply sequenced
 somatic mutations into putative clonal clusters while estimating their cellular prevalences and
 accounting for allelic imbalances introduced by segmental copy-number changes and normal-cell
 contamination.
 - [pyclone-vi/0.1.0-foss-2019b-Python-3.7.4](https://github.com/Roth-Lab/pyclone-vi)
PyClone is a Bayesian clustering method for grouping sets of deeply sequenced
 somatic mutations into putative clonal clusters while estimating their cellular prevalences and
 accounting for allelic imbalances introduced by segmental copy-number changes and normal-cell
 contamination.
 - [python-parasail/1.1.16-foss-2018b-Python-3.6.6](https://pypi.org/project/parasail/)
This package contains Python bindings for parasail. 
 - [qcat/1.0.7-foss-2018b-Python-3.6.6](https://github.com/nanoporetech/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/q/qcat/qcat-1.0.7-foss-2018b-Python-3.6.6.eb)
Qcat is Python command-line tool for demultiplexing Oxford
 Nanopore reads from FASTQ files.
 - [rMATS-turbo/4.1.1-foss-2020b](https://github.com/Xinglab/rmats-turbo)
rMATS turbo is the C/Cython version of rMATS (refer to http://rnaseq-mats.sourceforge.net).
 - [samblaster/0.1.24-foss-2018b](https://github.com/GregoryFaust/samblaster)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/samblaster/samblaster-0.1.24-foss-2018b.eb)
samblaster is a fast and flexible program for marking
 duplicates in read-id grouped1 paired-end SAM files.
 - [scVelo/0.1.24-foss-2019b-Python-3.7.4](https://scvelo.org)
scVelo is a scalable toolkit for estimating and analyzing RNA velocities in single cells using
 dynamical modeling.
 - [scanpy/1.7.2-foss-2020b](https://scanpy.readthedocs.io/en/stable/)
Scanpy is a scalable toolkit for analyzing single-cell gene expression data built
 jointly with anndata. It includes preprocessing, visualization, clustering, trajectory inference
 and differential expression testing. The Python-based implementation efficiently deals with
 datasets of more than one million cells.

 - [scipy/1.4.1-foss-2019b-Python-3.7.4](https://www.scipy.org)
SciPy is a collection of mathematical algorithms and convenience
 functions built on the Numpy extension for Python.
 - [seq2HLA/2.3-foss-2019b-Python-2.7.16](https://github.com/TRON-Bioinformatics/seq2HLA)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/seq2HLA/seq2HLA-2.3-foss-2019b-Python-2.7.16.eb)
In-silico method written in Python and R to determine HLA genotypes of a sample.
 seq2HLA takes standard RNA-Seq sequence reads in fastq format as input,
 uses a bowtie index comprising all HLA alleles and outputs the most likely
 HLA class I and class II genotypes (in 4 digit resolution),
 a p-value for each call, and the expression of each class. 
 - [seqtk/1.3-GCC-10.2.0](https://github.com/lh3/seqtk/)
Seqtk is a fast and lightweight tool for processing sequences in the FASTA or FASTQ format.
 It seamlessly parses both FASTA and FASTQ files which can also be optionally compressed by gzip.
 - [seqtools/4.44.1-foss-2019b](http://www.sanger.ac.uk/science/tools/seqtools)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/seqtools/seqtools-4.44.1-foss-2019b.eb)
The SeqTools package contains three tools for visualising sequence alignments: Blixem, Dotter and Belvu.
 - [sequenza-utils/3.0.0-GCCcore-8.3.0-Python-3.7.4](https://sequenza-utils.readthedocs.io/)
Sequenza is a software for the estimation and quantification of purity/ploidy and copy number alteration in sequencing experiments of tumor samples. Sequenza-utils provide command lines programs to transform common NGS file format
 - [smallgenomeutilities/0.2.1-foss-2018b-Python-3.6.6](https://github.com/cbg-ethz/smallgenomeutilities)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/s/smallgenomeutilities/smallgenomeutilities-0.2.1-foss-2018b-Python-3.6.6.eb)
The smallgenomeutilities are a collection of scripts that is
 useful for dealing and manipulating NGS data of small viral genomes. They
 are written in Python 3 with a small number of dependencies.
 - [snippy/4.6.0-foss-2019b-Perl-5.30.0](https://github.com/tseemann/snippy)
Snippy finds SNPs between a haploid reference genome and your NGS sequence
 reads. It will find both substitutions (snps) and insertions/deletions (indels).
Rapid haploid variant calling and core genome alignment.
 - [spglib-python/1.16.0-foss-2020b](https://pypi.python.org/pypi/spglib)
Spglib for Python. Spglib is a library for finding and handling crystal symmetries written in C.
 - [spoa/4.0.0-GCC-8.3.0](https://github.com/rvaser/spoa)
Spoa (SIMD POA) is a c++ implementation of the partial order alignment (POA) algorithm
 which is used to generate consensus sequences
 - [statsmodels/0.12.1-foss-2020b](https://www.statsmodels.org/)
Statsmodels is a Python module that allows users to explore data, estimate statistical models,
and perform statistical tests.
 - [strelka/2.9.9-foss-2018b](https://github.com/Illumina/strelka)
Strelka2 is a fast and accurate small variant caller
 optimized for analysis of germline variation in small cohorts and
 somatic variation in tumor/normal sample pairs.
 - [svaba/1.1.0-GCC-10.2.0](https://github.com/walaj/svaba)
SvABA
 - [tabix/0.2.6-GCCcore-7.3.0](http://samtools.sourceforge.net)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/tabix/tabix-0.2.6-GCCcore-7.3.0.eb)
Generic indexer for TAB-delimited genome position files 
 - [terraphast/master-foss-2018b](https://github.com/xflouris/libpll/wiki)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/t/terraphast/terraphast-master-foss-2018b.eb)
libpll is a versatile high-performance software library for phylogenetic analysis.
 - [vcflib/1.0.1-GCCcore-8.3.0](https://github.com/vcflib/vcflib)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/vcflib/vcflib-1.0.1-GCCcore-8.3.0.eb)
vcflib provides methods to manipulate and interpret sequence variation as it can be
 described by VCF. The Variant Call Format (VCF) is a flat-file, tab-delimited textual format intended
 to concisely describe reference-indexed genetic variations between individuals.
 - [velocyto.R/0.6-foss-2019b-R-4.0.2](http://velocyto.org/)
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/v/velocyto.R/velocyto.R-0.6-foss-2019b-R-4.0.2.eb)
velocyto (velox + κύτος, quick cell) is a package for the analysis of expression dynamics in single cell RNA seq data. In particular, it enables estimations of RNA velocities of single cells by distinguishing unspliced and spliced mRNAs in standard single-cell RNA sequencing protocols (see pre-print below for more information).
 - [vt/0.57721-foss-2018b](http://genome.sph.umich.edu/wiki/Vt)
A tool set for short variant discovery in genetic sequence data.
 - [wot/1.0.8-foss-2018b-Python-3.6.6]()
[easyconfig](https://github.com/FredHutch/easybuild-life-sciences/blob/master/fh_easyconfigs/w/wot/wot-1.0.8-foss-2018b-Python-3.6.6.eb)
Single-cell RNA sequencing is a powerful technology that can reveal a lot about what happens in a group of cells as they develop. But because the technology destroys a cell, it can only provide snapshots of the cells in a group at one point in time. To really understand how cells develop over time, snapshots aren't good enough: scientists want to fill in the gaps between snapshots and string everything together into a movie.
