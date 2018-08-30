---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2018-08-29
---

The Hutch, through Center IT and Scientific Computing, support a number of options for storing your data.  These can be categorized as:

 - database storage
 - block storage
 - object storage
 - collaborative storage

The service you use to store your data will depend on the nature of the data and the anticipated use.  Provided here is a summary of the different options to provide a basic overview of what resources are available to researchers for data storage. For more detailed information on each of these topics summarized here including setup instructions and limitations, please refer to each of the articles in this section of the sidebar.  

## Database Storage Systems: REDCap, SQL and DB4Sci
There are several options available at the Fred Hutch for storing data in a database system.  These supported systems span a wide range of services to meet the various needs of Fred Hutch researchers.  These include REDCap (supported by Collaborative Data Services based in PHS), SQL (supported by Center IT) and DB4Sci (supported by SciComp, and provides access to four database types including Postgres, MariaDB, MongoDB, and Neo4j).  

## Block Storage: Home, Fast, Secure, Scratch

Block storage keeps your data on disks and allows access to your data using familiar tools you're used to: browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), Unix commands like `cat`, `cp`, `ls`, and `rm`, and most common Bioinformatic tools.  These storage systems are similar to the hard drive on your computer, just typically larger and faster.

There are multiple resources available to researchers that are Block storage including:
- _home_ for personal files
- _fast_ for shared data, including the majority of research data
- _secure_ for data with higher-level security needs
- Scratch for temporary, working copies of data, which can be easily reproduced or are backed up elsewhere

The particular location where data should be stored in Block storage depends on a variety of issues, which are discussed in more detail on this page.  

### Note: Scratch Temporary Storage

The scratch file system is a Block storage system that works differently than those systems intended for long term data storage.  It is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.

Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).  **Data on this platform is not backed up.**  This storage is _not_ appropriate for storing the primary or only copy of any data or data which cannot be easily re-generated (such as an intermediate file in a workflow).


## Object Storage: Economy

The _economy_ file store is a nearline object storage system like Amazon's S3 storage or Google's Cloud Storage.  Unlike your the hard drive on your personal computer or the other file storage systems described above, access to data on this system requires that you retrieve the data prior to using it, copying data from the economy store to your hard drive or one of the file storage systems described above.  Unlike the other systems, this storage requires special tools to access data. Storing data in _economy_ is well suited for low-cost, long-term storage of data such as those that require archiving for a period of time after studies are published, or those from which a working copy has been generated for use in ongoing analyses.  


## Collaboration Storage: Aspera, AWS S3

These storage systems have capabilities allowing you to share data with people outside the Hutch - with or without a Hutch ID.

### Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

### AWS S3
S3 (the Simple Storage Service) is an object store very much like the Economy file service- though this one provided by Amazon Web Services.  The storage here is organized much like the other systems, with a "PI bucket" for each investigator at the Hutch (a bucket can be compared to a directory on a traditional file system).  This service can be used to distribute data to individuals outside the Hutch.  
