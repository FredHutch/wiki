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

### Compute environments

SciComp will create a new Compute Environment for you to use, however it is now possible to create multiple environments if you wish to run multiple different workflows simultaneously or if you need to track usage under different budgets.  You will have some ability to modify the compute environments that SciComp creates, however most changes will now be handled by SciComp to help create a much more uniform deployment that we can better support and maintain.  Additionally, having uniformly configured compute environments helps improve repeatability of running workflows and enables them to more easily be shared.

## Chargebacks for Cloud Computing

**Dirk and Loren, this is the part that you really need to write.**

## FAQ

> NOTE: these questions haven't actually been asked frequently.  This is actually pretty common with FAQs in general.  Still, it might be helpful.


- **How do I get my new credentials?**
  - Hopefully the same way that you got your old ones by using the `awscreds` command on Rhino or by logging into the Toolbox.
- **How do I get more compute environments created?**
  - Email SciComp with the instance types and sizes that you need and whatever *Project*, *GrantId*, or other Name/value pair that you want to track usage and we'll do the rest.
- **What is a scratch bucket for a compute environment and why do I care?**
  - In running a workflow, it is very common that large numbers of temporary files get created that only exist for the duration of the workflow.  Sometimes, if something crashes, these files do not get removed.  Other times, they stick around for far longer than they need to.  Either way, they waste money by sticking around when they are no longer needed.  Also, if versioning is enabled in an S3 bucket, even if you delete them you'll still have to pay for them for some number of days.  A scratch bucket is configured so that objects are not versioned and by default are automatically deleted after 60 days no matter where you put them in the bucket, however the same *delete10/*, *delete15/*, *delete30/*, and *delete45*/ prefixes will exist and will delete objects under those prefixes in the number of days specified.  This is customizable as well, so if you want a *delete3/* folder then we can provide that.
- **Do I need a scratch bucket for each compute environment?**
  - That's entirely up to you.  We can provision a single bucket that's shared between all compute environments.  If you need to track the expenses incurred by these temporary objects with more granularity than a general "Scratch storage" category, then we can set up additional scratch buckets that each have different tags to enable the level of granularity that you need.
- **What are these 'tags' that you keep mentioning?  What's a *Project* or *GrantId* even mean in this context?**
  - AWS enables tracking costs at various levels of detail.  At a minimum, anything spent in your account is guaranteed to have been spent by you; it is not possible that someone else could accidentally incur charges in your account.  However, in some cases it is necessary to pay for different projects from different budget categories.  The solution that enables a more granular breakdown of expenses is called *Cost Allocation Tags* and are basically a set of tags that, if applied to a resource, will cause all costs associated with that resource to get tracked by the value of that tag.  Currently, your choices for tag names are *Project*, *GrantId*, and *Owner*, however you can set any value you like and you can use these tags in any combination.  For example, if I have a project called Foo and I need to track not only the total costs for that project but also the costs created by individual users in the account, I could use the same *Project: Foo* tag on everything used and set a unique *Owner: Joe Snuffy* tag on only those things used by Joe Snuffy.  At the end of the month, you'll receive the chargebacks for your costs which will include a csv file that contains charges based on whatever tags you specify and their values.
- **Can you guarantee that resources are always tagged properly for tracking costs?**
  - Possibly.  SciComp is able to ensure that certain tags are created on certain types of resources and will deny permission to create the resource if those tags are not present or do not have a particular value (or one value out of a set of values).  Additionally, acounts are monitored and anything that is not tagged properly will be flagged as non-compliant so that they can be corrected more proactively.  However, not every single resource is able to be tagged when it is created and it is not possible to prevent people from choosing a valid, yet incorrect tag value.  If you have specific requirements for your accounts, contact SciComp.
- **Can I set a fixed budget amount per month for certain resources using Tags and then get alerts as I go through that budget?**
  - In most cases, this is possible.  Budgets can be set up monthly, quarterly, yearly, or for a set time period.  They are typically set based on the AWS Service and can also incorporate Cost Allocation Tags so you can track different projects under different budgets.  It will be possible to set percentage thresholds when you will receive an email alert.  **THERE IS A POTENTIAL DELAY IN WHEN YOU WOULD RECEIVE THE EMAIL AND WHEN THE CHARGES ARE INCURRED** so it is possible that by the time you get the alert that you're at 95% of your budget, you're actually exceeding your budget.  Typically this delay is at most 24 hours.  Contact SciComp for more details.
- **Can I designate people in my lab to have a higher level of access to AWS Services for configuring things, viewing budgets, seeing alerts, etc?**
  - Yes, however there are limits as to what permissions can be given to users in an account.  Additionally, there are permissions boundaries in place at higher levels that will restrict your access, even if you have full Administrator permissions.  For example, you will not be able to create a new VPC or create a Route53 Hosted Zone in your account.  If you need things like this, contact SciComp.
