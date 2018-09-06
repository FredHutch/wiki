---
title: Data Storage in Object Storage Systems
last_modified_at: 2018-09-06
---

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

## Object Storage: Economy File

Object Storage systems are not directly attached to your computer via drive mapping, a mount point or the Mac Finder, so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an Object Storage system as if the files were stored in traditional file storage systems. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud Computing depends very much on Object Storage systems such as Amazon's AWS S3 or Google Cloud Storage.


### Features & Benefits

There are a number of features and benefits of object storage systems, for example:

- if you need to transfer data from Hutch Campus to cloud the network throughput performance of Object Storage is 10x higher than file storage.

- greatly increased file listing performance, for example if you need to list 50000 files in a single directory file storage can take minutes to return the list but if you list an object storage bucket it can return millions of file names within seconds.

- it mostly uses the standard http/https protocol which makes it much easier to share data with collaborators all over the world than using a file server and complex VPN technology

- you can add additional and arbitrary attributes to each file. Why is this a benefit? Well, normally you just organize your files in folders but what if one file really belongs in multiple folders or projects or departments ? Many users end up storing files in multiple different folders to keep relevant data together in one place. Object storage systems do away with folders all together, you just store all files in a single bucket and you can then tag it with many different attributes. These attributes or metadata are stored with the file as key=value pairs such as "cancer=breast" and "grant=P01-123456". This additional metadata makes it extremely easy to retrieve data for automated pipelines based on different criteria.

Given these benefits it is expected that Object Storage systems will become more common in the future, especially as datasets are getting larger and larger.
Today Fred Hutch offers access to 2 different Object Storage systems through the _Economy File_ service. We recommend these systems typically for large genomic data and imaging files that require computational pipelines for processing (e.g. large BAM files) as well as for archival of infrequently used data. Both options for _Economy File_ are _encrypted at rest_ and are approved to store strictly confidential data such as PHI.

In the future Fred Hutch Shared Resources data delivery processes (e.g. through  HutchBase) will be modified to deliver data directly to _Economy File_ and Scratch File systems as opposed to Fast File as it happens today.

## Economy Local (Swift)

_Economy local_ is an object storage system based on Openstack Swift. It is largely compatible with AWS S3 and you can access it with command line tools such as `swc`, `swift`, `aws s3` or `rclone` or GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _swiftclient_ or _boto3_ for _Python_ or _aws.s3_ for R. _Economy Local_ is recommended for research groups who keep large amounts of data (>100TB) on Hutch campus and frequently use the Gizmo cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud.
In the near future Economy Local will be retrofitted to become a _Hybrid Storage_ solution. You will be able to access your data conveniently through a file access mount point such as /fh/economy/ in addition to the faster object storage access.



## Economy Cloud (S3)
> Note:  More information about using AWS S3 here at the Fred Hutch can be found on the [Collaborative Data Storage]({{ site.baseurl }}/computing/store_collaboration/) page.  

_Economy Cloud_ is a public cloud based object storage service that uses Amazon S3 to offer managed and secure (encrypted) AWS S3 buckets to Hutch investigators. You can access it with the `aws s3` or `rclone` command line tools or with GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _boto3_ for _Python_ or _aws.s3_ for R.
While it is not accesible by non-Hutch investigators by default, you can contact SciComp to allow access for external research groups. _Economy Cloud_ is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.
