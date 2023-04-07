---
title: Scratch Storage
primary_reviewers: vortexing
---

## Overview

_Scratch_ storage is storage for data used in ad-hoc applications when the principal storage location for that data is unsuitable or undesirable in that application.

For example: you have the primary copy of sequencing data in cloud storage (e.g. AWS S3).  This location is not usable for analysis on the gizmo compute cluster and thus you copy it to a scratch location where it is usable by gizmo analysis tools.

> It is **critical** that you do not store the primary or only copy of a data set in locations designated as scratch storage.  Scratch storage paths are typically not backed up and not configured for long-term storage of data.

## Scratch Options

### Local Scratch

### Network "delete" Scratch
