---
title: Computing Environments and Containers
last_modified_at: 2019-04-26
primary_reviewers: bmcgough
---

The Fred Hutch provides researchers on campus access to high performance computing using on-premise resources.  The various technologies provided are outlined on our [Technologies](/scicomputing/compute_platforms/) page along with the basic information required for researchers to identify which FH resource might be best suited to their particular computing needs.

The Scientific Computing group supports additional software used in scientific research beyond those available on local workstations. A large number of pre-compiled packages are already available on our high performance computing (HPC) cluster and Linux systems. Individual user installation of packages and language modules is also supported.

Reasons to use scientific software maintained by SciComp include:
- packages are often faster due to compiler optimizations
- packages are reproducible in or outside Fred Hutch
- rapid access to many software packages and package versions


## Environment Modules

On the command line and in scripts, we use Environment Modules to make different versions of software easily available in a modular and changeable way. Loading specific versions of software packages helps stabilize your environment and improves reproducibility of your work.

We use [TACC Lmod Environment Modules](https://tacc.utexas.edu/research/tacc-research/lmod/) to manage your software environment.  The commands you use to interact with Environment Modules are `module` or `ml`.  These commands take subcommands (e.g. `module load`) which direct Lmod to update the Environment Modules in use.

> [!NOTE]
> For more information on what modules we have available for use on `rhino` and `gizmo` see our [Scientific Software](/scicomputing/compute_scientificSoftware/) page.  This page details available modules of R, python and all other life sciences oriented software modules available.

We use [EasyBuild](https://easybuild.io/) to build software and create Environment Modules for everyone to use- there are over a thousand modules already available.

### How to Use Environment Modules
As you will learn below, Environment Modules can be referred to in two ways- generic and specific. Often the generic method is fastest, and this is an acceptable way to load Environment Modules when using a shell interactively. When using the generic method, you refer simply to the software package name you want to load (ex: `module load Python`). This is fast, but circumvents one of the reproduciblity supporting features of Environment Modules. 

The default version of `Python` loaded using the generic reference will change as the `Python` package versions are updated. When using the specific method, you specify the verison of the software package you want to load (ex: `module load R/3.5.1-foss-2016b-fh1`). When you specify the version of a module, you will always load exactly the same version of the software package regardless of what new or different versions might also be available. For scripts, we recommend always using a specific Environment Module reference to ensure both reproducibility of your processes as well as making sure your process continues to work over time.

#### Interactively
When you log in to any SciComp managed server, your terminal session will have **Lmod** loaded. Commonly used shell commands for Environment Modules include:

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

Lmod environment modules can be used in your job scripts- just insert the `module` or `ml` command into your script in the same way you'd use it interactively:

```bash
#!/bin/bash

ml fhR/4.4.1-foss-2023b-R-4.4.1

# the rest of your script...
```

This will then load the module then run the rest of the commands in your script. There are some recommendations for using modules in your scripts:

##### Use the Full Module Name

Scripts are expected to be reproducible, so specifying the Environment Module with its version is recommended.  For example, instead of:

```
module load Python
```

load the module with the version included:
```
module load Python/3.5.1-foss-2016b-fh1
```

The default version loaded by the first command will change as we install new versions of that module (default always tracks the most recent).  While some changes may be trivial, other changes may break your script.  This allows you to have a stable environment for your work and ensures that others who use your code know which module version is supported.

##### One at a Time

Loading multiple modules concurrently can lead to compatibility problems.  Each module is built with a specific set of dependencies: if two different modules use different versions of the same dependency the resulting conflict can cause unexpected behavior.

Thus, when possible, load and purge modules on an as-needed basis in your script.  For example, if your script calls an R script and then a Python script:

```bash
#!/bin/bash

ml fhR/4.4.1-foss-2023b-R-4.4.1

Rscript /path/to/your/script.R

ml purge

ml Python/3.9.6-GCCcore-11.2.0

python /path/to/a/python/script.py

```

Attempting to load those two modules at the same will produce a warning like "The following have been reloaded with a version change" and a list of incompatible modules.

This may still run, but can produce odd failures or unanticipated output.

> [!NOTE]
> When you require multiple modules loaded concurrently (for example, _reticulate_ which requires R and Python), you'll need to take additional steps to ensure that dependencies match.  Checking toolchain versions is one way, trial-and-error another.

##### Clean Before you Load

A good habit to have is cleaning your environment before loading any modules.  The `purge` command will remove any configurations from any applied module and ready your environment for subsequent modules.

#### With Workflow Managers

If desired, one way to manage jobs, environments, and data transfers particularly in a series of linked tasks or jobs is to use a workflow manager.  Workflow managers allow you to describe a workflow as a series of individual tasks.  Then the workflow manager software does the work of:

- sending the jobs to the compute resources
- deciding what tasks can be done in parallel
- staging data for use and keeping track of inputs and outputs
- environment management (via docker containers or environment modules)
- monitoring jobs and providing you with metadata about them and the workflow itself

Two workflow managers in use on the Fred Hutch campus are [Nextflow](/compdemos/nextflow/) and [Cromwell](/compdemos/Cromwell/) and users are actively curating more shared support and resources at those pages as well as in GitHub.  Workflow manager related information is collected as a GitHub [Workflow Manager Project](https://github.com/orgs/FredHutch/projects/8) as well as specific [Nextflow repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=nf+OR+nextflow&type=&language=) or [Cromwell/WDL repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=wdl+OR+cromwell&type=&language=) which often contain shared workflows or configuration information.


## Docker Containers

At its core, Docker is a tool that lets you run code inside a totally fixed and reproducible computational environment. If you have used virtual machines, then you can think of a Docker container as being a lightweight, portable, intuitive system for building and running virtual machines. The major difference between a Docker container and virtual machine is that Docker doesn't come with operating system, which makes it more lightweight and portable.  However, Docker containers do require the Docker engine to run them, which is a client-side application.

The folks at Docker are probably the best ones to answer the
question, ["What is Docker?"](https://www.docker.com/what-docker).

For more documentation and background on Docker, see [Docker for Beginners](https://docker-curriculum.com/).

The reason that scientists use Docker is that it allows them to run
computational tools using the exact same computational environment as another
scientist, so that the same input data will (by definition) yield the exact
same set of results. This is a level of reproducibility that is essentially
impossible to achieve with any other tool apart from full virtual machines.  It
also neatly solves the problem of having to install dependencies in order to
run a new tool in the right way.

Although you cannot run Docker on our HPC cluster or on the `rhino` machines,
you can work with Docker containers in those environments using
[Apptainer](/compdemos/Apptainer/).

### Common Terms

There are a few basic terms that will make it easier to learn
about Docker:

#### Image

A Docker image is basically a file that is built from a [Dockerfile](https://docs.docker.com/engine/reference/builder/). The image functions like a recipe for the process you want to have the Docker container execute. It specifies all the details, such as tools, processes and parameters needed for the process to occur in the Docker container that could be created from it.

#### Container

A Docker container is a Docker image that is being executed or actively
applied. Once you launch an image and start doing things (writing files,
running commands, etc.) it becomes a container. The useful reason behind the
distinction between images and containers is that once you are done using a
container, you usually delete it. However, the image that you launched the
container from remains untouched, and can be used to launch more containers in
the future should the same exact process be needed again for different data
sets.

#### Mount Point

By default, Docker containers do not have access to the file system for the
computer that they are being run on. In order to pass files back and forth
between the running Docker container and the host filesystem, you must make a
"mount point." The mount point is a folder that is shared between the Docker
container and the host filesystem, allowing you to read and write data.

#### Pull / Push

Docker images can be stored either locally (on your laptop or desktop)
or on a remote Docker server (such as [Docker Hub](https://hub.docker.com/)). Moving the Docker image to and from a remote server is called "pushing" and
"pulling." The nice thing about this feature is that you can pull
down an image that was used by another scientist and run all of
the same commands that they did using the exact same computational
environment.

### Using Docker at Fred Hutch

The best page to get started at the Hutch is the [Computing Resource Library](/compdemos/Docker/) about Docker.

Because Docker requires root access, it cannot be run on shared compute
environments such as `Rhino` / `Gizmo`. Instead, developers at LBL have
developed a utility called Apptainer (formerly Singularity) which can be used
to run Docker images within an environment like `Rhino` / `Gizmo` at Fred
Hutch. Additional information on using Apptainer can be found at the
[apptainer.org](https://apptainer.org/docs/) site and more [details about using
Apptainer at Fred Hutch](/compdemos/Apptainer/) on `Gizmo`.

> [!NOTE]
> Apptainer also has its own image format, however we do not recommend to use
> it and instead import Docker containers as they can be used more universally,
> e.g. in cloud computing.

Some cloud computing platforms are built explicitly on top of Docker. For example, [AWS Batch](/scicomputing/compute_cloud/) works by running code within Docker containers on AWS EC2 instances. As AWS Batch gets rolled out at Fred Hutch, Docker images can be used to save and version the code that is
executed with that system.

### Other Docker Resources

  * The most commonly used server to share Docker images is called [Docker Hub](https://hub.docker.com/).
  * Another commonly used server to share Docker images is called [Quay](https://quay.io/).
  * [BioContainers](https://biocontainers.pro/) is a free and open source project to collect a set of images that contain useful bioinformatics tools.


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
> [!NOTE]
> For announcements from Scientific Computing, please see the [Announcements
> page](/scicompannounce/), and for assistance email `scicomp`.  Also, see the
> Events page in CenterNet for current Office Hours.

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

