# Nucleic Acid Omnibus

Multiple processes can be involved in the isolation, quality assessment and preparation of biological materials upstream of large scale data collection. For many types of datasets, the particulars of the method of nucleic acid extraction and quality assessment process can have a large impact on the quality, relevance, and interpretability of the resulting data. Thus, it is critical to ensure that a correct set of conditions are chosen before any specimens are prepared for analysis.

The sections below contain an array of background information about isolation and quality control (QC) of nucleic acids when the downstream application is a large scale molecular data type.

## Nucleic Acid Isolation Methods

There is a tradeoff between purity and yield when it comes to nucleic acid isolation. Thus choosing an appropriate nucleic acid isolation method for the sample and the data intended to be made is critical. Precipitation-based methods tend to provide a larger representation of total nucleic acid types (both large and small fragments), but can have higher levels of "contaminating" nucleic acid types that are not the intended target (e.g., miRNA in the mRNA, RNA in the genomic DNA). Selection-based isolation techniques (affinity column or magnetic-bead) tend to produce higher purity nucleic acids at the expense of yield due to their selectivity. Important considerations for which approach to isolation is desired will include the minimum amount of nucleic acid required for a given assay as well as the inherent sample preparation steps involved in generating those data. Specimen preservation types can also influence the type of nucleic acid extraction approaches that are desirable. For example, cryopreserved, viable cell suspensions tend to provide more intact nucleic acids, while FFPE tissues will tend to produce fragmented nucleic acids due solely to their preservation method, even without issues such as degradation and human error in processing.

### RNA Considerations

RNA extraction kits will typically isolate total RNA (small RNAs, mRNAs, rRNAs among [other types of RNA](https://en.wikipedia.org/wiki/RNA#Types_of_RNA){:target="_blank"}<!--_-->) or are moiety-specific (such as mRNAs only). Depending on the downstream application, one approach may be more successful than another despite the intended target. An example is in the case of cDNA preparation for mRNA sequencing via Illumina's TruSeq reagent set. While the final cDNA that is sequenced is enriched for mRNA, the first step in the sample preparation is an mRNA bead based isolation, which means upstream, the ideal sample would be intact, pure total RNA of sufficient quantity and isolating mRNA specifically can be redundant and can result in insufficient yields. Thus, matching isolation approaches to the downstream sample preparation and data type is important to consider prior to beginning a project.

### DNA considerations

DNA extraction from samples of varying quantities and preservation methods can be limited by the fragment length of the isolated DNA and its appropriateness to the downstream sample prep steps. Choosing a method that incorporates the specimen type is important to avoid situations where sufficient yield of DNA is obtained, but the resulting fragments are so small that they are incompatible with the analysis type. For example, fragmented DNA may not provide usable data for a capture based sample preparation, such as an exome sequencing library preparation, that starts with a probe based hybridization because the selected fragments bound to the probes may not be long enough to then sequence sufficiently far to produce usable data.

### Available Resources:

* Some summaries of extraction kits can be found at the following links:

    * DNA extraction - [Labome overview of DNA extraction kits and applications](https://www.labome.com/method/DNA-Extraction-and-Purification.html){:target="_blank"}<!--_-->

    * RNA extraction - [Labome overview of RNA extraction kits and application*s](https://www.labome.com/method/RNA-Extraction.html){:target="_blank"}<!--_-->

## Quantification Methods

There are two main approaches to quantifying nucleic acids in solution after isolation. Both provide important information that will influence what downstream analyses are possible and suitable, but are not interchangeable, thus it is important to know what types of data describing the nucleic acids can be obtained via each method.

### Spectrophotometric analysis

Spectrophotometic analysis (e.g. via [NanoDrop systems](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/ultraviolet-visible-visible-spectrophotometry-uv-vis-vis/uv-vis-vis-instruments/nanodrop-microvolume-spectrophotometers/nanodrop-products-guide.html){:target="_blank"}<!--_-->) is a common quantification method that allows measurement of quantity and purity of nucleic acid samples, via their absorbance of light. Total amount of nucleic acid is determined by the absorbance at 260nm. Amounts of common contaminants can also be measured with this method - remaining protein is measured via absorbance at 280nm; remaining organic solvents and salts are measured via absorbance at 230nm. Purity of the sample is assessed by calculating ratios of absorbances: 260/280 and 260/230. Nucleic acid samples are generally considered pure enough for sequencing if 260/280 > 1.8 and 260/230 > 1.7.

**Of Important Note:** Both RNA and DNA absorb light at 260nm. Spectrophotometric analysis will tell you the **total** amount of nucleic acid (all moieties) in your sample. Also, this analysis does not give information about the quality of the nucleic acid in the sample. To assess amounts of specific nucleic acid, use a fluorescent dye-tagging quantification (fluorimetric) method; in addition, assessment of nucleic acid quality requires electrophoresis via TapeStation (see below).

### Fluorimetric analysis

Fluorometric analysis (e.g. via a [Qubit](https://www.thermofisher.com/us/en/home/industrial/spectroscopy-elemental-isotope-analysis/molecular-spectroscopy/fluorometers/qubit.html){:target="_blank"}<!--_-->)) relies on fluorescent dyes that bind to specific types of nucleic acid (RNA, dsDNA, ssDNA) or protein. Fluorescence assays can thus be more sensitive than spectrophotometric assays for nucleic acid quantification, can provide quantitation of specific moieties of nucleic acids even in mixed solutions, but do not give any information about nucleic acid purity or quality. Qubit systems are often in many labs around the Hutch and consist of a base reader as well as specific assays for the different types and concentrations of nucleic acid.

## Quality Assessment Methods

### TapeStation

To assess nucleic acid quality, it is necessary to perform electrophoresis. This process separates nucleic acid fragments by size and charge in order to evaluate the amount of fragmentation and degradation in a sample. Often these types of analysis will also quantitate the amount of nucleic acid in the sample but does not give any information about nucleic acid purity.

For RNA samples, you can use the results of electrophoresis to calculate an RNA Integrity Number (RIN) value. RIN is a calculated ratio of 28S and 18S rRNA amounts, and is used as a metric of RNA quality. Higher RINs reflect less fragmentation and higher quality RNA; lower RINs indicate RNA degradation. The extraction method itself can have an effect on RIN values and how they should be interpreted. Phenol-chloroform (precipitation-based) extractions may result in lower RIN due to inclusion small RNA types; conversely, column-based extractions may falsely inflate RIN due to exclusion of small RNAs/degradation products in the final isolate analyzed via TapeStation. In general, RIN values > 8 are considered appropriate for sequencing.

### Additional Resources

* Consider emailing the reagents listserv in order to find laboratories near you that have a Qubit reader.

* The Fred Hutch Genomics lab members are very helpful and can provide guidance for what works best for different types of genomics assays. [The Hutch Genomics Core site is here along with the relevant contact info for the group.](https://sharedresources.fredhutch.org/core-facilities/genomics){:target="_blank"}<!--_-->)

* The Fred Hutch Genomics lab also provides access to TapeStation analysis for nucleic acids (to determine RIN for RNA or fragment sizes for DNA). Samples can be submitted for fee-for-service via Hutchbase. Check in with the Genomics lab members for specific instructions on sample concentration and volume requirements as well as assay choice (there are several different assays that can be run on the TapeStation).

* For more information on [RIN definition and background for why it is important to consider when using RNA as an assay material, this article provides additional information.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1413964/){:target="_blank"}<!--_-->)

* [Here is a useful reference outlining the amount/quality of a few FFPE nucleic acid extraction kits.](https://doi.org/10.1016/j.ab.2010.01.014){:target="_blank"}<!--_-->)
