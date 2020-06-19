---
title: Gizmo Bionic Upgrade
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

The current operating system used on the Gizmo cluster and Rhino login nodes is Ubuntu 14.04.  This version has been out of support for some time now and is starting to become difficult to support on newer hardware and is preventing installation of some bioinformatics software.

We are therefore upgrading to a more modern version of Ubuntu (18.04, code name "Bionic Beaver", or just "Bionic").  As part of this work we are also installing newer hardware (what will become the "K" class of nodes for Gizmo and new systems for the Rhinos).  This work will also see the NoMachine hosts lynx, manx, and sphinx retired, integrating NoMachine services onto the new Rhino nodes.

Unfortunately this will require some changes on your part.  We are trying to maintain as much compatibility with the existing systems but changes are necessary.  You will see this primarily in the software available by default on these nodes and how you load software with `ml`.

During this transition (before these new systems become the default) you'll also need to take a couple additional steps to access and use these new systems.

For brevity and clarity, the new environment (module, module versions, and OS version) is termed the "Bionic" environment and the existing, out-of-date environment termed "Trusty".

## Schedule Overview

It is important that you take some time to evaulate any necessary changes to your work as we do have a timeline for implementing these new hosts and retiring the old platform.  The current schedule is:

### General Availability (6 May - 16 June)

During this time the Bionic environment is available for use by anyone with a HutchNet ID.  This is the best opportunity for you to evaluate any necessary changes to your work and tools as the old Trusty environment will still be available as the default for most commands and work.

During this phase you will need to take special steps to access Bionic nodes, including additional options to Slurm commands.

As demand dictates, we will begin upgrading a limited number of Trusty nodes to the new OS though we will endeavor to keep sufficient capacity in the Trusty environment to accommodate existing work.

During this time we will no longer be building modules and software for Lmod in the Trusty environment.  New module and software build requests will be built for the Bionic environment. Existing packages will continue to be available in the Trusty- we will attempt to fix any problems that arise with these packages in the Trusty environment during this time

### New Default (16 June - 17 July)

On the 1st of June the Bionic environment will become the "default".  When you access hosts via the hostname "rhino" you will get one of the Bionic rhinos nodes.  Slurm commands (`sbatch`, `srun`, `grabnode`, et alia) will run your jobs on the new Bionic nodes by default.

We will be maintaining some capacity in the Trusty environment during this time, including an old "rhino".  However, during this period we will be actively migrating systems to the Bionic environment so there will be a significant decline in capacity in the Trusty environment.

This phase will also see the migration of the NoMachine service (currently hosted by lynx, manx, and sphinx) to the Bionic Rhino nodes.

At this point, any problems that develop with Lmod modules in the Trusty environment will not be fixed.  We will work with you to complete the migration to the Bionic environment and address problems there instead.

### End of Support (17 July)

On this date access to the Trusty environment will be disabled.  Any remaining hosts will be retired or upgraded.

## Instructions for Use- New Default (16 June - 17 July)

When the Bionic environment become the default you'll no longer need to do anything different to use these systems.  At this point the Trusty environment is considered "deprecated" and while work in the old environment can continue, every effort should be made to migrate to the new nodes.

Contact Scientific Computing for assistance using the Trusty environment.

### Interactive Computing- Shell Based

The name `rhino` will now route you to a Bionic Rhino node.  The `rhino-new` name will still be around, but will be retired.

### Interactive Computing- NoMachine

All of the NoMachine services will be migrated to the new Bionic Rhino nodes.  The current hosts- lynx, manx, and sphinx- will be retired with the Bionic Rhinos taking over those services.  You will need to create connections to one of the names `rhino01`, `rhino02`, and `rhino03`.  More information is available on [this page](/compdemos/gizmo-nx-users/)

### Interactive Computing- grabnode

`grabnode` will continue to function as expected.  This command, executed from the Bionic Rhino nodes will allocate cluster nodes from the Bionic environment.

### Batch Computing

The partition `campus-new` contains the new Bionic nodes.  This is the default partition for the cluster as of 17 June.  If your job does specify the `campus` partition in its options, you will need to update the partition when submitting jobs from Bionic hosts.  For example, change:

    --partition=campus

to

    --partition=campus-new

The `largenode` partition is being retired in the Bionic environment.  If your job requests the `largenode` partition (and associated memory and core requests) you will need to update the request- the memory request is no longer required and the minimum core request has also been removed.  For example:

    --partition=largenode -c 6 --mem=32000

can be updated to:

    --partition=campus-new -c 6

If your job has high memory requirements it is necessary to request more than four cores to ensure your job will be assigned a node with a large memory configuration.  Minimally we ask that you ask for at least 1 core for every 4 GB of memory required by your job.

> IMPORTANT: Submitting jobs to `campus` and `largenode` from Bionic nodes will result in errors.  Please see below if you still need to use Trusty resources.

### <a name="using-trusty"></a>Using Trusty Hosts

While the old nodes have been left running and will be available through this period, note that we will now begin the process of migrating hosts to the Bionic environment.

 - The Trusty `rhino` hosts are still available, but instead of the alias `rhino`, you need to specify one of `rhino1`, `rhino2`, and `rhino3`.
 - The `campus` partition is still available but must be requested explicitly.
 - Using the `campus` from the new Bionic rhino nodes is not supported- launch these jobs from a Trusty `rhino` node.
 - The Trusty NoMachine servers `lynx`, `manx`, and `sphinx` are now considered deprectated and will be removed on the 29th of June.

