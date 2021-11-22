---
title: "R Modules Available"
layout: collection
classes: wide
permalink: /rModules/
collection: rModules # collection name
entries_layout: list # list (default),
show_excerpts:  true #(default), false
sort_by: date # date (default), title
sort_order:  reverse # (default), reverse, forward
sidebar:
  nav: "scicomputing"
toc: true
toc_label: "On This Page"
---

SciComp creates R modules for every version of R. There are two module for each version
of R released. A base module **R/4.1.1** and a local Fred Hutch module **fhR/4.1.1**.
The local Fred Hutch module contains libraries that have been requested by Hutch users.
The Fred Hutch module inherits the modules from the base R module that
is maintained by the EasyBuild community. Hutch users should use the 'fh' versions of R.

## Requesting Modules
Adding every user request for libraries is becoming a challenge to support.
 The Fred Hutch R module has close to 1,000 libraries. Users are encouraged
 to install custom R libraries in their home directories. Users can submit install
 request for libraries that require system libraries.

## Installing Personal R Libraries
The fhR module has over 1,000 libraries, but it might not have the one
library that you need. R libraries can be installed into your UNIX home 
directory if they not otherwise available. Use the `install.packages()`
function to install R libraries.

### R Library Location
At startup, the R library search path is initialized from the environment variables 
**R_LIBS**, **R_LIBS_USER** and **R_LIBS_SITE**. Note: if you use an ~/.Rprofile or ~/.Renviron file, it should NEVER be setting
any of the library paths. Verify your library paths after starting R. **> .Library** is the location of the 
default R library, a subdirectory of R_HOME.
**> .Library.site** is the path to local site libraries. fhR modules use **.> Library.site** beginning with fhR/4.0.5.
The paths for **.Libraries** and **.Library.site** are systems paths are not writable.

```
> .Library
[1] "/app/software/R/4.1.1-foss-2020b/lib64/R/library"
> .Library.site
[1] "/app/software/fhR/4.1.1-foss-2020b"
```

### R_LIBS_USER
To install R libraries a library path to your local UNIX directory is required. Users can not add libraries to the system library paths.
By default **R_LIBS_USER** is unset, and if **R_LIBS_USER** is unset or empty, R will set it to directory ‘~/R/R.version$platform-library/x.y’.
Do not set the **R_LIBS_USER** environment variable. R libraries change over time, and libraries are now installed into library paths based on the
Major and Minor version of R. Do not keep all your libraries in a single location. Personal libraries need to be re-installed
as R is updated.

```
> .Library.user
Error: object '.Library.user' not found
> Sys.getenv("R_LIBS_USER")
[1] "~/R/x86_64-pc-linux-gnu-library/4.1"
>
```

Notice that `.Library.user` was blank, but `Sys.getenv("R_LIBS_USER")` was defined. I had to exit R and create a local 
library path in my home directory before the USER path was set in `.libPaths`.

```
mkdir -p ~/R/x86_64-pc-linux-gnu-library/4.1
ls ~/R/x86_64-pc-linux-gnu-library/
3.6  4.0  4.1

R
> .libPaths()
[1] "/home/jfdey/R/x86_64-pc-linux-gnu-library/4.1"
[2] "/app/software/fhR/4.1.1-foss-2020b"
[3] "/app/software/R/4.1.1-foss-2020b/lib/R/library"
>
```

Once you have verified that your personal library bath is based on the R version you are using and that your USER path
is the first path listed from **.libPaths()** you can install packaages with the **install.packages()** command.

```
> install.packages("flextable")
Installing package into ‘/home/jfdey/R/x86_64-pc-linux-gnu-library/4.1’
(as ‘lib’ is unspecified)
...
```

## Issues with R Libraries
One of the most frequent R issues are errors with loading libraries. There are
two major issues; the library is out of date or there is a newer version available
from the system that is not being loaded. Make sure **.libPaths()** is correct. Do
not set R_LIBS or R_LIBS_USER in any of your startup scripts. Use the new style
R_LIBS_USER path based on the R major and minor version numbers. You should have
a directories with with this template: `~/R/R.version$platform-library/x.y` in your
UNIX home directory.  Your local R path takes preciedec even if the libraries
are older than the libraries in the system path.
