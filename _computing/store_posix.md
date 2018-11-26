---
title: Data Storage in File (Block) Storage Systems
last_modified_at: 2018-11-26
primary_reviewer: dirkpetersen
---

File, or block storage keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools.  These storage systems are similar to the hard drive on your computer, just typically larger and faster.

There are multiple resources available to researchers that are Block storage including:
- _home_ for personal files
- _fast_ for shared data, including the majority of research data
- _secure_ for data with higher-level security needs

## Storage Allocation and Costs

Please see an overview of file/block allocation amounts, features and costs on [Centernet.](https://centernet.fredhutch.org/cn/u/center-it/services/storedataprotect.html) For expenses charged for your group for data storage in these systems, please see the [storage chargeback portal.](https://teams.fhcrc.org/sites/centerit/Support/storage/)

>Note: You can typically access the monthly billing information during the first 10 days of every month



## Home

The _home_ file server is your own personal file storage space at the Fred Hutch.  It is a default place for your Linux login files (profiles &c) as well as an appropriate place to store your own private information.

While you are allowed up to 100GB of storage in this home directory, it is not tailored for heavy use and won't accommodate large data sets- the 100GB limit cannot be extended.  Also, data in this file system cannot be shared with others.

There is no charge for this storage.

## Fast File

The _fast file_ service is a large high-performance system that holds the bulk of the scientific data at the FredHutch.  The data here is organized by investigator- each folder at the top level is named using the investigators last name and first initial: investigator "Sneezy Smith" would have a directory on fast called `smith_s`.

On SciComp supported Linux systems you will see this storage in the path `/fh/fast`.  Windows systems can access this via the UNC path `\\center.fhcrc.org\fh\fast` and OSX hosts using the path `smb://center.fhcrc.org/fh/fast`.  

This storage platform is appropriate for most scientific data- particularly large data sets.  There is no charge for the first 5TB of storage on this system: there is a $30 per-month charge for every terabyte above this.

## Secure File

The _Secure File_ system provides a higher-level of security controls than available on other services- the key difference is access auditing.  This is also organized by investigator.

Secure file is available via the path `/fh/fast/secure/research/lastname_f` on SciComp Linux systems, `\\center.fhcrc.org\fh\secure\research\lastname_f` on Windows hosts, and `smb://center/fh/secure/research/lastname_f` on OSX.

This storage platform can be used for storing PHI.  It must be noted, however, that many connected systems may not be appropriate for analysis of PHI data.  The first terabyte of data is provided by CIT with a charge of $50 per-terabyte for any amount above that.
