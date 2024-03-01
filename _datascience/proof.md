---
title: PROOF
primary_reviewers: vortexing, abbywall
---

**PROOF** (**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility) is a user-friendly tool designed for managing and executing [**WDL**](https://docs.openwdl.org/en/1.0.0/) (Workflow Description Language) workflows using the [**Cromwell**](https://cromwell.readthedocs.io/en/stable/) workflow manager, configured to run on the [**Fred Hutch cluster**](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/). PROOF allows users to:

- Automate all the backend configurations necessary to run your workflows instantly.

- Validate, troubleshoot, assess performance, and run their workflows all under one roof.

- Refine their workflows before potential transitions to cloud-based infrastructures, providing a 'proofing' resource of sorts.

## Getting Started

### Training and Courses
- Find out more about PROOF in our [How-To in the DaSL Resource Library](/dasldemos/proof-how-to/)
- Learn more about developing WDL workflows using our [WDL Guide](https://hutchdatascience.org/WDL_Workflows_Guide/)

### Technical Documentation and Repositories
- [PROOF Shiny App](https://github.com/getwilds/shiny-cromwell)
- [proofr](https://github.com/getwilds/proofr)
- [rcromwell](https://github.com/getwilds/rcromwell)

## Release Notes

### February 2024
**What's New!**
- PROOF has now grouped together all the components for setting up and configuring your database and Cromwell server so you don’t have to manually configure each part!
- You can interact with PROOF in two improved ways when running your workflows:
    - [PROOF Shiny App](https://cromwellapp.fredhutch.org/) - an easy to use interface for accessing and configuring workflows to run on our cluster
    - Through the R clients [proofr](https://getwilds.org/proofr/) and [rcromwell](https://getwilds.org/rcromwell/) - combined these allow you to run WDL workflows on PROOF from your R console 
- We’ve made some enhancements to the way you use PROOF including:
    - Each user must login with your Fred Hutch credentials so that no one else can access or use your Cromwell server session
    - Each user can only run one Cromwell server at a time so that you don’t lose track of your workflow sessions

**Fixes**
- No fixes just yet, we’re launching our product
