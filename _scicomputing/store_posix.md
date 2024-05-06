---
title: Data Storage in File Storage Systems
primary_reviewer: dirkpetersen
---

File keeps your data on disks and allows access to your data using familiar tools you're used to: Unix commands like `cat`, `cp`, `ls`, and `rm`,  browser tools like Windows Explorer or OSX's Finder (to browse drives mapped to your local workstation), and most common Bioinformatic tools.  These storage systems are similar to the hard drive on your computer, just typically larger and faster.

There are multiple file storage resources available to researchers including:
- `Home` for personal files
- `Fast` for shared data, including the majority of large scale research data
- [`Temp`](/scicomputing/store_temp/) for temporary storage of files when using the cluster
- [`Scratch`](/scicomputing/store_scratch/) for personal and shared temporary data
- `Secure` for data with higher-level security needs (PHI/encryption/auditing)

>Note:  Currently it is recommended to use a combination of [AWS S3](/scicomputing/store_objectstore/), [`Temp`](/scicomputing/store_temp/) and `Fast`.  Please see our other storage pages for more information about what storage locations are best for what type of data and uses.  

A tool that is useful for moving data between these systems is [Motuz](https://motuz.fredhutch.org).  `Motuz` facilitates the transfer of small or large data between Fred Hutch storage locations (such as `Scratch` and `Fast`) and cloud storage locations such as AWS S3 buckets among others.  You can find some basic how-to guidance to get started with Motuz in our [Resource Library](/compdemos/motuz/
). 



## Home

`Home` storage is your own personal file storage space at the Fred Hutch.  It is a default place for your [shell login files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) as well as an appropriate place to store your own private information.

While you are allowed up to 100GB of storage in this home directory, it is not tailored for heavy use and won't accommodate large data sets- the 100GB limit cannot be extended.  Also, data in this file system cannot be shared with others.

## Fast

`Fast` storage is a petabyte sized high-performance posix file system that holds the bulk of the scientific data at the Fred Hutch. A quick overview: 

- Each PI and division is provided with storage space in `Fast`

This storage platform is appropriate for most scientific data- particularly large data sets.

The data in `Fast` is organized by investigator or Division - each folder at the top level is named using the investigators last name and first initial: investigator "Sneezy Smith" would have a directory on fast called `smith_s`. There are also folders for each division. Special folders `_IRC` (Integrated research centers), `_CTR` (center wide resources and groups not under a specific division.)

Each folder that lives directly under `/fh/fast/lastname_f` can have a different set of permissions governed by a specific Security group (collection of users authorized for a certain resource - managed by SciComp).
We recommend some default folders such as for data shared to any Fred Hutch user (`/pub`), to any member of the PI's immediate research group (`/grp`), group wide software / applications (`/app`) or work spaces to each individual user in a PI's immediate research group (`/user`). Additionally, links to other data sources can appear here, such as data from the Fred Hutch Genomics Shared Resource (`/SR`). Access to these default folders would be governed by a security named lastname_f_grp. This can be customized for a given researcher in conjunction with Scientific Computing (see Available Resources).

To summarize: the folder structure on fast file looks like this: `/fh/fast/(level-of-charge)/(level-of-access-control)/actual/data` and access to non default folders is granted by specific security groups created for each folder (see example below: `lastname_f_project1_grp`)

```
/pub -> publicly readable folder where data can be shared with a hutch 
        wide community

/SR  -> folder with potentially many subfolders (e.g. /SR/genomics/,
        /SR/compbio) that shared resources can write data to,
        e.g Instrument data would be dropped directly in here.

/app -> binary packages compiled specifically for this group, owned by 
        root or a programmer in the group

/grp -> lab or group folder, access restricted to lastname_f_grp.
        Default location for all shared lab data.

/project1 -> project specific folder protected by security group 
         lastname_f_project1_grp (folder not created by default)

/user -> user specific workspaces (/user/username) for staff and service 
         accounts (non user accounts used for applications). If a user requires to have a home directory larger than 100GB, the current home directory would be migrated to this location.
```

