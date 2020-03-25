---
title: Gizmo Node Beta
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

This page describes the new gizmo cluster nodes, some of the differences
between these new systems, and how you can help bring these nodes into service.

# The Hardware

These new systems will be the "K" class of nodes.  Currently we have four in
service- F, G, H, and J.  These new systems have 36
cores[1](#cores-hyperthreading) each running at a peak of 3.10GHz.  These have
been configured with about 768GB of RAM and 6TB of node-local storage.

> Each node is equipped with an NVIDIA GeForce RTX 2080 Ti GPU.  At this time
> it is not currently enabled for use- this feature will come soon.

Along with these new nodes there are three new Rhino-class hosts to provide interactive and login sessions. These have the same 36 physical cores, but hyperthreading is enabled which increases the number of cores presented to 72.

# The Software

The software stack is significantly different from what is currently on gizmo:

 - The base OS has been upgraded to Ubuntu 18.04 (Bionic) from the
   venerable 14.04 (Trusty) currently installed
 - The applications in _app_ have been rebuilt for this new platform

Our goal is to make the versions of the tools you're using on the current hosts
available in these new nodes.  We've already compiled quite a few, but if
you're missing one, email SciComp.

The base operating system installation is much leaner than on the older gizmo
nodes.  Thus, many tools you may have been using without loading a module may
require that you load a module on this new platform.

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

For the new K class nodes we need to submit jobs to a different partition- one called "campus-new".  This partition doesn't appear in many command outputs by default (it's hidden to prevent confusion):

    sbatch -p campus-new ...

Even though these share the profile of the nodes in the "largenode" partition,
there are no minimums to have jobs run.  The limits are, currently, much lower
as we're trying to maximize availability during this trial period- 72 cores and 4 nodes maximum.

At this point we don't have a `grabnode` equivalent.  For interactive shell usage:

    srun -X -p campus-new --pty /bin/bash

Add other `srun` options (like CPU and time limit) as necessary.

## NoMachine

We are consolidating NoMachine functions onto this new generation.  Simple create a new connection to the host "rhino03".

## Usage Guidelines

As with the existing rhinos, these new systems are intended for interactive
development and testing and should not be used for computationally intensive
work.  We are in the process of evaluating a few different options for managing
load- the current "loadwatcher" is effective but can be rather cruel at times.
During this evaulation period please do your best to keep your processes from
overwhelming the system.

# Notes

### <a name="cores-hyperthreading"></a> Cores and Hyperthreading

Hyperthreading creates multiple virtual cores from a single physical core.  All
of these hosts are capable of hyperthreading, but given the intense
computational demands of most work done in our environment, it provides no
benefit.

The interactive nature of the workload on the rhinos, however, makes
hyperthreading a much more beneficial feature.  Thus, on the rhinos you will
see 72 cores even though these have the same number of _physical_ cores as the
K class nodes

### <a name="x11-support"></a>X11 Support

Starting X clients will require that you load the X11 module:

    ml X11

