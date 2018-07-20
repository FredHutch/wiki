---
title: High Performance Computing Overview
last_modified_at: 2018-06-20
---
This section contains articles that describe a range of computing resource options available to Fred Hutch researchers, all the way from a single laptop to the Fred Hutch on-premise high performance computing cluster (`gizmo`) to various cloud-based options, as well as how to get started using each platform.

### Interactive Computing: Command Line Interface (CLI), Moderate to High Capability
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.  Often reasons to move to these HPC resources include the need for version controlled, specialized package/module/tool configurations, higher compute resource needs, or rapid access to large data sets in data storage locations not accessible with the required security for the data type by the above systems. In the table below, `gizmo` is actually the compute resource that can be accessed via multiple tools, which are also listed below.  

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Gizmo | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
  |   |   |  
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
NoMachine | NX Client, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types

#### Meet `Rhino`
`Gizmo` is actually not a stand alone system like the above section; instead, access to the resource is based on the Rhino platform supported by Center IT.  `Rhino`, or more specifically the Rhinos are the locally managed HPC resources that are actually three different servers all accessed via the name `rhino`. Together, they function as a data and compute hub for a variety of data storage resources and high performance computing (HPC).  The specific guidance for the use of each of the approaches to HPC access are slightly different, but will all require the user to learn how to access and interact with `Rhino`.  Any user interacting with the following systems will be dependent on being proficient with the care and keeping of the Rhinos.

### Interactive Computing: Future Systems Currently Under Development
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage
--- | --- | --- | ---
Beagle | Via Rhino or NoMachine hosts (CLI, FH credentials on campus/VPN off campus) | Center IT | _home_, _fast_, _economy_, AWS-S3, and Beagle-specific _scratch_
<!-- Globus Genomics | web, FH credentials after being linked to Globus | HDC (Bret Dodson) | Economy Cloud ONLY, Requires specific data organization
Zeppelin | - | Center IT | -->