### Special Note for Shared Resources Genomics Data

For data made by Fred Hutch researchers via the Genomics Shared Resource, the default data deposition is currently managed directly by Genomics, and will result in the data being made available to the researchers via their `Fast` storage ( e.g., at path `/fh/fast/lastname_f/SR/ngs` for sequencing data).  Other types of datasets are transferred to researchers in either a `dnaarray` directory or via other forms of transfer specific to the platform type or data source.  This allows for rapid access to recently generated datasets.  However, once data generated via the Genomics Core becomes of primary interest to archive for occasional use, it is a good idea to consider implementing the active data management scheme described above with the assistance of Scientific Computing.  

For example, depending on the intended use of the datasets, it may be desirable once data is generated by the Genomics Shared Resource to archive the data to the researcher's `Economy` storage space (AWS S3), with a copy put in `Scratch` for immediate processing.  The specific organization of archive and working copies of data will depend on the particular project involved.  


## Secure

`Secure` storage provides a higher-level of security controls than available on other services- the key difference is access auditing.  There are no charges for data stored here but there is a limit of 750GB per PI directory in this path.  

This storage platform can be used for storing PHI.  It must be noted, however, that many connected systems may not be appropriate for analysis of PHI data.  

## How to access Fred Hutch storage

The following is a summary of how to access these storage systems from PC, Mac or Linux command line. For all of these you must either be on campus and connected to the wired network or the Marconi wireless network. If you are off-site, you must be connected to the VPN. If you frequently work both on and off site, ensure that you are disconnected from the VPN if on the campus network.

**Fred Hutch PC:** 

| Location | Path |
| --- | ----------- |
| Homelink | `\\homelink\homes` |
| Fast | `X:\fast` |
| Scratch | `X:\scratch` |
| Secure | `X:\secure` |


**Non-Fred Hutch PC:**

| Location | Path |
| --- | ----------- |
| Homelink | `\\homelink.fhcrc.org\homes` |
| Fast | `\\center.fhcrc.org\fh\fast` |
| Scratch | `\\center.fhcrc.org\fh\scratch` |
| Secure | `\\center.fhcrc.org\fh\secure` |


**Mac:**

For these paths, replace HUTCHID with your hutchid.

| Location | Path |
| --- | ----------- |
| Homelink | `smb://fhcrc.org;HUTCHID@homelink.fhcrc.org/homes` |
| Fast | `smb://fhcrc.org;HUTCHID@center.fhcrc.org/fh/fast` |
| Scratch | `smb://fhcrc.org;HUTCHID@center.fhcrc.org/fh/scratch` |
| Secure | `smb://fhcrc.org;HUTCHID@center.fhcrc.org/fh/secure` |

Note: Drive mapping with Macs can be very slow for large volumes due to the Mac wanting to index every file in a volume. Turn off volume indexing to improve the speed of drive mapping. 
From a terminal window on your Mac, turn off all drive mapping.
```sudo mdutil -a -i off```
Turn indexing back on for your local drive:
```sudo mdutil -i on /Volumes/mac-name```
The sudo command will ask for your Mac login password. Often Mac volume names have spaces; a backslash can be used to quote spaces. `Macintosh\ HD`

**Linux command line:**

| Location | Path |
| --- | ----------- |
| Homelink | `~/` or `/home/HUTCHID` |
| Fast | `/fh/fast` |
| Temp | `/hpc/temp` |
| Scratch | `/fh/scratch` |
| Secure | `/fh/secure` |


## Related Centernet links:

[Mapping Network Drives](https://centernet.fredhutch.org/u/it/help-desk/mapping-network-drives.html)
[Network Drive Paths - Mac](https://centernet.fredhutch.org/u/it/help-desk/mapping-network-drives.html#mac)  
[Network Drive Paths - Windows](https://centernet.fredhutch.org/u/it/help-desk/mapping-network-drives.html#windows)  

