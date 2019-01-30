---
title: On-Premise HPC at Fred Hutch
last_modified_at: 2019-01-30
---

## Interactive Computing: Command Line Interface (CLI), Moderate to High Capability

These systems are provided by the Fred Hutch to serve needs that rise above
those that can be met using the above listed platforms.  Often reasons to move
to these HPC resources include the need for version controlled, specialized
package/module/tool configurations, higher compute resource needs, or rapid
access to large data sets in data storage locations not accessible with the
required security for the data type by the above systems. In the table below,
`gizmo` is actually the compute resource that can be accessed via multiple
tools, which are also listed below.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Gizmo | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, AWS-S3, and Beagle-specific _scratch_
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
NoMachine | NX Client, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types

## Rhino

_Rhino_, or more specifically rhinos are the locally managed HPC resources
that are actually three different servers all accessed via the name _rhino_.
These function as a data and compute hub for a variety of data storage
resources and high performance computing (HPC) tasks.

These are large shared Linux-based systems which are accessed via SSH.  As
these are shared, you must take care not to overload these hosts.  As a rule,
use the rhinos for cluster tasks, development, and prototyping.

## NoMachine

The NoMachine (NX) servers provide a Linux desktop environment. These systems
are useful if you use tools that require an X Windows display and you don't
wish to install an X11 server on your personal computer.  Another benefit of
using these systems is that the desktop environment and any processes are
preserved if you should disconnect- particularly handy for laptop users.

There are three NX servers: lynx, manx, and sphinx.  lynx runs the Unity desktop environment, the other two run Maté.

NoMachine requires you install the client (NX client) on your computer.  Clients are available for OSX and Windows.  Contact the helpdesk if you need assistance with installation.

## Gizmo and Beagle Cluster

While we generally don't recommend interactive computing on the HPC clusters-
interactive use can limit the amount of work you can do and introduce
"fragility" into your computing- there are many scenarios where interactively
using cluster nodes is a valid approach.  For example, if you have a single
task that is too much for a rhino, opening a session on a cluster node is the
way to go.

If you need an interactive session with dedicated resources, you can start a
job on the cluster using the command `grabnode`.  The `grabnode` command will
start an interactive login session on a cluster node.  This command will prompt
you for how many cores, how much memory, and how much time is required 

This command can be run from any NoMachine or rhino host.

> NOTE: at this time we aren't running interactive jobs on Beagle nodes.  If
> you have a need for this, please contact scicomp.

## Batch Computing

_Batch_ computing allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop should be disconnected for any reason the job will be terminated.

The batch system used at the Hutch is [Slurm](http://schedmd.com).  Slurm provides a set of commands for submitting and managing jobs on the gizmo and beagle clusters as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.

## Parallel Computing
There are many approaches to parallel computing (doing many jobs simultaneously rather than in series).  We have begun a Resource LIbrary entry on [Parallel Computing with Slurm,](/compdemos/cluster_parallel/) as well as created the [FredHutch/slurm-examples repository](https://github.com/FredHutch/slurm-examples) containing community curated examples with additional documentation that can help you get started.  

## External Slurm and HPC Reference and Learning Resources
- Princeton's Introduction to [HPC systems and Bash.](https://princetonuniversity.github.io/hpc_beginning_workshop/slurm/)
- Harvard's [Wiki site Slurm page.](https://wiki.rc.hms.harvard.edu/display/O2/Using+Slurm+Basic)
- The Carpentries [lesson on HPC and job scheduling.](https://hpc-carpentry.github.io/hpc-intro/)
