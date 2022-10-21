---
title: Migrating Data from Fast to Economy Cloud
main_author: John Nyhuis
primary_reviewers:
---

This pathway will walk you through the process of moving data from FAST to AWS S3 Economy Cloud.

## Prerequsites and Background:
Familiarize yourself with available storage options
 - [Store Overview](https://sciwiki.fredhutch.org/scicomputing/store_overview/)
 - [Store Posix](https://sciwiki.fredhutch.org/scicomputing/store_posix/)
 - [Store Objectstore](https://sciwiki.fredhutch.org/scicomputing/store_objectstore/)

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
AWS credentials are assigned when each lab is given an AWS account.  If you need AWS Credentials, please send an email to helpdesk@fredhutch.org

### Set Up Motuz to Move Data
Motuz is the recommended tool to transfer data between Fred Hutch data storage locations.
Motuz is available on FHCC Campus or through the VPN at [https://motuz.fredhutch.org](https://motuz.fredhutch.org).
Documentation on Motuz is located here:
 - [Copying Files To Cloud Locations Using Motuz](https://sciwiki.fredhutch.org/compdemos/motuz/#copying-files-to-cloud-locations)

### Copying Data
Motuz does not delete data.

 - Motuz does not delete data on fast when copying data to S3.  After you have verified that your data has been successfully copied to S3, you may directly delete unwanted data from fast.

 - Motuz does not delete data on S3 when copying data to fast.  After you have verified that your data has been successfully copied to fast, you should delete unwanted data from S3 using the AWS cli.

## Advanced Usage

Documentation to aid in using the AWS cli is located here:
[working-with-s3-using-the-aws-cli](https://sciwiki.fredhutch.org/compdemos/AWSCLI_WSL/#working-with-s3-using-the-aws-cli).

Note that the API endpoint to use with Fred Hutch's instance of Motuz is `https://motuz.fredhutch.org/api/` .

## Problems?

Email `scicomp@fredhutch.org`
