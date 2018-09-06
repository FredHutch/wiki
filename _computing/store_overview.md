---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2018-09-06
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

Object Storage systems are not directly attached to your computer (via drive mapping, mount point or the Mac Finder) so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an Object Storage system. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than tradional file storage systems. Cloud Computing depends very much on Object Storage systems such as Amazon's AWS S3 or Google Cloud Storage. There are a number of features and benefits of object storage systems, such as better shareing of data and much better handling of meta data (e.g. annotations). At Fred Hutch we use object storage predominantly for very large files (e.g. BAM files) and as nearline storage (e.g. for archiving purposes). Please see the Object Storage Section in the side bar for more details. 

### Economy Cloud (S3) or Economy local (swift)

The Hutch supports 2 different object storage systems, one is based on Amazon S3 and the other one on Openstack Swift. Please see the side bar to decide which is better for you.

## Collaboration Storage Options

These storage systems have capabilities allowing you to share data with people outside the Hutch- with or without a HutchnetID.

### Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

### AWS S3

You can use the _Economy Cloud_ buckets created for each PI to collaborate with external research groups. In addion to the _Economy Cloud_ buckets SciComp maintains S3 transfer buckets for external institutions and sequencing centers. These buckets may not be encryted to increase interoperability. Please ask your PI to contact SciComp to enable the bucket of your PI for external collaboration or to enable a transfer bucket into which your sequencing center or other large scale data provider can drop large files.