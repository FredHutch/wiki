---
title: Hypotheses in the Era of Large Scale Molecular Data
last_modified_at: 2018-08-31
---


## Hypothesese in the Era of Large Scale Molecular Data
Develop a hypothesis that will have reasonable statistical power and feasible sets of samples for a specific type of data.  Then analyze the data collected with the original hypothesis in mind and then stop.  Don't mine the data indefinitely, because while you'll find something eventually, it may not mean anything.

### Sample Sizes:  Power calculations in the 'omics setting
More to come about how to identify what types of hypotheses have the possibility to be addressed with what sample sizes.  

### Significance in the 'omics setting:  Multiple Testing
More to come.  Statistically, this is defined as the testing of more than one hypothesis at a time.  Pragmatically, this changes 'omics significance levels based on the breadth of your assay and the number of different cohort arrangements on which statistical tests are run.

The resources below will help you understand the broad strokes before consulting with a statistician about your project's specific details.

### Available Resources
 - [Defining the scientific method](https://www.nature.com/articles/nmeth0409-237.pdf?origin=ppub), an editorial published in Nature Methods in 2009.  "Science, it turns out, is whatever scientists do." - David Goodstein

- [Wikipedia's page on statistical power](https://en.wikipedia.org/wiki/Statistical_power)

- [GPower](http://www.gpower.hhu.de/):  Downloadable software for a variety of tests, including graphical power analysis results.  Not 'omics-specific, but a good reference.

- [Power and sample size calculations for high-throughput sequencing-based experiments](https://academic.oup.com/bib/article-lookup/doi/10.1093/bib/bbx061)(Li et al 2017):  Figure 1 and Table 1 have references to papers on computational bioinformatics tools for various power calculations

- [How does multiple testing correction work?](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2907892/) (Noble 2010)


## Study Design and Data Types
You could design a house without an architect, but the time and money you would spend while trying to do so are effectively wasted because there are people for whom this procedural and rote knowledge is their job.  The same is true for 'omics - there is an incredible quantity of statistics, bioinformatics and sample preparation that goes into this process. To give a study the best chance of succeeding (and being possible with the $ resources available in a suitable amount of time), identify a set of collaborators familiar with the experimental design and statistics required for a study of this kind.  

There are the two general types of studies using large scale molecular data sets, which can loosely be thought of as "investigative" and "comparative."  The two aren't completely extricable and can each can serve as groundwork for future experiments for the other.  The process to perform these types of studies, however can be very different, and the details specific to each are best addressed prior to beginning a process involved in generating materials or data sets. 

Finding a collaborator to help identify if any biological feature supports or rejects your hypothesis using large scale molecular data is important because of the issues of multiple testing, determining biological significance and power issues unique to large data sets where the number of measurements (p) is much larger than the sample size (n).  The statistics required when n>>p are very different than those when p>>n and finding someone who is well versed in the specific issues that arise in this context is important.  

### Available Resources
- The Clinical Biostatistics Shared Resource can also help with study design and guide in what is realistic statistically.  Email `biostatistics`.
- The Bioinformatics Shared Resource associated with the Fred Hutch Genomics Shared Resource is a valuable source of guidance for developing a plan for a study and with the Genomics group can provide detailed information about available platforms, estimated costs and process-specific issues to be accounted for when choosing the type of data to acquire. Email `bioinformatics`.


## Rigor and Reproducibility
The reproducibility of a bioinformatic or statistical analysis has been highlighted in recent years a major challenge especially in situations where the raw data are very large, private or otherwise challenging to share with reviewers of publications based on them.  Approaching a study with the intent to create a reproducible result involves a bit more forethought than usual, and a good handle on what types of tools area available to document processes.  The data management tools highlighted in this Wiki are good places to start to address reproducibility.  


## Confounding and Unintended Covariates
Issues we intend to expand upon in this section include the types of confounding covariates that can occur when using large scale molecular data, such as batch effects of assay material isolation or genomics data creation.  Randomization of samples based on intended covariates (group A vs group B relating to the specific hypothesis the study is designed to address) as well as unintended covariates (such as sex, specimen type, date of specimen acquisition, laboratory performing the preservation or isolation, or other variables that are not associated the primary hypothesis), is critical to plan for in a study especially considering the costs to generate these data as well as the use of limited human specimens.   

