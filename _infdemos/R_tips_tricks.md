---
title: R Tips & Tricks
main_author: Phu T. Van
primary_reviewers: dtenenba, vortexing
---

Below are some general tips and tricks for working in R that don't fit neatly into any articles.

## Installing R packages from CRAN vs. Bioconductor vs. GitHub
- You can't use the CRAN instructions to install a BioC package, but you CAN do the reverse. 
So if you have a bunch of packages to install, and some are in BioC and others are in CRAN, 
you can install them all in one command if you use the BioC installation mechanism.

- When installing the cutting-edge version of package X (where X is available in CRAN or Bioconductor 
but the latest version is only available in GitHub), it's recommended to first install the package via CRAN or Bioconductor, 
*then* installing the new version of it using `devtools::install_github(X)`. The reason is that `devtools::install_github()` 
does not always install all the necessary dependencies
