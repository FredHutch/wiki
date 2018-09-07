---
title: Cluster Software
last_modified_at: 2018-08-29
---


>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.

## Software and Scientific Computing
Scientific Computing supports software used in science. A large number of pre-compiled packages are already available on our HPC cluster and Linux systems. Individual installation of packages and language modules is also supported.

## Linux at Fred Hutch
<!--Brief description of Fred Hutch policies and choices around Linux.-->
At Fred Hutch, we use the Ubuntu distribution of Linux. The HPC cluster and support systems currently run {{site.data.scicomp_versions.ubuntu}}. For many reasons we do not use OS packages for scientific software. We have a separate system that provides software packages, which is detailed below.

### Environment Modules
Environment Modules are a mechanism to provide modular software packages in shell and other languages. Environment Modules are similar to Python virtualenvs or Conda envs. As there are many Environment Modules already built, users only need to load them, not write or create them.

#### How to Use Environment Modules
##### Interactively
When you log in to a SciComp server (or Ubuntu desktop) your terminal session has Lmod pre-loaded. Common shell commands:
Command | Action
--- | ---
`module avail` | List modules available to load
`module avail <pattern>` | Filter available modules based on pattern (ex: `module avail SAMtools`)
`module load <modelename>` | Load an Environment Module into your environment (ex: `module load Python/3.6.5-foss-2016b-fh1`)
`module load <packagename>` | Load a default Environment Module *see below* (ex: `module load Perl`)
`module list` | List currently loaded Environment Modules
`module purge` | Unload all currently loaded Environment Modules

##### Scripting with Environment Modules
To use Environment Modules in a bash script, it is best to explicitly activate the `module` command and load exact versions of modules. To activate Environment Modules, add the follow lines to the top of your script:
```
#!/bin/bash
source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all
```

##### Questions
<!--We should have a single "how to get help from SciComp page" and link here.-->
1. *Only bash?*
  - Our recommendation is to use bash as your shell. If you wish to use a different shell, please get in touch with SciComp and we will help you with terminal sessions and/or scripts.
1. *Is there a faster way?*
  - The command `ml` is a shortcut for `module` and implies `module load` but will work with other `module` subcommands (ex: `ml R/3.5.0-foss-2016b-fh1`)
1. *What is this "foss-2016b" stuff?*
  - The EasyBuild project supports many different toolchains. The toolchain defines a compiler and library set, and also has a number of common support libraries (things like libTIFF) associated with it.
1. *What is the benefit of the "foss-2016b" toolchain?*
  - EasyBuild toolchains are optimized and include accelerated libraries by default. Binaries are often much faster when compiled with these toolchains.
  - OS compilers and libraries are updated infrequently - usually only with major OS version upgrades.
1. *Should I load default modules?*
  - It is faster and easier to type `ml R` than the entire Environment Module name (though, tab-completion does work in this case). However, the default version loaded by a generic `module load <pkg>` command will change over time.
1. *Is there a list of included language libraries/modules/packages?*
  - Yes! For R, Python, and some additional packages, look [here](https://fredhutch.gihub.io/easybuild-life-sciences).
1. *What about Bioconductor for R?*
  - Starting with R/3.4.3-foss-2016b-fh2 we include Bioconductor and many Bioc packages with the standard R Environment Module.
1. *What are Best Practices with Environment Modules?*
  - Specify the full Module name when loading, especially in scripts.
  - Avoid mixing Modules from different toolchains at the same time (unloading one and loading another works well if you need to).
  - If you can't find a package you want, send an [email](mailto://scicomp@fredhutch.org) us or file an [issue](https://github.com/FredHutch/easybuild-life-sciences) requesting a new or updated package.

### EasyBuild
The EasyBuild system provides recipes for automatically building common software packages and creating Environment Modules for all of them. It provides:
- Faster and more reliable software builds
- Better performing binaries
- Ability to reproduce bit-for-bit any Environment Module

More info on EasyBuild(s [here]https://easybuilders.github.io/easybuild/).

### DIY Software

#### Packages/Modules for Python and R
Normal install methods work fine after loading an Environment Module:

- R: `install.packages("<pkgname>")`
- Python: you can use `pip` or `setup.py`

This is safe as the package will be installed in your home directory, not the site or source directory.

However, you must manage your Environment Module versions as some packages compile binary code, and will only work after you have loaded the same Environment Module you used to compile/install the package.

#### Other software installs and builds
If you want to use a non-R/Python software package, you are also welcome to install into your home directory, with the following caveats:

- Ubuntu system compilers are not optimized, and OS packages will not be installed to satisfy build and other dependencies (we use the EasyBuild system for this).
- Go ahead and try building and installing - you will simply be denied if you try to install somewhere other than your home or work directories. The only way you may conflict with another user would be installing packages in a shared group directory.
- You can load a toolchain Environment Module to get a newer compiler set before compiling your software:
  - `module load foss-2016b` = GCC 5.4.0, binutils 2.26, OpenMPI 1.10.3, OpenBLAS 0.2.18, FFTW 3.3.4, ScaLAPACK 2.0.2
  - most of our software is built against that toolchain
- If you loaded a toolchain before building new software, you will need to load that toolchain environment module before running that software as well.
