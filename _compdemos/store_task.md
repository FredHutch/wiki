---
title: Task Oriented Storage
primary_reviewers: vortexing
---

## Overview

_Task storage_ is storage for data used in ad-hoc applications when the primary or principal storage location for that data is unsuitable or undesirable for that application.

For example: you have the primary copy of sequencing data in cloud storage (e.g. AWS S3).  This location is not usable for analysis on the gizmo compute cluster and thus you copy it to a location where it is usable by gizmo analysis tools (e.g. a network-attached storage server like "scratch").

> It is **critical** that you do not store the primary or only copy of a data set in locations designated as scratch storage.  Scratch storage paths are not backed up and not designed for long-term storage of data.

### Recommendations

Use of task storage requires careful thought and consideration. Given the volitile nature of the storage the responsibility falls to you- the data steward- to ensure that you have accounted for risks you take on as part of using these storage systems.

Some general guidelines for using task storage:

> **DO NOT** keep the primary copy of data in a task storage location.  Before storing your data set in a task storage location, ensure that the primary data set is in durable storage (such as fast or S3) or that the primary data set is easily retrievable from it's source (e.g. your collaborators, DbGap, EMBL,)

> **DO** make sure that data generated into a task storage path is either a) easily regenerated or b) copied to durable storage immediately after generation.  Some intermediate data may not need to be copied if regenerating isn't too difficult or computationally costly.  This is a judgement you will have to make in determining if intermediate data requires durable storage.

> **DO** consider using a workflow manager to manage data in task storage.  Workflow managers can be set up with targets to ensure data is present in task storage before the task begins as well as staging out generated data after successful completion of a task

The Data Science Lab and Scientific Computing teams are available to help you identify and mitigate these risks- please reach out to us with any questions or to help with your plans.

## Storage Options for Tasks

### Scratch

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | no |
| charges | 0 |
| quota/limits | 5PB |

The networked "scratch" file system is available on all rhino/gizmo compute nodes and as part of the 'center' file server (i.e. `//center.fhcrc.org/fh/scratch`)

This storage space is based on a high performance file system (BeegFS) and designed for high-throughput computing on large data sets in the rhino/gizmo environment.  This file system does not have snapshots and is not backed up.

To manage storage volumes, each of the directories have automatic cleanup and deletion jobs that run to prune old data.  Each parent directory indicates the age (in days) of files that will be pruned.  For example, files in /fh/scratch/delete10 will be deleted when the file hasn't been accessed in 10 days.

### Job Local Task Storage

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | no |
| charges | 0 |
| quota/limits | 7TB |

When you submit a job to _gizmo_ and are allocated a node, you will also have task storage provisioned on local disk the duration of the job.  This is local to the node (i.e. a directly-attached disk), but is removed when the job is complete (failed or successful).

> We ask that you use this volume and not the `/tmp` directory on the node- the task storage volume has much greater capacity.  Filling the `/tmp` directory can cause problems for your job and others on the node if it is filed.

### Cloud Scratch Storage

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | limited |
| charges | 0 |
| quota/limits | n/a |

A "scratch" bucket is configured as part of the standard cloud account.  This bucket is described in greater detail [here](https://sciwiki.fredhutch.org/scicomputing/store_objectstore/#scratch-s3-bucket).  This bucket uses automatic timed deletion: if data is stored in a path with the "delete" prefix (e.g. if the path starts "delete10" data under that path will be deleted after 10 days of inactivity).
