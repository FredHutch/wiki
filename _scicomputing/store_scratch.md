---
title: Scratch File Service
primary_reviewers: scicomp
---


The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems.

> Data on this platform is not backed up.  This storage is _not_ appropriate for storage of the primary or only copy of any data.

Data in _scratch_ is purged when unused: the age at which files are purged is set by the file's path in _scratch_:

| path                  | age to be purged |
| --------------------- | -----------------|
| /fh/scratch/delete10/ | 10 days          |
| /fh/scratch/delete30/ | 30 days          |
| /fh/scratch/delete90/ | 90 days          |

> Data on this platform is not backed up.  This storage is _not_ appropriate for storage of the primary or only copy of any data.

As with other SciComp supported file systems, the _scratch_ file system is available to most workstations connected to the campus network:

 - `/fh/scratch` on SciComp supported Linux systems
 - `\\center.fhcrc.org\fh\scratch` on Windows
 - `smb://center.fhcrc.org/fh/scratch` on Mac.

There are no charges to the investigator for data stored here.

> Data on this platform is not backed up.  This storage is _not_ appropriate for storage of the primary or only copy of any data.
