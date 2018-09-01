---
title: Data Storage in Object Storage Systems
last_modified_at: 2018-07-19
---

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  


The _economy_ file store is a nearline object storage system like Amazon's S3 storage or Google's Cloud Storage.  Unlike your the hard drive on your personal computer or the other file storage systems, access to data on this system requires that you retrieve the data prior to using it, copying data from the economy store to your hard drive or one of the file storage systems.  Unlike the other systems, this storage requires special tools to access data.

This storage system is a good place for preserving data.  For example: if you've completed a project and no longer need to work with a set of files regularly (but have determined they need to be retained beyond the term of the project), moving those files to an object store for long term storage is ideal.  Should you need to go back to those files at a later date those can easily be pulled back to online storage (local disk or the other file stores above).  Advanced workflows are possible with this storage system as well.  

Economy file storage can be used to store sensitive or protected data including protected health information (PHI).  Data is encrypted both during transfer and when "at-rest" in the system.  The Hutch makes Economy file storage available to investigators in a similar way as block storage systems via an investigator directory in the system.
