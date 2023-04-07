---
title: Task Oriented Storage
primary_reviewers: vortexing
---

## Overview

_Task oriented storage_ is storage for data used in ad-hoc applications when the principal storage location for that data is unsuitable or undesirable for that application.

For example: you have the primary copy of sequencing data in cloud storage (e.g. AWS S3).  This location is not usable for analysis on the gizmo compute cluster and thus you copy it to a location where it is usable by gizmo analysis tools (e.g. a network-attached storage server like "scratch").

> It is **critical** that you do not store the primary or only copy of a data set in locations designated as scratch storage.  Scratch storage paths are typically not backed up and not configured for long-term storage of data.

## Options for Task Storage

### Job Local Temp Space

> This is the /loc/scratch/<jobid> space that exists for the duration of the job

### Network "delete" Scratch

> /fh/scratch/delete*


