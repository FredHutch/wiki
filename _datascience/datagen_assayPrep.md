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
This table outlines common nucleic acid extraction methods, highlighting their trade-offs between purity and yield. Choosing the right extraction method is critical for obtaining high-quality DNA or RNA that meets the specific needs of your downstream applications. The trade-off between purity and yield can impact your analysis, as higher yields may come with impurities, while higher purity methods may result in lower yields. This table helps you understand which extraction methods are best suited for your samples based on your specific goals, whether you need total nucleic acids or prefer highly purified nucleic acids for specialized assays.

| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
| **Precipitation-based** | **Higher yield, lower purity** | Captures total nucleic acids (large & small fragments) | May contain contaminants (e.g., miRNA in mRNA prep, RNA in DNA prep) | Applications needing total DNA or RNA |  
| **Selection-based (affinity column or magnetic-bead)** | **Higher purity, lower yield** | Removes contaminants for high-specificity extraction | Loss of total nucleic acid, may exclude small RNA or fragmented DNA | High-purity applications |  

### Impact of Sample Source
When selecting a nucleic acid extraction method, the source of your samples plays a key role in determining the best approach. This table compares different sample types—such as cryopreserved and formalin-fixed, paraffin-embedded (FFPE) samples—and their inherent challenges related to purity, integrity, and yield. The sample source can significantly impact the success of genomic assays, and understanding the specific considerations for each source type ensures that you can select the most appropriate method for obtaining usable DNA or RNA.

| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
 **Cryopreserved Samples** | **Higher purity, higher integrity** | Preserves intact nucleic acids | Requires careful storage | Long-read sequencing, high-integrity studies |  
| **FFPE Samples** | **Lower purity, fragmented nucleic acids** | Enables analysis of archived samples | DNA/RNA fragmentation may affect sequencing success | Exome sequencing, targeted mutation analysis |  

### Nucleic Acid Type
This table focuses on the various types of nucleic acids (DNA, RNA) and the specialized extraction methods needed for each. It highlights the key considerations for extracting total RNA, mRNA, genomic DNA, and fragmented DNA, taking into account purity, yield, and specific application requirements. Whether you’re preparing for RNA sequencing or genomic DNA analysis, this table helps you choose the most effective method for isolating the right nucleic acid type needed for your research.

