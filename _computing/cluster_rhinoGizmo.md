---
title: On-Premise HPC at Fred Hutch
last_modified_at: 2018-08-02
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
  |   |   |  
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, AWS-S3, and Beagle-specific _scratch_
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
NoMachine | NX Client, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types

## Meet `Rhino`

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

## Gizmo and Beagle

While we generally don't recommend interactive computing on the HPC clusters-
interactive use can limit the amount of work you can do and introduce
"fragility" into your computing- there are many scenarios where interactively
using cluster nodes is a valid approach.  For example, if you have a single
task that is too much for a rhino, opening a session on a cluster node is the
way to go.

> NOTE: at this time we aren't running interactive jobs on Beagle nodes.  If
> you have a need for this, please contact scicomp.

## Notebooks and RStudio

