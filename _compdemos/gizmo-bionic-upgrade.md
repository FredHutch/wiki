---
title: Gizmo Bionic Upgrade
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

# Overview

The current operating system used on the Gizmo cluster and Rhino login nodes is Ubuntu 14.04.  This has been out of support for some time now and is starting to become difficult to support on newer hardware and is preventing installation of some bioinformatics software. 

We are therefore upgrading to a more modern version of Ubuntu (18.04, code name "Bionic Beaver", or just "Bionic").  As part of this work we are also installing newer hardware (what will become the "K" class of nodes for Gizmo and new systems for the Rhinos).  This work will also see the NoMachine hosts lynx, manx, and sphinx retired, integrating NoMachine services onto the new Rhino nodes.

Unfortunately this will require some changes on your part.  We are trying to maintain as much compatibility with the existing systems but changes are necessary.  You will see this primarily in your use of Lmod modules (the packages you're loading with `ml` or `module load`.  During this transition (before these new systems become the default) you'll also need to take a couple additional steps to access these new systems.

# Schedule Overview

It is important that you take some time to evaulate any necessary changes to your work as we do have a timeline for implementing these new hosts and retiring the old platform.  The current schedule is:

## General Availability (4 May - 1 June)

During this time these new systems are available for use by anyone with a HutchNet ID.  This is the best opportunity for you to evaluate any necessary changes to your work and tools as the old Ubuntu 14.04 systems will still be available as the default for most commands and work.

During this phase you will need to take special steps to access these new nodes, including additional options to Slurm commands.

As demand dictates, we will begin upgrading a limited number of existing nodes to the new OS though we will endeavor to keep sufficient capacity to accommodate existing work.

During this time we will no longer be building modules and software for Lmod on the current platform.  New modules and software requestes will be built for the new environment. Existing packages will continue to be available in the old environment and we will attempt to fix any problems that arise with these packages during this time

## New Default (1 June - 5 July)

On the 1st of June this new environment will become the "default".  When you access hosts via the hostname "rhino" you will get one of the new hosts.  Slurm commands (`sbatch`, `srun`, `grabnode`, et alia) will run your jobs on the new nodes by default.

We will be maintaining some capacity in the old platform during this time, including an old "rhino".  However, during this period we will be actively migrating systems to the new platform so there will be a significant decline in capacity in this old environment.

This phase will also see the migration of the NoMachine service (currently hosted by lynx, manx, and sphinx) to the new rhino nodes.

At this point, any problems that develop with Lmod modules in the old environment will not be fixed.  We will work with you to complete the migration to the new environment and address problems there instead.

### End of Support (5 July)

On this date access to the old environment will be disabled.  Any remaining hosts will be retired or upgraded.

# Instructions for Use- General Availability (4 May - 1 June)

These instructions are appropriate for the first phase of the transition- the "General Availability" phase described above. During this time, special steps will be necessary to use the new environment as the current environment will remain the default for everyday activities.

This time should be used to evaluate what changes may be necessary for your tools to function in the new environment.  Scientific Computing staff will be available to help with this process.

## Interactive Computing- Shell Based

Use the alias `rhino-new` to access the new rhino hosts with `ssh`.  This will log you into one of the new rhino nodes which will have a name like `rhino01`, `rhino02`, or `rhino03` (note the zero before the number).

## Interactive Computing- NoMachine

The existing NoMachine hosts will be available for use as per usual during this time.  We do have NoMachine installed on the host `rhino01`- you can use this to see how the NoMachine service will work when this has been migrated to the rhinos.

## Interactive Computing- grabnode

`grabnode` will start a session on one of the new Gizmo nodes when launched from `rhino-new`.  On any other system (the existing rhinos, lynx, etc.) `grabnode` will start a session on a node in the current environment.

## Batch Computing

As with `grabnode` you will need to launch your Slurm jobs from `rhino-new` to use the new environment.  These nodes are in the partition `campus-new`, but from one of these new nodes it will not be necessary to add any additional options for job submission.

These new nodes have 36 cores and 768GB of RAM- though these have a profile similar to the largenodes, there is no minimum on memory or CPU required. Thus it is *critical* that if your jobs use a significant amount of memory that you request a number of cores proportional to the anticipated amount of memory you will need.  A good rule of thumb is to request one core for each 4 GB of memory required- for example, if you think you will need about 32GB of memory, request 8 cores for your job.

# Instructions for Use- New Default (1 June - 5 July)

When these new hosts become the default you'll no longer need to do anything different to use hosts in the new environment.  At this point the old environment is considered "deprecated" and while work in the old environment can continue, every effort should be made to migrate to the new nodes.

Contact Scientific Computing for assistance using the old environment.

## Interactive Computing- Shell Based

The name `rhino` will now route you to a new Rhino node.  The `rhino-new` name will still be around, but will eventually be retired.

## Interactive Computing- NoMachine

All of the NoMachine services will be migrated to the new Rhino nodes.  The current hosts- lynx, manx, and sphinx- will be retired with the new Rhinos taking over those services.  You will need to create connections to one of the names `rhino01`, `rhino02`, and `rhino03`.

## Interactive Computing- grabnode

`grabnode` will continue to function as expected from the new Rhino nodes and will allocate nodes from the new environment.

## Batch Computing

As above, no changes to job submission will be required when submitting from one of the new Rhino nodes.  The new default partition for the gizmo cluster will contain only these new hosts.

# Environment Modules (Lmod)

> Please note that we will discontinue building new packages in the old computing environment starting 4 May and will end fixes in the old environment starting 1 June to allow us to better focus on migrating work to the new envrionment.

One of the more significant changes in the new environment is to the modules available in Lmod.  While the commands are the same, in the new environment there are different toolchains requiring changes to the names of the modules you use.  For example, if you use R version 3.6.2:

| old                      | new                         |
|-------                   |------                       |
| `R/3.6.2-foss-2016b-fh1` | `ml R/3.6.2-foss-2019b-fh1` |

Most common versions and tools are available.  Use the `ml spider` command to locate the modules you use.

## Scripting with Modules

Another change is to the path used for initializing Lmod into your environment- if you have lines that run the Lmod initialization scripts in `/app` you will need to update (or possibly remove) those lines from your script.  Where you have code like:

```
source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all
```

Replace this with:

```
source /app/lmod/lmod/init/profile
module use /app/easybuild/modules/all
```

We have made changes that may allow you to eliminate those lines from your scripts entirely- the specifics of how your job is launched ultimately will determine if those lines are necessary.  Contact Scientific Computing if you need assistance assessing this.

# Notes

## <a name="local-gcc"></a>GCC and Compiling Your Own Code

These new hosts have a very minimal number of tools and packages installed.  While a basic compiler is installed on these hosts, it is strongly recommended that you use the tools provided in environment modules.  These are grouped under the module named "foss" or "fosscuda" (the latter for those needing GPU support):

    ml foss/2019b

> NOTE: Many R and Python modules compile binaries as part of their installation process.  To prevent future problems load this toolchain _before_ you use `pip install` or `install.packages()`

## <a name="compiled-apps"></a>Compiled Applications

If you have compiled your own modules- including R libraries installed via CRAN or Python libraries using `pip`- you may need to rebuild or re-install these (see above).

## <a name="x11-support"></a>X11 Support

Starting X clients will require that you load the X11 module:

    ml X11

## <a name="cores-hyperthreading"></a> Cores and Hyperthreading

Hyperthreading creates multiple virtual cores from a single physical core.  All of these hosts are capable of hyperthreading, but given the intense computational demands of most work done in our environment, it provides no benefit.

The interactive nature of the workload on the _rhinos_, however, makes hyperthreading a much more beneficial feature.  Thus, on the _rhino_ nodes you will see 72 cores even though these have the same number of _physical_ cores as the K class nodes

## <a name="node-specifications"></a> Node Specifications

The new nodes are the next generation of gizmo nodes- the "K" class.  These are configured with:

* 2 x Intel Xeon Gold 6254 Processor 18-Core 3.1 - 4 GHz with 2 x AVX 512 units each
* 1 x Dual-Port 10GbE Intel X540
* 768 GB Memory (12 x 64GB PC4-23400 2933MHz DDR4 ECC RDIMM)
* 7.68TB Micron 9300 PRO U.2 NVMe Solid State Drive
* NVIDIA GPU 12GB Memory and 544 Tensor cores 
  (with Compute Capability 7.5)

