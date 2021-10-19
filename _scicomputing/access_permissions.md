---
title: Permissions
last_modified_at: 2019-09-05
primary_reviewers:
---

## Overview of Permissions

### Local Filesystems

#### Types of permissions and users
Read
Write
Execute

User 
Group


Local data storage permissions are organized typically by PI, such as in `fast` where a PI folder would have the name `lastname_f`.  Each PI has a group of members, typically those direct reports or other members who have been manually added due to requests as part of collaborations.  Folders within the PI folder can then have more limited access to sub-groups or even to the level of a single individual.  

#### Collaborating with other labs
Members of other labs can be added to a lab's group or a subgroup to allow those individuals access to shared file locations. When requesting a user be added, please email `scicomp` with your request and include the following information:
- Hutch ID of the user to be given access
- The most restricted path to the folder where permissions need to be given
- Whether the user should be given read-only permissions or if they need read and write permissions
- CC the PI or manager associated with the data storage location to ensure communication

#### Shared Subfolders
Sometimes you can have access to a lower level folder, but do not have access (execute permissions) to a parent directory so for mapped drives on a local computer, you may not be able to map a directory and then click through subfolders to get to the folder you think you have access to.  Before emailing for assistance, test to see if you can directly access the folder containing the data in case this issue is preventing your access.  

- Command Line
Try to `cd /path/to/your/data` directly rather than `cd /path/` and then changing directories to subfolders. Sometimes changing directories directly to the lowest directory to which you should have permissions.  

- Desktop 
map (make a shortcut) to a child directory directly even if you can't map to a parent directory.  Sometimes connecting directly to the path will work when connecting to a parent directory will not. 

#### Requesting Changes to Permissions
If you do not seem to have correct permissions to folder or stoarage location and have tested the above connection instructions, email `scicomp` the following information:

- The most restricted path to the folder where permissions are needed
- Whether you need read-only permissions or read and write permissions
- CC the PI or manager associated with the data storage location to ensure communication

### Cloud Based Storage

Cloud storage is provided by default in PI accounts.  Please see the [S3 resources](/compdemos/aws-s3/) and the [FAQ](/compdemos/cloud-faq/) for more information.

#### User permissions

All users by default have the following permissions in all buckets except for prefixes that are restricted.

- List
- Read
- Write

Data Managers and Admins have all permissions on all folders within their accounts' S3 buckets.

#### Restricted S3 prefixes (folders)

- `readonly/`
- `SR/`

The `SR/` prefix is typically used by any Data Cores within Shared Resources to deliver data into your account.  The `readonly/` folder can be useful if you have certain data that you do not want the users in your lab to be able to alter.
