---
title: Scientific Software Overview
last_modified_at: 2018-08-23
---

## In-Person Training and Office Hours

## Current Software
For software running on your Windows or Mac laptop or desktop, please contact your divison IT support.

When running software on our Linux servers (including Ubuntu Desktops), we have a system of pre-compiled software packages that should be your first stop when using a new software package.

## Linux Software (rhino, cluster, Ubuntu)
SciComp offers over 1300 software package versions for your use.

We use two open source projects to help manage and use software packages on Linux at Fred Hutch.
- [EasyBuild](https://easybuilders.github.io/easybuild/) helps up compile software package versions
- [Lmod](https://github.com/TACC/Lmod) helps you to load software package versions

### EasyBuild
The EasyBuild system provides recipes for automatically building common software packages. It provides:
- Faster software builds = more available environment modules
- Optimized libraries and compiler options = faster software
- Toolchain and package recipes = bit-for-bit repeatable software builds (ex: `foss-2016b`)

### Lmod - Environment Modules
We use Lmod to implement Environment Modules. Environment Modules enable:
- modular software packages = load Python/2.7.14 and then swap for Python/3.6.1
- defined environment conffiguration = packages can "just work" on our servers
- easy package update = faster upgrades and security patches

#### How to Use Environment Modules
##### Interactively
When you log in to a SciComp server (or Ubuntu desktop) your terminal session has Lmod pre-loaded. You can:
- See a list of all available modules `module avail`
- Search for a specific module `module avail SAMtools`
- Load a specific module `module load Python/2.7.14-foss-2016b-fh1`
- Load a generic module `module load Perl`
- List loaded modules `module list`
- Unload all loaded modules `module purge`

##### Scripting
To use Environment Modules in scripts, it is best to explicitly activate the `module` command and load exact versions of modules. To activate Environment Modules, add the follow lines to the top of your script:
```
source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all
```
*Note* these instructions are for bash - please use `#!/bin/bash`

## Quick HOWTOs
Common actions involving scientific software.

### List available software
At a Linux command line (rhino): `module avail` or with a pattern: `module avail Python`

### List of packages/modules in Python and R builds
Check out [our EasyBuild repo](https://fredhutch.github.io/easybuild-life-sciences).

### How to request new software
- Send an email to scicomp@
- File an issue at [out EasyBuild repo](https://fredhutch.github.io/easybuild-list-sciences).

### When should ask us for software?
Always!

### What if I don't want to wait?
You can install software on your own.

#### Packages/Modules for Python and R
Normal install methods work fine after loading an environment module:

- R: `install.packages("<pkgname>")`
- Python: you can use `pip` or `setup.py`

This is safe as the package will be installed in your home directory, not the site or source directory.

However, you must manage your environment module versions as some packages compile binary code, and will only work with environment modules using the same toolchain (see below for compiling).

#### Other software installs and builds
If you want to use a non-R/Python software package, you are also welcome to install into your home directory, with the following caveats:

- Ubuntu system compilers are not optimized, and OS packages will not be installed to satisfy build and other dependencies (we use the EasyBuild system for this).
- You will simply be denied if you try to install somewhere other than your home or work directories - the only way you may conflict with another user would be installing packages in a shared group directory.
- You can load a toolchain environment module to get a newer compiler set before compiling your software:
  - `module load foss-2016b` = GCC 5.4.0, binutils 2.26, OpenMPI 1.10.3, OpenBLAS 0.2.18, FFTW 3.3.4, ScaLAPACK 2.0.2
  - most of our software is built against that toolchain
- If you loaded a toolchain before building new software, you will need to load that toolchain environment module before running that software as well.

