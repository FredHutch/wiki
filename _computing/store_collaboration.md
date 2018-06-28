---
title: Data Storage and Collaboration
last_modified_at: 2018-06-28
---

There are data storage systems that have capabilities allowing you to share data with people outside the Hutch- with or without a Hutch ID.

### Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

> NOTE: space is limited. Because of this, data stored here is deleted after a short period of time making the Aspera inappropriate for primary storage.  Always keep the primary source on one of the other options above (fast, economy, etc.)

Visit [the Aspera information page](https://aspera.fhcrc.org/index.html) for more details and information on using this storage service.

### AWS S3

> NOTE: this is a very new service and may be subject to frequent changes.  Additionally, while S3 storage can be used for many other purposes, only its capabilities for collaboration are discussed here.  Refer to the documentation on cloud computing for more information on using S3 in its other capacities.

S3 (the Simple Storage Service) is an object store very much like the Economy file service- though this one provided by Amazon Web Services.  The storage here is organized much like the other systems, with a "PI bucket" for each investigator at the Hutch (a bucket can be compared to a directory on a traditional file syste).  This service can be used to distribute data to individuals outside the Hutch.  A specialized client (the AWS command line interface) is used to upload the data.  Once there, a temporary URL is created that has the necessary credentials embedded within and is then shared with those needing access.  A secure (HTTPS) connection is then used to download the data (via browser or other client like `wget` or `curl`).

This URL is temporary and set with a date after which the generated URL is no longer able to access the data, though the data stored here is not removed as with the Aspera.  That temporary URL can be regenerated as necessary.

Data on this service is not backed up in the traditional sense, but rather versioned: if a new version of a file is uploaded, the older version is saved in S3.  Similarly, if data is deleted, the versions aren't and can be retrieved.

S3 is appropriate for storage of restricted data, including PHI.
