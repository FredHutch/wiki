---
title: Data Storage in Object Storage Systems (Economy)
primary_reviewers: dirkpetersen, dtenenba
---

FIXME KATE: Economy cloud links to CompDemo on economy cloud
FIXME JEFF: Add FAQ for S3 that’s specific to Economy Cloud

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

NOTE:  Economy Local will no longer be available after June 2022.  It is recommended that you move your data from Economy Local (Swift) to Economy Cloud (S3)

`Economy Local` is an object storage system based on Openstack Swift. `Economy Local` is recommended for research groups who keep large amounts of data (>100TB) on the Fred Hutch campus and frequently use the `Gizmo` cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud storage resources.

`Economy Local` is well suited to store petabytes of data at low cost and a high level of data protection. Economy File does not require tape backup as data is replicated to multiple sites. If you accidentally delete data it will be held in a "Trash can" for multiple months during which you have read-only access to the deleted data. Economy File is approved for PHI / PII data.  It is a suitable location to store genomic data  including those governed by the NIH Genomic Data Sharing policies or originating from public repositories while in use locally. Please the [demo section for examples of Economy Local](/compdemos/Economy-storage/)


### Economy Cloud (S3)

`Economy Cloud` is a public cloud based object storage service that uses Amazon Web Services Simple Storage Service (S3) to offer managed and secure (encrypted) AWS S3 buckets to Fred Hutch investigators.  While it is not accessible by non-Hutch investigators by default, you can contact `scicomp` to request access for external research groups.  `Economy Cloud`  is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.

Each PI may request a dedicated AWS account for their lab if they wish to use `Economy Cloud` storage.  In the lab account, there will be two `Economy Cloud` buckets by default; contact your PI to get the names of the buckets.  There is a private bucket and a public bucket.  In this context, *private* and *public* refer to the *maximum possible level* of access to a file in that bucket.  Files uploaded to the public bucket by default will still *NOT* be publicly accessible, however if desired it is possible to change the access to one or more files or folders to make them directly accessible to the public.  For example, if you published a paper and wish to make a public refernce dataset available to accompany that paper, that reference dataset would need to go into the public bucket and then you can contact SciComp for assitance in changing the access permissions.  In the private bucket, granting public access will be impossible and even if the security policy is somehow accidentally modified to grant public access to the private bucket, the access will *still* be blocked by additional guardrails at the account level.

In the event that you need to share a very large dataset (e.g. >5TB) with an external collaborator and the collaborator intends to store that dataset within their own institutions S3 bucket, please contact SciComp for assistance.  There are ways to copy data between S3 buckets far more quickly than would otherwise be possible with any of the methods described here, however these typically require coordination between the collaborator's IT department and the SciComp team.  This can also be done for receiving very large datasets from external S3 buckets as well.  It is very rare that this method of bulk-copying data between buckets is required, however it is available if the situation warrants it.  Typically, the setup for this will take up to 48 hours.  The transfer speeds depend on a number of factors, however this has been reliably and repeatedly measured at 30TB-40TB per hour for well over 1 million files.

#### How it Works

S3 (the Simple Storage Service) is an object store very much like the Economy file service, though provided by Amazon Web Services.  Storage resources in S3 are organized much like the other Fred Hutch Object and Block systems, with a "PI bucket" for each investigator at the Hutch which is analogous to the investigator directories available in the traditional file system. A specialized client (the AWS command line interface) is used to upload the data from local storage to S3 storage.

#### Backup and Security

Data on this service is not backed up in the traditional sense, but rather versioned: if a new version of a file is uploaded, the older version is saved in S3.  Similarly, if data is deleted, the versions aren't and can be retrieved for up to 60 days.  The Fred Hutch supported PI buckets in S3 are appropriate for storage of restricted data, including PHI.

#### Credentials and Permissions

Once you have [obtained S3 credentials](/scicomputing/access_credentials/), you can use them to transfer files from/to the PI S3 buckets. If you work in the lab of the PI Jane Doe, your lab's S3 bucket name will be `fh-pi-doe-j-eco` for the private bucket and `fh-pi-doe-j-eco-public` for the public bucket. Please substitute your lab's actual bucket name when using the examples in our Resource Library demos.

By default, everyone in the lab with an AWS username will have access to all data in all buckets, however the prefixes `readonly/` and `SR/` are typically restricted.  Data Managers and Admins have full permissions on all files in all buckets.  While this default setup works well for most labs, it is possible to create additional restrictions as well if necessary.  For example, if a lab needs to store confidential PHI data such as for a clinical trial and only a certain subset of users in the lab are authorized to access that data, a specific prefix can be created that restricts access to only those authorized users.  Please contact SciComp for assistance in setting this up.

