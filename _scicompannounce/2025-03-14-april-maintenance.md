---
Title: April Maintenance for Rhino/Gizmo Compute Environment
---

On Sunday, 27 April 2025, SciComp will be performing maintenance on systems in the Rhino/Gizmo compute environment.  We expect this to take most of Sunday- during this time jobs will not be run and access to some systems will be intermittent.

If you have questions about any of this work, please email Scientific Computing.

## What to Expect

### When

We'l begin work about 8:00AM on Sunday, 27 April.  We expect this to take 3-4 hours in total.  Status will be sent to the [scicomp-announce mailing list](https://lists.fhcrc.org/postorius/lists/scicomp-announce.lists.fhcrc.org/).

### Retiring Scratch

Scratch will be removed from the rhino nodes, Motuz, and from the systems providing workstation access (homelink and file).  At this point there will be no access to scratch contents.

> We will keep scratch in this state- running but inaccessible- for thirty days.  After that date we will be powering down and decommissioning these hosts

### Rhino Maintenance

We need to reboot the rhino nodes- as part of this work we'll be updating NoMachine and rebooting the network switches connected to rhino nodes.

### Slurm Update

We'll be updating Slurm to the latest bugfix release (24.11.3). This is a bugfix release- there will be some interruptions with Slurm functions during the upgrade, but otherwise jobs will be unaffected during this upgrade process.

