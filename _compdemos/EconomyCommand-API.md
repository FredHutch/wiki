---
title: Using the command line/API for Accessing Economy Local Storage
last_modified_at: 2018-09-27
main_author: Dirk Peterson
primary_reviewers: dirkpetersen
---
Access to data stored in Fred Hutch resources that are [object stores](/computing/store_objectstore/) can be achieved via command line tools or the API.

## Accessing `Economy File` directly via Object API

This is an overview available tools starting with the ones you will most likely use and that are best supported.

## swc (swift commander - simple access)
Using the swc command is the simplest way of accessing the swift object store. The tool includes easy to use sub commands such as swc upload and swc download as well as simplified versions of standard unix tools such as ls, cd, rm, etc. By using swc you can ignore most of the peculiarities of the swift object storage system and (almost) work with it like a traditional file system. It is the best option for HPC scripting and automation.

First, let's invoke the swc command and see what it has to offer:

```
gizmod16:~> swc
*** Swift credentials not set. ***
Please execute 'sw2account <accountname>' to get credentials.
Use 'sw2account --save <accountname>' to set them as default.
```

Swift requires certain environment variables to be set for each PI.  You can easily set them by using the 'sw2account' command which asks for your HutchNet password:

    rhino04:~> sw2account groudine_m

now let's try running 'swc' again, still without any command options, you are prompted for your hutchnet password:
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
swc upload /local/folder /swift/folder
swc upload --symlinks /local/folder /swift/folder (save symlinks)
swc compare /local/folder /swift/folder
swc download /swift/folder /scratch/folder
swc download /swift/folder $TMPDIR
swc rm /archive/some_prefix
swc more /folder/some_file.txt
swc openwith emacs /folder/some_file.txt
```

OK, we see that there are some options, the swc command has nearly 30 sub commands. Let's upload a folder called 'testing' that is stored somewhere on fast file. The target folder on economy file is called /test:

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

let's make sure that the data is really there by comparing the size of the local folder with the swift folder:

```
petersen@rhino02:~/sc$ swc compare ./testing /test
    checking swift folder test ...
    3,180,498,696 bytes (2.962 GB) in test (swift)
    checking posix folder ./testing/ ...
    3,180,498,696 bytes (2.962 GB) in ./testing
OK! The size of ./testing and /test is identical!
```

now let's download a subfolder of that folder /test to our scratch file system for further processing:

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

please check our HPC and data migration tutorials in the scicomp wiki at http://scicomp.fhcrc.org and the swc page on github for additional details:


- [How to migrate large data to Economy File](/compdemos/Economy-local-large/)
- [swift commander on github](https://github.com/FredHutch/swift-commander)
- [Check out this video how to the swc command](https://asciinema.org/a/17172)


## R swift client

The R swift package allows to upload and download files to swift directly from R. This greatly improves usability from interactive R sessions
if you do *not* work on a SciComp supported Linux computer you need to install the R swift package first:

```
> install.packages('devtools',repos='http://cran.fhcrc.org')
> devtools::install_github("mtmorgan/swift")
interacting with the object stop is pretty easy. If your credentials are set (see above) you can start right away. In this case we (1) list the content of the SciComp swift container, (2) download a file and (3) upload a results file.
> library('swift')
>
> swlist('SciComp')
        size              last_modified                                 name
1    20.8 Mb 2014-12-08T07:01:27.141470                annotationhub.sqlite3
2     725 Kb 2014-12-08T06:54:18.677440                       tmp/squeue.txt
3     7.9 Kb 2014-12-08T06:54:18.974290                         tmp/test.csv

> myfile <- swdownload('SciComp','tmp/squeue.txt')
> myobject <- read.table(myfile)
>
> ....processing
>
> newfile <- paste0(myfile,'.csv')
> write.csv(myobject, newfile, row.names=FALSE)
> swupload('SciComp',newfile)
>
##### and even easier: use swread to load a file directly from swift into memory ######
> myobj <- swread('SciComp','tmp/squeue.txt')
> mydf <- swread('SciComp','tmp/test.csv')

