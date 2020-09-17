---
title: Quick Start Guide to Fred Hutch Research Computing
last_modified_at: 2019-08-01
main_author: Kate Hertweck
primary_reviewers: vortexing, k8hertweck
---

This guide is intended for rapid onboarding of Fred Hutch staff who have previous experience working with computing resources at other academic institutions.  Overview information and links to relevant portions of the Wiki for getting started and basic usage of Fred Hutch resources is the primary focus. We highlight, as well, specific steps new staff or existing staff who have not previously needed to use these resoruces might need to take in order to get set up to use these resources.

## Accounts

### HutchNet ID

A [HutchNet ID](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)  (username and password) are assigned to Fred Hutch employees and affiliates via the employee action form.  These credentials can access most Hutch-supported compute resources.

### GitHub

GitHub is an essential part of many workflows- GitHub is an external service which does require additional steps [described here](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#githubcom).

## Access

### On Campus

Access to the campus network is either a cable to a wall port or via the WiFi network "marconi".  The "marconi" network uses [your HutchNet ID for authentication](https://centernet.fredhutch.org/cn/u/center-it/help-desk/connecting-to-wifi.html).

Both are supported by CIT- email the [Service Desk](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) for assistance with either network.

### Remote Access

As a general rule, computational resources are not available outside the Hutch campus network.  To access computational resources, you will need to connect to the campus network over the Internet using the CIT supported [VPN](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html).  Shell (`ssh`) access is available via the host [snail](https://sciwiki.fredhutch.org/scicomputing/access_methods/#ssh-to-snailfhcrcorg)

## Core Computational Resources

### Bioinformatic Applications

Scientific Computing maintains hundreds of bioinformatic and development tools for use on the above resources.  These are managed using [environment modules- AKA `lmod`](https://sciwiki.fredhutch.org/scicomputing/compute_environments/#environment-modules)

### Interactive Shell

The ["rhino" hosts](https://sciwiki.fredhutch.org/compdemos/howtoRhino/#rhino-compute-nodes) are identically configured, shared linux servers that provide shell and bioinformatic application access.

### Batch Computing

The on-premise compute cluster is _gizmo_.  You can read about this and additional resources [here](https://sciwiki.fredhutch.org/scicomputing/compute_platforms/).

The compute clusters use [Slurm](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/) for workload management. This is the interface for submitting and managing batch jobs to these clusters.

## Additional Help and Support

 - [Scientific Computing](https://centernet.fredhutch.org/cn/u/hdc/scicomp.html)

     SciComp supports much of the storage and computational resources used
     for research at the Hutch.  Support is offered via email and
     office hours.

 - [Service Desk](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html)

     The CIT Service Desk is the point of contact for most compute support,
     including email, your workstation, networking questions, and your HutchNet
     ID.  Support is offered via email, phone, and walk-up.

 - Local IT Support

     Hutch divisions have their own IT support that provides support
     for many IT resources, including your workstation, some account
     and permissions, as well as assistance navigating the Hutch's IT
     world:

      - PHS (link to come)

      - HB/BS (link to come)

      - VIDD/SCHARP (link to come)

      - CRD (link to come)

 - [The Coop](https://research.fhcrc.org/coop/en.html)
 
     Supports data-intensive research and analysis.  The Coop uses community
     and community tool (like Slack) to connect researchers across the Hutch.
