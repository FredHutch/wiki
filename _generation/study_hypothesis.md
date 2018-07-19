---
title: Hypotheses in the Era of Large Scale Molecular Data
last_modified_at: 2018-07-19
---

Develop a hypothesis that will have reasonable statistical power and feasible sets of samples.  Then analyze the data collected with the original hypothesis in mind and then stop.  Don't mine the data indefinitely, because while you'll find something eventually, it may not mean anything.

## Sample Sizes:  Power calculations in the 'omics setting
More to come about how to identify what types of hypotheses have the possibility to be addressed with what sample sizes.  

## Significance in the 'omics setting:  Multiple Testing
More to come.  Statistically, this is defined as the testing of more than one hypothesis at a time.  Pragmatically, this changes 'omics significance levels based on the breadth of your assay and the number of different cohort arrangements on which statistical tests are run.

The resources below will help you understand the broad strokes before consulting with a statistician about your project's specific details.

## Available Resources:
 - [Defining the scientific method](https://www.nature.com/articles/nmeth0409-237.pdf?origin=ppub), an editorial published in Nature Methods in 2009.  "Science, it turns out, is whatever scientists do." - David Goodstein

- [Wikipedia's page on statistical power](https://en.wikipedia.org/wiki/Statistical_power)

- [GPower](http://www.gpower.hhu.de/):  Downloadable software for a variety of tests, including graphical power analysis results.  Not 'omics-specific, but a good reference.

- [Power and sample size calculations for high-throughput sequencing-based experiments](https://academic.oup.com/bib/article-lookup/doi/10.1093/bib/bbx061)(Li et al 2017):  Figure 1 and Table 1 have references to papers on computational bioinformatics tools for various power calculations

- [How does multiple testing correction work?](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2907892/) (Noble 2010)


## Study Design and Data Types
You could design a house without an architect, but the time and money you would spend while trying to do so are effectively wasted because there are people for whom this procedural and rote knowledge is their job.  The same is true for 'omics - there is an incredible quantity of statistics, bioinformatics and sample preparation that goes into this process. To give a study the best chance of succeeding (and being possible with the $ resources available in a suitable amount of time), identify a set of collaborators familiar with the experimental design and statistics required for a study of this kind.  

### Available Resources
- The Clinical Biostatistics Shared Resource can also help with study design and guide in what is realistic statistically.  Email FH username **biostatistics**.
- The Bioinformatics Shared Resource associated with the Fred Hutch Genomics Shared Resource is a valuable source of guidance for developing a plan for a study and with the Genomics group can provide detailed information about available platforms, estimated costs and process-specific issues to be accounted for when choosing the type of data to acquire. Email FH username **bioinformatics**.


## Study Types
There are the two general types of studies using large scale molecular data sets, which can loosely be thought of as "investigative" and "comparative."  The two aren't completely extricable and can each can serve as groundwork for future experiments for the other.  The process to perform these types of studies, however can be very different, and the details specific to each are best addressed prior to beginning a process involved in generating materials or data sets.  

## Preparing your Study Proposal
You could design a house without an architect, but the time and money you would spend while trying to do so are effectively wasted because there are people for whom this procedural and rote knowledge is their job.  The same is true for large scale molecular datasets as there is an incredible quantity of study design, sample preparation, genomics data production, bioinformatics and statistics that goes into this process. To give your study the best chance of succeeding (both in getting funding and scientifically), it's best to identify a set of collaborators familiar with the aspects of the research for which your team does not already have expertise.  

The Translational Genomics Data Coordination Center is available for collaboration in grant supported projects to provide access to a system of data management tools they manage to facilitate translational studies using large scale molecular data.  Also, we can help facilitate as-needed collaborations with various affiliated members of the Fred Hutch community with expertise in sample banking, assay material preparation, genomics data generation, bioinformatics and statistics.  If your study needs some support in these areas, we can work with you to both incorporate material into your application and also support your study over the course of the phases of research in areas where your team does not have expertise.  The project team that leads this effort has "boilerplate" NIH grant materials that we will provide after consultation to tailor the material to your particular study.  

Finding a collaborator to help identify if any biological feature supports or rejects your hypothesis using large scale molecular data is important because of the issues of multiple testing, determining biological significance and power issues unique to large data sets where the number of measurements (p) is much larger than the sample size (n).  The statistics required when n>>p are very different than those when p>>n and finding someone who is well versed in the specific issues that arise in this context is important.  

More to come on the following topics.  

## Reproducibility
The reproducibility of a bioinformatic or statistical analysis has been highlighted in recent years a major challenge especially in situations where the raw data are very large, private or otherwise challenging to share with reviewers of publications based on them.  Approaching a study with the intent to create a reproducible,

## Experimental Design
Issues to expand upon include assessing variability in the data generated in the cohorts of interest, the definition of a replicate, and approaches to power calculations using large scale datasets.

## Confounding and Unintended Covariates
Issues to expand upon include the types of confounding covariates that can occur when using large scale molecular data, such as batch effects of assay material isolation or genomics data creation.  Randomization of samples based on intended covariates (group A vs group B relating to the specific hypothesis the study is designed to address) as well as unintended covariates (such as sex, specimen type, date of specimen acquisition, laboratory performing the preservation or isolation, or other variables that are not associated the primary hypothesis), is critical to plan for in a study especially considering the costs to generate these data as well as the use of limited human specimens.   

### Available Collaborative Resources
  - Fred Hutch Bioinformatics Core:  Email FH username **bioinformatics**
  - Fred Hutch Biostatistics Resource: Email FH username **biostatistics**
