---
title: Temp File System
primary_reviewers: scicomp
---

The _temp_ file system is maintained by SciComp for temporary storage of research data during active analysis. This is a large, high-performance storage system designed to be used as temporary storage for cluster jobs.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems.

> Data on this platform is not backed up. This storage platform is _not_ appropriate for storaging the primary or only copy of any data. 

Unlike other SciComp supported file systems, the _temp_ file system is only available via the commandline on cluster nodes:

* `/hpc/temp` on rhino & gizmo

> Data on this platform is not backed up. This storage platform is _not_ appropriate for storaging the primary or only copy of any data. 

Data in _temp_ is purged after 30 days

| path                  | age to be purged |
| --------------------- | -----------------|
| /hpc/temp/            | 30 days          |

There are no charges to the investigator for data stored here.

To request access to this file system for your lab, send an e-mail to scicomp@

> Data on this platform is not backed up. This storage platform is _not_ appropriate for storaging the primary or only copy of any data. 