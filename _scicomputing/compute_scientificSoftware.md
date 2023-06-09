---
title: Scientific Software Modules
primary_reviewers: fitzwit
---

On the command line and in scripts, we use the Environment Module system to make software versions available in a modular and malleable way. Environment Modules provide modular access to one version of one or more software packages to help improve reproducibility. We use a system called EasyBuild to create modules for everyone to use - there are over a thousand modules already available. The modules listed here are the software modules available currently on the `gizmo` compute cluster.
You can read more about how to use these modules and manage your compute environment on our [Compute Environments](/scicomputing/compute_environments/) page.

## Custom Fred Hutch Modules
Scientific Computing maintains custom builds of R and Python.
The Fred Hutch modules have the prefix `fh.`  FH modules are specific to the Hutch and contain libraries that users have requested. The Fred Hutch modules inherit all
the libraries from EasyBuild base R and Python. The `fhR` module contains many Bioconductor libraries. 
We recommended using the `fh` versions of R and Python since they
have many BioInformatics packages. Most software package requests are already satisfied with the `fh` modules.

## R Modules
Specific information about which R Modules are available, including more information about R libraries can be found on our dedicated [R Module page](/rModules/).

## Python Modules
Specific information about which Python Modules and Bundles are available, including more information about packages installed in them can be found on our dedicated [Python Module page](/pythonModules/).

## Life Science/Bio Software Modules
Other software for life sciences that are available as modules can be found on our [BioModules page](/scicomputing/bio-modules-18.04/).  If you do not see the software you are looking for, email `scicomp` to request it or add your own GitHub issue in the [easybuild-life-sciences repo](https://github.com/FredHutch/easybuild-life-sciences).  Either way, please be specific about the source and version of the software you are interested in.  
