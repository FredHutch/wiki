---
title: PROOF
primary_reviewers: vortexing, abbywall
---

**PROOF** (**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility) is a user-friendly tool designed for managing and executing [**WDL**](https://docs.openwdl.org/en/1.0.0/) (Workflow Description Language) workflows using the [**Cromwell**](https://cromwell.readthedocs.io/en/stable/) workflow manager, configured to run on the [**Fred Hutch cluster**](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/). PROOF allows users to:

- Automate all the backend configurations necessary to run your workflows instantly.

- Validate, troubleshoot, assess performance, and run their workflows all under one roof.

- Refine their workflows before potential transitions to cloud-based infrastructures, providing a 'proofing' resource of sorts.



## Getting Started

- Links to training materials or getting started guide
    - Find out more about PROOF in our [How-To in the DaSL Resource Library](/dasldemos/proof-how-to/).  
    - Learn more about developing WDL workflows using our [WDL Guide]()


## Release Notes

- What’s New!
    - PROOF has now grouped together all the components for setting up and configuring your database and Cromwell server so you don’t have to manually configure each part!
    - You can interact with PROOF in two improved ways when running your workflows:
        - [PROOF Shiny App](https://cromwellapp.fredhutch.org/) - an easy to use interface for running WDL workflows on our cluster
        - [proofr](https://getwilds.org/proofr/) - an R client to run WDL workflows on PROOF
    - We’ve made some enhancements to the way you use PROOF including:
        - Each user must login with your Fred Hutch credentials so that no one else can access or use your PROOF server session
        - Each user can only run one PROOF server at a time so that you don’t lose track of your workflow sessions
- Fixes
    - No fixes just yet, we’re launching our product. 