---
title: Overview of Data Storage at Fred Hutch
last_modified_at: 2019-08-22
primary_reviewers: dirkpetersen
---

The Hutch supports a number of options for storing your data such as _database_, _file_, _scratch_, _object_ and _collaborative storage_ options. The storage you use to store your data will depend on the nature of the data and your anticipated use. Below is an overview of what data storage resources are available. For more detailed information, including setup instructions and limitations, please see the links and articles in the sidebar.  

## Data Management Guidance

Most Fred Hutch based researchers have multiple types of data they need to store while they are performing their research.  Broadly speaking these types of data can be categorized as:
- Raw laboratory results and data - e.g. raw sequencing data, unprocessed images, large numbers of raw flow cytometry files
- Files and copies generated during the process of transforming, analyzing, and consolidating raw data - e.g. aligned but not de-deuplicated bam files from sequencing experiments, working copies of the raw images being used to develop a novel analysis approach, etc
- Analyzed results, plots, documents, protocols and other small files and documents involved in the research process - e.g. Word docs containing the laboratory protocols used to generate experiments, Excel files of sample lists and metadata, plots and figures being consolidated for publications or incorporated into presentations

For these broad types of data, when determining how to manage all of your research data types, it's important also to think about a few features of the data you're storing:
- How big is the total dataset? Are your individual files relatively small (~1MB files) or relatively large (~1GB)?  Do you have thousands of related files (like a cohort), or just a few? 
- How do are these files typically accessed - by a computer or by a human?  An example of this is a fastq.gz full of sequencing reads that likely will need to be analyzed via a non-interactive computing process versus a pdf of an output plot that a human will look at and use in presentation.  
- Is this file a derivative of another - and how easy is it to remake it?  For instance, if you have a cram file of compressed sequencing data that would be hard or impossible to recreate, that's not a deriative file and should be archived, while a vcf of variant calls from the data in that cram file is derived through a process that can be easily defined and re-run using a series of scripts or bioinformatic workflow.  
- What resources do you have to offset costs of storage of data and does it make sense to use them to store a specific dataset for additional use?  While much of data storage resources at the Fred Hutch are subsidized, if your research is very data intensive, you're going to need to make data stewardship more of a focus of your work so you do not end up having to use additional grant funds to pay for data you're no longer using.  
- Do I need to share these data with others at the Fred Hutch or beyond?  Some systems make it easier to collaborate on data without having to duplicate it than others, and depending on who needs to use these data as well, some systems might be better suited than others.  Copying data should be your last resort.  


Depending on the type of data used by a research group, different combinations of data storage options may be appropriate. Assessing the strengths, mode of access, and interactivity with computing resources of each of these types of data storage options alongside an assessment of the types of data a research group use and the type of interactions with those data is becoming more important for researchers. This assessment also is becoming more important to repeat over time as data storage and connectivity infrastructure changes and as the particular data types and interactions of research groups evolve.


