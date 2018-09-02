---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2018-09-01
---

The Hutch supports a number of options for storing your data. These can be categorized as:

 - database storage
 - file storage
 - object storage
 - collaborative storage

The service you use to store your data will depend on the nature of the data and the anticipated use. Provided here is a summary of the different options to provide a basic overview of what resources are available to researchers for data storage. For more detailed information on each of these topics summarized here including setup instructions and limitations, please refer to each of the articles in this section of the sidebar.  

## Database Storage Systems: REDCap, SQL and DB4Sci

There are several options available at the Fred Hutch for storing data in a database system.  These supported systems span a wide range of services to meet the various needs of Fred Hutch researchers.  These include REDCap (supported by Collaborative Data Services based in PHS), MSSQL Server (supported by CIT Enterprise Application Services) and [DB4Sci](https://mydb.fredhutch.org/) (aka MyDB, supported by SciComp, and provides access to four database engine types including Postgres, MariaDB (MySQL), MongoDB, and Neo4j).  


## file Storage: Home, Fast, Secure, Scratch

File storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools. These storage systems are similar to the hard drive on your computer, just typically larger and faster.

There are multiple resources available to researchers that are file storage including:

- _Home_ for personal settings and some data files
- _Fast File_ for shared data, the default storage for most research data
- _Secure File_ for strictly confidential data such as PHI


### Scratch (Temporary) Storage

The [scratch file system](store_scratch) is a file storage system that works differently than the systems intended for long term data storage. It is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.

Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).  **Data on this platform is not backed up.**  This storage is _not_ appropriate for storing the primary or only copy of any data.


## Object Storage: Economy File

Object Storage systems are not directly attached to your computer (via drive mapping, mount point or the Mac Finder) so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an Object Storage system. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than tradional file storage systems. Cloud Computing depends very much on Object Storage systems such as Amazon's AWS S3 or Google Cloud Storage. There are a number of features and benefits of object storage systems, for example:

- if you need to transfer data from Hutch Campus to cloud the network throughput performance of Object Storage is 10x higher than file storage.

- greatly increased file listing performance, for example if you need to list 50000 files in a single directory file storage can take minutes to return the list but if you list an object storage bucket it can return millions of file names within seconds.

- it mostly uses the standard http/https protocol which makes it much easier to share data with collaborators all over the world than using a file server and complex VPN technology

- you can add addional and arbitrary attributes to each file. Why is this a benefit? Well, normally you just organize your files in folders but what if one file really belongs in multiple folders or projects or departments ? Many users end up storing files in multiple different folders to keep relevant data together in one place. Object storage systems do away with folders alltogether, you just store all files in a single bucket and you can then tag it with many different attributes. These attributes or metadata are stored with the file as key=value pairs such as "cancer=breast" and "grant=P01-123456". This addional metadata makes it extremely easy to retrieve data for automated pipelines based on different criteria.

Given these benefits it is expected that Object Storage systems will become more common in the future, especially as datasets are getting larger and larger.
Today Fred Hutch offers access to 2 different Object Storage systems through the _Economy File_ service. We recommend these systems typically for large genomic data and imaging files that require computational pipelines for processing (e.g. large BAM files) as well as for archival of infrequently used data. Both options for _Economy File_ are _encrypted at rest_ and are approved to store strictly confidential data such as PHI.
In the future Fred Hutch Shared Resources data deliverty processes (e.g. through  HutchBase) will be modified to deliver data directly to _Economy File_ and Scratch File systems as opposed to Fast File as it happens today.


### Economy Cloud (S3)

_Economy Cloud_ is a public cloud based object storage service that uses Amazon S3 to offer managed and secure (encrypted) AWS S3 buckets to Hutch investigators. You can access it with the `aws s3` or `rclone` command line tools or with GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _boto3_ for _Python_ or _aws.s3_ for R.
While it is not accesible by non-Hutch investigators by default, you can contact SciComp to allow access for external research groups. _Economy Cloud_ is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.

### Economy Local (Swift)

_Economy local_ is an object storage system based on Openstack Swift. It is largely compatible with AWS S3 and you can access it with command line tools such as `swc`, `swift`, `aws s3` or `rclone` or GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _swiftclient_ or _boto3_ for _Python_ or _aws.s3_ for R. _Economy Local_ is recommended for research groups who keep large amounts of data (>100TB) on Hutch campus and frequently use the Gizmo cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud.
In the near future Economy Local will be retrofitted to become a _Hybrid Storage_ solution. You will be able to access your data convienently through a file access mount point such as /fh/economy/ in addition to the faster object storage access.

## Collaboration Storage Options

These storage systems have capabilities allowing you to share data with people outside the Hutch- with or without a HutchnetID.

### Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

### AWS S3

You can use the _Economy Cloud_ buckets created for each PI to collaborate with external research groups. In addion to the _Economy Cloud_ buckets SciComp maintains S3 transfer buckets for external institutions and sequencing centers. These buckets may not be encryted to increase interoperability. Please ask your PI to contact SciComp to enable the bucket of your PI for external collaboration or to enable a transfer bucket into which your sequencing center or other large scale data provider can drop large files.