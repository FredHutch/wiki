---
title: Managing Code and Computing
last_modified_at: 2018-12-17
---
This section contains a variety of emerging topics that are becoming more critical for researchers to implement in their work.  

## [Overview of Compute Resources on Campus]({{ site.baseurl }}/bioinformatics/compute_resoverview/)
Researchers are more and more likely to need to analyze raw data sets using some sort of analysis process before they can be interpreted in the context of the scientific question. Raw data, whether from an array or sequencing for example, are not typically directly interpretable results, thus require some degree of processing. The nature of the processing depends on the data type, the platform with which the data were generated, and the biological question being asked of the data set. How this process is performed depends on the specific project, but support and resources for this process are available at the Fred Hutch for a variety of needs.  This section contains a basic overview of computing resource options available to Fred Hutch researchers, all the way from a single laptop to the Fred Hutch on-premise high performance computing cluster (gizmo) to various cloud-based options.


## [Github, Versioning and Sharing Code]({{ site.baseurl }}/bioinformatics/compute_github/)
While version control software has evolved over time, a new evolution that is happening more and more is the need for a wider group of researchers to actively use version control resources to manage their code and documentation of processes that are ongoing in their research. From the perspective of reproducibility, shareability and interoperability, the need for a sharing platform that integrates version control and collaboration is becoming more and more a critical part of a researcher’s toolkit. Thus, regardless of the degree to which code plays a direct role in a research project, more and more often at least a cursory understanding of what GitHub is and how it can be utilized in scientific research is important.


## [Notebooks and User Interfaces]({{ site.baseurl }}/bioinformatics/compute_uis/)
While programming in R, Python or other languages is an important skill to learn, another layer of how to actually implement and manage processes you have developed in the code you’ve written can be useful. To manage the interface between code and environments, versioning and more integrated features (e.g. git or multi-language processes), various Notebook or User Interfaces exist. This document is an overview of common user interfaces commonly used to manage or interact with code.

## [Docker]({{ site.baseurl }}/bioinformatics/compute_docker/)
Docker is an important tool for reproducible analysis in research, as it can be valuable in ensuring the computing environment an analysis is performed in can be completely reproduced.  At its core, Docker is a tool that lets you run code inside a totally fixed and reproducible computational environment. If you have used virtual machines, then you can think of a Docker container as being a lightweight, portable, intuitive system for building and running virtual machines. The major difference between a Docker container and virtual machine is that Docker doesn’t come with operating system, which makes it more lightweight and portable. However, Docker containers do require the Docker engine to run them, which is a client-side application. More about using Docker at Fred Hutch is on this [Introduction to Docker](/bioinformatics/compute_docker/) page, and we have provided a detailed set of instructions in the [Computing Resource Library](/compdemos/Docker/).
