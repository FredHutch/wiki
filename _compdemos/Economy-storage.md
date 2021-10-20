---
title: Accessing `Economy Local` Storage
main_author: Dirk Peterson
primary_reviewers: dirkpetersen, vortexing
---

<!--FIXME JEFF: Add new policies for object archiving, restricted tags, bucket restrictions, and public/private buckets with data-->

`Economy Local` is an object storage system based on Openstack Swift. `Economy Local` is recommended for research groups who keep large amounts of data (>100TB) on the Fred Hutch campus and frequently use the `Gizmo` cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud storage resources.

`Economy Local` is well suited to store petabytes of data at low cost and a high level of data protection. Economy File does not require tape backup as data is replicated to multiple sites. If you accidentally delete data it will be held in a "Trash can" for multiple months during which you have read-only access to the deleted data. Economy File is approved for PHI / PII data.  It is a suitable location to store genomic data  including those governed by the NIH Genomic Data Sharing policies or originating from public repositories while in use locally. Please the [demo section for examples of Economy Local](/compdemos/Economy-storage/)

It is also possible to use [Synology to backup data to _Economy Local_.](/compdemos/synology/)


This demo showcases different options for accessing economy storage, including command line and API options, and how to handle the migration of large datasets to Economy Local. 

## General Limitations and Notes

 - Files larger than 5GB require segmentation.  The value indicated with the "-S" argument is the size that files will be split into on the object store.  A segment size may be any value up to 5GB.  A reasonable default value is -S 2G which sets the maximum segment size to 2 GB, which means a file of 10GB size will be split into 5 segments.
 - using multiple segments will increase upload speeds (and download speeds in the future), setting the segment size to 1GB on a 10GB file can increase the theoretical upload performance 10 fold
 - Swift commands that fail don't set a return code, which could complicate scripting.
 - You can't delete a directory in a container. When you delete the last file from the directory, swift deletes the directory automatically.  However, swift will delete a container with files still in it, so be careful what you delete.

 >Note: Additional details on [migrating large data to Economy Local](#how-to-migrate-large-data-to-economy-local) are available below.


## Command Line and API Options for Accessing Economy Local Storage

Access to data stored in Fred Hutch resources that are [object stores](/scicomputing/store_objectstore/) can be achieved via command line tools or the API.  This is an overview of available tools that are related to accessing `Economy Local` storage, starting with the ones you will most likely use and that are best supported.  

### Swift Commander
Using the `swc` command is the simplest way of accessing the Swift object store. The tool includes easy to use sub commands such as `swc upload` and `swc download` as well as simplified versions of standard unix tools such as ls, cd, rm, etc. By using `swc` you can ignore most of the peculiarities of the Swift object storage system and (almost) work with it like a traditional file system. It is the best option for HPC scripting and automation.

First, let's invoke the `swc` command and see what it has to offer:

```
gizmod16:~> swc
*** Swift credentials not set. ***
Please execute 'sw2account <accountname>' to get credentials.
Use 'sw2account --save <accountname>' to set them as default.
```

Swift requires certain environment variables to be set for each user based on the PI's group.  You can easily set them by using `sw2account lastname_f`.

Now let's try running `swc` again, still without any command options, you are prompted for your HutchNet password:
```
petersen@rhino:~$ swc

Swift Commander (swc) allows you to easily work with a swift object store.
swc supports sub commands that attempt to mimic standard unix file system tools.
These sub commands are currently implemented: (Arguments in square brackets are
optional).

  swc upload <src> <targ>   -  copy file / dirs from a file system to swift
  swc download <src> <targ> -  copy files and dirs from swift to a file system
  swc cd <folder>           -  change current folder to <folder> in swift
  swc ls [folder]           -  list contents of a folder - or the current one
  swc mkdir <folder>        -  create a folder (works only at the root)
  swc rm <path>             -  delete all file paths that start with <path>
  swc pwd                   -  display the current swift folder name
  swc cat|more|less <file>  -  download a file to TMPDIR and view with cat, more or less
  swc vi|emacs|nano <file>  -  download a file to TMPDIR and edit it with vi|emacs or nano
  swc chgrp <group> <fld.>  -  grant/remove rw access to current swift account or container
  swc rw <group> <folder>   -  add rw access to current swift account or container
  swc ro <group> <folder>   -  add ro access to current swift account or container
  swc publish|hide </fld.>  -  make root folder public (web server mode) or hide it
  swc list <folder> [filt]  -  list folder content (incl. subfolders) and filter
  swc search <str> <folder> -  search for a string in text files under /folder
  swc openwith <cmd> <file> -  download a file to TMPDIR and open it with <cmd>
  swc header <file>         -  display the header of a file in swift
  swc meta <file>           -  display custom meta data of a file in swift
  swc mtime <file>          -  show the original mtime of a file before uploaded
  swc size <folder>         -  show the size of a swift or a local folder
  swc compare <l.fld> <fld> -  compare size of a local folder with a swift folder
  swc hash <locfile> <file> -  compare the md5sum of a local file with a swift file
  swc arch <src> <targ>     -  create one tar archive for each folder level
  swc unarch <src> <targ>   -  restore folders that have been archived
  swc auth                  -  show current storage url and auth token
  swc env                   -  show authentication env vars (ST_ and OS_)
  swc clean                 -  remove current authtoken credential cache

Examples:
  swc upload /local/folder /my/swift/folder
  swc upload --no-symlinks /local/folder /my/swift/folder (don't save symlinks)
  swc compare /local/folder /my/swift/folder
  swc download /my/swift/folder $TMPDIR (download to local scratch dir)
  swc arch /local/folder /my/swift/folder (upload folders as tar.gz files)
  swc unarch /my/swift/folder /scratch/folder (unpack tar.gz files)
  swc rm /my/archive/some_prefix
  swc less /my/swift/folder/some_file.txt (download and view with less)
  swc openwith emacs /folder/some_file.txt

Debugging:
  export OS_SWIFT_OPTS=--info
```

OK, we see that there are some options, the `swc` command has nearly 30 sub commands. Let's upload a folder called 'testing' this is a sub folder in your current folder  in `Fast`. The target folder in Swift is called /test:

```   
petersen@rhino04:~/sc$ swc upload ./testing /test
*** uploading ./test ***
*** to Swift__ADM_SciComp:/test/ ***
executing:swift upload --changed --segment-size=2147483648 --use-slo --segment-container=".segments_test" --header="X-Object-Meta-Uploaded-by:petersen" --object-name="" "test" "./test"
*** please wait... ***
/fld11/file12
/fld11/file11
/fld11/fld2/fld3/fld4/file43
/fld11/fld2/fld3/fld4/file42
.
.
.
/test
```

Let's make sure that the data is really there by comparing the size of the local folder with the swift folder:

```
petersen@rhino02:~/sc$ swc compare ./testing /test
    checking swift folder test ...
    3,180,498,696 bytes (2.962 GB) in test (swift)
    checking posix folder ./testing/ ...
    3,180,498,696 bytes (2.962 GB) in ./testing
OK! The size of ./testing and /test is identical!
```

Now let's download a subfolder of that folder /test to our scratch file system for further processing:

```
petersen@rhino04:~/sc$ swc download /test/fld1 /fh/scratch/delete30/lastname_f/tmp
...downloading /test/fld1, please wait...
executing:swift download --prefix="fld1" test
fld1/file11 [auth 0.123s, headers 0.162s, total 0.170s, 0.000 MB/s]
fld1/file12 [auth 0.118s, headers 0.164s, total 0.171s, 0.000 MB/s]
fld1/fld2/file21 [auth 0.123s, headers 0.158s, total 0.169s, 0.000 MB/s]
.
.
/fh/scratch/delete30/lastname_f/tmp/
```

Please check out the `swc` page on GitHub for additional details:

- [swift commander on github](https://github.com/FredHutch/swift-commander)
- [Check out this video how to the swc command](https://asciinema.org/a/17172)

There are further examples at the end of this page 


### rclone 

[rclone](http://rclone.org) is a swiss army knife for interacting with cloud / object storage. The benefit of using rclone is that it supports [many different cloud storage](https://rclone.org/overview/) systems and if you work with multiple systems you can use rclone to access them with one unified interface. On SciComp systems rclone is preconfigured to work with Economy Local (swift) and Economy Cloud (s3). You can use the `swc` command to create a token and this token will be used by rclone
If you execute this command you should see at least 2 entries.

`rclone listremotes`

and to list buckets in s3 you can run 

`rclone lsd s3:`

### Amazon Web Services S3 Compatibility Layer

We can use AWS tools such as `awscli`, the Python module `boto3` or the R package `aws.s3` to access Swift through the AWS S3 compatibility layer.  We have generated detailed docs for using [`awscli`](/compdemos/aws-s3/#aws-command-line-interface-cli), [`boto3`](/compdemos/aws-s3/#aws-via-python) and [`aws.s3`](/compdemos/aws-s3/#aws-via-r) in our Resource Library section.  Prior to using these tools, hwoever, we need to first setup the profile `s3.fhcrc.org` in ~/.aws/config and ~/.aws/credentials. To help with this just run the script `s3cfg` on `rhino`.  

```
> s3cfg
Please go to https://toolbox.fhcrc.org/sw2srv/swift/account
to get your PI/department S3 compatible credentials for Economy local (swift)
Edit section [s3.fhcrc.org] in ~/.aws/credentials and enter
aws_access_key_id = [account]
aws_secret_access_key = [key]

Please run command: source ~/.aws/s3env.sh

```
After running `s3cfg` you need to first put the credentials you can get from toolbox into ~/.aws/credentials. When you are done you can simply source some environment variables from script ~/.aws/s3env.sh :

```
    > source ~/.aws/s3env.sh
```

Now you should be able to use the `awscli` commands as [documented here](/compdemos/compdemos/aws-s3/#aws-command-line-interface-cli) to list all your directories in `Economy Local`.

```
    > aws s3 ls

    2009-02-03 08:45:09 nyc-taxi-data
    2009-02-03 08:45:09 public
    2009-02-03 08:45:09 s3ql
    2009-02-03 08:45:09 sc_software
```

If you would like to use both `Economy Local` (Swift) and `Economy Cloud` (AWS S3) it may be best not to set `Economy Local` as your default profile:

```
    > unset AWS_DEFAULT_PROFILE
    > unset AWS_PROFILE
```

and instead use the --profile option for `Economy Local`:

```
    > aws s3 ls --profile s3.fhcrc.org
```


### Swift standard client (Python)

The Swift client allows you to read and write files in your containers directly without mounting the container in the file system.  This is particularly handy for scripting and automation. The swift client is used by `swc` 'under the hood' and offers more options than `swc` but it is also slightly more difficult to use.  Do not use this tool if `swc` meets your needs.

The swift client operates similar to ftp or scp and can be used in batch mode.  These operations are:

- delete: delete a container or objects within a container
- download: download objects from containers
- list: lists the containers for the account or the objects for a container
- post: updates meta information for the account, container, or object
- stat: displays information for the account, container, or object
- upload: uploads files or directories to the given container
- capabilities: lists features/capabilities of the swift cluster
- tempurl: creates a temporary url with expiration date that can be published within the Fred Hutch network

You can supply your credentials on the command line, but this is discouraged as it can expose your password to any other user on the system.
The easiest way to get credentials to Swift storage on a SciComp system is using `sw2account` with the id of the PI as an argument (`sw2account lastname_f`) . It is recommend that you then use `swc auth` to save and display a token that you can use as credential to the PI account you mostly work with. 

```
    $ sw2account --save lastname_f
```

use the `swc auth` command (you may be prompted for your Hutch credentials) and copy and paste the 3 lines that start with `export ...` into your terminal. This will activate the authentication token for swift/

```
petersen@rhino03:~$ swc auth
Enter your swift password/key for AUTH_Swift_lastname_f/petersen:
Refreshing credentials ....please wait
export OS_AUTH_URL=https://xxxxx.xxxxxx.org/auth/v2.0
export OS_STORAGE_URL=https://xxxxx.xxxxxx.org/v1/AUTH_Swift_lastname_f
export OS_AUTH_TOKEN=AUTH_tk7d0a4508fd284a35xxxxxxxxxxxxxxx
```

With those environment variables set, the connection can be tested with the "stat" subcommand:

```
$ swift stat
Account: AUTH_username
Containers: 0
Objects: 0
    Bytes: 0
Accept-Ranges: bytes
X-Timestamp: 1386202905.14525
X-Trans-Id: tx93f905a47d044277b276c-0052a0ca26
Content-Type: text/plain; charset=utf-8
```

The "post" subcommand creates a new container into which we can "upload" a file.  The "list" subcommand rather obviously displays the contents of the indicated object:

```
$ ls -l samplefile.tgz
-rw-rw-r-- 1 user group 8134841 Nov 12 09:12 samplefile.tgz
$ swift post newcontainer
$ swift list
newcontainer
$ swift list newcontainer
$ swift upload -S 2G newcontainer samplefile.tgz
samplefile.tgz
$ swift list newcontainer
samplefile.tgz
```
You can upload an entire folder structure using the Swift upload command. Swift will recreate the entire folder structure you send on the command line. If you run `swift upload -S 2g newcontainer /fh/fast/lastname_f/myfolder` it will create the entire folder structure /fh/fast... under newcontainer. if you just want myfolder to show up under mycontainer you need to cd to  /fh/fast/lastname_f  and then run  `swift upload newcontainer myfolder`.

`download` and `delete` work as you might expect:

"download" and untar a compressed file directly into Gizmo's scratch file system (--output -  sends the downloaded file directly to STDOUT )
```
    $ swift download newcontainer samplefile.tar.gz --output - | tar xzv -C $SCRATCH/$SLURM_JOB_ID
````


### Python (swiftclient)

Instead of using the swift command from the unix shell one can also access swift directly from python using the swiftclient python module which is also used by the swift command line client. This is a quick example that writes 100 objects / files to a swift container called prj1. create this container by using the command `swift post prj1` .You can use the `swc auth` command to receive an authentication token for the Python client.

```
#! /usr/bin/env python
# -*- encoding: utf-8 -*-
import os, sys, random
from swiftclient import client as swiftclient

arg=0
if len(sys.argv) > 1:
    arg=sys.argv[1]

object_base_name = "%s-array" % arg
content_base = "asdasdfasdfafaf"
container_name = "prj1"

AUTH = os.environ.get('ST_AUTH')
USER = os.environ.get('ST_USER')
PASSWORD = os.environ.get('ST_KEY')

post_url, post_token = swiftclient.Connection(
    '%s' % (AUTH),
    USER,
    PASSWORD, auth_version=1).get_auth()

#headers = get_headers
#headers['x-auth-token'] = post_token
headers = {'x-auth-token': post_token}
sync_to = post_url + '/' + container_name

for i in range(100):
    x = random.random()
    object_name = "%s-%s" % (object_base_name,i)
    content = "%s-%s" % (content_base,x)
    swiftclient.put_object(sync_to, name=object_name, headers=headers,
                    contents=content)
```


## Other Access Methods

There are many other tools out there that support object storage systems. Swiftstack supports the Swift API and the more common S3 API. To get your credentials for these access methods please use this link https://toolbox.fhcrc.org/sw2srv/swift/account and enter the name of the PI or department account account (e.g. lastname_f).  You may be prompted for your hutchnet ID password.

If you have permissions to see the credentials you will get 3 entries:

    {
     "account": "Swift_lastname_f",
     "key": "abf47sfj48sfrjsrg8usrgj",
     "password": "Huew4jv&jfwvjsdg"
    }

For tools that use S3 protocol you need _account_ and _key_. Use the entry in account for "access key id" and the entry in 'key' for "secret key id". Connect these tools to https://s3.fhcrc.org

For tools that use the Swift protocol you need the account, a password, and an authentication endpoint (a URL used for authenticating your credentials). Use https://xxx.xxxxx.org/auth/v1.0 for this. Replace xxx with the hostname for swift (run `swc auth` to see this hostname)


## How to migrate/archive large data to `Economy Local`

The remainder of this document aims to provide some guidance for researchers interested in creating data archives in `Economy Local`.  Data archive in this document is intended to mean a long term dataset storage location where larger (>1TB) datasets can be stored, perhaps as read only for your group.  


Depending on where the data is being migrated from, different methods work best for archiving datasets in `Economy Local`.  

#### AWS S3 Transfer Bucket

You do not generally need to create a designated S3 bucket for transferring data, although in some cases this may be required.  Please refer to the [S3 documentation](/compdemos/aws-s3/) for more information.

### Physical Drives
In some cases the choice is made to receive large datasets on physical drives, such as a hard drive mailed to you from a data provider.  In this case, the physical drive might not be the best archive for a variety of reasons, but also is not an ideal working copy location either.  

## Archiving Basics

### Archive Types
Two common approaches for data archive types are those that are:
- intended to be used as long term, occasional access, backup type archives where subsets of the entire data collection may be accessed independently.
    - Example:  raw genomic data sets that need to be protected should any corruption or loss of the working copies occur.  
- intended to be used as long term, solely backup in which the entire data collection, should it be accessed, would be accessed in it's entirety.  
    - Example:  a large number of files associated with a project with legal or funding related requirements for retention.  

### Archiving Steps
In order to create an archive the following considerations should be determined for any given dataset collection:
- What is the total size of the dataset and how many individual files are inside it?
- [Where does it make sense to store these data at Fred Hutch](/scicomputing/store_overview/)?
- What type of archive do they need to be in?
- What permissions, for whom does the archive need to have once it's stored?

Migration:
- connect to the data source
- migrate the data
- check to ensure complete, uncorrupted data migration

Decide if you need assistance or if this is a task you can complete yourself.  

### Assisted Archiving

When requesting assistance with archiving your data, you may consider emailing `helpdesk` with the following information:
- What the data source is
- Where you'd like it to be archived
- What type of archive you'd like to create
- What permissions would you like to have on that archive


## Using `fh` Archive Tools yourself

Learn how archive data with little effort using the Gimzo cluster as a Helper.

### Disclaimer

Disclaimer for users who decide to delete data or put it on USB drives, etc:
Before you decide to delete data in order to reduce storage costs please be aware that there may be data retention requirements imposed by the research funding sponsor, other contractual obligations, NIH data sharing and retention requirements (if applicable),  and Center policies. Please contact the Office of the General Counsel if you are in doubt about the retention requirements for your data.

### Overview

When we migrate large amounts of data we have different use cases. First (A) we assume that we have a folder `mydata` that contains medium to large size data. (Many files that are > 1MB up to multiple  GB, scientific datasets, bam files, etc) After that we look for the best way (B) to store smaller files (e.g. source code and small text files, home directories of previous staff).  For further instructions please see How to use Economy File Storage
 . PLEASE NOTE: copying thousands of small files to economy file will be slow and frustrating to manage. Please use method B) if you have many small files.

Still excited to do this yourself ? SciComp offers to move the data for you. All you have to do is send the Fast file source folder and the Economy File target folder and the PI account to use to SciComp @ and the data will be moved for you.

## How do I find out if I have many small files ?

Here we can use the `swc size` command, let's try the bin folder in $HOME which should have a number of smaller files. 

```
petersen@rhino03:~$ swc size ~/bin
    checking posix folder /home/petersen/bin (following symlinks)...
[Errno 2] No such file or directory: '/home/petersen/bin/R2'
    236,505,505 bytes (225.549 MB) in /home/petersen/bin (average file size: 935.070 KB)
    ...including 16,145 bytes (15.767 KB) for links to outside of /home/petersen/bin
    ...including 2,133,551 bytes (2.035 MB) for duplicate inodes inside of /home/petersen/bin
```

We learn 3 things from this information:

- The average file size is small/medium (935 KB or < 1MB>) so method B) may be bettera good fit
- Traversing through the folder structure shows one error. This can have multiple reasons such as permission errors or orphaned symbolic links. We recommend to fix these issues before archiving as this eases validation and size comparisons.
- There are some symlinks pointing to data outside the ~/bin folder. If you choose Method A) it will include that data for uploading (following symlinks) and if you choose method B) it will NOT include that data but it will store the symlinks themselves.

## How can I find my big files?

Please check the [Storage Hotspots Finder](https://storage-hotspots.fhcrc.org/) 

### Preparation

create and switch to a folder where you keep the logs for your archiving activity. We recommend to use a folder Archivelogs in your home directory or in the fast file folder of the PI, eg. /fh/fast/lastname_f/archive/Archivelogs:
use sw2account to switch to the economy file account of your PI.
use 'swc ls' to make sure that the destination does not already exist. data at the destination will be overwritten without asking.

```
    > mkdir ~/Archivelogs
    > cd ~/Archivelogs
    > sw2account lastname_f
    > swc ls /archive/my/target
```  

make sure that 'Archivelogs' is your current directory during the following archiving activities

### Migrating large size files

if you have not done this yet make sure you use the right Economy file account with `sw2account`
before submitting a `swc upload` command to gizmo. Please check if the target folder has a trailing slash or not as this influences where you data is copied to. Also make sure that you request enough wall clock time on gizmo (in the example below 7 days)
check the progress of your copy job using the tail command on the --output file
use the `swc compare` command to make sure that source and target folder have the same size. If the size differs you may run another `swc upload` job
ask your colleaques if the data made it over correctly before you delete the source or ask IT to delete it for you.

```
    $ sbatch -J "copy" --mail-type=ALL -t 7-0 --output=myfolder-archive.txt --wrap="swc upload /myfolder /archive"
    $ tail -f myfolder-archive.txt
    $ swc compare myfolder /archive
```
To make things even easier there is a wrapper script : fhUpload,  which will request 4 Gizmo cores by default, run the upload and finish up with an `swc compare`​​​​ as well as send you an email when the job starts and when it ends.
```
    $ fhUpload /fh/fast/....../human/hg19/2013 /human/hg19/2013
    submitted batch job 27981126
    Upload job submitted to Gizmo. If you would like to monitor progress please use one of these commands:
    swc size "/human/hg19/2013"
    tail -f Upload_.....slurm.log.txt
```

### Migrating / Archiving small and medium size files

After you have gone through the 'Preparation' steps above you just need to use the fhArchive command to archive many small files to Economy.

```
    $ fhArchive

    usage: fhArchive /directory/to/archive /swift/folder /scratch/folder
        ->  compress and archive a directory to economy file
```

You do need to pass a scratch folder as final argument to be able to compare the size of the source with the archive. As the archive is compressed it will have a different size. fhArchive uncompresses the archived data to scratch and then compares the sizes of the original data with the scratch folder.
For example if you would like to archive a sub folder ProjectA in fast file for PI Jane Doe it would look like this:

```
    petersen@rhino1:/home…en/Archivelogs$ fhArchive /fh/fast/doe_j/ProjectA /archive/ProjectA /fh/scratch/delete30/doe_j/archive_verify

    checking economy file swift account, listing containers...
    switching to batchmode
    ..current folder (AUTH_Swift__ADM_SciComp):
    /
    Submitted batch job 55465002
    Archive job submitted to Gizmo. If you would like to monitor progress:
    swc size "/archive/ProjectA" 
    tail -f Archive__fh_fast_doe_j_ProjectA.slurm.log.txt
```

If the sizes of source and destination are not identical, use this command to search for errors:

```
    grep -B5 -A5 -i error Archive__fh_fast_doe_j_ProjectA.slurm.log.txt
```

It is recommended to not archive more than 5 TB per fhArchive command as this increases the likelihood that errors occur and that the process has to be repeated. Also the fhArchive command uses only a single compute node at a time requesting 4 cores by default. It will be faster if you execute fhArchive multiple times, one for each sub directory e.g ProjectA/subproject1, ProjectA/subproject2, etc )


### Checking results

when the job finishes you should get an email from slurm with a subject line similar to this one:
subject: SLURM Job_id=45975375 Name=Arc__fh_fast_doe_j_ProjectA Ended, Run time 00:29:56, COMPLETED, ExitCode 0
then check the output file with the tail command, you want to see something like this:

```
    > tail -f Archive__fh_fast_doe_j_ProjectA.slurm.log.txt

        checking posix folder /fh/fast/doe_j/ProjectA ...
        81,024,500,435 bytes (75.460 GB) in /fh/fast/doe_j/ProjectA
        checking 2nd posix folder /fh/scratch/delete30/doe_j/archive_verify ...
        81,024,500,435 bytes (75.460 GB) in /fh/scratch/delete30/doe_j/archive_verify
    OK! The size of /fh/fast/doe_j/ProjectA and /fh/scratch/delete30/doe_j/archive_verify is identical!
    The data was uploaded and then uncompressed to scratch.
    The sizes of the source directory and the scratch directory should be identical.
```

now you can delete everything under archive_verify. Note that fhArchive does not delete the orginal source data (e.g. under /fh/fast). You need to delete this data after you have confirmed that your data was archived successfully.
`> rm -rf /fh/scratch/delete30/doe_j/archive_verify`

Getting your data back is easy. Note that you do not need to restore the entire archive, you can also just restore a subdirectory. This is possible because "swc archive" creates one tar.gz archive per directory level.
```
    swc unarch /archive/ProjectA/subproject1 /fh/scratch/delete30/doe_j/ProjectA/subproject1
```

### Benefits of Method B

Using Method B) has multiple benefits over Method A) :

- Higher retrieval performance: While the archiving process can either be faster or slower than method A) the download/retrieval is much faster. We have measured a `swc unarch` performance of more than 350 MB/s 
- Lower storage utilization: Method B) compresses data by 30% on average which means 30% lower storage cots  
- 1:1 copy of data: All permissions (including execute bit) are retained which means we can restore an exact copy of the data with all permissions (Note: While permissions are retained upon restore, file owership is only retained if the restore is executed by SciComp staff as a root user.)


