---
title: Generating Genomics Data
---

Multiple processes are involved in the preparation of biological materials before genomic sequencing can even begin. The details of the methods of DNA or RNA extraction and quality assessment process can have a large impact on the quality, relevance, and interpretability of the resulting genomics data. Thus, it is critical to ensure that the most appropriate set of conditions are chosen for preparing your samples before you send them for sequencing of any kind.

## Considerations Regarding Extraction of Nucleic Acid

When deciding which approach of nucleic acid isolation you should use you must consider atleast these three things:

- The **quantity and quality** of nucleic acid you need for the genomic assay you wish to use.
     
- **Source of samples** for extracting the nucleic acid for the assay.

- **DNA or RNA** specific considerations.

When weighing your options also thing about the inherent sample preparation steps involved in generating those data. 


### Extraction Methods

| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
| **Precipitation-based** | **Higher yield, lower purity** | Captures total nucleic acids (large & small fragments) | May contain contaminants (e.g., miRNA in mRNA prep, RNA in DNA prep) | Applications needing total DNA or RNA |  
| **Selection-based (affinity column or magnetic-bead)** | **Higher purity, lower yield** | Removes contaminants for high-specificity extraction | Loss of total nucleic acid, may exclude small RNA or fragmented DNA | High-purity applications |  

### Impact of Sample Source

| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
 **Cryopreserved Samples** | **Higher purity, higher integrity** | Preserves intact nucleic acids | Requires careful storage | Long-read sequencing, high-integrity studies |  
| **FFPE Samples** | **Lower purity, fragmented nucleic acids** | Enables analysis of archived samples | DNA/RNA fragmentation may affect sequencing success | Exome sequencing, targeted mutation analysis |  

