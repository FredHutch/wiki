---
Title: New Temp Storage System
---

## Who
Research IT and Scientific Computing (RITSC)

## What
RITSC now supports a new temporary data storage platform for use by HPC cluster jobs. The system is made by Vast Data, and is a 100% flash storage system. It is clustered and provides increased performance and reliability over our previous temporary data storage platform (called scratch).

## How
The new storage platform is mounted on all cluster nodes, including rhinos, at `/hpc/temp`. In order to provide a high performance shared storage platform for all cluster users, all data written to _temp_ will be deleted 30 days after creation (this is a change from scratch). In order to use this new system, *all labs* will need to send an email to scicomp@fredhutch.org from lab leadership (data owner/PI/data steward) to have a folder created for read/write access. Once the folder is created, it can also be accessed
from the Mac Finder at `smb://fhcrc.org;USERNAME@hpc.chromium.fhcrc.org/temp.chromium` (replacing `USERNAME` with your HutchNet ID) or Windows Explorer at `\\hpc.chromium.fhcrc.org\temp.chromium`.

## When
The storage platform is available now.

## Why
Our previous temporary storage platform (scratch) is end of life. It is also an older generation of hardware with deteriorating reliability. It will be retired very soon.

## Errata
