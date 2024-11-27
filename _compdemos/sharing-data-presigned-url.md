---
title: Generating Pre-Signed URLs
primary_reviewers: scicomp
---

In AWS (Amazon Web Services), pre-signed Uniform Resource Locators ({% glossary URL%}) are a way that users can control and share access to specific objects in S3 buckets. Often, they are used for one-time sharing of files between users or for applications that require a specific URL to read data from an object.

The pre-signed URL process requires the following info from you to generate it: 

 - An Amazon S3 bucket 
 - An object key (if downloading this object will be in your Amazon S3 bucket, if uploading this is the file name to be uploaded) 
 - An HTTP method (GET for downloading objects or PUT for uploading) 
 - An expiration time interval 

## Why use a pre-signed URL? 

Pre-signed URLs are useful for quickly sharing objects without updating your S3 bucket policy or security settings. They are also useful for when other parties want to upload objects to your bucket, but do not have permission. In addition, they can be HTTP (public), or HTTPS (private) URLs depending on your need and can expire based on the date you provide when creating it. 

## What should I be careful about when using a pre-signed URL? 

It can be difficult to track who has access via a pre-signed URL, once it is created. Therefore, be extremely cautious about what kinds of objects you choose to share, and to whom. A bad actor that obtains your pre-signed URL can access your data for as long as the URL is active. Per Fred Hutch Information Security, presigned URLS should only be used for sharing non-sensitive data (e.g., no PHI), due to the security risks involved with generating an untracked URL.

Pre-signed URLs are also time-barred and will become inactive after a period of time- the longest a URL will be valid is 7 days.  The URL will expire and it will be necessary to create a new signed URL.

For more systematic collaboration between groups, a better route would be to contact your IT (Information Technology) Helpdesk and ask for an S3 bucket policy to be created that will allow for collaborator access.

## How do I get started using pre-signed URLs? 

Instructions on how to generate pre-signed URLS via the AWS Console, the AWS CLI (Command Line Interface), AWS SDK, AWS Toolkit for VS Code, and AWS Explorer for Visual Studio in Windows are available from AWS:

[Sharing objects with pre-signed URLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ShareObjectPreSignedURL.html)

[Working with pre-signed URLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html)

[Creating a pre-signed URL with Cyberduck or MountainDuck](https://docs.cyberduck.io/protocols/s3/#pre-signed-temporary-urls)

## How do I use a pre-signed URL?

A pre-signed URL can be used as any other "regular" URL- you can paste it into the address bar of a web-browser or using command line tools like `wget` and `curl`.

