---
title: Computing Environments and Containers
last_modified_at: 2025-11-11
primary_reviewers: bmcgough
---

Beyond what's available on local workstations, Scientific Computing maintains a large library of pre-compiled software packages on our HPC cluster and Linux systems. Reasons to use software maintained by SciComp include:
- Packages are often faster due to compiler optimizations
- Packages are reproducible in or outside Fred Hutch
- Rapid access to many software packages and versions

We use **Lmod**, an Environment Module system built with EasyBuild, to make specific software versions available on the command line and in scripts - over a thousand modules are already available. Use the `module` or `ml` commands to interact with them. See [Scientific Software](/scicomputing/compute_scientificSoftware/) for the R, Python, and other modules available on `rhino` and `gizmo`.


### How to Use Environment Modules
As you will learn below, Environment Modules can be referred to in two ways - generic and specific. Often the generic method is fastest, and this is an acceptable way to load Environment Modules when using a shell interactively. When using the generic method, you refer simply to the software package name you want to load (ex: `module load Python`). This is fast, but circumvents one of the reproduciblity supporting features of Environment Modules. 

The default version of `Python` loaded using the generic reference will change as the `Python` package versions are updated. When using the specific method, you specify the verison of the software package you want to load (ex: `module load R/3.5.1-foss-2016b-fh1`). When you specify the version of a module, you will always load exactly the same version of the software package regardless of what new or different versions might also be available. For scripts, we recommend always using a specific Environment Module reference to ensure both reproducibility of your processes as well as making sure your process continues to work over time.  

#### Interactively
When you log in to any SciComp managed server, your terminal session has **Lmod** pre-loaded. Commonly used shell commands around Environment Modules include:

Command | Action
--- | ---
`module avail` | Output a list of available Environment Modules
`module avail <pattern>` | Output a filtered list of modules based on pattern (ex: `module avail SAMtools`)
`module load <packagename>/<version>` | Load a specific version of a module into your environment (ex: `module load Python/3.6.5-foss-2016b-fh1`) - you can cut and paste from the output of `module avail`
`module load <packagename>` | Load a generic Environment Module (ex: `module load Perl`)
`module list` | Output a list of Environment Modules loaded in your current shell
`module unload <packagename>` | Unload an Environment Module from your current shell
`module purge` | Unload all currently loaded Environment Modules

There is also a short version of the `module` command: `ml`.  The `ml` command can substitute for `module` in any `module` command, behaves like `module list` when called with no arguments, and behaves like `module load` when executed with an argument (ex: `ml R/3.5.1-foss-20167b-fh1` runs `module load R/3.5.1-foss-2016b-fh1`). The `ml` and `module` commands can be used in scripts, but see the section on Scripting with Environment Modules below. 

Example:
```
$ which python
/usr/bin/python
$ module avail Python/2.7.15

-------------------------- /app/easybuild/modules/all --------------------------
   Python/2.7.15-foss-2016b-fh1    Python/2.7.15-foss-2016b

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".

$ module load Python/2.7.15-foss-2016b-fh1
$ which python
/app/easybuild/software/Python/2.7.15-foss-2016b-fh1/bin/python
```

#### Scripting with Environment Modules
To use Environment Modules in a bash script, there are two Best Practices we highly recommend you integrate into your work. 

##### Best Practice 1

Interactive shell session have the required `module` commands activated, but scripts can often be run in non-interactive shells, so it is best to explicitly activate the `module` command. Add the follow lines to the top of your script:

```
#!/bin/bash
source /app/lmod/lmod/init/profile
```

This snippet can be used as a template for bash shell scripts.

The `source` like activates the `module` and `ml` commands for you current shell. The `module` and `ml` commands are then available in your script:

```
module load R/3.5.1-foss-2016b-fh1
```

This would load that specific Environment Module for use in your script.

##### Best Practice 2
Scripts are expected to be reproducible, so using a specific Environment Module reference is recommended:
```
module load Python/3.5.1-foss-2016b-fh1
```
Rather than:
```
module load Python
```
The above line will load a different version of the software package over time as the "pointer" to a specific version is changed.

> Note: This does mean that your script will only work in environments with the specific Environment Module version you are loading. That environment module may not be initially available on systems outside Fred Hutch or on internal systems follow upgrades. You can either request the specific version be added, or edit your script to load an available package version.

#### With WDL

WDL commonly uses [Docker](/compdemos/Docker/) contiainers to access required packages. You can use our Environment Modules instead of Docker.

Instead of specifying a `docker` image in a task's `runtime` section, you can specify a `modules` attribute naming the Environment Module(s) to load:

