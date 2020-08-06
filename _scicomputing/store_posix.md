---
title: Data Storage in File Storage Systems
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

`Home` storage is your own personal file storage space at the Fred Hutch.  It is a default place for your [shell login files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) as well as an appropriate place to store your own private information.

While you are allowed up to 100GB of storage in this home directory, it is not tailored for heavy use and won't accommodate large data sets- the 100GB limit cannot be extended.  Also, data in this file system cannot be shared with others.

## Fast

`Fast` storage is a petabyte sized high-performance posix file system that holds the bulk of the scientific data at the Fred Hutch. A quick overview: 

- Each PI and division is provided with an allocation of storage space via `Fast`, though additional storage may be purchased.  

- You can access `Fast` from your workstation using `smb://center.fhcrc.org/fh/fast/lastname_f` on a Mac or `\\center.fhcrc.org\fh\fast\lastname_f` or `X:\fast\lastname_f` on a PC).

- On Fred Hutch HPC systems (Rhino, Gizmo, Beagle and Koshu) you can access fast via `/fh/fast/lastname_f`

This storage platform is appropriate for most scientific data- particularly large data sets.

The data in `Fast` is organized by investigator or Division - each folder at the top level is named using the investigators last name and first initial: investigator "Sneezy Smith" would have a directory on fast called `smith_s`. There are also folders for each division. Special folders ``\_IRC` (Integrated research centers), ``\_CTR` (center wide resources and groups not under a specific division.)
Each folder that lives directly under `/fh/fast` has a default allocation, with additional storage available to purchase.

Each folder that lives directly under `/fh/fast/lastname_f` can have a different set of permissions governed by a specific Security group (collection of users authorized for a certain resource - managed by SciComp).
We recommend some default folders such as for data shared to any Fred Hutch user (`/pub`), to any member of the PI's immediate research group (`/grp`), group wide software / applications (`/app`) or work spaces to each individual user in a PI's immediate research group (`/user`). Additionally, links to other data sources can appear here, such as data from the Fred Hutch Genomics Shared Resource (`/SR`). Access to these default folders would be governed by a security named lastname_f_grp. This can be customized for a given researcher in conjunction with Scientific Computing (see Available Resources).

To summarize: the folder structure on fast file looks like this: `/fh/fast/(level-of-charge)/(level-of-access-control)/actual/data` and access to non default folders is granted by specific security groups created for each folder (see example below: `lastname_f_project1_grp`)

```
/pub​ -> publicly readable folder where data can be shared with a hutch 
        wide community

/SR  -> folder with potentially many subfolders (e.g. /SR/genomics/, /SR/compbio)
        that shared resources can write data to, e.g Instrument data would 
        be dropped directly in here.

/app -> binary packages compiled specifically for this group, owned by 
        root or a programmer in the group

/grp -> lab or group folder, access restricted to lastname_f_grp.
        Default location for all shared lab data.

/project1 -> project specific folder protected by security group 
         lastname_f_project1_grp (folder not created by default)

/user -> user specific workspaces (/user/username) for staff and service 
         accounts (non user accounts used for applications). If a user requires to have a home directory larger than 100GB, the current home directory would be migrated to this location.
```

## Secure

`Secure` storage provides a higher-level of security controls than available on other services- the key difference is access auditing.  This is also organized by investigator with a free allocation with additional storage available for purchase.  

Secure file is available via the path `/fh/fast/secure/research/lastname_f` on SciComp Linux systems, `\\center.fhcrc.org\fh\secure\research\lastname_f` or `X:\secure\research` on Windows hosts, and `smb://center/fh/secure/research/lastname_f` on OSX.

This storage platform can be used for storing PHI.  It must be noted, however, that many connected systems may not be appropriate for analysis of PHI data.  
