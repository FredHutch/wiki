---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2023-03-24
primary_reviewers: 
---

The Hutch provides many platforms for storing, using, moving, and sharing your data- relational databases, block-based network file storage, and cloud object datastores.  Each of these platforms have options as well- these options to address the diverse needs of modern biomedical and bioinformatic research.  The platform you use will depend on the nature of the data and how you plan to use it.

This article is an overview of the available storage platforms and options and provides some guidance for selecting the option best for your need. More detailed information- including setup instructions and limitations- can be found in the pages and articles linked in the sidebar.  There are multiple resources at the Fred Hutch to help you design and implement a data management plan for your research.  The Fred Hutch [Data Science Lab](https://hutchdatascience.org/) offers a [Data House Calls](https://hutchdatascience.org/datahousecalls/) service to get a consultation to discuss your data needs and how you might design a plan, and Scientific Computing can help you with the tools and resources you need to implement that plan (email `scicomp` for help).

For more guidance about how to think about Reserach Data Stewardship and designing a data storage strategy for your research, you can find the Data Science Lab's [data stewardship page](/datascience/stewardship/).

## Data Storage Types

### [Everyday Files and Documents](/scicomputing/store_onedrive/)

### [Relational Database Storage Systems: REDCap, SQL and MyDB](/scicomputing/store_databases/)

There are several options available at the Fred Hutch for storing data in a database system.  These supported systems span a wide range of services to meet the various needs of Fred Hutch researchers.  These include REDCap (supported by Collaborative Data Services based in PHS), MSSQL Server (supported by CIT Enterprise Application Services) and [MyDB](https://mydb.fredhutch.org/) (supported by SciComp providing access to four database engine types: Postgres, MariaDB (MySQL), MongoDB, and Neo4j).

### [File Storage: Storage in Home, Fast, Secure](/scicomputing/store_posix/)

File storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools. These storage systems are similar to the hard drive on your computer, just typically larger and faster.

### [Temporary Storage: Scratch](/scicomputing/store_scratch/)

The scratch file system is a file storage system that works differently than the systems intended for long term data storage. It is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.


### [Economy Storage: Object Storage](/scicomputing/store_objectstore/)

Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud computing depends very much on object storage systems such as Amazon's AWS S3. There are a number of features and benefits of object storage systems, such as better sharing of data and much better handling of meta data (e.g. annotations). At Fred Hutch we use object storage predominantly for very large files (e.g. BAM files) and for archiving purposes.

### [Collaborative Storage Options](/scicomputing/store_collaboration/)

These storage systems and transfer tools have capabilities allowing you to share data with people outside the Hutch, with or without a HutchNet ID.  These include Motuz and Aspera transfer tools and OneDrive for data storage, as well as information about using AWS S3 for collaboration.

## Security Capabilities

> these are the security capabilities of storage

|  Feature 	                | Secure File	| Fast File | Economy Cloud |  Scratch  	|  OneDrive 	|
|:-	                        |:-:	        |:-:	      |:-:	          |:-:	        |:-:	        |
|  Encryption at Rest 	    |        Yes  |      Yes  |          Yes	|        Yes	|        Yes	|
|  Encryption in Transit    |        Yes* |      Yes* |          Yes	|        Yes* |        Yes	|
|  Access auditing 	        |        Yes	|      Yes  |    	     Yes  |         No	|        Yes	|
|  Approved for PHI by ISO 	|        Yes  |      No   |          Yes  |         No	|        Yes	|

*) Transit encryption is only available when the data is accessed by SMB mounts- Windows and newer OSX systems use SMB. The HPC systems (e.g. rhino, gizmo) use NFS which is not encrypted.  However, this traffic is confined to a secure data center.

At this time both _fast_ and _secure_ storage platforms have the same capabilities for encryption, access auditing, and backups.  _Secure_ has a more capable mechanism for managing access permissions that allows more flexibility in assigning those permissions.  Contact scicomp if you think you may need these capabilities.

## Allocations and Costs

Storage Resource | Costs (per TB/month)\*  | Backup Location/Duration | Best Use
--- | --- | --- | --- | ---
Home | Free to 100GB limit |  7 days of Snapshots, Daily backups, Off Site copy | Only use this location for software and settings specific to a user, not for data, not shared to others. HARD LIMIT, cannot be expanded
Fast | $$$ beyond 1TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | Large instrument files and data sets that need high performance access to computing resources, Unix file permissions, but not temporary data (such as intermediate files)
Economy Cloud | $ beyond 100TB per PI |  Multi-datacenter replication, 90 day undelete (Trashcan) with request to `helpdesk` | Best for archiving large data sets, or primary storage of large files.  Good for PHI or other data that requires encryption and auditing. *Requires Desktop Client to access, see [Object Storage page.](/scicomputing/store_objectstore/)*
Scratch | Free | Not backed up | Temporary files, such as those intermediate to a final result that only need to persist during a job, and secondary copies of files used in analysis but with a primary copy on more durable storage  *Appropriate use  can significantly reduce data storage costs- see the [Scratch Storage](/scicomputing/store_scratch/) page.*
OneDrive | None | Recycle Bin available | Documents, spreadsheets, and other similar administrative files

Additional details for other CIT file services such as `Secure File` (aka J or R drive) features are available on [Centernet](https://centernet.fredhutch.org/cn/u/center-it/services/storedataprotect.html).

For expenses charged to your group for data storage in these systems, please see the [storage usage dashboard](https://grafana.fredhutch.org/d/dy5I3SIMk/data-core-storage-usage/). If you are interested in a breakdown of your storage ulitization by folder you can get these details at [Storage HotSpots](https://storage-hotspots.fhcrc.org/). Please select your PI as owner. You can also export all data as CSV. (Please note: for performance reasons only folders > 1GB without subfolders are shown here) . For pricing information please check [this page](https://centernet.fredhutch.org/cn/u/shared-resources/data-resource.html) on CenterNet. 

## Data Storage Guidance

Most Fred Hutch based researchers using large scale biomedical data sets initially store their data using Fast storage alongside their smaller scale laboratory data. This provides direct, rapid access to files both manually (e.g., via mapping a drive to a workstation) and to local computing resources (via our HPC cluster, see below). However, a strategy for where, when and for how long to store what size data is important to create to ensure that data access by researcher or compute resource, transfer and archiving are not unnecessarily complicated thus hindering the research process.

Depending on the type of data used by a research group, different combinations of data storage options may be appropriate. Assessing the strengths, mode of access, and interactivity with computing resources of each of these types of data storage options alongside an assessment of the types of data a research group use and the type of interactions with those data is becoming more important for researchers. This assessment also is becoming more important to repeat over time as data storage and connectivity infrastructure changes and as the particular data types and interactions of research groups evolve.

### Storing protected health information (PHI) data

Please check with your supervisor before you store any [PHI data](https://cphs.berkeley.edu/hipaa/hipaa18.html) on Fred Hutch systems as your data set may have compliance requirements that would not allow you to store the data on any of the existing systems. In almost all cases you should be working with de-identified data which can be stored on any of the above storage systems. If you must store PHI data, you may only use systems that are approved by [ISO](https://centernet.fredhutch.org/cn/u/center-it/iso.html) and support:

1. Encryption at rest (e.g. on the hard drive)
2. Encryption in transit (e.g. through the network)
3. Access auditing (a systems log who accessed a file what time).

The Fred Hutch IRB's [information on HIPAA compliance](https://centernet.fredhutch.org/cn/u/irb/hipaa-compliance.html) can be found at the linked CenterNet pages.

  - For consulting about how to handle large amounts of externally or internally generated data email `scicomp`.
  - For additional assistance regarding data generated via the Fred Hutch Genomics Shared Resource, email `bioinformatics`.
  - For consultation about data management and strategies, schedule a [Data House Call](https://hutchdatascience.org/datahousecalls/) with the Data Science Lab. 