```wdl
runtime {
  modules: "SAMtools/1.11-GCC-10.2.0"
}
```

This requires an execution engine that has been configured to support Environment Modules (e.g., Cromwell on our cluster). 

See the [Environment Modules (HPC-specific)](/datascience/wdl_workflows/#environment-modules-hpc-specific) section of our [WDL Workflows](/datascience/wdl_workflows/) page for more detail.

#### With VSCode

We recommend creating a Python virtual environment that captures your currently loaded modules and reloads them automatically whenever the environment is activated. 

This is because VSCode's Remote SSH extension can't load cluster Environment Modules when you connect to it. The remote session starts before your shell would normally load modules from `.bashrc` or `.profile`.

See [Using Modules with VS Code](/compdemos/VS-Code_lmod/) for the workaround.

#### With RStudio

The easiest way to use Environment Modules with RStudio is through [Open OnDemand](/scicomputing/access_openondemand/), which launches RStudio Server for you and lets you pick which modules to use when starting a session.

Be sure to use the [Fred Hutch RStudio Server](https://openondemand.fredhutch.org/pun/sys/dashboard/batch_connect/sys/ood_rstudio_server/session_contexts/new), which uses the modules on the cluster, not [RStudio Server/Apptainer](https://openondemand.fredhutch.org/pun/sys/dashboard/batch_connect/sys/ood_rstudio_server_apptainer/session_contexts/new).

See [R and RStudio](/scicomputing/software_R/#run-rstudio-server-on-an-hpc-machine) for more on both options.

#### With Jupyter

We supply a `JupyterLab` module you can load along with whichever other modules you need. On the command line, load these additional Environment Modules at the same time as JupyterLab. For example, to load Seaborn with Jupyter:

```
ml purge

ml JupyterLab/4.0.3-GCCcore-12.2.0 Seaborn/0.12.2-foss-2022b 
jupyter lab --ip=0.0.0.0 --port=$(fhfreeport) --no-browser
```

See [Using Jupyter on rhino](/scicomputing/software_python/#using-jupyter-on-rhino) for the full instructions, or use [Open OnDemand](/scicomputing/access_openondemand/) for the easiest way to launch Jupyter Lab without loading modules yourself.

## Docker Containers

Docker containers package software and all dependencies into a standardized, reproducible computational environment. They are different from Environment Modules. Read more about Docke here: [Using Docker at Fred Hutch](/compdemos/Docker/).

## Installing Custom Software Packages
If you do not find the software you need, a support package or library, or the specific version you need, you have two options:

1. Request the software be built: file an issue in our [software repo](https://github.com/FredHutch/easybuild-life-sciences) and we will work with you to build a module for any software or version. This Environment Module will then be available to all.

2. If you cannot wait for the software to be built, you may be able to install it yourself. This is primarily supported for language (Python/R) packages.

### Packages/Modules for Python and R
Normal install methods will work after loading an Environment Module:

- R: `install.packages("<pkgname>")`
- Python: you can use `pip` or `setup.py` (specify `--user` with pip)

Any package you install this way will be installed into your home directory.

Remember that the environment module you have loaded will be used to install the package/module. For example, if you load `Python/3.6.9` and use `pip install --user <newpkg>` then you will need to load `Python/3.6.9` every time you wish to use `newpkg`. Using a different version of the language module may or may not work.

### Other software installs and builds
If you want to install or build a standalone software package, you are also welcome to install into your home directory, with the following caveats:

- We cannot install OS package dependencies (if your software has many dependencies, please file an issue [here](https://github.com/FredHutch/easybuild-life-sciences) and we will be happy to work with you to offer a package build with all dependencies.
- Ubuntu compilers are not optimized. We recommend loading a 'toolchain' module:

  ```
  module load foss/2019b
  ```

- If you loaded a toolchain module when installing or building new software, you will must load that toolchain module before running that software, or you will get library errors.

## Frequently Asked Questions
> Note:  For announcements from Scientific Computing, please see the [Announcements page](/scicompannounce/), and for assistance email `scicomp`.  Also, see the Events page in CenterNet for current Office Hours.  

1. *Something weird is going on with my shell and/or job!?!*
  - "Reset" your shell by logging out and back in. This will clear your environment. Users using screen or tmux will need to exit their session to clear their environment.
1. *Why am I getting errors when running software from a module?*
  - Unload all modules with `module purge` and re-load only the module(s) you need
  - Reset your shell - *see above*
  - Remove and reinstall software in your home directory not installed with the module you are using (`~/R`,`~/.local`) - this is key with toolchain modules and package/libraries that use compiled code
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

