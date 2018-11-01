---
title: Proteomic methods
last_modified_at: 2018-10-30
primary_reviewers: jdberndt
---

Proteomics refers to a collection of methods used to discover and quantify the abundance and state of proteins in cells and tissue. Given that proteins are the primary drivers of cellular function, understanding which proteins are present and how they relate to one another can provide powerful insight into cell and systems biology. Likewise, analyzing proteins as biomarkers has proven useful for diagnosing disease and stratifying patients for personalized medicine.

The most basic division among proteomics experiments is the use of top-down versus bottom-up approaches. Top-down approaches, such as 2D gel electrophoresis, attempt to quantify entire proteins. In contrast, bottom-up approaches break proteins into small fragments, often proteolytic peptides, and algorithmically reconstruct protein identities.

A second important distinction is between "discovery" and "targeted" proteomic methods. Discovery proteomics addresses global changes in the relative abundance of multiple proteins; whereas targeted proteomics precisely quantifies a priori selected proteins or protein isoforms, e.g. phosphorylated proteins.

## Data acquisition  
This article primarily focuses on data acquisition using mass spectrometry (MS). MS-based approaches are the most widely used in the research community and the technology is rapidly evolving.

#### Discovery approaches  
- Likely, the most commonly used discovery proteomics method is so called "shotgun" proteomics which is used to identify multiple proteins in a mixture of unknown composition, e.g. cell lysate. The protein mixture is digested with proteolytic enzymes, typically trypsin. The resulting mixture of peptides is separated according to their relative hydrophobicity using reverse phase HPLC and sequentially eluted directly into a mass spectrometer. In the mass spectrometer, the vaporized peptides are ionized and focused through a series of electromagnetic chambers (traps). In a typical MS-MS-type experiment, an RF sweep is used to resonate with ions according to their mass charge ratio (m/z). This alters the trajectory of the peptides and ejects them from the trap and into a detector, e.g. a PMT. The signal is recorded as a chromatogram of m/z and time (MS1). The acquisition software selects the most abundant ions and then refills the trap with the selected peptide. The peptides are bombarded with energized gas to randomly fragment them along the peptide bond. The resultant fragment ions are then quantified (MS2). The data from the MS2 scans are used to determine the identity of the peptide typically by matching the m/z profile of the various fragment ions to the expected fragmentation patterns from an in silico digested library of proteins (see data analysis below). Peptide abundance is typically calculated from the area under the curve for the precursor peptide in the MS1 scan.

#### Targeted approaches  
- MRM  

#### Non mass spectrometry-based methods  
- Antibody array  

## Sample Preparation  
- Whole cell proteomics  
- Analysis of post-translational modifications  
- Kinase profiling  
- Identification of protein-protein interactions  
- Protein identification  

## Data analysis  
#### Peptide spectrum matching  
- Protein Pilot  
- Sequest  
- Comet
- Andromeda  
- OMSSA  


#### Quantitative methods  
- MaxQuant
- Skyline  





### Available Resources  
- [FH Shared Resources page](https://sharedresources.fredhutch.org/core-facilities/proteomics)
- [UW Proteomics Resource](http://proteomicsresource.washington.edu)
- [UW Genome Sciences, see MacCoss, Bruce, and Villen labs](http://www.gs.washington.edu/index.htm)
- [Pacific Northwest Mass Spec Group](http://www.pacmass.org)
