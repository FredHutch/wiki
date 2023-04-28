---
title: Job Local Storage
last_modified_at: 2023-04-28
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Job Local Storage

In the _gizmo_ compute cluster you will be provisioned a directory on the allocated node's local disk.  This directory exists _only_ for the duration of the job.  Once the job exits this directory will be removed.

> Please use this space instead of `/tmp` for local storage.  The `/tmp` directory has less space available and (more importantly) is not automatically cleaned up after the job is finished

## Accessing Job Local Storage

