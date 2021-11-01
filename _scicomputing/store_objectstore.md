---
title: Data Storage in AWS S3
primary_reviewers: jefftucker, dtenenba
---

Object storage systems are not directly attached to your computer via drive mapping, a mount point or the Mac Finder, so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an object storage system as if the files were stored in traditional file storage systems. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud Computing depends very much on object storage systems such as Amazon's AWS S3 or Google Cloud Storage.

## Object Storage PI Allocations
As the amount of research data grows, which can occur rapidly when new large scale data is generated, existing externally generated datasets are transferred into the `Fast` storage, OR if existing data is inadvertently duplicated.  When the space requirements become larger, it is recommended that researchers begin implementing a set of more active data management practices.  

> Note:  Currently it is recommended to use a combination of AWS S3, [*Scratch*](/scicomputing/store_scratch/) and [`Fast`](/scicomputing/store_posix/).  Please see our other storage pages for more information about what storage locations are best for what type of data and uses.  


AWS S3 is less expensive than [`Fast`](/scicomputing/store_posix/) and is suitable for large scale data sets that are not frequently accessed (i.e., ~monthly or less) but that require a relatively large amount of storage space.  For example, AWS S3 would be suitable for a set of large files such as fastq's or bam's that on a daily basis are not accessed, but when a new bioinformatic process is desired, a large "burst" of activity will be occurring that will need to interact with the data.  AWS S3 serves as an archive for these data, and typically compute processes do not directly access these files.


### Economy Local (Swift)

> NOTE:  Economy Local will no longer be available after June 2022.  It is recommended that you move your data from Economy Local (Swift) to Economy Cloud (S3).  All resources for using `Economy Local` have been moved to [here for archiving](/compdemos/Economy-storage/).

## Features & Benefits of Object Storage Systems

Some features and benefits of object storage systems include:

- if you need to transfer data from Hutch Campus to cloud the network throughput performance of Object Storage is 10x higher than file storage.

- greatly increased file listing performance, for example if you need to list 50000 files in a single directory file storage can take minutes to return the list but if you list an object storage bucket it can return millions of file names within seconds.

- it mostly uses the standard http/https protocol which makes it much easier to share data with collaborators all over the world than using a file server and complex VPN technology

- you can add additional and arbitrary attributes to each file. Why is this a benefit? Well, normally you just organize your files in folders but what if one file really belongs in multiple folders or projects or departments? Many users end up storing files in multiple different folders to keep relevant data together in one place. Object storage systems do away with folders all together, you just store all files in a single bucket and you can then tag it with many different attributes. These attributes or metadata are stored with the file as key=value pairs such as "cancer=breast" and "grant=P01-123456". This additional metadata makes it extremely easy to retrieve data for automated pipelines based on different criteria.

Given these benefits it is expected that Object Storage systems will become more common in the future, especially as datasets are getting larger and larger.  Today Fred Hutch offers access to two different Object Storage systems through the `Economy Local` service. We recommend these systems typically for large genomic data and imaging files that require computational pipelines for processing (e.g. large BAM files) as well as for archival of infrequently used data. Both options for AWS S3 storage are _encrypted at rest_ and are approved to store strictly confidential data such as PHI.

Access to AWS S3 storage is governed by Hutch Net ID (Active Directory) authentication and group membership in a security group called `lastname_f_grp` (e.g. `groudine_m_grp`). This is the same security group that governs access to `Fast` storage.

>Note: In the future Fred Hutch Shared Resources data delivery processes (e.g. through  HutchBase) will be modified to deliver data directly to AWS S3 and [*Scratch*](/scicomputing/store_scratch/) storage as opposed to [`Fast`](/scicomputing/store_posix/) as it happens today.

## Accessing AWS S3 Storage
You can access AWS S3 resources with [command line tools](/compdemos/aws-s3/) such as  `aws s3` or `rclone` or libraries such as or _boto3_ for _Python_ or _aws.s3_ for R.  As of March 2016, Center IT officially supports the use of [Mountain Duck and Cyberduck desktop clients](/compdemos/Mountain-CyberDuck/) on Windows or Mac to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing. 