### Nucleic Acid Type
| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
| **Total RNA Extraction** | **Moderate purity & yield** | Captures all RNA types (mRNA, rRNA, miRNA) | May require additional purification for specific RNA types | General RNA-based applications, RNA-seq |  
| **mRNA-Specific Isolation (e.g., Poly(A) Selection)** | **Higher purity, lower yield** | Removes rRNA and other unwanted RNA | Lower total RNA yield, can be redundant if total RNA is available | mRNA-seq, gene expression analysis |  
| **Genomic DNA Extraction** | **Moderate purity & yield** | Good for whole-genome sequencing | May contain RNA contamination if not treated | WGS, PCR, genotyping |  
| **Fragmented DNA Extraction (e.g., FFPE DNA Isolation)** | **Lower purity & yield** | Allows recovery from FFPE samples | Fragmentation limits some sequencing applications | Targeted sequencing, mutation analysis |  

 
### Useful Links For Further Reading 

  * Here is a useful reference outlining the amount/quality of a few [FFPE nucleic acid extraction kits.](https://doi.org/10.1016/j.ab.2010.01.014)

## Yield (Quanitity)

There are two main approaches to quantifying nucleic acids after isolation. Both provide important information that will influence what downstream analyses are possible and suitable, but are not interchangeable, thus it is important to know what types of data describing the nucleic acids can be obtained via each method.

| **Method**               | **Principle** | **What It Measures** | **Advantages** | **Disadvantages** | **Best For** |  
|--------------------------|--------------|----------------------|----------------|-------------------|--------------|  
| **Spectrophotometric (e.g., NanoDrop)** | Measures absorbance at specific wavelengths | Total nucleic acid concentration (260 nm) and purity (260/280, 260/230 ratios) | - Quick, no reagents needed  <br> - Measures contaminants (protein, organic solvents, salts) | - Cannot differentiate DNA vs. RNA <br> - No quality assessment <br> - Less sensitive for low concentrations | Routine nucleic acid quantification when purity ratios are needed |  
| **Fluorometric (e.g., Qubit)** | Fluorescent dyes bind specifically to nucleic acids | Specific quantification of DNA, RNA, or protein in a sample | - Highly sensitive <br> - Differentiates DNA vs. RNA <br> - Works well for low concentrations | - Requires specialized reagents <br> - Does not measure purity | Accurate quantification of specific nucleic acid types, even in mixed samples |  

### Useful Links For Further Reading 

- [NanoDrop systems](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/ultraviolet-visible-visible-spectrophotometry-uv-vis-vis/uv-vis-vis-instruments/nanodrop-microvolume-spectrophotometers/nanodrop-products-guide.html) 
- [Qubit](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/fluorometers/qubit.html)

### Tapestation

TapeStation is a tool used to **assess the quality** of nucleic acids by running an **electrophoresis-based analysis**. Unlike spectrophotometric or fluorometric methods, which measure quantity, TapeStation helps determine **fragmentation and degradation** in your sample.  

#### How It Works
- **Separates nucleic acid fragments** based on **size and charge**  
- **Provides a visual representation** of sample integrity  
- Can also **quantify** nucleic acids, but **does not assess purity**  

#### Why It’s Important
For **RNA samples**, TapeStation calculates an **RNA Integrity Number (RIN)**, which measures RNA quality based on the ratio of **28S and 18S rRNA**.  
- **High RIN (>8):** RNA is intact, good for sequencing  
- **Low RIN (<8):** Indicates RNA degradation, which may impact downstream applications  

#### Things to Keep in Mind
- **Extraction method affects RIN values:**  
  - **Phenol-chloroform (precipitation-based) extractions** may lower RIN because they retain **small RNAs**  
  - **Column-based extractions** may falsely increase RIN by removing **small RNA fragments**  
- **Use TapeStation results to confirm quality before sequencing** to avoid failed experiments  

#### Useful Links For Further Reading 
 - For more information on [RIN definition and background for why it is important to consider when using RNA as an assay material, this article provides additional information.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1413964/)

#### Useful Links on Genomic Data Generation

## Library Preparation & Quality Assessment
| Topic | Description | Resources |
|-------|------------|-----------|
| **Library Preparation for Sequencing** | Overview of library prep applications, methods, and challenges | [Genohub Guide](https://genohub.com/ngs-library-preparation-kit-guide/), [Illumina Resources](https://www.illumina.com/techniques/sequencing/ngs-library-prep.html), [Method Explorer](https://www.illumina.com/science/sequencing-method-explorer.html) |
| **Quality Assessment** | Best practices for assessing nucleic acid purity and integrity | [Labome RNA Extraction](https://www.labome.com/method/RNA-Extraction.html), [Labome DNA Extraction](https://www.labome.com/method/DNA-Extraction-and-Purification.html) |

### Sequencing Platforms
| Technology | Description | Resources |
|------------|-------------|-----------|
| **Illumina Sequencing** | Short-read sequencing platform using Sequencing-by-Synthesis (SBS) technology | [Illumina Overview](https://www.illumina.com/techniques/sequencing.html), [SBS Video](https://www.youtube.com/watch?v=fCd6B5HRaZ8) |
| **PacBio SMRT Sequencing** | Long-read sequencing technology for full-length transcripts & high accuracy |[PacBio SMRT Science](https://www.pacb.com/smrt-science/smrt-sequencing/) |
| **10X Genomics** | Single-cell and spatial genomics platform | [10X Genomics Website](https://www.10xgenomics.com/) |

### Sequencing Applications
| Application | Description | Resources |
|-------------|-------------|-----------|
| **RNA Sequencing (RNA-seq)** | Profiling gene expression & transcriptome analysis |[RNA-seqlopedia](https://rnaseq.uoregon.edu/), [Best Practices](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0881-8) |
| **Small RNA Sequencing** | Focused on miRNA and other small RNAs | [Genohub miRNA Guide](https://genohub.com/services/sequencing/illumina-miRNA-sequencing-services) |
| **CUT&RUN** | Nuclease-based chromatin profiling for protein-DNA interactions | [Original CUT&RUN Paper](https://elifesciences.org/articles/21856) |
| **Whole Exome Sequencing (WES)** | Targets protein-coding regions of the genome | [Illumina WES](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/exome-sequencing.html) |
| **Targeted Sequencing** | Focused sequencing of specific genomic regions | [[Illumina Targeted Sequencing](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/targeted-panels.html) |
| **CRISPR Screens** | Genome-wide screening for gene function | [CRISPR Overview Video](https://www.youtube.com/watch?v=4YKFw2KZA5o), [Applications in Research](https://www.nature.com/articles/nbt.3659) |
| **ChIP-seq** | Chromatin immunoprecipitation for studying protein-DNA interactions | [ChIP-seq Overview](https://epigenie.com/guide-getting-started-with-chip-seq/) |
| **ATAC-seq** | Assays chromatin accessibility genome-wide | [ATAC-seq Guide](https://www.activemotif.com/blog-atac-seq), [ATAC-seq Paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4374986/) |
| **Nanostring** | Digital gene expression profiling technology | [Nanostring Website](https://www.nanostring.com/) |



## Fred Hutch Specific Resources

| **Resource** | **Description** | **Relevant Links** |  
|-------------|---------------|---------------------|  
| **Qubit Reader Access** | Researchers can email the `reagents` listserv to find nearby labs with a Qubit reader. | N/A |  
| **Genomics  Core** | Fred Hutch provides multiple shared resource groups, from specimen processing to genomics.  | [Genomics Core Site](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics.html) |  
| **Bioinformatics Core** | Offers to discuss experimental design, choice of data analysis strategies and software tools via fee-for-service. | [Bioinformatics Core Site](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics/bioinformatics-services.html)|  
