---
title: Overview of Fred Hutch Computing Platforms for Bioinformatics
last_modified_at: 2018-06-20
---
Researchers are more and more likely to need to analyze raw data sets using some sort of analysis process before they can be interpreted in the context of the scientific question. Raw data, whether from an array or sequencing for example, are not interpretable results, but typically require some degree of processing. The nature of the processing depends on the data type, the platform with which the data were generated, and the biological question being asked of the data set.  How this process is performed depends on the specific project, but support and resources for this process are available at the Fred Hutch for a variety of needs.

The first step in doing this work is often as simple as "what computing resource do I need to use for this task?  This section contains articles that describe a range of computing resource options available to Fred Hutch researchers, all the way from a single laptop to the FH on prem high performance computing cluster (`gizmo`), to various cloud-based options, as well as how to get started using each platform.  

### Desktop computing platforms
While most bioinformatic analysis of genomics data, for example, will likely require more compute resources than are typically available in a desktop computer around campus, some smaller compute jobs can be done on a desktop or laptop.  For these smaller compute jobs, scientific computing languages [R](https://www.r-project.org) or [Python](https://www.python.org) may be useful (see [the Bioinformatics page for more information about these computing languages).](https://fredhutch.github.io/wiki/bioinformatics/inf_index/) You can obtain assistance in installing a copy of R and RStudio on PC's through the Center IT desktop software resource.  Macs come with an installation of Python 2 that is used by the operating system and can be accessed by using the Terminal application.  Also, the installation of a commonly used Python and R package management system called Conda can be done on either PCs or Macs and more information about Anaconda and Miniconda (two versions of the Python oriented version of Conda package manager) can be found [here.](https://conda.io/docs/glossary.html#anaconda)

---
### Interactive Computing:  Easy Access, Moderate Capability
These systems are provided by the Fred Hutch to serve the community with the intention of:
1. being immediately accessible by everyone, regardless of skill set,
2. allow for interactive development of code and/or approaches to analyses, and
3. are supported by compute resources larger than a typical desktop computer.

 These systems are best used for situations such as training of new users in development of R or python code or curation of Galaxy-style workflows that need connectivity to our local filesystem in a way not accessible via the [public instance of Galaxy.](https://usegalaxy.org/)  These systems also provide compute resources that serve as a step above a typical desktop computer, thus are good systems for slightly more compute-intensive jobs that still require interactivity.  Each is a managed resource with actively managed packages/modules/tools depending on the system, and thus work well for fairly standard platforms for interactive computing that does not require highly specialized software components.  Additionally, these systems may not be appropriate for analyses that require a higher level of data security, please contact FH username `scicomp` to inquire.


Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage 
--- | --- | --- | --- 
[RStudio Server](http://rstudio.fhcrc.org) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast 
[Fred Hutch Galaxy Instance](http://galaxy.fredhutch.org/)| web, platform-specific credentials | Matsen Group (Brian Claywell) | Limited to staged data 
[JupyterHub](https://jupyterhub.fhcrc.org/) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast 

#### Meet Rhino (technically all the Rhinos)
The specific resources listed below are actually not stand alone systems like the above section; instead, they are all based on the Rhino platform supported by Center IT.  Rhino, or more specifically the Rhinos are the locally managed HPC resources that are actually four different Rhino servers. Together, they function as a data and compute hub for a variety of data storage resources and high performance computing.  The specific guidance for the use of each of the approaches to HPC access are slightly different, but will all require the user to learn how to access and interact with Rhino.  Any user interacting with the following systems will be dependent on being proficient with the care and keeping of the Rhinos.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage 
--- | --- | --- | --- 
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types 
NoMachine/Linux Session Servers | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types 
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types 
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types 


### Interactive Computing: Command Line Interface (CLI), Moderate to High Capability
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.  Often reasons to move to these HPC resources include the need for version controlled, specialized package/module/tool configurations, higher compute resource needs, or rapid access to large data sets in data storage locations not accessible with the required security for the data type by the above systems.  

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage 
--- | --- | --- | --- 
Gizmo | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types 
AWS Batch | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing |Direct to all local storage types 

### Interactive Computing: Future Systems Currently Under Development
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | --- 
Beagle | CLI | Center IT | - 
Globus Genomics | web, FH credentials after being linked to Globus | HDC (Bret Dodson) | Economy Cloud ONLY, Requires specific data organization 
Zeppelin | - | Center IT | - 

---