## Software and Environment Modules (Lmod)

> Please note that we will discontinue building new packages in the Trusty computing environment starting 4 May and will end fixes in the Trusty environment starting 1 June to allow us to better focus on migrating to the Bionic envrionment.

### Bundled Software

We have significantly reduced the number of packages installed as part of the operating system- many utilities available on Trusty nodes without loading a module may now require that you load a module.  For example the `gcc` compiler, `mysql`, and `X11` tools are installed with operating system on Trusty nodes but now require that you load a module first.  An incomplete list:

| if you use this on Trusty | ...use this on Bionic |
|-----------                |--------------
| `mysql`                   | `ml mariadb` |
| `gcc`                     | `ml foss/2019b` |
| X11 display (e.g. DISPLAY)| `ml X11` |

> As always, if you are missing a command or tool, email Scientific Computing to get that installed- depending on the nature of the tool, availability, and its use, it may be installed from the Ubuntu package repositories or as an Environment Module.

### Environment Modules

In the new environment there are different toolchains requiring changes to the names of the modules you use.  Some examples:

| old                          | new                          |
|-------                       |------                        |
| `R/3.6.2-foss-2016b-fh1`     | `ml R/3.6.2-foss-2019b-fh1`  |
| `Python/3.7.4-foss-2016b`    | `Python/3.7.4-foss-2019b-fh1` |
| `Bowtie2/2.3.4.3-foss-2016b` | `Bowtie2/2.3.4.2-foss-2018b` |
| - | `Bowtie2/2.4.1-GCCcore-8.3.0` |


Most common tools are available.  Use the command `ml spider` to locate the modules you use and contact Scientfic Computing if you need a particular version.

### Scripting with Modules

Another change will be to the path used for initializing Lmod into your shell environment- if you have lines that run the Lmod initialization scripts in `/app` you will need to update (or possibly remove) those lines from your script.  Where you have code like:

```
source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all
```

Replace this with:

```
source /app/lmod/lmod/init/profile
```

We have made changes that may allow you to eliminate those lines from your scripts entirely- the specifics of how your job is launched ultimately will determine if those lines are necessary.  Contact Scientific Computing if you need assistance assessing this.

### Extended Default Module Matching

With version 8.3 of Lmod we now have new options for loading modules using a partial module name.  For example, if you have loaded R with the command:

    ml R/3.6.2-foss-2019b-fh1

but are not overly concerned with the toolchain information (i.e. the `foss-2019` stuff) you can load the module with the shorter:

    ml R/3.6.2

Similarly, if the "patch" level isn't important to you:

    ml R/3.6

Will get you the latest 3.6 release of R installed in Lmod.

## Notes

### <a name="locally-libraries"></a>Locally Installed Libraries

If you have compiled R and/or Python libraries installed in your home directory you need to take some extra care.

Libraries compiled on the Trusty platform very likely won't work when used on Bionic, and vice-versa.  Thus, if you are trying out the Bionic environment and install libraries (e.g. using `install.packages()` or `pip install --user`) you will end up with some libraries that are incompatible with the older Trusty environment.

There are a number of ways to address this problem depending on your goals- the easiest may be backing up the library install directory prior to working in the different environment.  For example, `R` installs local libraries into `$HOME/R`- back this up or move it out of the way before working with the Bionic environment.

### <a name="terminator"></a>Terminator Won't Launch

_Terminator_ won't start.  This is a bug in terminator with no anticipated fix in sight.  The workaround is to start terminator with the `-u` option:

    terminator -u

### <a name="local-gcc"></a>GCC and Compiling Your Own Code

These new hosts have a very minimal number of tools and packages installed.  While a basic compiler is installed on these hosts, it is strongly recommended that you use the tools provided by Lmod modules.  These are grouped under the module named "foss" or "fosscuda" (the latter for those needing GPU support):

    ml foss/2019b

> NOTE: Many R and Python modules compile binaries as part of their installation process.  To prevent future problems load this toolchain _before_ you use `pip install` or `install.packages()`

### <a name="compiled-apps"></a>Compiled Applications


If you have compiled your own modules- including R libraries installed via CRAN or Python libraries using `pip`- you may need to rebuild or re-install these (see the above notes about the compiler).

### <a name="x11-support"></a>X11 Support

Starting X clients will require that you load the X11 module:

    ml X11

### <a name="cores-hyperthreading"></a> Cores and Hyperthreading

Hyperthreading creates multiple virtual cores from a single physical core.  All of these hosts are capable of hyperthreading. Given the intense computational demands of most work done by our cluster node, however, it provides no benefit.

The interactive nature of the workload on the Rhinos makes hyperthreading a much more beneficial feature.  Thus, on the new Rhino nodes you will see 72 cores even though these have the same number of _physical_ cores as the K class nodes

### <a name="node-specifications"></a> Node Specifications

The new nodes are the next generation of gizmo nodes- the "K" class.  These are configured with:

* 2 x Intel Xeon Gold 6254 Processor 18-Core 3.1 - 4 GHz with 2 x AVX 512 units each
* 1 x Dual-Port 10GbE Intel X540
* 768 GB Memory (12 x 64GB PC4-23400 2933MHz DDR4 ECC RDIMM)
* 7.68TB Micron 9300 PRO U.2 NVMe Solid State Drive
* NVIDIA GPU 12GB Memory and 544 Tensor cores 
  (with Compute Capability 7.5)

