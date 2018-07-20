---
title: Scientific Computing Supported Resources
last_modified_at: 2018-07-12
---

### Primary Resources
Overview
#### Batch Computing
Overview of Batch computing with gizmo/beagle and other primary links, no specifics

_Batch computing_ allows you to queue up jobs and have them executed by the batch system, rather than you having to start an interactive session on a high-performance system.  Using the batch system allows you to queue up thousands of jobs- something impractical to impossible when using an interactive session.  There are benefits when you have a smaller volume of jobs as well- interactive jobs are dependent on the shell from which they are launched- if your laptop should be disconnected for any reason the job will be terminated.

The batch system used at the Hutch is (Slurm)[http://schedmd.com].  Slurm provides a set of commands for submitting and managing jobs on the gizmo and beagle clusters as well as providing information on the state (success or failure) and metrics (memory and compute usage) of completed jobs.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Gizmo | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, and S3 access. Beagle has its own _scratch_
AWS Batch | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing |Direct to all local storage types

#### Storage?
Overview of storage with primary link, no specifics
#### Software
Over of software support with primary link, no specifics
#### Support
Email, Office Hours (or primary link to "getting help" page?)

### Secondary Resources
Overview
#### Self Service
Jupyterhub, RStudio, db4sci, Galaxy, etc.
#### Available
VMs, shiny, rancher, data transfer

### Unsupported Resources
Are there things people use that we don't really support?
