---
title: Data Storage in Object Storage Systems
last_modified_at: 2018-06-07
---
<!-- what IS an object storage system?????-->

## Economy

The _economy_ file store is a nearline object storage system like Amazon's S3 storage or Google's Cloud Storage.  Unlike your the hard drive on your personal computer or the other file storage systems described above, access to data on this system requires that you retrieve the data prior to using it, copying data from the economy store to your hard drive or one of the file storage systems described above.  Unlike the other systems, this storage requires special tools to access data.

This storage system is a good place for preserving data.  For example: if you've completed a project and no longer need to work with a set of files, move those to the economy file store.  Should you need to go back to those files at a later date those can easily be pulled back to online storage (local disk or the other file stores above).  Advanced workflows are possible with this storage system- Scientific Computing can help you create those.

Economy file storage can be used to store sensitive data (dbGap) and protected health information (PHI).  Data is encrypted both during transfer and when "at-rest" in the system.  The Hutch funds the first 5 terabytes of storage for each investigator.  Above this threshold the investigator is charged $3 per terabyte per month.