There are multiple resources at the Fred Hutch to help you design and implement a data management plan for your research.  The Fred Hutch [Data Science Lab](https://hutchdatascience.org/) offers a [Data House Calls](https://hutchdatascience.org/datahousecalls/) service to get a consultation to discuss your data needs and how you might design a plan, while Scientific Computing can help you with the tools and resources you need to implement that plan (email `scicomp` for help).



### Storing protected health information (PHI) data

Please check with your supervisor before you store any [PHI data](https://cphs.berkeley.edu/hipaa/hipaa18.html) on Fred Hutch systems as your data set may have compliance requirements that would not allow you to store the data on any of the existing systems. In almost all cases you should be working with de-identified data which can be stored on any of the above storage systems. If you must store PHI data, you may only use systems that are approved by [ISO](https://centernet.fredhutch.org/cn/u/center-it/iso.html) and support:

1. Encryption at rest (e.g. on the hard drive)
2. Encryption in transit (e.g. through the network)
3. Access auditing (a systems log who accessed a file what time).

This is an overview of supported features:

|  Feature 	                | Secure File	| Fast File | Economy Cloud |  Scratch  	|  OneDrive 	|
|:-	                        |:-:	        |:-:	      |:-:	          |:-:	        |:-:	        |
|  Encryption at Rest 	    |        Yes  |      Yes  |          Yes	|        Yes	|        Yes	|
|  Encryption in Transit    |        Yes* |      Yes* |          Yes	|        Yes* |        Yes	|
|  Access auditing 	        |        Yes	|      Yes  |    	     Yes  |         No	|        Yes	|
|  Approved for PHI by ISO 	|        Yes  |      No   |          Yes  |         No	|        Yes	|

*) Transit encryption is only available when the data is accessed by SMB mounts- Windows and newer OSX systems use SMB. The HPC systems (e.g. rhino, gizmo) use NFS which is not encrypted.  However, this traffic is confined to a secure data center.

At this time both _fast_ and _secure_ storage platforms have the same capabilities for encryption, access auditing, and backups.  _Secure_ has a more capable mechanism for managing access permissions that allows more flexibility in assigning those permissions.  Contact scicomp if you think you may need these capabilities.

The Fred Hutch IRB's [information on HIPAA compliance](https://centernet.fredhutch.org/cn/u/irb/hipaa-compliance.html) can be found at the linked CenterNet pages.  

### Storage Allocation and Costs

Storage Resource | Costs (per TB/month)\*  | Backup Location/Duration | Best Use
--- | --- | --- | --- | ---
Home | Free to 100GB limit |  7 days of Snapshots, Daily backups, Off Site copy | Only use this location for software and settings specific to a user, not for data, not shared to others. HARD LIMIT, cannot be expanded
Fast | $$$ beyond 1TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | Large instrument files and data sets that need high performance access to computing resources, Unix file permissions, but not temporary data (such as intermediate files)
Economy Cloud | $ beyond 100TB per PI |  Multi-datacenter replication, 90 day undelete (Trashcan) with request to `helpdesk` | Best for archiving large data sets, or primary storage of large files.  Good for PHI or other data that requires encryption and auditing. *Requires Desktop Client to access, see [Object Storage page.](/scicomputing/store_objectstore/)*
Scratch | Free | Not backed up | Temporary files, such as those intermediate to a final result that only need to persist during a job, and secondary copies of files used in analysis but with a primary copy on more durable storage  *Appropriate use  can significantly reduce data storage costs- see the [Scratch Storage](/scicomputing/store_scratch/) page.*
OneDrive | None | Recycle Bin available | Documents, spreadsheets, and other similar administrative files

Additional details for other CIT file services such as `Secure File` (aka J or R drive) features are available on [Centernet](https://centernet.fredhutch.org/cn/u/center-it/services/storedataprotect.html). For expenses charged to your group for data storage in these systems, please see the [storage usage dashboard](https://grafana.fredhutch.org/d/dy5I3SIMk/data-core-storage-usage/). If you are interested in a breakdown of your storage ulitization by folder you can get these details at [Storage HotSpots](https://storage-hotspots.fhcrc.org/). Please select your PI as owner. You can also export all data as CSV. (Please note: for performance reasons only folders > 1GB without subfolders are shown here) . For pricing information please check [this page](https://centernet.fredhutch.org/cn/u/shared-resources/data-resource.html) on CenterNet. 

### Data Locations for Fred Hutch Shared Resource-Generated Data

For data made by Fred Hutch researchers via the Genomics Shared Resource, the default data deposition is currently managed directly by Genomics, and will result in the data being made available to the researchers via their `Fast` storage ( e.g., at path `/fh/fast/lastname_f/SR/ngs` for sequencing data).  Other types of datasets are transferred to researchers in either a `dnaarray` directory or via other forms of transfer specific to the platform type or data source.  This allows for rapid access to recently generated datasets.  However, once data generated via the Genomics Core becomes of primary interest to archive for occasional use, it is a good idea to consider implementing the active data management scheme described above with the assistance of Scientific Computing (email `scicomp`).

For example, depending on the intended use of the datasets, it may be desirable once data is generated by the Genomics Shared Resource to archive the data to the researcher's `Economy` storage space (AWS S3 "PI buckets"), with a copy put in `Scratch` for immediate processing.  The specific organization of archive and working copies of data will depend on the particular project involved.  

  - For technical assistance in handling large amounts of externally or internally generated data email `scicomp`.
  - For additional assistance regarding data generated via the Fred Hutch Genomics Shared Resource, email `bioinformatics`.
  - For consultation about data management and strategies, schedule a [Data House Call](https://hutchdatascience.org/datahousecalls/) with the Data Science Lab. 


## Data Storage Types

### [Database Storage Systems: REDCap, SQL and MyDB](/scicomputing/store_databases/)

There are several options available at the Fred Hutch for storing data in a database system.  These supported systems span a wide range of services to meet the various needs of Fred Hutch researchers.  These include REDCap (supported by Collaborative Data Services based in PHS), MSSQL Server (supported by CIT Enterprise Application Services) and [MyDB](https://mydb.fredhutch.org/) (supported by SciComp providing access to four database engine types: Postgres, MariaDB (MySQL), MongoDB, and Neo4j).  


### [File Storage: Storage in Home, Fast, Secure](/scicomputing/store_posix/)

File storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools. These storage systems are similar to the hard drive on your computer, just typically larger and faster.

### [Economy Storage: Object Storage](/scicomputing/store_objectstore/)

Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud computing depends very much on object storage systems such as Amazon's AWS S3. There are a number of features and benefits of object storage systems, such as better sharing of data and much better handling of meta data (e.g. annotations). At Fred Hutch we use object storage predominantly for very large files (e.g. BAM files) and for archiving purposes.


### [Temporary Storage: Scratch](/scicomputing/store_scratch/)

The scratch file system is a file storage system that works differently than the systems intended for long term data storage. It is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the home or fast file systems (these features were traded for lower cost and greater volume)- that said, it has shown itself to be quite reliable and reasonably fault tolerant.


### [Collaborative Storage Options](/scicomputing/store_collaboration/)

These storage systems and transfer tools have capabilities allowing you to share data with people outside the Hutch, with or without a HutchNet ID.  These include Motuz and Aspera transfer tools and OneDrive for data storage, as well as information about using AWS S3 for collaboration.  