An additional tool is [Motuz](http://motuz.fredhutch.org), a tool that facilitates the transfer of small or large data between Fred Hutch storage locations (such as `Scratch` and `Fast`) and cloud storage locations such as AWS S3 buckets among others.  You can find some basic how-to guidance to get started with Motuz in our [Resource Library](/compdemos/motuz/). 



### AWS S3

AWS S3 is a public based object storage service that uses Amazon Web Services Simple Storage Service (S3) to offer managed and secure (encrypted) AWS S3 buckets to Fred Hutch investigators.  While it is not accessible by non-Hutch investigators by default, you can contact `scicomp` to request access for external research groups.  AWS S3  is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.

Each PI may request a dedicated AWS account for their lab if they wish to use AWS S3 storage.  In the lab account, there will be two AWS S3 buckets by default; contact your PI to get the names of the buckets.  There is a private bucket and a public bucket.  In this context, *private* and *public* refer to the *maximum possible level* of access to a file in that bucket.  Files uploaded to the public bucket by default will still *NOT* be publicly accessible, however if desired it is possible to change the access to one or more files or folders to make them directly accessible to the public.  For example, if you published a paper and wish to make a public refernce dataset available to accompany that paper, that reference dataset would need to go into the public bucket and then you can contact SciComp for assitance in changing the access permissions.  In the private bucket, granting public access will be impossible and even if the security policy is somehow accidentally modified to grant public access to the private bucket, the access will *still* be blocked by additional guardrails at the account level.  If you are unsure which bucket to use, you should by default use the private bucket.  The data can later be moved if necessary.

In the event that you need to share a very large dataset (e.g. >5TB) with an external collaborator and the collaborator intends to store that dataset within their own institutions S3 bucket, please contact SciComp for assistance.  There are ways to copy data between S3 buckets far more quickly than would otherwise be possible with any of the methods described here, however these typically require coordination between the collaborator's IT department and the SciComp team.  This can also be done for receiving very large datasets from external S3 buckets as well.  It is very rare that this method of bulk-copying data between buckets is required, however it is available if the situation warrants it.  Typically, the setup for this will take up to 48 hours.  The transfer speeds depend on a number of factors, however this has been reliably and repeatedly measured at 30TB-40TB per hour for well over 1 million files.

#### How it Works

S3 (the Simple Storage Service) is an object store very much like the Economy file service, though provided by Amazon Web Services.  Storage resources in S3 are organized much like the other Fred Hutch Object and Block systems, with a "PI bucket" for each investigator at the Hutch which is analogous to the investigator directories available in the traditional file system. A specialized client (the AWS command line interface) is used to upload the data from local storage to S3 storage.

#### Backup and Security

Data on this service is not backed up in the traditional sense, but rather versioned: if a new version of a file is uploaded, the older version is saved in S3.  Similarly, if data is deleted, the versions aren't and can be retrieved for up to 60 days.  The Fred Hutch supported PI buckets in S3 are appropriate for storage of restricted data, including PHI.

#### Credentials and Permissions

Once you have [obtained S3 credentials](/scicomputing/access_credentials/), you can use them to transfer files from/to the PI S3 buckets. If you work in the lab of the PI Jane Doe, your lab's S3 bucket name will be `fh-pi-doe-j-eco` for the private bucket and `fh-pi-doe-j-eco-public` for the public bucket. Please substitute your lab's actual bucket name when using the examples in our Resource Library demos.

By default, everyone in the lab with an AWS username will have access to all data in all buckets, however the prefixes `readonly/` and `SR/` are typically restricted.  Data Managers and Admins have full permissions on all files in all buckets.  While this default setup works well for most labs, it is possible to create additional restrictions as well if necessary.  For example, if a lab needs to store confidential PHI data such as for a clinical trial and only a certain subset of users in the lab are authorized to access that data, a specific prefix can be created that restricts access to only those authorized users.  Please submit a helpdesk ticket for assistance in setting this up.

#### Scratch S3 bucket

Each PI account has an additional scratch S3 bucket, currently called `fh-pi-lastname-f-nextflow-scratch`.  While these have "nextflow" in the name, they are a general-purpose scratch bucket that can be used for temporary data storage while you are running any workflow or for any other temporary purpose.  In this bucket, you can create/use the folders "delete10/", "delete30/", or "delete60/" and these will automatically delete any data in them 10, 30, or 60 days (respectively) after that data is initially created.  If you use any other folder in that bucket, it will default to deletion after 60 days.  Please note that this data will be deleted after the appropriate number of days from when an object was *initially created* and *NOT* from the last time that object was accessed, so accessing objects in the scratch bucket periodically will *NOT* prevent their deletion at the scheduled time.  Objects in the scratch bucket are not backed up by S3, so any deletion of the objects there is permanent immediately after it occurs.  By default, all users have full permissions on all folders of the scratch bucket and any workflows run in your default compute environment will also have full permissions on any folders in the scratch bucket.  If you need a folder to be enabled to delete objects after a different number of days for any reason, e.g. a "delete13/" folder that deletes objects after precisely 13 days, then please submit a ticket to the helpdesk.

#### Sharing data with other collaborators

You can use the AWS S3 buckets created for each PI to collaborate with external research groups as well as other labs within Fred Hutch. There are several ways in which this can be enabled, and it is still possible to grant external collaborators access to specific prefixes on the private bucket as well as the public bucket depending on how their access is configured.  Contact SciComp for assistance in setting up this access.  There are several ways in which data can be shared depending on the need.

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


#### FAQ

> Why does the scratch bucket have the name "nextflow" in it?  Is it only for nextflow or can I use it for other things?

Unfortunately, it is impossible to rename an S3 bucket once created so when the initial compute environment was designed it was tested only against nextflow and the name has persisted.  In the future, we will be making a change to provide a new scratch bucket with a more generic name.  In the meantime, despite having "nextflow" in the name you can use the scratch bucket for any purpose you wish that is conducive to temporary data storage.

> I really need an additional S3 bucket created in my account for some reason.  Can I create one?

In most cases you will not need any additional buckets, but it is possible to have additional S3 buckets created in your lab account if you have a reasonable justification for those buckets.  You will not be able to create them yourself, so please submit a helpdesk ticket if you have this need.

> I need a bucket in a location other than us-west-2, can this be done?

Yes, the CLD team can create buckets in other regions if you have a need for this however in most cases this is not necessary.  If you have a specific need that would require buckets in other regions, please submit a ticket to the helpdesk.

> Is it possible to see who is using the data in my lab buckets?

Yes, all access to your S3 buckets will be logged to a centralized location however you will not be able to access this log data by default.  This includes all buckets in all regions of your account regardless of how those buckets got created, when they were created, or who created them, and it is impossible to disable this logging.  If you have a specific concern about access to your bucket, please submit a ticket to the CLD team.

> I accidentally deleted something in my scratch bucket.  Is it gone forever?

Yes, it is gone forever.  There is no way to recover that data.

> I accidentally deleted something in my public or private economy cloud bucket (or another bucket that has "eco" in the name).  Can I get this data back?

Yes, deleted data can be un-deleted for up to 60 days immediately following the time that the object was deleted.  Submit a helpdesk ticket immediately and we will be able to assist you with data recovery.

> I accidentally uploaded a file to the wrong path and it overwrote an existing file.  Can I get the original contents of the file back?

Yes, this is effectively the same scenario as if you had deleted the file instead of overwriting it.  Submit a ticket to the helpdesk immediately for assistance.

> I have a file in my S3 bucket that I need to permanently delete immediately instead of waiting 60 days.  Is this possible?

Yes, it is possible to permanently remove the backup copy of a file that was modified or deleted prior to the 60-day period.  This is typically only necessary for regulatory compliance and in general is extremely rare, however should it be necessary then please submit a ticket to the helpdesk and we can assist you with this.

> I already have extensive knowledge of S3 and have been working with it for years.  Do I really need to contact the helpdesk for everything?

It depends.  Certain restrictions exist in the account that cannot be overridden so you will not be able to delete an AWS S3 bucket, modify the resource policy, enable object locks or legal holds (unless this has been granted on your account; contact helpdesk for more info), adjust the object lifecycle policies, or enable an object or bucket ACL other than bucket-owner-full-control on any bucket except the public bucket.  Admins and Data Managers are able to recover non-current versions of objects, initiate Glacier retrieval requests, and submit S3 Batch jobs (depending on the circumstances, other guardrails may prevent you from running an S3 Batch job, especially if it involves invoking other AWS Service such as Lambda functions).  If you are certain that you know what you are doing, then you may proceed entirely at your own risk.

### How do I access my other AWS account resources?

Once you have working credentials, you can read more about [AWS Computing](/scicomputing/compute_cloud/) in our wiki page.  

## I have more questions

Please check out the [FAQ](/compdemos/cloud-faq/) for more information.
