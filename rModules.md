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
---

The Fred Hutch R modules have the suffix `-fh1`. The `-fh1` module is spefific
 to the Hutch, and contains libraries that have been requested by Hutch users.
 The Fred Hutch module inherits the modules from a base R module that
 is maintained by the EasyBuild community.
 Users should use the 'fh' versions of R.

### Requesting Modules ###
Adding every user request for libraries is becoming a challenge to support.
 The Fred Hutch R module has close to 1,000 libraries. Users are encouraged
 to install custom R libraries in their home directories. Users can submit install
 request for libraries that require system libraries.

### User Installed R Modules
The Fred Hutch R module has over 1,000 libraries, but it might not have the one
library that you need. R libraries into your home directory if they not otherwise
available.  Use the `install.packages()` function to install R libraries.

```
> install.packages("dsa")
Installing package into ‘/app/easybuild/software/R/3.6.0-foss-2016b-fh1’
(as ‘lib’ is unspecified)
Warning in install.packages("dsa") :
  'lib = "/app/easybuild/software/R/3.6.0-foss-2016b-fh1"' is not writable
Would you like to use a personal library instead? (yes/No/cancel) yes
```

The default path for libraries is the system path which is not writable. Chose the
option to create a personal library. Before adding a personal library you should
check the location where it will be written.  The `.libPaths()` fuction will show
the locations that libraries are searched.

```
> .libPaths()
[1] "/app/easybuild/software/R/3.6.0-foss-2016b-fh1"
[2] "/home/jfdey/R/x86_64-pc-linux-gnu-library/3.6"
[3] "/app/easybuild/software/R/3.6.0-foss-2016b/lib/R/library"
>
```

Notice one of the paths is in my "Home" directory and contains the major.minor
 version of R `3.6` in the path. If your library path is not versioned you might have
defined **R_LIBS_USER** in your .Rprofile configuation file.  Use `Sys.getenv()`
 to check your default user path.

```
Sys.getenv("R_LIBS_USER")
> Sys.getenv("R_LIBS_USER")
[1] "~/R/x86_64-pc-linux-gnu-library/3.6"
```

### Issues with R Libraries
One of the most frequent issues are errors with loading libraries.  There are
two major issues; the library is out of date or there is a newer version available
from the system that is not being loaded. Use the `packageVersion("snow")`
function to show the library version and `update.packages()` function to update
out of date packages.
