---
title: Scientific Computing Resource Overview for Grants and Publications
last_modified_at: 2018-09-16
---

# Description of computational resources for grant writers

This is a description of Scientific Computing resources. For Shared Resources descriptions please see [SR info for grant writers](https://sharedresources.fredhutch.org/grant-writers#cf-922).

## Long Description

The detailed description is a frequently changing document that contains some non-public information. Please email `SciComp` for the latest version of the document `Fred-Hutch-Computational-Resource-Description-for-Grant-Writers.docx`.

## Short Description

If you are space constrained in your grant application or only need to include a summary of the resources avilable, this short description may suffice.  

### Local Computing Resources

The `Gizmo` cluster is currently equipped with almost 600 compute nodes, 4000 cpu cores, more than 40 TB of main memory (RAM) and is connected to a fully redundant high performance storage system via 100G networking equipment. `Gizmo` can directly access a storage capacity of more than 3 PB and has dedicated high performance scratch spaces of 500TB with a maximum throughput of nearly 10GB/s. Data in scratch storage spaces is automatically removed after 10, 30 or 90 days of inactivity depending on location.

### Cloud Computing Resources 

Fred Hutch is currently using cloud computing resources from the 3 major infrastructure (IaaS) cloud service providers. The internal network has been extended into several secure Virtual Private Clouds (VPC). The private cloud networks are covered under Business Associates Agreement (BAA). This environment is fully audited and integrated with our Security Information and Event Management (SIEM) system.

The `Beagle` and `Koshu` clusters are configured identical to `Gizmo`, however they execute their jobs in the cloud. More than 2000 cloud based compute cores are available to all investigators and they can seamlessly use their pipelines on premise and in the cloud.

### Data Storage Service and Network Connectivity  

The Fast File storage service provides a high performance Posix file system accessed via SMB and NFS protocols. A cloud-based mirror of this file system provides backup and disaster recovery capability.  

The Economy File storage service is backed by two different technologies: 

- a high capacity object storage system that can scale to sizes > 50 Petabyte at low cost. The service is based on commodity storage hardware, open source cloud storage technology (Openstack Swift) and is commercially supported. The system is can be accessed via Swift or S3 protocols. Three replicas (copies) of the data are stored in three different buildings on campus providing high resiliency and data protection.

- the economy cloud service provides a secure object storage bucket for each investigator using AWS S3. The buckets can be used to store data as well as collaborate with external investigators.

Both systems are equipped with a recycle bin that protects against accidental deletion of files and currently allow for data restoration within 60 days after deletion.


## Information for citing in publications

Fred Hutch is using compute equipment that has been partially funded by an NIH [S10 instrumentation grant](https://orip.nih.gov/construction-and-instruments/s10-instrumentation-programs). If you use Fred Hutch computational resources in your publication, please cite: **"Fred Hutch Scientific Computing, NIH grant S10-OD-020069"**.
