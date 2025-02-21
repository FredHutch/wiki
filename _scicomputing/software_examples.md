---
title: Code Examples and Templates
primary_reviewers: k8hertweck
---
Our [Resource Library](/compdemos/) includes tutorials of how to perform common computational tasks using software available at Fred Hutch. If you're interested in implementing these methods on your own data following best practices for reproducibility, the resources below include templates for setting up your own analyses, as well as additional examples of executable code that can be tailored to suit your own needs.

These templates and examples are generally published as GitHub repositories. If you are unfamiliar with GitHub, please see our section on [Managing and Sharing Code]. If you have other templates or examples you would like to see posted here, please file an [issue in our GitHub repository](https://github.com/FredHutch/wiki/issues) or read our [contributing guidelines](https://github.com/FredHutch/wiki#contributing-to-sciwiki) to learn how you can add the content yourself.

## Coding Practices

In addition to building your project within the file structure of the templates below, you should apply these coding practices to all your software development work:
1. Raw and processed data should be stored separately.
1. Source code and results should be organized and clearly labeled.
1. All projects should contain a license and a README file, with a project overview and details about each component in the README.
1. Code should be fully documented. Additional documentation, instructions and examples can be included in a separate folder.
1. Reuse existing code (or packages) when available.
1. Code should be automated to reduce transcription errors.
1. Use inline comments and meaningful variable names to help make your code readable to reviewers, researchers, and your future self.
1. For Python packages and modules, include Help documentation.


## Templates for data analysis and coding

The following repositories were created by researchers at Fred Hutch to assist in software development and data analysis following best practices for reproducibility.

- [Python data analysis template](https://github.com/FredHutch/python-analysis-template): Data analysis project using Python in Jupyter notebooks
- [Python tool development template](https://github.com/FredHutch/python-tool-template): Developing a Python package
- [Flask Python template](https://github.com/FredHutch/flask-python-template): Creating a web application using Python
- [Shiny app template](https://github.com/FredHutch/shiny-app-template): template for creating an interactive web application using the R package Shiny
- [SCHARP templates](https://github.com/FredHutch/scharpTemplates): templates used by the Fred Hutch research group [SCHARP](https://www.fredhutch.org/en/research/divisions/vaccine-infectious-disease-division/research/biostatistics-bioinformatics-and-epidemiology/statistical-center-for-hiv-aids-research-and-prevention/about.html0) for data analysis in R

Other groups have developed templates for more general use:

- [Cookiecutter](https://cookiecutter.readthedocs.io) is a command-line utility that allows you to create projects from project templates that includes a wide variety of functionality for different languages.
- [Shablona](https://github.com/uwescience/shablona) is a template developed by UW's eScience that is specifically designed for small scientific Python projects.

## Fred Hutch Code Examples

These repositories were created by Fred Hutch researchers and staff, and contain a variety of curated example code with documentation.

- [Data Science Example Code](https://github.com/FredHutch/data-science-examples): Example code for a variety of common data science analysis tasks, longer than what appears in the [Resource Library](/compdemos/), but not so long as to warrant their own repositories.
- [Slurm examples](https://github.com/FredHutch/slurm-examples): Examples of using Slurm (the [job management system](/scicomputing/compute_overview/#job-management) used on our cluster) for life sciences research tasks.
- [Batch pipeline](https://github.com/FredHutch/batch_pipeline): Example workflows for a multi-step array job on AWS Batch (cloud computing)
- [Nextflow examples](https://github.com/FredHutch?utf8=✓&q=nf&type=&language=): this link shows all repositories containing Nextflow (`nf`) examples in the Fred Hutch GitHub organization. Each repository represents a different kind of analysis.  
- [WDL examples](https://github.com/FredHutch?q=wdl&type=all&language=wdl&sort=)this link shows all public repositories containing WDL examples in the Fred Hutch GitHub organization. 
- [WILDS WDLs](https://getwilds.org/projects.html#wdls): a collection of pre-written WDL workflows you can fork and customize for your own use developed by Fred Hutch staff. 
- Older repositories involving workflows that are useful for reference:
  - [Single Cell RNAseq workflows](https://github.com/FredHutch/scrnaseq-workflows): basic outline of different approaches to workflows used in scRNAseq. Includes some perspective on why some approaches may be more effective.
  - [Reproducible Workflows](https://github.com/FredHutch/reproducible-workflows): examples of various workflows (Cromwell, WDL, AWS), with guidance for use of each.
