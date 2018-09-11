---
title: Experimental Data Management
last_modified_at: 2018-07-19
---

While clinical covariates (like age, race, or disease type) are often part of a study's experimental design, additional covariates may be of interest that originate from laboratory based processes.  There are two main sources of laboratory based covariates that are important to track and consider when using large scale molecular data in a study:  Experimental and Process-Related.  

## Experimental and Process-Related Laboratory Covariates
Because large scale molecular datasets can measure so many targets simultaneously, it becomes important to record sample processing information for each specimen, so that any variables that might create a "batch effect" can be addressed in the final analysis.  [This review](https://www.nature.com/articles/nrg2825) highlights the need to include processing data in analyses, to assess the impact of batch effects on downstream results.

The following list is far from exhaustive, but here are a few important process-related covariates to consider:
  - time it takes to preserve specimen
  - method of specimen preservation
  - any intermediate specimen processing (e.g. cell-selection techniques)
  - type and length of specimen storage
  - specimen transport information
  - method of nucleic acid isolation
  - nucleic acid quantity and quality metrics
  - lot numbers of processing reagents
  - processing procedure dates
  - technician performing each procedure

### Available Resources
The tools to capture laboratory covariates depend on the workflow needs.  Any type of data capture (lab notebooks, excel spreadsheets, etc.) is better than nothing; however, there are some tools that make the downstream utilization of those laboratory data easier. We have a few suggestions of platforms here at Fred Hutch:

  - [LabMatrix](http://www.biofortis.com/labmatrix): LabMatrix is a specimen tracking platform that can be used to capture clinical and laboratory covariates. One of its main strengths is the ability to capture lineage of specimen processing steps in a workflow (for example, multiple nucleic acid types could be extracted from the same tissue). More information on this system can be found on the [Specimen Banking page.]({{ site.url }}/generation/clsp_specimenBanking)

  - [REDCap](https://projectredcap.org): REDCap projects are flexible and secure ways to capture multiple types of data, including experimental and laboratory covariates. REDCap includes version-control and access-restriction features. Fred Hutch has its [own instance](http://research.fhcrc.org/cds/en/redcap.html) of REDCap and offers many [training opportunities](http://research.fhcrc.org/cds/en/redcap-training.html) to support researchers.
  
## Laboratory Data Management

  - [LabArchives Electronic Lab Notebooks](https://centernet.fredhutch.org/cn/u/center-it/projects/eln-project.html): as an alternative to paper lab notebooks, electronic notebooks can be quite useful in capturing and sharing laboratory covariates. Currently, Center IT is supporting LabArchives as a Fred Hutch ELN solution.
