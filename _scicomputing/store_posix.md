---
title: Data Storage in File Storage Systems
last_modified_at: 2019-04-01
primary_reviewer: dirkpetersen
---

File keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools.  These storage systems are similar to the hard drive on your computer, just typically larger and faster.

There are multiple file storage resources available to researchers including:
- `Home` for personal files
- `Fast` for shared data, including the majority of large scale research data
- [`Scratch`](/scicomputing/store_scratch/) for personal and shared temporary data
- `Secure` for data with higher-level security needs (PHI/encryption/auditing)

>Note:  Currently it is recommended to use a combination of [*Economy*](/scicomputing/store_objectstore/), [`Scratch`](/scicomputing/store_scratch/) and `Fast`.  Please see our other storage pages for more information about what storage locations are best for what type of data and uses.  

## Home

`Home` storage is your own personal file storage space at the Fred Hutch.  It is a default place for your Linux login files (profiles &c) as well as an appropriate place to store your own private information.

While you are allowed up to 100GB of storage in this home directory, it is not tailored for heavy use and won't accommodate large data sets- the 100GB limit cannot be extended.  Also, data in this file system cannot be shared with others.

## Fast

`Fast` storage is a large high-performance system that holds the bulk of the scientific data at the FredHutch.  Each PI is provided with 5TB of free storage space via `Fast` storage above which a cost per TB per month is charged.  This storage can be accessed by mapping the drive to their workstation (using `//center/fh/fast/lastname_f` on a Mac or `\\center\fh\fast\lastname_f` or `X:\fast\lastname_f` on a PC). This storage access point can provide members of research groups access to groups of datasets that can have different types of permissions.  Within a PI's `Fast` directory, directories can exist for data shared to any Fred Hutch user (`/pub`), to any member of the PI's immediate research group (`/grp`), or private to each individual user in a PI's immediate research group (`/user`).  Additionally, links to other data sources can appear here, such as data from the Fred Hutch Genomics Shared Resource (`/SR`).  This can be customized for a given researcher in conjunction with Scientific Computing (see Available Resources).

The data here is organized by investigator- each folder at the top level is named using the investigators last name and first initial: investigator "Sneezy Smith" would have a directory on fast called `smith_s`.

On SciComp supported Linux systems you will see this storage in the path `/fh/fast`.  Windows systems can access this via the UNC path `\\center.fhcrc.org\fh\fast` or `X:\fast` and OSX hosts using the path `smb://center.fhcrc.org/fh/fast`.  

This storage platform is appropriate for most scientific data- particularly large data sets.  There is no charge for the first 5TB of storage on this system: there is a $30 per-month charge for every terabyte above this.

## Secure

`Secure` storage provides a higher-level of security controls than available on other services- the key difference is access auditing.  This is also organized by investigator with a 1TB free allocation above which a cost per TB per month is charged.  

Secure file is available via the path `/fh/fast/secure/research/lastname_f` on SciComp Linux systems, `\\center.fhcrc.org\fh\secure\research\lastname_f` or `X:\secure\research` on Windows hosts, and `smb://center/fh/secure/research/lastname_f` on OSX.

This storage platform can be used for storing PHI.  It must be noted, however, that many connected systems may not be appropriate for analysis of PHI data.  The first terabyte of data is provided by CIT with a charge of $50 per-terabyte for any amount above that.
