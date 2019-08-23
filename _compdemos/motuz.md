---
title: Using Motuz to Move Data
last_modified_at: 2019-08-22
main_author: Dan Tenenbaum
primary_reviewers: dtenenba
---

# Overview

This demo provides specific examples of how to use the new tool, Motuz, to transfer data between Fred Hutch data storage locations.  

## Accessing Motuz

Motuz is available at 

[https://motuz.fredhutch.org](https://motuz.fredhutch.org)

This link is only accessible from the campus network. If you are off campus you will need
to use VPN.

Log in with your HutchNet ID and password.

At this time, Motuz allows copying of files/objects between the following file storage systems (with more to come):

* Shared file systems on campus (your home directory, `/fh/fast`, `/fh/scratch`)
* [Amazon S3](https://aws.amazon.com/s3/)
* [Azure Blob Storage](https://aws.amazon.com/s3/)
* [Google Cloud Bucket](https://cloud.google.com/storage/docs/json_api/v1/buckets)
* [Swift](/compdemos/Economy-storage/) (Economy Local Storage)

This demo will focus on moving files between 
shared file systems on campus and Amazon S3.

## Add a new Cloud Connection to Motuz

Before we can use Motuz to move data, we need to add a Cloud Connection
which will tell Motuz about our S3 account and bucket.

Every researcher at Fred Hutch has access to 
an S3 bucket belonging to their lab. If your PI's name is Jane Doe, your lab's bucket would be called `fh-pi-doe-j`. 

Each researcher also has credentials to access 
this bucket. See [the documentation](/scicomputing/access_credentials/#gui-instructions) for how to obtain these credentials.

In Motuz, click the `Cloud Connections` link at the top of the browser window. Then click the `New Connections` button. 

![](/assets/motuz/2019-08-23-12-30-33.png)

In the `Basic` section, set `Type` to `Amazon Simple Storage Service (s3)`. Give the connection a name such as `lab s3 bucket`. Optionally enter the bucket name (`fh-pi-doe-j` here is just an example).

In the `Credentials` section, paste your access key ID and secret access key from the credentials you obtained above. You can optionally click `Verify Connection` to make sure the connection works. Then click `Create Cloud Connection`.


