---
title: Job Local Storage
last_modified_at: 2023-04-28
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

In the _gizmo_ compute cluster you will be provisioned a directory on the allocated node's local disk.  This directory exists _only_ for the duration of the job.  Once the job exits this directory will be removed.

> Please use this space instead of `/tmp` for local storage.  The `/tmp` directory has less space available and (more importantly) is not automatically cleaned up after the job is finished

This local storage is on an attached SSD and has approximately 7TB available on the K class nodes.  This storage is only available to processes running on the allocated node- it isn't shared between jobs or between jobs running on multiple nodes (e.g. an MPI job)

## Accessing Job Local Storage

In the _gizmo_ compute cluster the environment variable `$TMPDIR` will be set to the path where this storage has been provisioned.  Currently this variable is set using the job ID and uses the form `/loc/scratch/<jobid>`.  This is a directory unique to the job and owned by you.

> We recommend that you use the environment variable in your scripts rather than generating this path as the path to the job local storage may change.  Using the environment variable will "future proof" your scripts.

## Note for Java, GATK, and Picard Users

As Java (and by extension GATK and Picard) does not follow the _TMPDIR_ convention we set the Java property `java.io.tmpdir` using the environment variable _JAVA_TOOL_OPTIONS_.  This updates the default value- if you are using GATK or Picard specific options to set the temporary directory, that option value will be used.
