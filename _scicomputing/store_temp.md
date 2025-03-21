---
title: Temp File System
primary_reviewers: scicomp
---

The _temp_ file system is maintained by SciComp for temporary storage of research data during active analysis. This is a large, high-performance storage system designed to be used as temporary storage for cluster jobs.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems.

> Data on this platform is not backed up. This storage platform is _not_ appropriate for storing the primary or only copy of any data. 

The limitations of _temp_:
* the storage is only accessible on cluster nodes at `/hpc/temp`
* data on _temp_ is not backed up in any way
* data on _temp_ is subject to an automated lifecycle policy and will be deleted 30 days after they are created

There are no charges to the investigator for data stored here. 

Due to the temporary nature of this storage, the lack of charges, limits of capacity, and automatic deletion policy, it is very important that lab leadership understand these aspect before storing data here. *To have a folder created for your lab and your use, please send an email to scicomp@fredhutch.org and include lab owner, PI, and/or data steward.*

### FAQ

#### Q: Can I use _temp_ rather than _Fast_ for lab data to avoid storage charges?
A: No. The _temp_ storage platform is not backed up and has automatic deletions. All data stored on _temp_ will be deleted in 30 days.

#### Q: What will happen to my existing data in _scratch_?
A: _scratch_ will be retired on the 27th of April.  You can start moving your data off of _scratch_ right away. Data that is not moved or copied elsewhere will be deleted.

#### Q: If I have data in _Economy_ storage, but need to analyze it, can I copy it to _temp_?
A: Yes! This is the main use case for _temp_ storage.

#### Q: Can I `touch` my files to avoid automatic deletion?
A: No. The lifecycle policy is managed by the storage platform and is based on file creation time, not read or modify time stamps.

#### Q: What is a good way to automate data management for my jobs so I don't worry about data in _temp_?
A: Use a workflow manager. Please see DaSL's [PROOF](/datascience/proof).

#### Q: Is the data on _temp_ encrypted?

A: Data in _temp_ is encrypted "at rest" (meaning the data is encrypted on the devices where it is stored).  Transit encryption is very client-dependent: the mount on the rhino/gizmo nodes is not encrypted but if you mount it on your workstation, the connection will be encrypted in most cases.

#### Q: Is any data in _temp_ copied or moved to off-campus storage systems?

A: No- all data on _temp_ is confined to the storage system in the data center.  There are no offsite replicas nor any migration of data to offsite data stores.

#### Q: Can I access _temp_ from my Windows or Mac workstation

A: _temp_ can also be accessed from the Mac Finder at `smb://fhcrc.org;USERNAME@hpc.chromium.fhcrc.org/temp.chromium` (replacing `USERNAME` with your HutchNet ID) or Windows Explorer at `\\hpc.chromium.fhcrc.org\temp.chromium`.
