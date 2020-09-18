---
title: Data Storage in Object Storage Systems (Economy)
primary_reviewers: dirkpetersen, dtenenba
---
Object storage systems are not directly attached to your computer via drive mapping, a mount point or the Mac Finder, so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an object storage system as if the files were stored in traditional file storage systems. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud Computing depends very much on object storage systems such as Amazon's AWS S3 or Google Cloud Storage.

### Object Storage PI Allocations
As the amount of research data grows, which can occur rapidly when new large scale data is generated, existing externally generated datasets are transferred into the `Fast` storage, OR if existing data is inadvertently duplicated.  When the space requirements become larger, it is recommended that researchers begin implementing a set of more active data management practices.  

>Note:  Currently it is recommended to use a combination of `Economy`, [*Scratch*](/scicomputing/store_scratch/) and [`Fast`](/scicomputing/store_posix/).  Please see our other storage pages for more information about what storage locations are best for what type of data and uses.  


`Economy` is less expensive than [`Fast`](/scicomputing/store_posix/) and is suitable for large scale data sets that are not frequently accessed (i.e., ~monthly or less) but that require a relatively large amount of storage space.  For example, `Economy` would be suitable for a set of large files such as fastq's or bam's that on a daily basis are not accessed, but when a new bioinformatic process is desired, a large "burst" of activity will be occurring that will need to interact with the data.  `Economy` serves as an archive for these data, and typically compute processes do not directly access these files.

## Features & Benefits of Object Storage Systems

Some features and benefits of object storage systems include:

- if you need to transfer data from Hutch Campus to cloud the network throughput performance of Object Storage is 10x higher than file storage.

- greatly increased file listing performance, for example if you need to list 50000 files in a single directory file storage can take minutes to return the list but if you list an object storage bucket it can return millions of file names within seconds.

- it mostly uses the standard http/https protocol which makes it much easier to share data with collaborators all over the world than using a file server and complex VPN technology

- you can add additional and arbitrary attributes to each file. Why is this a benefit? Well, normally you just organize your files in folders but what if one file really belongs in multiple folders or projects or departments? Many users end up storing files in multiple different folders to keep relevant data together in one place. Object storage systems do away with folders all together, you just store all files in a single bucket and you can then tag it with many different attributes. These attributes or metadata are stored with the file as key=value pairs such as "cancer=breast" and "grant=P01-123456". This additional metadata makes it extremely easy to retrieve data for automated pipelines based on different criteria.

Given these benefits it is expected that Object Storage systems will become more common in the future, especially as datasets are getting larger and larger.  Today Fred Hutch offers access to two different Object Storage systems through the `Economy Local` service. We recommend these systems typically for large genomic data and imaging files that require computational pipelines for processing (e.g. large BAM files) as well as for archival of infrequently used data. Both options for `Economy` storage are _encrypted at rest_ and are approved to store strictly confidential data such as PHI.

Access to `Economy` storage is governed by Hutch Net ID (Active Directory) authentication and group membership in a security group called `lastname_f_grp` (e.g. `groudine_m_grp`). This is the same security group that governs access to `Fast` storage.

>Note: In the future Fred Hutch Shared Resources data delivery processes (e.g. through  HutchBase) will be modified to deliver data directly to `Economy` and [*Scratch*](/scicomputing/store_scratch/) storage as opposed to [`Fast`](/scicomputing/store_posix/) as it happens today.

## Accessing Economy Storage
You can access `Economy Local` or `Economy Cloud` resources with [command line tools](/compdemos/Economy-storage/) such as `swc`, `swift`, `aws s3` or `rclone` or libraries such as _swiftclient_ or _boto3_ for _Python_ or _aws.s3_ for R.  As of March 2016, Center IT officially supports the use of [Mountain Duck and Cyberduck desktop clients](/compdemos/Mountain-CyberDuck/) on Windows or Mac to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing. It is also possible to use [Synology to backup data to _Economy Local_.](/compdemos/synology/)

### Economy Local (Swift)

`Economy Local` is an object storage system based on Openstack Swift. `Economy Local` is recommended for research groups who keep large amounts of data (>100TB) on the Fred Hutch campus and frequently use the `Gizmo` cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud storage resources.

`Economy Local` is well suited to store petabytes of data at low cost and a high level of data protection. Economy File does not require tape backup as data is replicated to multiple sites. If you accidentally delete data it will be held in a "Trash can" for multiple months during which you have read-only access to the deleted data. Economy File is approved for PHI / PII data.  It is a suitable location to store genomic data  including those governed by the NIH Genomic Data Sharing policies or originating from public repositories while in use locally. Please the [demo section for examples of Economy Local](/compdemos/Economy-storage/)


### Economy Cloud (S3)

`Economy Cloud` is a public cloud based object storage service that uses Amazon Web Services Simple Storage Service (S3) to offer managed and secure (encrypted) AWS S3 buckets to Fred Hutch investigators.  While it is not accessible by non-Hutch investigators by default, you can contact `scicomp` to request access for external research groups.`Economy Cloud`  is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.

You can use the `Economy Cloud` S3 buckets created for each PI to collaborate with external research groups. In addition to the `Economy Cloud` S3 buckets SciComp maintains S3 transfer buckets for external institutions and sequencing centers. These buckets may not be encrypted to increase interoperability. Please ask your PI to contact SciComp to enable the bucket of your PI for external collaboration or to enable a transfer bucket into which your sequencing center or other large scale data provider can drop large files.

#### How it Works

S3 (the Simple Storage Service) is an object store very much like the Economy file service, though provided by Amazon Web Services.  Storage resources in S3 are organized much like the other Fred Hutch Object and Block systems, with a "PI bucket" for each investigator at the Hutch which is analogous to the investigator directories available in the traditional file system. A specialized client (the AWS command line interface) is used to upload the data from local storage to S3 storage.  Once there, a temporary URL is created that has the necessary credentials embedded within and is then shared with those needing access.  A secure (HTTPS) connection is then used to download the data (via browser or other client like `wget` or `curl`). This URL is temporary and set with a date after which the generated URL is no longer able to access the data, though the data stored here is not removed as with the Aspera.  That temporary URL can be regenerated as necessary.

#### Backup and Security
Data on this service is not backed up in the traditional sense, but rather versioned: if a new version of a file is uploaded, the older version is saved in S3.  Similarly, if data is deleted, the versions aren't and can be retrieved.  The Fred Hutch supported PI buckets in S3 are appropriate for storage of restricted data, including PHI.

#### Credentials and Permissions
Once you have [obtained S3 credentials](/scicomputing/access_credentials/), you can use them to transfer files from/to the PI S3 buckets. If you work in the lab of the PI Jane Doe, your lab's S3 bucket name will be `fh-pi-doe-j`. Please substitute your lab's actual bucket name when using the examples in our Resource Library demos.  

#### User Demos
We have a number of demos in our Resource Library related to how to interact with Economy Storage, specifically via [a desktop client](/compdemos/Mountain-CyberDuck/), [via the AWS CLI](/compdemos/aws/#aws-command-line-interface-cli), [via R](/compdemos/aws/#aws-via-r), or [via Python](/compdemos/aws/#aws-via-python) and various methods for [Economy Local](/compdemos/Economy-storage/)


>Note: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  
