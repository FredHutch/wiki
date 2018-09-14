---
title: Scientific Computing resources for Grants and Publications
last_modified_at: 2018-09-14
---

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  


# Description of computational resources for grant writers

This is a description of Scientific Computing resources. For Shared Resources descriptions please see https://sharedresources.fredhutch.org/grant-writers 

## Long description

The detailed desciption is a document that is frequently changed and contains some non-public information. Please contact SciComp for the latest version of this document.

## Short description

If you are space constrained in your grant application, the short description may suffice:  

### Local Computing Resources

The 'Gizmo' cluster is currently equipped with almost 600 compute nodes / 4000 cpu cores and more than 40 TB of main memory (RAM) and connected to a fully redundant  high performance storage system via 100G networking equipment. Gizmo can directly access a storage capacity of more than 3 Petabyte and has dedicated high performance scratch space of 500TB with a maximum throughput of nearly 10GB/s.

### Cloud Computing Resources 

Fred Hutch is currently using cloud computing resources from the 3 major infrastructure (IaaS) cloud service providers. The internal network has been extended into several secure Virtual Private Clouds (VPC). The private cloud network are covered under Business Associates Agreement (BAA). This environment is fully audited and integrated with our Security Information and Event Management (SIEM) system.
The Beagle and Kushu clusters are configured idential to Gizmo, however they exeute their jobs in the cloud. More than 2000 cloud based compute cores are available to all investigators.


### Data Storage Service and Network connectivity  

The Fast File storage service provides a high performance Posix file system that canvia SMB and NFS protocols. A cloud-based mirror of this file system  provides backup and disaster recovery capability.  

The Economy File storage service offers is backed by 2 different technologies: 

- a high capacity object storage system that can scale to sizes > 50 Petabyte at low cost. The Service is based on commodity storage hardware, open source cloud storage technology (Openstack Swift) and is commercially supported. The system is can be accessed via Swift or S3 protocols. 3 replicas (copies) of the data are stored in 3 different buildings on campus providing high resiliency and data protection.

- the economy cloud service provides a secure object storage bucket for each investigator using AWS S3. The buckets can be used to store data as well as collaborte with external investigators.

both systems are equipped with a recycle bin that protects against accidental deletion of files and currently allows for data restoration within 60 days after deletion.


# Information for citing in publications

Fred Hutch is using compute equipment that has been partially by an S10 instrumentation grant. In your publication that uses Fred Hutch computational resources, please ensure that you are citing it your publications:

Please cite **"Fred Hutch Scientific Computing, grant S10OD020069"**

