---
title: Proteomic Data and Methods
last_modified_at: 2018-10-30
primary_reviewers: jdberndt
---

Proteomics refers to a collection of methods used to discover and quantify the abundance and state of proteins in cells and tissue. Given that proteins are the primary drivers of cellular function, understanding which proteins are present and how they relate to one another can provide powerful insight into cell and systems biology. Likewise, analyzing proteins as biomarkers has proven useful for diagnosing disease and stratifying patients for personalized medicine.

The most basic division among proteomics experiments is the use of top-down versus bottom-up approaches. Top-down approaches, such as 2D gel electrophoresis, attempt to quantify entire proteins. In contrast, bottom-up approaches break proteins into small fragments, often proteolytic peptides, and algorithmically reconstruct protein identities.

A second important distinction is between "discovery" and "targeted" proteomic methods. Discovery proteomics addresses global changes in the relative abundance of multiple proteins; whereas targeted proteomics precisely quantifies a priori selected proteins or protein isoforms, e.g. phosphorylated proteins.

## Data Acquisition  
This article primarily focuses on data acquisition using mass spectrometry (MS). MS-based approaches are the most widely used in the research community and the technology is rapidly evolving.

### Discovery approaches  
Likely, the most commonly used discovery proteomics method is so called "shotgun" proteomics which is used to identify multiple proteins in a mixture of unknown composition, e.g. cell lysate. The protein mixture is digested with proteolytic enzymes, typically trypsin. The resulting mixture of peptides is separated according to their relative hydrophobicity using reverse phase HPLC and sequentially eluted directly into a mass spectrometer. In the mass spectrometer, the vaporized peptides are ionized and focused through a series of electromagnetic chambers (traps). In a typical MS-MS-type experiment, peptides are electromagnetically separated according to their mass charge ratio (m/z) and ion intensity is quantified, e.g. by a PMT. Thus, the signal is recorded as a three dimensional chromatogram of ion intensity, peptide m/z, and elution time (MS1 scan). The acquisition software selects the most abundant ions and then refills the trap with peptides in a selected window of m/z. The peptides are bombarded with energized gas to randomly fragment the peptide. Since proteins bonds are weakest between amino acids, this creates a series of fragment peptides of varying length. The intensity of the fragment ions is then quantified (MS2). The data from the MS2 scans are used to determine the identity of the peptide, typically by matching the m/z profile of the various fragment ions to the expected fragmentation patterns from an *in silico* digested library of proteins (see data analysis below). Peptide abundance is generally calculated using the area under the curve for the elution profile of the precursor peptide in the MS1 scan. This acquisition scheme is called "data-dependent" because the data from the MS1 scan is used to determine which peptides are analyzed in the MS2 scan.

### Targeted Approaches
Targeted proteomics or data-independent acquisition takes a somewhat different approach where individual peptides are selected ahead of time (often from separate preliminary discovery proteomics experiments). While the starting material and separation methods are similar, the instrument is programmed to look for peptides with a particular m/z. Synthetic peptides matching the peptide of interest are spiked into the sample for use as an internal reference standard. Peptide abundance is calculated from MS1 data.  More about targeted approaches to come.  

### Non-Mass Spectrometry Based Methods  
In addition to mass spectrometry, other methods such as antibody microarrays and multidimensional polyacrylamide gel electrophoresis can be used to describe and quantify complex protein mixtures. These techniques are typically lower cost and may be better (particularly relative to shotgun proteomics) at quantifying proteins with relatively low abundance. However, targeted MS methods are largely supplanting these older methods except in specialized cases.

## Sample Preparation  
>More content to come!

- Whole cell proteomics  
- Analysis of post-translational modifications  
- Kinase profiling  
- Identification of protein-protein interactions  
- Protein identification  

## Instrumentation
>More content to come!

- Ion trap
- Triple quad
- Hybrid

## Data Analysis  
>More content to come!

### Software
A wide variety of commercial and open source software are available. Some of the more commonly used packages are list below:

- [Mascot](http://www.matrixscience.com)
- [Proteome Discover](https://www.thermofisher.com/order/catalog/product/OPTON-30795)
- [Protein Pilot](https://sciex.com/products/software/proteinpilot-software)  
- [SEQUEST Sorcerer](https://www.sagenresearch.com)  
- [Comet](http://comet-ms.sourceforge.net)
- [MaxQuant/Andromeda](https://www.biochem.mpg.de/5111795/maxquant)  
- [X!tandem](https://www.thegpm.org/tandem/api/index.html)
- [Skyline](https://skyline.ms/project/home/software/Skyline/begin.view)


## Available Resources  
- [FH Shared Resources page](https://sharedresources.fredhutch.org/core-facilities/proteomics)
- [UW Proteomics Resource](http://proteomicsresource.washington.edu)
- [UW Genome Sciences, see MacCoss, Bruce, and Villen labs](http://www.gs.washington.edu/index.htm)
- [Pacific Northwest Mass Spec Group](http://www.pacmass.org)
