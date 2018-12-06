---
title: Data Storage Best Practices
last_modified_at: 2018-11-26
primary_reviewers:
---

Most Fred Hutch based researchers using large scale biomedical data sets initially store their data using *Fast* storage alongside their smaller scale laboratory data.  This provides direct, rapid access to files both manually (e.g., via mapping a drive to a workstation) and to local computing resources (via our HPC cluster, see below).  However, a strategy for where, when and for how long to store what size data is important to create to ensure that data access by researcher or compute resource, transfer and archiving are not unnecessarily complicated thus hindering the research process.

Depending on the type of data used by a research group, different combinations of data storage options may be appropriate.  In general, the three categories of data storage common to Fred Hutch researchers are:
- [Databases](/computing/store_databases/)
- [File-Based Storage](/computing/store_posix/), such as `fh/fast` or the `Z drive` often mapped directly to workstations)
- [Object Storage](/computing/store_objectstore/) (AWS S3 and Swift, often accessed via a "client" or other software that facilitates the upload/download of items)

Assessing the strengths, mode of access, and interactivity with computing resources of each of these types of data storage options alongside an assessment of the types of data a research group use and the type of interactions with those data is becoming more important for researchers.  This assessment also is becoming more important to repeat over time as data storage and connectivity infrastructure changes and as the particular data types and interactions of research groups evolve.  


## Overview of File-Based Storage Resources

Storage Resource | Costs (per TB/month)\*  | Backup Location/Duration | Best Use
--- | --- | --- | --- | ---
*Home* | Free to 100GB limit |  7 days of Snapshots, Daily backups, Off Site copy | Data specific to a user, not shared to others, relatively small data sets
*Fast* | $$$ beyond 5TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | Large data sets that need high performance access to computing resources, Unix file permissioning, but neither PHI nor temporary data (such as intermediate files)
*Secure* | $$$$ beyond 1TB per PI |  7 days of Snapshots, Daily backups, Off Site copy | PHI containing datasets or those that require auditing, relatively small datasets
*Economy* | $ beyond 5TB per PI |  Multi-datacenter replication, 60 day undelete with request to `helpdesk` | Best for archiving large data sets, or primary storage of large files.  Good for PHI or other data that requires encryption and auditing. *Requires Desktop Client to access, see [Object Storage page.](/computing/store_objectstore/)*
*Scratch* | Free | Not applicable | Temporary files, such as those intermediate to a final result that only need to persist during a job.  *Appropriate use  can significantly reduce data storage costs, see [Scratch Storage](/computing/store_scratch/) and [Using Scratch](/bioinformatics/dm_scratch/) pages.*

> Note:  All admin contact for assistance with dat storage can be initiated by emailing `helpdesk`, but different system administrators are primary for different platforms.  Admin assistance can be requested for data transfers and validation, data import, as well as restoring data from backups for a given resource if available.

### Available Resources
- Contact Scientific Computing staff by emailing `scicomp` for help with:
  - identifying current storage space usage
  - assistance with identification of possible duplicated data sets
  - guidance with implementing active data management practices
