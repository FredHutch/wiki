---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2018-06-21
---

Three main types of data storage systems exist at the Hutch.

## Database Storage Systems

### MyDB

_MyDB_ is a service supported by Scientific Computing (SciComp) that allows you to provision a dedicated database by logging into the [MyDB console](https://mydb.fredhutch.org/login) and choosing the kind of database.  Four databases are available: Postgres, MariaDB, MongoDB, and Neo4j.

There is currently no charge for this service.  MyDB should not be used for protected data.

## Block Storage

Block storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder, and most common Bioinformatic tools .  These storage systems are similar to the hard drive on your computer, just typically larger and faster.

### Home

The _home_ file server is your own personal file storage space at the FredHutch.  It is a default place for your Linux login files (profiles &c) as well as an appropriate place to store your own private information.

While you are allowed up to 100GB of storage in this home directory, it is not tailored for heavy use and won't accommodate large data sets- the 100GB limit cannot be extended.  Also, data in this file system cannot be shared with others.

There is no charge for this storage.

### Fast File

The _fast file_ service is a large high-performance system that holds the bulk of the scientific data at the FredHutch.  The data here is organized by investigator- each folder at the top level is named using the investigators last name and first initial: investigator "Sneezy Smith" would have a directory on fast called `smith_s`.

On SciComp supported Linux systems you will see this storage in the path `/fh/fast`.  Windows systems can access this via the UNC path `\\center.fhcrc.org\fh\fast` and OSX hosts using the path `smb://center.fhcrc.org/fh/fast`.  

This storage platform is appropriate for most scientific data- particularly large data sets.  There is no charge for the first 5TB of storage on this system: there is a $30 per-month charge for every terabyte above this.

### Secure File

The _Secure File_ system provides a higher-level of security controls than available on other services- the key difference is access auditing.  This is also organized by investigator.

Secure file is available via the path `/fh/fast/secure/researcher` on SciComp Linux systems, `\\center.fhcrc.org\fh\secure` on Windows hosts, and `smb://center.fhcrc.org` on OSX.

This storage platform can be used for storing PHI.  It must be noted, however, that many connected systems may not be appropriate for analysis of PHI data.  The first terabyte of data is provided by CIT with a charge of $50 per-terabyte for any amount above that.

### Scratch

The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.

Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).

**Data on this platform is not backed up.**  This storage is _not_ appropriate for storing the primary or only copy of any data.

Similar to the Fast File system above, the scratch file system is available on the path `/fh/scratch` on SciComp supported Linux systems, `\\center.fhcrc.org\fh\scratch` on Windows, and `smb://center.fhcrc.org/fh/scratch` on OSX.

There is no charge to the investigator for data stored here.

## Economy

The _economy_ file store is a nearline object storage system like Amazon's S3 storage or Google's Cloud Storage.  Unlike your the hard drive on your personal computer or the other file storage systems described above, access to data on this system requires that you retrieve the data prior to using it, copying data from the economy store to your hard drive or one of the file storage systems described above.  Unlike the other systems, this storage requires special tools to access data.

This storage system is a good place for preserving data.  For example: if you've completed a project and no longer need to work with a set of files, move those to the economy file store.  Should you need to go back to those files at a later date those can easily be pulled back to online storage (local disk or the other file stores above).  Advanced workflows are possible with this storage system- Scientific Computing can help you create those.

Economy file storage can be used to store sensitive data (dbGap) and protected health information (PHI).  Data is encrypted both during transfer and when "at-rest" in the system.  The Hutch funds the first 5 terabytes of storage for each investigator.  Above this threshold the investigator is charged $3 per terabyte per month.

## Collaboration Storage Options

These storage systems have capabilities allowing you to share data with people outside the Hutch- with or without a HutchnetID.

### Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outide the Hutch network.

> NOTE: space is limited. Because of this, data stored here is deleted after a short period of time making the Aspera inappropriate for primary storage.  Always keep the primary source on one of the other options above (fast, economy, etc.)

Visit [the Aspera information page](https://aspera.fhcrc.org/index.html) for more details and information on using this storage service.

> #FIXME: is this suitable for PHI? Restricted?

### AWS S3

> NOTE: this is a very new service and may be subject to frequent changes

S3 (the Simple Storage Service) is an object store very much like the Economy file service described above.  The storage here is organized much like the other systems, with a "PI directory" for each investigator at the Hutch.  This service can be used to distribute data to individuals outside the Hutch.  A specialized client (the AWS command line interface) is used to upload the data.  Once there, a temporary URL is created that has the necessary credentials embedded within and is then shared with those needing access.  A secure (HTTPS) connection is then used to download the data (via browser or other client like `wget` or `curl`).

This URL is temporary and set with a date after which the generated URL is no longer able to access the data.  It can be refreshed as needed.

Data here is not removed as with the Aspera.  However, while this storage is very robust, it is not backed up.  Thus it is possible for data to be lost to deletion or overwrites.

> #FIXME: is this suitable for PHI? Restricted?
