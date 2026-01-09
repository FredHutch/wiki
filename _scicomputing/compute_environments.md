---
title: Computing Environments and Containers
last_modified_at: 2025-11-11
primary_reviewers: bmcgough
---

The Fred Hutch provides researchers on campus access to high performance computing using on-premise resources.  The various technologies provided are outlined on our [Technologies](/scicomputing/compute_platforms/) page along with the basic information required for researchers to identify which FH resource might be best suited to their particular computing needs.

The Scientific Computing group supports additional software used in scientific research beyond those available on local workstations. A large number of pre-compiled packages are already available on our high performance computing (HPC) cluster and Linux systems. Individual user installation of packages and language modules is also supported.

Reasons to use scientific software maintained by SciComp include:
- packages are often faster due to compiler optimizations
- packages are reproducible in or outside Fred Hutch
- rapid access to many software packages and package versions


## Environment Modules

On the command line and in scripts, we use the Environment Module system to make software versions available in a modular and malleable way. Environment Modules provide modular access to one version of one or more software packages to help improve reproducibility. We use a system called EasyBuild to create modules for everyone to use - there are over a thousand modules already available. The implementation of Environment Modules we use is **Lmod**, and the commands you use to interact with Environment Modules are `module` or `ml`.  For more information on what modules we have available for use on `rhino` and `gizmo` see our [Scientific Software](/scicomputing/compute_scientificSoftware/) page.  This page details available modules of R, python and all other life sciences oriented software modules available.  


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

#### With Workflow Managers

If desired, one way to manage jobs, environments, and data transfers particularly in a series of linked tasks or jobs is to use a [workflow manager](/datascience/using_workflows/).  Workflow managers allow you to describe a workflow as a series of individual tasks.  Then the workflow manager software does the work of:

- sending the jobs to the compute resources
- deciding what tasks can be done in parallel
- staging data for use and keeping track of inputs and outputs
- environment management (via [Docker](/compdemos/Docker/) containers or environment modules)
- monitoring jobs and providing you with metadata about them and the workflow itself

At Fred Hutch, [Nextflow](/compdemos/nextflow/) and [WDL workflows](/datascience/wdl_workflows/) are the primary workflow systems in use. WDL workflows can be executed using [multiple engines](/datascience/wdl_execution_engines/) including Cromwell, miniWDL, and Sprocket, while Nextflow has its own execution engine. Users are actively curating shared support and resources, with the [WILDS WDL Library](/datascience/wilds_wdl/) being a key resource for WDL workflows, and the [Fred Hutch NextFlow catalog](/datascience/nextflow_catalog/) being a key resource for Nextflow workflows. See the [Using Workflows](/datascience/using_workflows/) page for more information on workflow systems.

## Docker Containers

Docker containers package software and all dependencies into a standardized, reproducible computational environment. They enable scientists to run tools using the exact same configuration across different computing platforms, ensuring reproducible results. Docker containers isolate the computational environment without the overhead of full virtual machines.

For a comprehensive introduction to Docker at Fred Hutch, see [Using Docker at Fred Hutch](/compdemos/Docker/), which covers:

- [What Docker is and how it works](/compdemos/Docker/#what-is-docker)
- [Using pre-built containers from WILDS and other sources](/compdemos/Docker/#using-existing-docker-images)
- [Running Docker on your local computer](/compdemos/Docker/#running-docker-on-your-local-computer)
- [Using Docker containers on the Fred Hutch cluster (via Apptainer)](/compdemos/Docker/#using-docker-on-the cluster)
- [Creating your own Docker images](/compdemos/Docker/#creating-your-own-docker-images)
- [Using Docker in WDL and other workflow systems](/compdemos/Docker/#using-docker-with-workflow-systems)

**Important:** Docker requires root access and cannot run directly on shared compute environments like `Rhino` or `Gizmo`. Instead, use [Apptainer](/compdemos/Apptainer/) to run Docker containers on the cluster. Apptainer can pull and run Docker images directly from Docker Hub without requiring administrator privileges. See the [Apptainer documentation](/compdemos/Apptainer/) for details.

Cloud computing platforms like [AWS Batch](/scicomputing/compute_cloud/) are built on Docker, using containers to ensure consistent execution environments across distributed computing resources.

### Docker Resources

#### Fred Hutch Resources

  * **WILDS Docker Library ([GitHub](https://github.com/getwilds/wilds-docker-library), [DockerHub](https://hub.docker.com/u/getwilds))** - Tested, versioned Docker containers for bioinformatics tools, built and maintained by the WILDS team at Fred Hutch. These containers are designed to work seamlessly with WDL workflows and other workflow systems.
  * **[Fred Hutch DockerHub](https://hub.docker.com/u/fredhutch)** - Additional containers available for Fred Hutch researchers.

#### Community Resources

  * **[Docker Hub](https://hub.docker.com/)** - The most commonly used server to share Docker images.
  * **[Quay](https://quay.io/)** - Another commonly used server to share Docker images.
  * **[BioContainers](https://biocontainers.pro/)** - A free and open source project to collect a set of images that contain useful bioinformatics tools.


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

