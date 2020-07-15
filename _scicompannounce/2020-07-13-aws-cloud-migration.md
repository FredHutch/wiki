---
title: AWS Cloud Migration
---

We're currently getting ready to migrate to our new AWS environment!  This new environment will provide many benefits over the current account structure and enable SciComp to deliver better solutions for Economy Cloud storage, sharing data, running compute jobs in AWS Batch with various workflow engines (e.g. Nextflow, Cromwell), and whatever solutions continue to evolve in the exciting world of Scientific Computing in the Cloud.

## What's changing?

Every Lab will receive their own dedicated AWS account.  This means a few things will change and you'll also have access to a few new features.
Here's a brief overview of what will change:

- All AWS S3 buckets will have a new name.  Data from the current HSE account will be migrated to these new buckets
- All access credentials will change.  You'll need a new Access Key and Secret Key.
- Some of your data may move to a different top-level folder in S3.
- Each account will have their own dedicated AWS Batch Compute Environment.

## What's new?

There are a lot of things that you will be able to do with your new account that was not possible before.
Here are some highlights:

- Everyone will have access to the AWS Console (you will need to enable MFA authentication)
- You can now have multiple AWS Batch Compute Environments for running different projects if desired.  SciComp will even create them for you!
- Accessing public S3 buckets in other accounts will be much easier.
- Sharing data with external collaborators will be much easier.
- Tracking and controlling costs for various services will now be possible.  You'll even be able to have budgets with alert thresholds as you incur charges on various AWS Services.
- The new accounts have improved security, monitoring, and alertings.  Most of these improvements will be completely transparent to you and are managed by SciComp, however some of these changes can help to enable better control over your own account and ensure compliance around things such as data storage.
- You will now be able to spend your own budgets and allocate funds for Cloud Computing and manage these expenses.  You can track them under a unique *Project*, *GrantId*, a combination of those two things, or under another tag.  

## What isn't changing?

Some things will remain approximately the same as they were before in your new account.

- The Economy-Cloud storage charges will not change.  If you have both a public and private S3 bucket, you will be charged for the total amount of data so there will be no difference in cost under that model.  The only difference is in improved security and accessibility of data that you wish to share, either publically, with certain external collaborators, or with other labs.
- Accessibility of your data is still restricted to the Fred Hutch IP address space, so you will need to be on the VPN to access your private bucket.
- The general setup of your AWS Batch Compute Environment will be the same, so any workflows that you were using will still function like they always did.
- Motuz can still be used with your new account.
- Your new account will still be covered under the Fred Hutch BAA, so you will be able to store any data that requires a higher level of compliance.

## What happens now and what do I need to do?

SciComp will contact each lab currently using AWS in the HSE account to help you with the migration and ensure that everything will go as smoothly as possible.  Your data will need to migrate to the new S3 bucket(s) in your new account.  There are two ways in which this can happen.

- **SciComp helps you migrate your data**

    - In this option, SciComp will sync your S3 bucket in the HSE account to your new bucket.  You can still access your data in the HSE account during this time, however all access will be read-only once the migration starts.  Any object tags that you have will be preserved.  If it's necessary to move any data to new folders in S3, we will handle this for you and coordinate where things are stored to ensure that everything is preserved and nothing is lost.

- **You migrate your own data**

    - With this option, you will receive credentials for your new account and you will need to migrate your data yourself.  If you think that you may have a lot of data that you don't need or have multiple copies of various files, this could be a good opportunity to only migrate what you actually want to keep.  You will have a limited amount of time to do the migration and SciComp will be happy to assist you if necessary.  When you are done, just let us know and we'll finallize everything.

Under either option, your existing data in the HSE account bucket will be preserved for a short while, after which it will be transitioned into Glacier Deep Archive and retained for *one year*.  After *one year* that data will be permanently deleted.  If you discover that something did not copy over correctly for whatever reason, we will be able to retreive it from your previous bucket and move it again at any time.