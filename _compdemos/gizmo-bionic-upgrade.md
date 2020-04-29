---
title: Gizmo Bionic Upgrade
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

# Overview

The current operating system used on the Gizmo cluster and Rhino login nodes is Ubuntu 14.04.  This has been out of support for some time now and is starting to become difficult to support on newer hardware and is preventing installation of some bioinformatics software. 

We are therefore upgrading to a more modern version of Ubuntu (18.04, code name "Bionic Beaver", or just "Bionic").  As part of this work we are also installing newer hardware (what will become the "K" class of nodes for Gizmo and new systems for the Rhinos).  This work will also see the NoMachine hosts lynx, manx, and sphinx retired, integrating NoMachine services onto the new Rhino nodes.

Unfortunately this will require some changes on your part.  We are trying to maintain as much compatibility with the existing systems but changes are necessary.  You will see this primarily in your use of Lmod modules (the packages you're loading with `ml` or `module load`.  During this transition (before these new systems become the default) you'll also need to take a couple additional steps to access these new systems.

## Schedule

It is important that you take some time to evaulate any necessary changes to your work as we do have a timeline for implementing these new hosts and retiring the old platform.  The current schedule is:

### General Availability (4 May - 1 June)

During this time these new systems are available for use by anyone with a HutchNet ID.  This is the best opportunity for you to evaluate any necessary changes to your work and tools as the old Ubuntu 14.04 systems will still be available as the default for most commands and work.

During this phase you will need to take special steps to access these new nodes, including additional options to Slurm commands.

> On 4 May we will also be discontinuing support for Lmod on the current platform- any new software (including new versions of existing software) will be built for the new environment. Existing packages _will_ continue to function and we will attempt to fix any problems that arise with these packages during this time

As demand dictates, we will begin upgrading a limited number of existing nodes to the new OS though we will endeavor to keep sufficient capacity to accommodate existing work.

### New Default (1 June - 5 July)

On the 1st of June these new nodes will become the "default".  When you access hosts via the hostname "rhino" you will get one of the new hosts.  Slurm commands (`sbatch`, `srun`, `grabnode`, et alia) will run your jobs on the new nodes by default.

We will be maintaining some capacity in the old platform during this time, including an old "rhino".  However, during this period we will be actively migrating systems to the new platform so there will be a significant decline in capacity in this old environment.

This phase will also see the migration of the NoMachine service (currently hosted by lynx, manx, and sphinx) to the new rhino nodes.

### End of Support (5 July)

On this date all hosts will have been migrated to the new environment.

# Instructions for Use- General Availability

> These instructions are appropriate for the first phase of the transition- the "General Availability" phase described above.

## Interactive Computing- Shell Based

Use the alias `rhino-new` to access the new rhino hosts with `ssh`.  This will log you into one of the new rhino nodes which will have a name like `rhino01`, `rhino02`, or `rhino03` (note the zero before the number).

## Interactive Computing- NoMachine

The existing NoMachine hosts will be available for use as per usual during this time.  We do have NoMachine installed on the host `rhino01`- you can use this to see how the NoMachine service will work when this has been migrated to the rhinos.

## Interactive Computing- grabnode

`grabnode` will start a session on one of the new Gizmo nodes when launched from `rhino-new`.  On any other system (the existing rhinos, lynx, etc.) `grabnode` will start a session on a node in the current environment.

## Batch Computing

As with `grabnode` you will need to launch your Slurm jobs from `rhino-new` to use the new environment.  These nodes are in the partition `campus-new`, but from one of these new nodes it will not be necessary to add any additional options.

These new nodes have 36 cores and 768GB of RAM- though these have a profile similar to the largenodes, there is no minimum on memory or CPU required. Thus it is *critical* that if your jobs use a significant amount of memory that you request a number of cores proportional to the anticipated amount of memory you will need.  A good rule of thumb is to request one core for each 4 GB of memory required- if you think you will need about 32GB of memory, request 8 cores for your job.

# Instructions for Use- New Default

When these new hosts become the default you'll no longer need to do anything different to use hosts in the new environment.  At this point the old environment is considered "deprecated" and while transitional work can continue, every effort should be made to migrate to the new nodes.

Contact Scientific Computing for assistance using the old environment.

## Interactive Computing- Shell Based

The name `rhino` will now route you to a new Rhino node.  The `rhino-new` name will still be around, but will eventually be retired.

## Interactive Computing- NoMachine

All of the NoMachine services will be migrated to the new Rhino nodes.  The current hosts- lynx, manx, and sphinx- will be retired with the new Rhinos taking over those services.  You will need to create connections to one of the names `rhino01`, `rhino02`, and `rhino03`.

## Interactive Computing- grabnode

`grabnode` will continue to function as expected from the new Rhino nodes and will allocate nodes from the new environment.

## Batch Computing

As above, no changes to job submission will be required when submitting from one of the new Rhino nodes.  The partition `campus-new` will be configured to reject new jobs (allowing existing jobs to finish) so jobs using that partition name will not be queued.

# Environment Modules (Lmod)

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




------

This page describes the new gizmo cluster nodes, some of the differences between these new systems, and using these systems during this beta period.

## The Hardware

Currently we have four "classes" of node in service: F, G, H, and J. Each class represents compute nodes with different capabilities, processors, and memory.  These new systems will be the "K" class of nodes.  These new systems have two Intel 6254 processors each with 18 cores (for 36 cores per node total) and running with processor speeds between 3.10 and 4.0 GHz.  These have been configured with 768GB of RAM and 6TB of node-local storage. The full  list of specifications [can be found below.](#node-specifications)

Each node is also equipped with an NVIDIA GPU 12GB Memory and 544 Tensor cores.  These can be requested as part of your job submission request.

Along with these new nodes there are three new Rhino-class hosts to provide interactive and login sessions. These have the same 36 physical cores, but hyperthreading is enabled which increases the number of cores presented to 72.

## The Software

The software stack is significantly different from what is currently on gizmo:

 - The base OS has been upgraded to Ubuntu 18.04 (Bionic) from the venerable 14.04 (Trusty) currently installed
 - The applications and [environment modules](https://sciwiki.fredhutch.org/scicomputing/compute_environments/#environment-modules) in _app_ have been rebuilt for this new platform

Our goal is to make the versions of the tools you're using on the current hosts available in these new nodes.  We've already compiled quite a few, but if you're missing one, email SciComp.

The base operating system installation is much leaner than on the older gizmo nodes.  Thus, many tools you may have been using without loading an environment module may require that you [load a module](https://sciwiki.fredhutch.org/scicomputing/compute_environments/#environment-modules) on this new platform.

## Reporting Problems

Please report problems using SciComp's ticketing system: email SciComp and indicate that your problem is with the gizmo beta nodes. Please describe the problem, including any command output, hostnames, and if or how this differs from your use of the current gizmo nodes.

# Use

First, it must be noted that this is still not a production-ready system.  The limits and configuration are not set and are thus subject to change.  While we'll try to keep the "dust" to a miniumum, we will need to rebuild and reboot systems regularly.

As part of this work we are creating a mailing list for those of you participating in this beta period.  We'll be sending updates on changes and notices of upcoming outages via this list.

## Usage Guidelines

As with the existing _rhinos_, the new _rhino_ nodes are intended for interactive development and testing and should not be used for computationally intensive work which should be directed to the cluster nodes via Slurm.

> There is currently no load management on the new _rhino_ nodes, so please take care with your processes.  We are in the process of evaluating a few different options for managing load- the current "loadwatcher" is effective but can be rather cruel at times.  During this evaulation period please do your best to keep your processes from overwhelming the system.

## Access

For interactive sessions, use the host _rhino03_ (note the zero in the hostname).  This should work the same as the existing _rhinos_- ssh, putty, etc.  All of your existing data will be available in the same paths.  The Slurm commands here work just the same as they do on existing systems.

## Job Submission

> IMPORTANT: Submit jobs from the host _rhino03_.  While other systems have access to this partition, the environment is sufficiently different such that we need to use the new rhino hosts for job submission.

For the new K class nodes we need to submit jobs to a different partition- one called "campus-new".  This partition doesn't appear in many command outputs by default (it's hidden to prevent confusion):

    sbatch -p campus-new ...

Even though these share the profile of the nodes in the "largenode" partition, there are no minimums to have jobs run.  The limits are, currently, much lower as we're trying to maximize availability during this trial period- the limit is 72 cores or 4 nodes.

Your login environment should be configured to set this partition (`campus-new`) as the default partition- this is done via the environment variables `SLURM_PARTITION` and `SBATCH_PARTITION`.  You can verify this with the command `srun hostname` which should return something like `gizmok` in its output.

The `grabnode` command on these new _rhino_ class systems has also been updated to use the campus-new partition.  It will prompt you for job attributes just as it does today, but will get you a node on the new hosts.

### Special Note for GPU Users

The GPUS can be requested in your job using the option _gres_:

    sbatch -p campus-new --gres=gpu

## NoMachine

We are consolidating NoMachine functions onto this new generation of nodes instead of having separate hosts (i.e. _sphinx_ and other).  Simply create a new connection to the host _rhino03_ as you would any of the existing NoMachine hosts.

# Notes

## <a name="environment-module-scripts"></a>Environment Modules Changes for Scripts

Loading modules in a script requires initializing Environment Modules.  This is accomplished by sourcing the shell-specific initialization script in your script:

```
#!/bin/bash

. /app/lmod/lmod/init/bash

module use /app/modules/all

ml ...
```

## <a name="environment-module-names"></a>Environment Module Names

While Environment Modules on these new hosts have the same version of the tool
as on the existing nodes, these have been compiled with different toolchain
which requires a different module name.

For example, on these new nodes you'd load "R/3.6.2-foss-2019b" instead of "R/3.6.2-foss-2016b"

## <a name="local-gcc"></a>GCC and Compiling Your Own Code

As indicated, these new hosts have a very minimal number of tools and packages installed.  While a basic compiler is installed on these hosts, it is strongly recommended that you use the tools provided in environment modules.  These are grouped under the module named "foss" or "fosscuda" (the latter for those needing GPU support):

    ml foss/2019b

> NOTE: Many R and Python modules compile binaries as part of their installation process.  To prevent future problems load this toolchain _before_ you use `pip install` or `install.packages()`

## <a name="x11-support"></a>X11 Support

Starting X clients will require that you load the X11 module:

    ml X11

## <a name="cores-hyperthreading"></a> Cores and Hyperthreading

Hyperthreading creates multiple virtual cores from a single physical core.  All of these hosts are capable of hyperthreading, but given the intense computational demands of most work done in our environment, it provides no benefit.

The interactive nature of the workload on the _rhinos_, however, makes hyperthreading a much more beneficial feature.  Thus, on the _rhino_ nodes you will see 72 cores even though these have the same number of _physical_ cores as the K class nodes

### <a name="node-specifications"></a> Node Specifications

* 2 x Intel Xeon Gold 6254 Processor 18-Core 3.1 - 4 GHz with 2 x AVX 512 units each
* 1 x Dual-Port 10GbE Intel X540
* 768 GB Memory (12 x 64GB PC4-23400 2933MHz DDR4 ECC RDIMM)
* 7.68TB Micron 9300 PRO U.2 NVMe Solid State Drive
* NVIDIA GPU 12GB Memory and 544 Tensor cores 
  (with Compute Capability 7.5)

# Notes for Admins

> Gory details for those with the stomach and need to know.

## Adding New Users

 - [ ] verify user's group has access to "campus-new" QOS
 - [ ] add to Unix group "gizmo-beta"
 - [ ] add to "gizmo-beta-testers" mailman list

## Communication

We're using a mailman list "gizmo-beta-testers" for communicating updates and information.  The management interface is [here](https://lists.fhcrc.org/mailman/admin/gizmo-beta-testers).

When adding new users, include the following text:

> Hi
>
> This is the mailing list for those participating in the gizmo beta node trial period.  The wiki page "https://sciwiki.fredhutch.org/compdemos/gizmo-node-beta/" contains much of the recent information on changes and how to use this resource.
>
> Please use 'scicomp at fredhutch.org' to report problems and get assistance.

The administrator password is in LastPass.  This list should be synchronized with the groups below- if someone is participating, they must be a member of the list.

## Access to "campus-new" Partition

Allowing access to `campus-new` requires adding a user to a group and the user's account to a QOS.  The latter was done for all accounts active as of 25 March 2020 so will only be necessary as new accounts are provisioned.

## User Group

This access is controlled by the group `gizmo-beta`.  Use `fhgroup` to add individuals to this group.

## QOS

These limits are governed by a QOS named `campus-new`.  New accounts will need to have this QOS in their list:

    sacctmgr update account where account=foo_b set qos+=campus-new

The QOS is set up as a partition QOS for the _campus-new_ partition (`PartitionQOS=campus-new`).  There are two TRES limits specified in `MaxTRESPerUser`: `cpu` and `node` limiting total cores in use to 72 and a total number of nodes in use to 4.
