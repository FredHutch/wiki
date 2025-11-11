---
title: AWS Cloud Computing at Fred Hutch
primary_reviewers: dtenenba, jefftucker, sminot, vorting
---

There are multiple methods by which you might leverage AWS cloud computing here at the Hutch. For less experienced cloud computing users, a workflow manager such as WDL or Nextflow may be of interest. These tools abstract away the actual running of the jobs in the cloud or on Gizmo. For those with needs that do not focus on the running of workflows, AWS Batch itself may be the ideal service.

## [WDL Workflows at Fred Hutch](/datascience/wdl_workflows/)
[WDL (Workflow Description Language)](/datascience/wdl_workflows/) is an open-source workflow language that works across multiple compute infrastructures including Gizmo and AWS. WDL workflows can be executed using [various execution engines](/datascience/wdl_execution_engines/) including Cromwell, miniWDL, and Sprocket. At Fred Hutch, you can run WDL workflows using [PROOF](/datascience/proof/), which provides a user-friendly interface and handles Cromwell server configuration automatically. Cromwell can be configured to run on Gizmo but submit workflow jobs to either Gizmo or AWS as defined by the user at workflow submission time.

## [Nextflow at Fred Hutch](/compdemos/nextflow/)

Another option for using cloud resources, especially when performing a series of tasks (a workflow) repeated, while not necessarily having to understand or coordinate the individual components of the AWS infrastructure is to use the workflow manager [Nextflow](https://www.nextflow.io/).  Nextflow can be configured to use AWS as the backend execution resource, and thus it is very helpful to understand the basics of AWS Batch in order to get your data to a place where it can be analyzed easily via Nextflow.

Ultimately, Nextflow will reduce the amount of backend retooling required when transitioning from on-premise computing to cloud computing. This is an emerging service that is not currently fully supported. However, resource documentation is available [here](/compdemos/nextflow/) and will be updated with forthcoming releases.

## [AWS Batch](/compdemos/aws-batch/)

[AWS Batch](https://aws.amazon.com/batch/): a service which wraps around AWS EC2 resources such that researchers can more easily do computing processes with EC2 instances on data stored in S3.  
For more information on using AWS Batch, please see [this entry in the Resource Library](/compdemos/aws-batch/). 

AWS _Batch_ is an AWS service that uses Docker containers to build a batch
computing system.  Batch is made up of a queueing system where jobs are defined
and queued, and a computational resource made up of Docker containers to
process those jobs.  Resources are provisioned when there are jobs to be
processed and destroyed when the work is complete.  This results in a very
efficient and cost-effective solution for some work.

_Batch_ is useful if you have a fairly standard processing workflow or at least
a step which is fairly consistent.  The classic example for _Batch_ is image
processing: converting a raw image to some other format.  _Batch_ is capable of
much more complicated analyses and pipelines.

As _Batch_ is very much a cloud service, some familiar resources aren't
available when using this.  Our ubiquitous file systems (home directories,
fast-file, temp) are not available- data used in _Batch_ is typically stored
in S3 or some other web-available source.  There have been some recent changes which
expand options for data storage which may make some workloads more accessible
to _Batch_.

## CloudShell at Fred Hutch

CloudShell is a browser-based shell that's native to AWS. With CloudShell, you can quickly run scripts with the AWS Command Line Interface (CLI), experiment with service APIs using the AWS CLI, and use other tools to increase your productivity. The CloudShell icon appears in AWS Regions where CloudShell is available. CloudShell inherits the credentials of the user who is signed in to the AWS Management Console. This makes authentication simpler and reduces operational burden by eliminating the need to configure and manage credentials locally. CloudShell comes with 1 GB of persistent storage for your home directory. Persistent storage enables you to store your frequently used scripts and configuration files between CloudShell sessions. For more details on persistent storage, see the [AWS CloudShell User Guide](https://docs.aws.amazon.com/cloudshell/latest/userguide/welcome.html).

CloudShell will enable low-level access to AWS services when you need to create services that are not handled by the ones listed above (e.g. if you wanted to spin up a RedShift data warehouse).  There is no charge for CloudShell, but there may be charges for any services you enable.


## How do I access my other AWS account resources?

You can read more about [AWS Storage](/scicomputing/store_objectstore/) in our wiki page.  

## I have more questions

Please check out the [FAQ](/scicomputing/store_objectstore/#faq) for more information.
