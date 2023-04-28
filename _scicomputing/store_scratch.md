---
title: Scratch File Service
primary_reviewers: vortexing
---

## Overview

The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems. Data here is purged when unused for some amount of time- 10, 30, and 90 days depending on the location.

> Data on this platform is not backed up.  This storage is _not_ appropriate for storing the primary or only copy of any data.

As with other SciComp supported file systems, the _scratch_ file system is available to most workstations connected to the campus network:

 - `/fh/scratch` on SciComp supported Linux systems
 - `\\center.fhcrc.org\fh\scratch` on Windows
 - `smb://center.fhcrc.org/fh/scratch` on Mac.

There are no charges to the investigator for data stored here.

## How long will my data stay in scratch?

The name of the parent directory determines how long data is stored.  For example, in `delete30` the data will stay on the file system for 30 days after you have stopped accessing it. `delete90` has a 90 day timer.  Three days before the data is deleted you (the owner of the files created) will receive an email with a warning:

```
    From: fs-cleaner.py-no-reply@fhcrc.org [mailto:fs-cleaner.py-no-reply@fhcrc.org]
    Sent: Tuesday, August 23, 2016 11:32 PM
    To: Doe, Jane <jdoe@fredhutch.org>
    Subject: WARNING: In 3 days will delete files in /fh/scratch/delete30!

    This is a notification message from fs-cleaner.py, Please review the following message:

    Please see attached list of files!

The files listed in the attached text file will be deleted in 3 days when they will not have been touched for 30 days:

# of files: 247, total space: 807 GB
You can prevent deletion of these files
by using the command 'touch -a filename'
on each file. This will reset the access time of the file to the current date.
```

## How can I use Scratch?

In jobs on _gizmo_, environment variables can be used to reference files in _scratch_: e.g. $DELETE30/lastname_f/myfile.csv

>Note: lastname_f stands for the last name and the first initial of your PI and follows the format of your _fast_ file directory name. If you need assistance, please email _scicomp_.

