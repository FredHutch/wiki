---
title: Where to run code
last_modified_at: 2019-09-26
primary_reviewers: k8hertweck
---


For R and Python, you can run the code you have written locally on your computer, or remotely on the [Linux clusters](/scicomputing/compute_platforms/). For running remotely, you can either run on a cluster node shared with other users, or reserve a node for your exclusive use for a limited time.

### Running on your computer
- Pro: immediate access, familiar environment
- Con: limited CPU, memory and disk resources for large tasks (eg. aligning RNASeq reads, variant calling, etc.)

### Running remotely on shared cluster node (`Rhino`)
- Pro: higher CPU, memory and disk resources
- Con: need to transfer files to Hutch servers, requires Internet connection, can be temporarily slow if Rhino has many concurrent users

### Running remotely on reserved cluster node (`Gizmo`)
- Pro: higher CPU, memory and disk resources, and you're the exclusive user
- Con: need to transfer files to Hutch servers, requires Internet connection, if you request a very powerful computer, you may have to wait a while for one to become available

When using the Fred Hutch computing clusters, users should access these programming languages via the environmental modules (eg. `ml R` rather than simply `R` in Rhino). Doing this will ensure reproducibility of your code and that you're using the latest software available. More information about environment modules are available [here](/scicomputing/compute_environments/).
