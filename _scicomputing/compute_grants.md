---
title: Scientific Computing Resource Overview for Grants and Publications
primary_reviewers: dirkpetersen
---

This is a description of Scientific Computing resources. For Shared Resources descriptions please see [SR info for grant writers](https://sharedresources.fredhutch.org/grant-writers#cf-922).

## Long Description

The detailed description is a frequently changing document that contains some non-public information. Please email `SciComp` for the latest version of the document `Fred-Hutch-Computational-Resource-Description-for-Grant-Writers.docx`.

## Short Description

If you are space constrained in your grant application or only need to include a summary of the resources available, this short description may suffice.  

### Local Computing Resources

The `Gizmo` cluster is currently equipped with almost 600 compute nodes, 4000 cpu cores, more than 40 TB of main memory (RAM) and is connected to a fully redundant high performance storage system via 100G networking equipment. `Gizmo` can directly access a storage capacity of more than 3 PB and has dedicated high performance scratch spaces of 500TB with a maximum throughput of nearly 10GB/s. Data in scratch storage spaces is automatically removed after 10, 30 or 90 days of inactivity depending on location.

### Cloud Computing Resources 

Fred Hutch is currently using cloud computing resources from the 3 major infrastructure (IaaS) cloud service providers. The internal network has been extended into several secure Virtual Private Clouds (VPC). The private cloud networks are covered under Business Associates Agreement (BAA). This environment is fully audited and integrated with our Security Information and Event Management (SIEM) system.

### Data Storage Service and Network Connectivity  

The Fast File storage service provides a high performance Posix file system accessed via SMB and NFS protocols. A cloud-based mirror of this file system provides backup and disaster recovery capability.

The Economy Cloud storage service provides a secure object storage bucket for each investigator using AWS S3. The buckets can be used to store data as well as collaborate with external investigators.

Both systems are equipped with a recycle bin that protects against accidental deletion of files and currently allow for data restoration within 60 days after deletion.

## Information for citing in publications

Fred Hutch is using compute equipment that has been partially funded by an NIH [S10 instrumentation grant](https://orip.nih.gov/construction-and-instruments/s10-instrumentation-programs). If you use Fred Hutch computational resources in your publication, please cite: **"Fred Hutch Scientific Computing, NIH grants S10-OD-020069 and S10-OD-028685"**.

## Amazon Web Services 

Amazon offers the [AWS Cloud Credits for Research](https://aws.amazon.com/grants/) program, where you can apply for a grant to get AWS Credits that you can use on AWS Services.  For the *AWS Account Number* field in the application, please contact SciComp and we will give you the correct number to use in your grant application.  If you receive credits from AWS, you will need to contact SciComp to request an account in the Sandbox environment.