# a csv file always loads into a dataframe
Limitations and Notes:
only supports files with sizes less than 5GB
```

## Swift standard client (python)

The swift client allows you to read and write files in your containers directly without mounting the container in the file system.  This is particularly handy for scripting and automation. The swift client is used by swc 'under the hood' and offers more options than swc but it is also slighly more difficult to use.  Do not use this tool if swc meets your needs.

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
The easiest way to get credentials to Swift Economy File storage on SciComp system is using the command sw2account with the id of the PI as an argument (sw2account lastname_f) . It is recommend that you use the sw2account command to save the credentials of the PI account you mostly work with.

    $ sw2account --save groudine_m

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
you can upload an entire folder structure using the swift upload command. swift will recreate the entire folder structure you send on the command line. If you run "swift upload -S 2g newcontainer /fh/fast/lastname_f/myfolder" it will create the entire folder structure /fh/fast... under newcontainer. if you just want myfolder to show up under mycontainer you need to cd to  /fh/fast/lastname_f  and then run  "swift upload newcontainer myfolder"

"download" and "delete" work as you might expect:

"download" and untar a compressed file directly into Gizmo's scratch file system (--output -  sends the downloaded file directly to STDOUT )

    $ swift download newcontainer samplefile.tar.gz --output - | tar xzv -C $SCRATCH/$SLURM_JOB_ID

## Limitations and Notes

 - Files larger than 5GB require segmentation.  The value indicated with the "-S" argument is the size that files will be split into on the object store.  A segment size may be any value up to 5GB.  A reasonable default value is -S 2G which sets the maximum segment size to 2 GB, which means a file of 10GB size will be split into 5 segments.
 - using multiple segments will increase upload speeds (and downlaod speeds in the future), setting the segment size to 1GB on a 10GB file can increase the theoretical upload performance 10 fold
 - Swift commands that fail don't set a return code, which could complicate scripting.
 - You can't delete a directory in a container. When you delete the last file from the directory, swift deletes the directory automatically.  However, swift will delete a container with files still in it, so be careful what you delete.

## Amazon S3 (boto)

Swift has an Amazon S3 compatiblity layer that supports most of the S3 API. boto is a very popular python library that allows you to interact with S3 compatible object stores. It is currently installed on most scientific computing systems such as the rhinos and gizmo nodes. The current version this boto3. You can also install it on your own system:

On SciComp systems boto3 is already in the latest Python, just load the module

    $ ml Python

or you install boto within virtualenv, please check the scicomp wiki for "Manage Python environments using virtualenv"

Please see this detailed and current example for boto3 in the scicomp wiki:

### Boto3 access to Economy File

The client method below is a little  older and exposes more low level access to s3. It should not be required for most access.

To use this method, put your credentials into a text file (.e.g.  ~/.aws/s3.fhcrc.org) separated by colon:

    echo "accountname:secretkey" > ~/.aws/s3.fhcrc.org

then you run your first example: using Boto to list your existing storage containers (buckets):

```
#! /usr/bin/env python3

import boto3, os

with open(os.path.expanduser('~/.aws/s3.fhcrc.org'), 'r') as f:
    access_key_id, secret_access_key = f.readline().strip().split(':')

s3client = boto3.client('s3',
        endpoint_url='https://s3.fhcrc.org',
        aws_access_key_id = access_key_id,
        aws_secret_access_key = secret_access_key)

l = s3client.list_buckets()
print(l)

boto3 is the current and recommeded version of boto, however you will still find many examples for boto, the legacy version of the library
import boto.s3.connection

connection = boto.s3.connection.S3Connection(
    aws_access_key_id='EC2_ACCESS_KEY or USERNAME',
    aws_secret_access_key='S3 API KEY',
    port=443,
    host='s3.fhcrc.org',
    is_secure=True,
    validate_certs=False,
    calling_format=boto.s3.connection.OrdinaryCallingFormat()
)

b=connection.create_bucket('mybucket')

buckets = connection.get_all_buckets()
print buckets
```

There is more detailed documentation about boto available [here](http://boto.s3.amazonaws.com/s3_tut.html)

## Python (swiftclient)

Instead of using the swift command from the unix shell one can also access swift directly from python using the swiftclient python module which is also used by the swift command line client. This is a quick example that writes 100 objects / files to a swift container called prj1. create this container by using the command `swift post prj1`

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


## Access From the Command Line or REST API

Economy File supports several access methods:

## Direct Access / Linux / Rhino

Please see How to Access the Swiftstack Object store to learn about direct Access via API or command line tools. If you want to use data from Economy File on the Gizmo cluster or from the Rhinos this is your preferred access method.

## Other Access Methods

There are many other tools out there that support object storage systems. Swiftstack supports the Swift API and the more common S3 API. To get your credentials for these access methods please use this link https://toolbox.fhcrc.org/sw2srv/swift/account and enter the name of the PI or department account account (e.g. lastname_f).  You may be prompted for your hutchnet ID password.

If you have permissions to see the credentials you will get 3 entries:

    {
     "account": "Swift_lastname_f",
     "key": "abf47sfj48sfrjsrg8usrgj",
     "password": "Huew4jv&jfwvjsdg"
    }

For tools that use S3 protocol you need _account_ and _key_. Use the entry in account for "access key id" and the entry in 'key' for "secret key id". Connect these tools to https://s3.fhcrc.org

For tools that use the Swift protocol you need the account, a password, and an authentication endpoint (a URL used for authenticating your credentials). Use https://tin.fhcrc.org/auth/v1.0 for this.
