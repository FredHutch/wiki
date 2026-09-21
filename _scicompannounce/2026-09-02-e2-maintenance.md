---
Title: October Gizmo Outage
---

Maintenance of the E2 data center power distribution systems will require that we take the cluster out of service over two weekends in October of 2026.  The power distribution units supplying power to the racks need replacement which requires we power down systems for the duration of the work.

 - Sunday, 10/18 09:00 AM to Monday, 10/19 12:00 PM
 - Sunday, 10/25 12:00 PM to Sunday, 10/25 9:00 PM

Our hope is that we can complete this work in the first maintenance window- if we are able to complete everything on the weekend of the 18th we will release the second reservation.

A maintenance reservation is now active across the cluster for these dates. Any job whose requested runtime would extend into the 10/18 9:00 AM start of the maintenance window will be held until maintenance concludes. During the outage the rhino and maestro login nodes, and the gizmo cluster nodes will be powered down.  Any active sessions will be terminated, and any running jobs will be terminated.

## Other Work

With the cluster nodes all being rebooted, we are going to take advantage of this outage to perform a few other maintenance tasks on the gizmo cluster

### Slurm Update

We'll be updating Slurm from its current version (25.11) to 26.05.  This will keep us current with bug and security fixes as well as on the supported track.  This won't change how you submit jobs or manage workload on the cluster.

### NoMachine Update

We will be installing the latest NoMachine version (8.27.1) to keep us current on fixes and support.  No changes to how you use NoMachine are expected.

### Open OnDemand

We will update [Open OnDemand](https://openondemand.fredhutch.org) to version 4.2.4. This update brings improved accessibility, smoother keyboard navigation, and key usability fixes across the file manager and interactive apps.

### Linux Updates

We're going to install any missing OS updates and update the kernel to the latest version (5.4.0.238.258~18.04.1 at the time of writing).  These are bug and security fixes that won't affect how you use these systems.

### GPU Updates

gizmoj and gizmok nodes: from 580.126.09-0ubuntu0.18.04.1 to 580.178.04-0ubuntu0.18.04.1
maestro and harmony: from 550.163.01-0ubuntu1 to 580.178.04-1ubuntu1