#### Sharing data with other collaborators

You can use the `Economy Cloud` S3 buckets created for each PI to collaborate with external research groups as well as other labs within Fred Hutch. There are several ways in which this can be enabled, and it is still possible to grant external collaborators access to specific prefixes on the private bucket as well as the public bucket depending on how their access is configured.  Contact SciComp for assistance in setting up this access.  There are several ways in which data can be shared depending on the need.

##### Direct access to the bucket

Both internal and external collaborators can be given direct access to specific prefixes or even specific objects in your buckets.  This access can be read-only, write-only, or read/write.  Delete permissions are not granted by default, however this can be added if required.  External collaborators typically are only granted credentials to access the bucket via the CLI, however they can be given console access if the circumstances require it.  This is by far the most common way that data is shared.

When requesting access for a collaborator, please provide the following information:

For external collaborators (people who do *NOT* have a HutchnetID):

1. The collaborator's full name.
1. The collaborator's email address.
1. The collaborators contact email address if this is different than their email address (this is sometimes the case for external companies that deliver data regularly).
1. A list of buckets and prefixes which you wish to share with the collaborator and whether they need access for read, write, or both.
1. An expiration date for when you estimate that the collaboration will complete.  See note below about how expiration dates work.

For internal collaborators (people who *DO* have a HutchnetID):

1. The collaborator's name and HutchnetID.
1. A list of buckets and prefixes which you wish to share with the collaborator and whether they need access for read, write, or both.

NOTE: Expiration dates for external collaborators are NOT a hard deadline by which their account will be automatically removed.  On or near the expiration date, someone will contact you to indicate that your collaborator's access is about to expire and ask if they should continue to have access.  If so, we can extend the expiration date accordingly.  If they do not *or* if we do not receive a reply, then their account will be removed.  However, if an external collaborator no longer requires access to your `Economy Cloud` buckets *before* their expiration date, please email SciComp so that we can remove their access.  The default expiration date is one year.

##### Pre-signed URLs

A pre-signed URL is a temporary URL that is created for a single file and has the necessary credentials embedded within, which can then shared with those needing access.  Files shared with Pre-signed URLs will need to be placed in the public bucket.  A secure (HTTPS) connection is then used to download the data (via browser or other client like `wget` or `curl`). This URL is temporary and set with a date after which the generated URL is no longer able to access the data, though the data stored here is not removed as with the Aspera.  That temporary URL can be regenerated as necessary.  This is a good solution for an external collaborator who needs a one-time share of a relatively small number of files.  SciComp can assist with creating pre-signed URLs, however both Admins and Data Managers are also able to create them within their own AWS account.

##### Public Access

Only SciComp is able to make an object publicly available.  Objects in the public bucket can be shared several ways:

- public access restricted via IP address range.  This is not a guarantee since it is possible (though difficult) for an unauthorized individual to spoof an IP address to gain access to this data.  For this reason, this access should still be considered "public" even though it is restricted by IP address.  
- Unrestricted public access.  This will enable anyone in the world to download a specific object or any object within a given prefix without credentials as long as they know the URL.  It is not possible for them to list all the files available publicly, however.  If you wish to share a large number of files in this manner, the recommended approach is to create a single text file that contains a list of hyperlinks to the URLs for all of the objects you wish to share and then include the URL of that text file in whatever means you use to advertise your dataset.  There are other ways to accomplish this as well; contact SciComp for assistance.

NOTE:  Public access is read-only.  Write access will *NEVER* be granted to the general public.

##### Direct access via collaborator's AWS account

If an external collaborator has an AWS account available to them through their institution, it is possible to set up sharing so that they can access your data by using their own AWS user credentials.  This typically requires some coordination between SciComp and the external collaborator's IT department and may not be suitable for all cases even if the collaborator *does* have access to their own AWS account.  The main advantages of this method are improved security and accessiblity:

- It is not necessary to send credentials to an external individual so there is no chance of credentials being intercepted or otherwise acquired by unauthorized individuals.
- If the external collaborator is offboarded from their organization, their access will typically be terminated automatically.
- The collaborator will be able to use their own familiar tools and/or methods to upload or download data.

#### User Demos

We have a number of demos in our Resource Library related to how to interact with Economy Storage, specifically via [a desktop client](/compdemos/Mountain-CyberDuck/), [via the AWS CLI](/compdemos/aws/#aws-command-line-interface-cli), [via R](/compdemos/aws/#aws-via-r), or [via Python](/compdemos/aws/#aws-via-python) and various methods for [Economy Local](/compdemos/Economy-storage/)


>Note: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  
