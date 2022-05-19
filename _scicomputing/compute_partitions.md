---
title: Cluster Partitions
primary_reviewers: atombaby
---

## Overview

Slurm _partitions_ organize and associate compute resources in the cluster. Partitions have a number of attributes that can be adjusted to suit the particular needs of the compute users- primarily we use partitions to adjust the limits and scheduling of compute jobs.

## Gizmo Partition Summary

| Partition Name | Nodes | Guaranteed | Max Time | Limits
|----------------|-------|------------|----------|--------
| campus-new (*) | All   | yes        | 30 days  | 1000 cores per account
| short          | All   | yes        | 12 hours | 8000 core-hours committed per account
| restart        | All   | no         | 7 days   | no limit


### campus-new

The partition "campus-new'
