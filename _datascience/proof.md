---
title: PROOF
main_authors: vortexing, sitapriyamoorthi
primary_reviewers: vortexing
---

## Introduction:

**PROOF** (PRoving cOmpute On cloud Foundations) is a user-friendly tool designed for managing and executing [**WDL**](https://docs.openwdl.org/en/1.0.0/) (Workflow Description Language) workflows using the [**Cromwell**](https://cromwell.readthedocs.io/en/stable/) workflow manager, configured to run on the [**Fred Hutch cluster**.](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/) 

**PROOF** :

- Automates all the backend configurations necessary to run your workflows instantly.

- Allows researchers to validate, troubleshoot, assess performance, and run their workflows all under one roof.

- Also functions as a 'proofing' resource, enabling researchers to refine their workflows before potential transitions to cloud-based infrastructures.

This guide is intended to describe how you can run PROOF, catering to varying levels of computational expertise. 

We also have a WDL 101 course that will be a quick-start guide to building a WDL workflow.

## What is a WDL?

The **Workflow Description Language** (**WDL**, pronounced '**widdle**') is a versatile tool for executing bioinformatics and computational workflows. WDL offers:

-   A **standardized approach** to describing computational tasks, including inputs, outputs, and dependencies.
  
-   A **task-oriented** approach promoting **code reuse and modularity**.
  
-   Support for **parallel execution**, enabling efficient processing of large datasets.
  
-   Explicit **data type definitions** and i**mmutability of variables** by default, ensuring data consistency.
  
-   Built-in support for specifying **data locations**, facilitating seamless collaboration across environments.
  
-   Support for **scatter-gather operations**, improving workflow performance.
  
-   **Flexible syntax** for concise and readable workflow definitions.
  
-   **Platform independence**, allows WDL workflows to run across different environments.
  
-   The requirement of an **engine like Cromwell** for interpreting and executing WDL on various backends enhances usability and versatility.
