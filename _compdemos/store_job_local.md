---
title: Job Local Storage
last_modified_at: 2023-04-28
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Job Local Storage

In the _gizmo_ compute cluster you will be provisioned a directory on the allocated node's local disk.  This directory exists _only_ for the duration of the job.  Once the job exits this directory will be removed.

> Please use this space instead of `/tmp` for local storage.  The `/tmp` directory has less space available and (more importantly) is not automatically cleaned up after the job is finished

This local storage is on an attached SSD and has approximately 7TB available on the K class nodes.  This is shared by all jobs allocated to the node, but not managed.

## Accessing Job Local Storage

In the _gizmo_ compute cluster the environment variable `$TMPDIR` will be set to the path where this storage has been provisioned.  Currently this variable is set using the job ID and uses the form `/loc/scratch/<jobid>`.  This is a directory unique to the job and owned by you.

> We recommend that you use the environment variable in your scripts rather than generating this path as the path to the job local storage may change.  Using the environment variable will "future proof" your scripts.
