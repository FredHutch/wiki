---
title: PROOF
main_authors: vortexing, sitapriyamoorthi
primary_reviewers: vortexing
---

## What is PROOF?

**PROOF** (PRoving cOmpute On cloud Foundations) is a user-friendly tool designed for managing and executing [**WDL**](https://docs.openwdl.org/en/1.0.0/) (Workflow Description Language) workflows using the [**Cromwell**](https://cromwell.readthedocs.io/en/stable/) workflow manager, configured to run on the [**Fred Hutch cluster**.](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/) 

PROOF :

- Automates all the backend configurations necessary to run your workflows instantly.

- Allows researchers to validate, troubleshoot, assess performance, and run their workflows all under one roof.

- Also functions as a 'proofing' resource, enabling researchers to refine their workflows before potential transitions to cloud-based infrastructures.

This guide is intended to describe how you can run PROOF, catering to varying levels of computational expertise. 

We also have a WDL 101 course that will be a quick-start guide to building a WDL workflow.

## What is a WDL?

The **Workflow Description Language** (**WDL**, pronounced '**widdle**') is a versatile tool for executing bioinformatics and computational workflows. WDL offers:

-   A **standardized** approach to describing computational tasks, including inputs, outputs, and dependencies.
  
-   A task-oriented approach promoting **code reuse** and modularity.
  
-   Support for **parallel execution**, enabling efficient processing of large datasets.
  
-   Explicit data type definitions and **immutability of variables** by default, ensuring data consistency.
  
-   Built-in support for specifying **data locations**, facilitating seamless collaboration across environments.
  
-   Support for **scatter-gather** operations, improving workflow performance.
  
-   **Flexible syntax** for concise and readable workflow definitions.
  
-   **Platform independence**, allows WDL workflows to run across different environments.
  
-   The requirement of an **engine like Cromwell** for interpreting and executing WDL on various backends enhances usability and versatility.


## What is Cromwell?

Cromwell, originally developed at the Broad Institute, is a WDL workflow engine, that facilitates the orchestration of multi-step workflows. It efficiently handles individual tasks, monitors job metadata, offers an intuitive API interface, and enables users to oversee multiple workflows concurrently. While other WDL engines exist, here are some of the reasons Cromwell stands out :

-   **Integration with the Fred Hutch cluster:** Cromwell has been configured to run on the Fred Hutch cluster to make running WDL workflows very simple. Additionally, it seamlessly integrates with various cloud platforms, and workflow description formats, enhancing compatibility and facilitating workflow execution across different computing infrastructures.

-   **Robust Workflow Management**: Cromwell offers a robust engine for managing complex workflows, ensuring efficient execution of tasks, and streamlined workflow orchestration.

-   **Scalability**: With its ability to handle large-scale workflows, Cromwell accommodates projects of varying sizes, from small-scale analyses to large-scale data processing pipelines.

-   **Comprehensive Job Monitoring**: It provides comprehensive job monitoring and metadata tracking, enabling users to closely monitor workflow progress, identify bottlenecks, and troubleshoot issues effectively.

-   **Community Support and Documentation**: Cromwell benefits from a supportive community and extensive documentation, offering users access to resources, tutorials, and community-driven solutions to common challenges.

-   **Open Source and Customizability**: Being open-source, Cromwell allows for customization and adaptation to specific workflow requirements, empowering users to tailor workflows to their unique needs and preferences.


## Running a WDL workflow using Cromwell at Fred Hutch
   
   In general, Cromwell works best when run in **server mode**, which means that users start a **Cromwell server** as a job on our local SLURM cluster that can connect to a **database** specifically for Cromwell workflow tracking.
  
This Cromwell server job then behaves as the workflow **coordinator** for that **user**, allowing a user to send workflow instructions for **multiple workflows** running simultaneously.

The Cromwell server will then **parse** these workflow instructions, find and copy the relevant input files, **send** the tasks to the cluster (Gizmo) to be processed, **coordinate** the results of those tasks and **record** all of the metadata about what is happening in its database.

This means that individual users can:

 - run **multiple independent workflows** at the same time using **one Cromwell server**

 - use **cached results** when identical to the current task

 - **track** the status of workflows and tasks
 
 - **customize** the locations of input data, intermediate data, and workflow outputs to data storage resources appropriate to the data type (re: cost, backup and accessibility)

 - **query** the Cromwell database for information about workflows run in the past, including where their workflow outputs were saved or a variety of other workflow and task level metadata.


### How to get setup with Cromwell at Fred Hutch
 
 The prerequisite to running WDL workflows using Cromwell within the Fred Hutch involves two key steps: starting a Cromwell server and having a database setup. There are currently two ways to do this:

**The PROOF way _(recommended)_:**
Using one of the three ways (see User guides below for detailed instructions) PROOF will help you

 - Automatically start a Cromwell server for you
_Note: Your Cromwell server by default runs only for 7 days. Make sure to restart it to continue submitting and running
   jobs._
   
 -   Automatically sets up a MariaDB(MySql) database for you


 **The DIY way:**
 
 - Requires you to first setup a MariaBD (MySql) database

 - Requires you to kick-off a Cromwell server 


   _Note: **Irrespective** of which way you use to **start** and configure your **Cromwell** server you can validate, submit, track, troubleshoot and abort your **jobs** using PROOF. More details below in the user guides._


## Things to do before you start
***section in development***


## Users guide: Running WDL workflows through R (rcromwell)
***section in development***


## Users guide: Running WDL workflows through command line via PROOF
***section in development***


## Developing with PROOF API
***section in development***


## Resources and help
***section in development***
