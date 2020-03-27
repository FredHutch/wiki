---
title: Gizmo Node Beta
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

# Overview

This page describes the new gizmo cluster nodes, some of the differences
between these new systems, and using these systems during this beta period.

## The Hardware

Currently we have four "classes" of node in service: F, G, H, and J. Each class represents compute nodes with different capabilities, processors, and memory.
These new systems will be the "K" class of nodes.  These new systems have two
Intel 6254 processors each with 18 cores (for 36 cores per node total) and
running with processor speeds between 3.10 and 4.0 GHz.  These have been
configured with 768GB of RAM and 6TB of node-local storage. The full  list of
specifications [can be found below.][#node-specifications]

> Each node is also equipped with an NVIDIA GeForce RTX 2080 Ti GPU.  At this
> time it is not currently enabled for use- this feature will come soon.

Along with these new nodes there are three new Rhino-class hosts to provide
interactive and login sessions. These have the same 36 physical cores, but
hyperthreading is enabled which increases the number of cores presented to 72.

## The Software

The software stack is significantly different from what is currently on gizmo:

 - The base OS has been upgraded to Ubuntu 18.04 (Bionic) from the
   venerable 14.04 (Trusty) currently installed
 - The applications in _app_ have been rebuilt for this new platform

Our goal is to make the versions of the tools you're using on the current hosts
available in these new nodes.  We've already compiled quite a few, but if
you're missing one, email SciComp.

The base operating system installation is much leaner than on the older gizmo
nodes.  Thus, many tools you may have been using without loading an environment
module may require that you [load a module](https://sciwiki.fredhutch.org/scicomputing/compute_environments/#environment-modules) on this new platform.

## Reporting Problems

Please report problems using SciComp's ticketing system- emailing SciComp and
indicating that your problem is with the gizmo beta nodes. Please describe the
problem, including any command output, hostnames, and if or how this differs
from what you do on the current gizmo nodes.

# Use

First, it must be noted that this is still not a production-ready system.  The
limits and configuration are not set and are thus subject to change.  While
we'll try to keep the "dust" to a miniumum, we will need to rebuild and reboot
systems regularly.

## Access

For interactive sessions, use the host "rhino03" (note the zero in the
hostname).  This should work the same as the existing rhinos- ssh, putty, etc.
All of your existing data will be available in the same paths.  The Slurm
commands here work just the same as they do on existing systems.

For the new K class nodes we need to submit jobs to a different partition- one
called "campus-new".  This partition doesn't appear in many command outputs by
default (it's hidden to prevent confusion):

    sbatch -p campus-new ...

Even though these share the profile of the nodes in the "largenode" partition,
there are no minimums to have jobs run.  The limits are, currently, much lower
as we're trying to maximize availability during this trial period- 72 cores and
4 nodes maximum.

The `grabnode` command on these new rhino class systems has been updated to use
the campus-new partition.  It will prompt you for job attributes just as it
does today, but will get you a node on the new hosts.

## NoMachine

> NoMachine is still in the process of getting installed.  When finished, this
> message will be removed.

We are consolidating NoMachine functions onto this new generation.  Simple
create a new connection to the host "rhino03".

## Usage Guidelines

As with the existing rhinos, these new systems are intended for interactive
development and testing and should not be used for computationally intensive
work.  We are in the process of evaluating a few different options for managing
load- the current "loadwatcher" is effective but can be rather cruel at times.
During this evaulation period please do your best to keep your processes from
overwhelming the system.

# Notes

## <a name="local-gcc"></a>GCC and Compiling Your Own

As indicated, these new hosts have a very minimal number of tools and packages
installed.  While a basic compiler is installed on these hosts, it is strongly
recommended that you use the tools provided in environment modules.  These are
grouped under the module named "foss" or "fosscuda" (the latter for those
needing GPU support):

    ml foss/2019b

## <a name="x11-support"></a>X11 Support

Starting X clients will require that you load the X11 module:

    ml X11

## <a name="cores-hyperthreading"></a> Cores and Hyperthreading

Hyperthreading creates multiple virtual cores from a single physical core.  All
of these hosts are capable of hyperthreading, but given the intense
computational demands of most work done in our environment, it provides no
benefit.

The interactive nature of the workload on the rhinos, however, makes
hyperthreading a much more beneficial feature.  Thus, on the rhinos you will
see 72 cores even though these have the same number of _physical_ cores as the
K class nodes

### <a name="node-specifications"></a> Node Specifications

<#! insert node spec table here >

# Notes for Admins

> Gory details for those with the stomach and need to know.

## Access to "campus-new" Partition

Allowing access to `campus-new` requires adding a user to a group and the
user's account to a QOS.  The latter was done for all accounts active as of 25
March 2020 so will only be necessary as new accounts are provisioned.

## User Group

This access is controlled by the group `gizmo-beta`.  Use `fhgroup` to add
individuals to this group.

## QOS

These limits are governed by a QOS named `campus-new`.  New accounts will need to have this QOS in their list:

    sacctmgr update account where account=foo_b set qos+=campus-new

The QOS is set up as a partition QOS for the _campus-new_ partition
(`PartitionQOS=campus-new`).  There are two TRES limits specified in
`MaxTRESPerUser`: `cpu` and `node` limiting cores to 72 and a total number of
nodes in use to 4.
