---
title: Migrating Data from Fast to Economy Local
main_author: John Nyhuis, Dan Tenenbaum
primary_reviewers:
---

This pathway will walk you through the process of moving data from FAST to AWS S3 Economy Cloud.

## Prerequsites and Background:
Understand your storage options
 - [Storage Overview](https://sciwiki.fredhutch.org/scicomputing/store_overview/)
 - [Storage Posix](https://sciwiki.fredhutch.org/scicomputing/store_posix/)
 - [Storage Objectives](https://sciwiki.fredhutch.org/scicomputing/store_objectstore/)

Notes (as of 2022-10-19):
 - Economy local (Swift) has been retired and all data has been migrated to the AWS S3 economy cloud storage.
 - High Security storage (Secure) is being retired as all data is being moved to the new secure storage on Fast.   Fast will soon be approved for confidential data as well as data with minimal confidentiality concerns.
 - Chargeback fees for (Fast) storage are under review and may be reduced or cancelled.

Data that is accessed less than once a month should be stored in the AWS S3 Economy Cloud.
Each PI has been assigned two folders in the S3 Economy Cloud.
 - `fh-PI-Name-eco` is designed to share data within the Fred Hutch
 - `fh-PI-Name-eco-public` is designed to share data within external collaborators.
If you store your data in `fh-PI-Name-eco` and decide to later share it with an external institute or lab, it must be moved from `fh-PI-Name-eco` to `fh-labname-eco-public`.
If you need to access this data from the High Performance Compute Clusters, you will need to move it back to your `fh-PI-Lab` directory on Fast.

## Steps

### Acquire an AWS S3 account associated with your HutchNetID:
Each employee will need AWS credentials to access S3 Economy Cloud.
 - [AWS-Credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)
New hires are assigned AWS credentials as part of onboarding, but if you were hired before this process was added, please send an email to helpdesk@fredhutch.org

### Set Up Motuz to Move Data
Motuz is the recommended tool to transfer data between Fred Hutch data storage locations.
Motuz is available on FHCC Campus or through the VPN at [https://motuz.fredhutch.org](https://motuz.fredhutch.org).
Documentation on Motuz is located here:
 - [Copying Files To Cloud Locations](https://sciwiki.fredhutch.org/compdemos/motuz/#copying-files-to-cloud-locations)

## Add a new Cloud Connection to Motuz

### Amazon S3 Bucket Connection

Before we can use Motuz to move data, we need to add a Cloud Connection which will tell Motuz about our S3 account and bucket.

Every researcher at Fred Hutch has access to an S3 bucket belonging to their lab. If your PI's name is Jane Doe, your lab's bucket would be called `fh-pi-doe-j-eco`.

In Motuz, click the `Cloud Connections` link at the top of the browser window. Then click the `New Connections` button.

![](/assets/motuz/2019-08-23-12-30-33.png)

In the `Basic` section, set `Type` to `Amazon Simple Storage Service (s3)`. Give the connection a name such as `lab s3 bucket`. Optionally enter the bucket name (`fh-pi-doe-j-eco` here is just an example).

In the `Credentials` section, paste your access key ID and secret access key from the credentials you obtained above. You can optionally click `Verify Connection` to make sure the connection works. Then click `Create Cloud Connection`.

## Copying Files to Cloud Locations

You can copy a single file or the contents of a directory.

The Motuz UI consists of two panes. You can actually copy in either direction, but in this case we will copy from left to right, and therefore use the button that points to the right.

First, select the files you want to copy. In this case I want to copy a directory. I navigate from my home directory by clicking the Path widget in the right-hand pane and navigating to the top level directory (`/`):

![](/assets/motuz/2019-08-29-11-57-11.png)

From there I can navigate to the location
of the files I want to copy, under `/fh/fast`.
Note that each user has different permissions and you may not be able to access the files that I can access. Try to copy files in your lab's subdirectory under `/fh/fast`.

Then, in the right-hand pane, choose the cloud connection that you set up earlier:

![](/assets/motuz/2019-08-29-11-59-47.png)

If you want to copy to a sub-folder (prefix)
of the S3 bucket, navigate there (this example uses a bucket you may not have access to; you will be seeing different files/folders
in your PI's bucket).

![](/assets/motuz/2019-08-29-12-02-29.png)

In the left-hand pane, single-click the folder you want to copy to S3:

![](/assets/motuz/2019-08-29-12-03-33.png)

Then click the blue arrow that points to the right:

![](/assets/motuz/2019-08-29-12-03-58.png)

You will see a confirmation screen like this that allows you to enter an optional description of the copy job:

![](/assets/motuz/2019-08-29-12-05-23.png)

Click the `Submit Copy Job` button.

You'll see the copy job's progress shown in the bottom pane:

![](/assets/motuz/2019-08-29-12-06-01.png)

If all goes well, the copy will complete with the status `SUCCESS`.

At any point during or after the copy, you can click this line in the status bar to see more information about the job status:

![](/assets/motuz/2019-08-29-12-08-16.png)

If you change your mind, you can cancel the copy job by clicking the `Stop Job` button.


## Copying from S3 to a shared directory on campus

This is similar to the previous steps; just find the directory you want to copy in the right hand pane, navigate to the place you want to copy to in the left hand pane, and click the blue arrow that points to the left:

![](/assets/motuz/2019-08-29-12-13-27.png)


## Advanced Usage

Motuz also has an API; consult its [documentation](https://github.com/FredHutch/motuz/#how-to-use-the-api). Note that the API endpoint to use with Fred Hutch's instance of Motuz is `https://motuz.fredhutch.org/api/` .

## Problems?

Email `scicomp` or [file an issue in the Motuz repository](https://github.com/FredHutch/motuz/issues/new).
