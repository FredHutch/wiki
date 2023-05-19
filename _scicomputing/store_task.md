---
title: Task Optimized Storage
primary_reviewers: scicomp
---


_Task storage_ is storage for data used in ad-hoc applications when the primary or principal storage location for that data is unsuitable or undesirable for that application.

> It is **critical** that you do not store the primary or only copy of a data set in locations designated as task or scratch storage.  These storage paths are not backed up and not designed for long-term storage of data.

In bioinformatics workflows often use pipelines with many execution steps. Each of these steps can create a large amount of temporary data. This data often needs to be  kept for a short period of time to allow for quality assurance.  Informaticians often do not delete this data after this step because they are already off to the next task.

For example: you have the primary copy of sequencing data in cloud storage (e.g. AWS S3).  This location is not usable for analysis on the gizmo compute cluster and thus you copy it to a location where it is usable by gizmo analysis tools (e.g. a network-attached storage server like _Scratch_).

If temporary data is created in a standard file system such as _Fast_ storage it will both be captured in the file system snapshots and can be picked up by the backup system and copied offsite.  If data is frequently created and deleted these snapshots and backups can grow to 5 to 10 times the size of the original data.

To prevent this, everyone working with large datasets should incorporate task storage into their workflow.

## Recommendations

Use of task storage requires careful thought and consideration. Given the volitile nature of the storage the responsibility falls to you- the data steward- to ensure that you have accounted for risks you take on as part of using these storage systems.

Some general guidelines for using task storage:

> **DO NOT** keep the primary copy of data in a task storage location.  Before storing your data set in a task storage location, ensure that the primary data set is in durable storage (such as fast or S3) or that the primary data set is easily retrievable from it's source (e.g. your collaborators, DbGap, EMBL,)

> **DO** make sure that data generated into a task storage path is either a) easily regenerated or b) copied to durable storage immediately after generation.  Some intermediate data may not need to be copied if regenerating isn't too difficult or computationally costly.  This is a judgement you will have to make in determining if intermediate data requires durable storage.

> **DO** consider using a workflow manager to manage data in task storage.  Workflow managers can be set up with targets to ensure data is present in task storage before the task begins as well as staging out generated data after successful completion of a task

The Data Science Lab and Scientific Computing teams are available to help you identify and mitigate these risks- please reach out to us with any questions or to help with your plans.

## Storage Options for Tasks

### Scratch

The networked [_Scratch_](/scicomputing/store_scratch) file system is available on all rhino/gizmo compute nodes and as part of the 'center' file server (i.e. `//center.fhcrc.org/fh/scratch`)

This storage space is based on a high performance file system (BeegFS) and designed for high-throughput computing on large data sets in the rhino/gizmo environment.  This file system does not have snapshots and is not backed up.

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | no |
| charges | none |
| purged when unused | yes |

### Job Local Storage

When you submit a job to _gizmo_ and are allocated a node, you will also have task storage provisioned on local disk the duration of the job.  This is local to the node (i.e. a directly-attached disk), but is removed when the job is complete (failed or successful).

More documentation on using this storage is available [here](/compdemos/store_job_local)

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | no |
| charges | none |
| purged when unused | yes |

### Cloud Scratch

The bucket "fh-pi- _lastname-f_ -nextflow-scratch" is configured as part of the standard cloud account.  This bucket is described in greater detail [here](/scicomputing/store_objectstore/#scratch-s3-bucket).

| feature | availability |
|---------|--------------|
| backups | no           |
| snapshots | no         |
| offsite replication/dr | limited |
| charges | yes |
| purged when unused | yes |