| **Method**                 | **Purity vs. Yield Tradeoff** | **Advantages** | **Disadvantages** | **Best For** |  
|----------------------------|-----------------------------|---------------|------------------|-------------|  
| **Total RNA Extraction** | **Moderate purity & yield** | Captures all RNA types (mRNA, rRNA, miRNA) | May require additional purification for specific RNA types | General RNA-based applications, RNA-seq |  
| **mRNA-Specific Isolation (e.g., Poly(A) Selection)** | **Higher purity, lower yield** | Removes rRNA and other unwanted RNA | Lower total RNA yield, can be redundant if total RNA is available | mRNA-seq, gene expression analysis |  
| **Genomic DNA Extraction** | **Moderate purity & yield** | Good for whole-genome sequencing | May contain RNA contamination if not treated | WGS, PCR, genotyping |  
| **Fragmented DNA Extraction (e.g., FFPE DNA Isolation)** | **Lower purity & yield** | Allows recovery from FFPE samples | Fragmentation limits some sequencing applications | Targeted sequencing, mutation analysis | 


 
### Useful Links For Further Reading 

  * Here is a useful reference outlining the amount/quality of a few [FFPE nucleic acid extraction kits.](https://doi.org/10.1016/j.ab.2010.01.014)

## Yield (Quanitity)

Quantifying nucleic acids is an essential step in preparing samples for genomic assays. This table compares two common methods of nucleic acid quantification: spectrophotometry and fluorometry. Spectrophotometric methods, such as NanoDrop, provide a quick and general overview of concentration and purity, while fluorometric methods like Qubit offer highly sensitive and specific measurements of DNA or RNA. Understanding the differences between these methods and when to use each can help ensure that your nucleic acid concentrations are accurate and suitable for downstream applications.

| **Method**               | **Principle** | **What It Measures** | **Advantages** | **Disadvantages** | **Best For** |  
|--------------------------|--------------|----------------------|----------------|-------------------|--------------|  
| **Spectrophotometric (e.g., NanoDrop)** | Measures absorbance at specific wavelengths | Total nucleic acid concentration (260 nm) and purity (260/280, 260/230 ratios) | - Quick, no reagents needed  <br> - Measures contaminants (protein, organic solvents, salts) | - Cannot differentiate DNA vs. RNA <br> - No quality assessment <br> - Less sensitive for low concentrations | Routine nucleic acid quantification when purity ratios are needed |  
| **Fluorometric (e.g., Qubit)** | Fluorescent dyes bind specifically to nucleic acids | Specific quantification of DNA, RNA, or protein in a sample | - Highly sensitive <br> - Differentiates DNA vs. RNA <br> - Works well for low concentrations | - Requires specialized reagents <br> - Does not measure purity | Accurate quantification of specific nucleic acid types, even in mixed samples |  

### Useful Links For Further Reading 

- [NanoDrop systems](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/ultraviolet-visible-visible-spectrophotometry-uv-vis-vis/uv-vis-vis-instruments/nanodrop-microvolume-spectrophotometers/nanodrop-products-guide.html) 
- [Qubit](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/fluorometers/qubit.html)

### Tapestation

TapeStation is an electrophoresis-based tool for assessing the integrity and fragmentation of nucleic acids. Unlike quantification methods, TapeStation provides a visual representation of sample quality, making it invaluable for assessing RNA degradation, DNA fragmentation, or the overall health of your samples. Below explains how TapeStation works and why it’s essential for ensuring that your RNA or DNA samples are suitable for high-quality sequencing and other genomic assays. By using TapeStation, you can confirm the quality of your samples before proceeding with sequencing to minimize the risk of failed experiments.

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
This table offers an overview of best practices for library preparation and quality assessment in genomics. Preparing your samples correctly for sequencing is a crucial step, as the quality of your libraries will directly impact the accuracy and reliability of your sequencing results. It includes links to helpful resources for learning more about various preparation techniques and assessing nucleic acid purity and integrity. This table serves as a guide to understanding the essential steps for successful library preparation and quality assessment, ensuring that your sequencing runs smoothly.

| Topic | Description | Resources |
|-------|------------|-----------|
| **Library Preparation for Sequencing** | Overview of library prep applications, methods, and challenges | [Genohub Guide](https://genohub.com/ngs-library-preparation-kit-guide/), [Illumina Resources](https://www.illumina.com/techniques/sequencing/ngs-library-prep.html), [Method Explorer](https://www.illumina.com/science/sequencing-method-explorer.html) |
| **Quality Assessment** | Best practices for assessing nucleic acid purity and integrity | [Labome RNA Extraction](https://www.labome.com/method/RNA-Extraction.html), [Labome DNA Extraction](https://www.labome.com/method/DNA-Extraction-and-Purification.html) |

### Sequencing Platforms
In genomic research, selecting the right sequencing platform is critical for obtaining high-quality data that matches the needs of your study. This table compares various sequencing technologies, including Illumina short-read sequencing, PacBio long-read sequencing, and 10X Genomics' single-cell and spatial sequencing platforms. Understanding the strengths and weaknesses of each platform will help you choose the most appropriate one for your project, whether you need high-throughput sequencing, full-length transcripts, or single-cell resolution. The linked resources provide additional insights into each technology's capabilities and applications.
| Technology | Description | Resources |  
|------------|-------------|-----------|  
| **Illumina Sequencing** | Short-read sequencing platform using Sequencing-by-Synthesis (SBS) technology | [Illumina Overview](https://www.illumina.com/techniques/sequencing.html), [SBS Video](https://www.youtube.com/watch?v=fCd6B5HRaZ8) |  
| **PacBio SMRT Sequencing** | Long-read sequencing technology for full-length transcripts & high accuracy |[PacBio SMRT Science](https://www.pacb.com/smrt-science/smrt-sequencing/) |  
| **10X Genomics** | Single-cell and spatial genomics platform | [10X Genomics Website](https://www.10xgenomics.com/) |  

### Sequencing Applications
Different sequencing applications serve distinct research goals, and choosing the right application is essential for obtaining meaningful results. This table outlines several popular sequencing applications, from RNA sequencing (RNA-seq) to CRISPR screens and ATAC-seq. Each application is designed for specific research questions, such as gene expression profiling, chromatin accessibility, or targeted mutation analysis. This table helps you navigate the diverse array of sequencing applications and guides you in selecting the one that best fits your research objectives.

| Application | Description | Resources |  
|-------------|-------------|-----------|  
| **RNA Sequencing (RNA-seq)** | Profiling gene expression & transcriptome analysis |[RNA-seqlopedia](https://rnaseq.uoregon.edu/), [Best Practices](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0881-8) |  
| **Small RNA Sequencing** | Focused on miRNA and other small RNAs | [Genohub miRNA Guide](https://genohub.com/services/sequencing/illumina-miRNA-sequencing-services) |
| **CUT&RUN** | Nuclease-based chromatin profiling for protein-DNA interactions | [Original CUT&RUN Paper](https://elifesciences.org/articles/21856) |
| **Whole Exome Sequencing (WES)** | Targets protein-coding regions of the genome | [Illumina WES](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/exome-sequencing.html) |
| **Targeted Sequencing** | Focused sequencing of specific genomic regions | [Illumina Targeted Sequencing](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/targeted-panels.html) |
| **CRISPR Screens** | Genome-wide screening for gene function | [CRISPR Overview Video](https://www.youtube.com/watch?v=4YKFw2KZA5o), [Applications in Research](https://www.nature.com/articles/nbt.3659) |
| **ChIP-seq** | Chromatin immunoprecipitation for studying protein-DNA interactions | [ChIP-seq Overview](https://epigenie.com/guide-getting-started-with-chip-seq/) |
| **ATAC-seq** | Assays chromatin accessibility genome-wide | [ATAC-seq Guide](https://www.activemotif.com/blog-atac-seq), [ATAC-seq Paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4374986/) |
| **Nanostring** | Digital gene expression profiling technology | [Nanostring Website](https://www.nanostring.com/) |



## Fred Hutch Specific Resources
Fred Hutch provides several specialized resources to support researchers throughout their genomics workflows, from sample preparation to data analysis. This table lists resources available to Fred Hutch researchers, such as access to the Genomics Core and Bioinformatics Core. Whether you need guidance on experimental design, access to shared equipment, or bioinformatics support, these resources can streamline your research process. The table links to relevant Fred Hutch websites, providing easy access to additional details and support services.
Here are some resources:  

| **Resource** | **Description** | **Relevant Links** |  
|-------------|---------------|---------------------|  
| **Qubit Reader Access** | Researchers can email the `reagents` listserv to find nearby labs with a Qubit reader. | N/A |  
| **Genomics Core** | Fred Hutch provides multiple shared resource groups, from specimen processing to genomics. | [Genomics Core Site](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics.html) |  
| **Bioinformatics Core** | Offers to discuss experimental design, choice of data analysis strategies and software tools via fee-for-service. | [Bioinformatics Core Site](https://www.fredhutch.org/en/research/shared-resources/core-facilities/genomics-bioinformatics/bioinformatics-services.html) |  
| **Data House Calls** | Offers free consultations to discuss effective data science and bioinformatics strategies available to all Fred Hutch staff. | [Data House Calls](https://ocdo.fredhutch.org/programs/dhc.html) |  

