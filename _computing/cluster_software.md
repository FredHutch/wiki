---
title: Cluster Software
last_modified_at: 2018-10-11
---


The Scientific Computing Center IT group supports additional software used in scientific research beyond those available on local workstations. A large number of pre-compiled packages are already available on our high performance computing (HPC) cluster and Linux systems. Individual user installation of packages and language modules is also supported.

## Environment Modules
On the command line and in scripts, we use the Environment Module system to make software versions available in a modular and malleable way. Environment Modules are similar to Python virtualenvs or Conda envs and allow you to choose between many software packages and versions of those packages. We use a system called EasyBuild to create modules for everyone to use- there are hundreds of modules already available.

### How to Use Environment Modules
#### Interactively
When you log in to a SciComp server (or Ubuntu desktop) your terminal session has Lmod pre-loaded. Commonly used shell commands include:

Command | Action
--- | ---
`module avail` | List modules available to load
`module avail <pattern>` | Filter available modules based on pattern (ex: `module avail SAMtools`)
`module load <packagename>/<version>` | Load a specific version of a module into your environment (ex: `module load Python/3.6.5-foss-2016b-fh1`)
`module load <packagename>` | Load a default Environment Module *see below* (ex: `module load Perl`)
`module list` | List currently loaded Environment Modules
`module purge` | Unload all currently loaded Environment Modules

There is also a short version of the `module` command: `ml`.  You can substitute `ml` for `module` in any of the commands above (`ml` = `module list` `ml <pkg>` = `module load <pkg>`).

Example:
```
$ which python
/usr/bin/python
$ ml avail Python/2.7.15

-------------------------- /app/easybuild/modules/all --------------------------
   Python/2.7.15-foss-2016b-fh1    Python/2.7.15-foss-2016b

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".

$ which python
/app/easybuild/software/Python/2.7.15-foss-2016b-fh1/bin/python
```

#### Scripting with Environment Modules
To use Environment Modules in a bash script, it is best to explicitly activate the `module` command and load exact versions of modules. To activate Environment Modules, add the follow lines to the top of your script:
```
#!/bin/bash
source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all
```

## Installing Custom Software Packages
IF there is no available module for a software package you need, or existing modules do not include specific packages, libraries, or versions you need, it is possible to install those packages yourself.

*First, file an issue in our [software repo](https://github.com/FredHutch/easybuild-life-sciences) and we will work with you to build a module for any software or version.*

If that doesn't work for you, see below for language modules (R/Python libraries) or other software build guidelines.

### Packages/Modules for Python and R
Normal install methods mostly work after loading an Environment Module:

- R: `install.packages("<pkgname>")`
- Python: you can use `pip` or `setup.py` (specify `--user` with pip)

Any package you install this way will be installed into your home directory.

Remember that the environment module you have loaded will be used to install the package/module. For example, if you load `Python/3.6.9` and use `pip install --user <newpkg>` then you will need to load `Python/3.6.9` every time you wish to use `newpkg`.

### Other software installs and builds
If you want to install or build a standalone software package, you are also welcome to install into your home directory, with the following caveats:

- We cannot install OS package dependencies (if you software has many dependencies, please file an issue [here](https://github.com/FredHutch/easybuild-life-sciences)
- Ubuntu compilers are not optimized. We recommend loading a 'toolchain' module:
  - `module load foss-2016b` will get you GCC 5.4.0, binutils 2.26, OpenMPI 1.10.3, OpenBLAS 0.2.18, FFTW 3.3.4, ScaLAPACK 2.0.2 (most of our software is built against that toolchain)
- If you loaded a toolchain module when installing or building new software, you will liekly need to load that toolchain module before running that software

## Frequently Asked Questions
<!--We should have a single "how to get help from SciComp page" and link here.-->
1. *Why am I getting errors when running software from a module?*
  - Unload all modules with `module purge` and re-load only the module you need
  - Refresh your shell environment by exiting and re-connecting
  - Remove and reinstall software in your home directory not installed with the module you are using (`~/R`,`~/.local`)
1. *Only bash?*
  - Our recommendation is to use bash as your shell. If you wish to use a different shell, please contact SciComp.
1. *Is there a faster way?*
  - The command `ml` is a shortcut for `module` and implies `module load` but will work with other `module` subcommands (ex: `ml R/3.5.0-foss-2016b-fh1` or `ml avail Python/3.5`)
1. *What is this "foss-2016b" stuff?*
  - The EasyBuild project supports many different toolchains. The toolchain defines a compiler and library set, and also has a number of common support libraries (things like libTIFF) associated with it.
1. *Should I load default modules?*
  - It is faster and easier to type `ml R` than specifying the full package and version. However, the default version loaded by a generic `module load <pkg>` command will change over time.  If maintaining a specific version of a package is important to you, always specify the version.
1. *Is there a list of included language libraries/modules/packages?*
  - Yes! For R, Python, and some additional packages, look [here](https://fredhutch.github.io/easybuild-life-sciences).
1. *What about Bioconductor for R?*
  - Starting with R/3.4.3-foss-2016b-fh2 we include Bioconductor and many Bioc packages with the standard R module.
1. *What are Best Practices with Environment Modules?*
  - Specify the full Module name when loading, especially in scripts (see above for scripting information).
  - Avoid mixing Modules from different toolchains at the same time (unloading one and loading another mid-script works well if you need to).
  - If you can't find a package you want, send an email us or file an [issue](https://github.com/FredHutch/easybuild-life-sciences) requesting a new or updated package.

### EasyBuild
The EasyBuild system provides recipes for automatically building common software packages and creating Environment Modules for all of them. It provides:
- Faster and more reliable software builds
- Better performing binaries
- Ability to reproduce bit-for-bit any Environment Module

More info on EasyBuild is [here](https://easybuilders.github.io/easybuild/).


>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.
