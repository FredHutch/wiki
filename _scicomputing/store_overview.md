---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2019-04-01
main_author: Dirk Petersen
primary_reviewers:
---

The Hutch supports a number of options for storing your data, specifically Database storage, File storage, Scratch storage, Object storage and Collaborative storage options.  The storage you use to store your data will depend on the nature of the data and the anticipated use. Here we provide a basic overview of what resources are available to researchers for data storage. For more detailed information on each of these topics summarized here including setup instructions and limitations, please refer to each of the articles in this section of the sidebar.  

## Data Storage Guidance

Most Fred Hutch based researchers using large scale biomedical data sets initially store their data using Fast storage alongside their smaller scale laboratory data. This provides direct, rapid access to files both manually (e.g., via mapping a drive to a workstation) and to local computing resources (via our HPC cluster, see below). However, a strategy for where, when and for how long to store what size data is important to create to ensure that data access by researcher or compute resource, transfer and archiving are not unnecessarily complicated thus hindering the research process.

Depending on the type of data used by a research group, different combinations of data storage options may be appropriate. Assessing the strengths, mode of access, and interactivity with computing resources of each of these types of data storage options alongside an assessment of the types of data a research group use and the type of interactions with those data is becoming more important for researchers. This assessment also is becoming more important to repeat over time as data storage and connectivity infrastructure changes and as the particular data types and interactions of research groups evolve.


## Storing protected health information (PHI) data

Please check with your supervisor before you store any [PHI data](https://cphs.berkeley.edu/hipaa/hipaa18.html) on Fred Hutch systems as your data set may have compliance requirements that would not allow you to store the data on any of the existing systems. In almost all cases you should be working with de-identified data which can be stored on any of the above storage systems. If you require to store PHI data you should only use systems that support 1. Encryption at rest (e.g. on the hard drive), 2. Encryption in transit (e.g. through the network) and 3. access auditing (a systems log who accessed a file what time). Also, PHI can only be stored on systems that are approved by [ISO](https://centernet.fredhutch.org/cn/u/center-it/iso.html).

This is an overview of supported features:

|  Feature 	| Secure File	| Fast File | Economy File |  OneDrive 	|
|:-	|:-:	|:-:	|:-:	|:-:	|
|  Encryption at Rest 	|   -	|   -	|   X	|   X	|
|  Encryption in Transit	|   	X|   -	|   X	|   X	|
|  Access auditing 	|   X	|   -	|   X	|   X 	|
|  Approved for PHI by ISO 	|   Yes	|   No	|   Yes	|   pending	|


Additional resources for identifying [whether your data is de-identified or not](https://centernet.fredhutch.org/cn/u/hdc/data.html) and the Fred Hutch IRB's [information on HIPAA compliance](https://centernet.fredhutch.org/cn/u/irb/hipaa-compliance.html) can be found at the linked CenterNet pages.  

## Storage Allocation and Costs

Storage Resource | Costs (per TB/month)\*  | Backup Location/Duration | Best Use
--- | --- | --- | --- | ---
*Home* | Free to 100GB limit |  7 days of Snapshots, Daily backups, Off Site copy | Data specific to a user, not shared to others, relatively small data sets
*Fast* | $$$ beyond 5TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | Large data sets that need high performance access to computing resources, Unix file permissioning, but neither PHI nor temporary data (such as intermediate files)
*Secure* | $$$$ beyond 1TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | PHI containing datasets or those that require auditing, relatively small datasets
*Economy Local and Cloud* | $ beyond 5TB per PI |  Multi-datacenter replication, 60 day undelete with request to `helpdesk` | Best for archiving large data sets, or primary storage of large files.  Good for PHI or other data that requires encryption and auditing. *Requires Desktop Client to access, see [Object Storage page.](/computing/store_objectstore/)*
*Scratch* | Free | Not applicable | Temporary files, such as those intermediate to a final result that only need to persist during a job.  *Appropriate use  can significantly reduce data storage costs, see [Scratch Storage](/computing/store_scratch/) and [Using Scratch](/bioinformatics/dm_scratch/) pages.*

Additional details of file allocation amounts, features and costs are available on [Centernet.](https://centernet.fredhutch.org/cn/u/center-it/services/storedataprotect.html) For expenses charged for your group for data storage in these systems, please see the [storage chargeback portal.](https://teams.fhcrc.org/sites/centerit/Support/storage/)  This portal also displays the amount of data in TB that is stored in each location for each Investigator.  

>Note: You can typically access the monthly billing information during the first 10 days of every month

## [Database Storage Systems: REDCap, SQL and DB4Sci](/scicomputing/store_databases/)

There are several options available at the Fred Hutch for storing data in a database system.  These supported systems span a wide range of services to meet the various needs of Fred Hutch researchers.  These include REDCap (supported by Collaborative Data Services based in PHS), MSSQL Server (supported by CIT Enterprise Application Services) and [DB4Sci](https://mydb.fredhutch.org/) (aka MyDB, supported by SciComp, and provides access to four database engine types including Postgres, MariaDB (MySQL), MongoDB, and Neo4j).  


## [File Storage: Storage in Home, Fast, Secure](/scicomputing/store_posix/)

File storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools. These storage systems are similar to the hard drive on your computer, just typically larger and faster.

## [Economy Storage: Object Storage](/scicomputing/store_objectstore/)

Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud computing depends very much on object storage systems such as Amazon's AWS S3. There are a number of features and benefits of object storage systems, such as better sharing of data and much better handling of meta data (e.g. annotations). At Fred Hutch we use object storage predominantly for very large files (e.g. BAM files) and for archiving purposes.


## [Temporary Storage: Scratch](/scicomputing/store_scratch/)

The scratch file system is a file storage system that works differently than the systems intended for long term data storage. It is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.


## [Collaborative Storage Options](/scicomputing/store_collaboration/)

These storage systems have capabilities allowing you to share data with people outside the Hutch, with or without a HutchNet ID.  These include Aspera and OneDrive.  


## Data Locations for Fred Hutch Shared Resource-Generated Data
For data made by Fred Hutch researchers via the Genomics Shared Resource, the default data deposition is currently managed directly by Genomics, and will result in the data being made available to the researchers via their `Fast` storage ( e.g., at path `/fh/fast/lastname_f/SR/ngs` for sequencing data).  Other types of datasets are transferred to researchers in either a `dnaarray` directory or via other forms of transfer specific to the platform type or data source.  This allows for rapid access to recently generated datasets.  However, once data generated via the Genomics Core becomes of primary interest to archive for occasional use, it is a good idea to consider implementing the active data management scheme described above with the assistance of Scientific Computing.  

For example, depending on the intended use of the datasets, it may be desirable once data is generated by the Genomics Shared Resource to archive the data to the researcher's `Economy Local` storage space, with a copy put in `Scratch` or `Economy Cloud` for immediate processing.  The specific organization of archive and working copies of data will depend on the particular project involved.  

  - For consulting about how to handle large amounts of externally or internally generated data email `scicomp`.
  - For additional assistance regarding data generated via the Fred Hutch Genomics Shared Resource, email `bioinformatics`.