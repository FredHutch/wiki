---
title: Cloud FAQ
last_modified_at: 2020-08-19
main_author: Jeff Tucker
primary_reviewers: jefftucker
---

FIXME JEFF: check to see if any of this info needs to be included on main pages

This resource page attempts to consolidate all information available about cloud computing,
as well as answering general questions about how our current research cloud computing developed.

## Cloud Resources

FIXME KATE: format, include links, order appropriately

- Basic introduction to cloud computing 
(links specific sections in the pages below,
intended for people new to cloud and/or computing)
    - _drafts/cloud_pathway.md

- Obtaining permission, credentials, and access to cloud resources
    - _scicomputing/access_credentials.md

- Announcement about transition in Fred Hutch's approach to cloud computing,
from summer 2020
    - _scicompannounce/2020-07-13-aws-cloud-migration.md

- Data storage in AWS S3
    - page: _scicomputing/store_objectstore.md
    - page: _scicomputing/store_scratch.md
    - demo: _compdemos/Economy-storage.md
    - demo: _compdemos/aws-s3.md

- Cloud computing 
    - page: _scicomputing/compute_cloud.md
    - demo: _compdemos/aws-batch.md
    - demo: _compdemos/ucsc-track-s3.md

- Applying cloud credits to research
    - page: _scicomputing/compute_grants.md
    - demo: _compdemos/aws-credits.md

## Frequently Asked Questions

> NOTE: these questions haven't actually been asked frequently.  This is actually pretty common with FAQs in general. 
> Still, it might be helpful if you're interested in the hows and whys of our current policies.

### Account Access

- **I'm a new PI at Fred Hutch or I do not have an AWS account for my lab and I need to store data in S3.  How do I get an account?**

  - Submit a ticket to the helpdesk with the "New Account Checklist" included.

- **I just joined a lab at Fred Hutch, how do I get access to my lab's AWS account?**

  - Your lab may not have an account yet, so it may be necessary to set one up.  You can get credentials to access your lab account by sending an email to the helpdesk.  You will receive an encrypted email with your credentials and instructions for how to access the account.

### S3 (Economy Cloud) storage

- **Why do I get two buckets for Economy Cloud storage now instead of just one?**

  - While it is technically possible to have public and private data in the same bucket, security is vastly improved by separating these into two different buckets and it is much easier to know what you are sharing publicly and whom you are sharing it with.  In the HSE account, it was impossible to provide two buckets per lab due to fundamental limits in AWS S3.  The new account architecture was designed so that these limits would not be a factor.  Additionally, if you do not need to share any data publicly then you do not need to use your public bucket.

- **Can I store and use PHI or other sensitive data in my account?**

  - Generally, yes.  Your S3 buckets will be configured in a way that is HIPAA compliant and your account is covered under our Data Security Agreement with AWS (the BAA).  If you have an application or workflow that needs to access PHI, please contact CLD to ensure that everything gets set up in a way that's fully compliant.

- **If I want to share data with a specific external collaborator, do I need to use the public bucket?**

  - Not usually.  As long as you want to share data with someone that will have AWS credentials then sharing data can be enabled in the private bucket.  However, you may still grant access specifically for an individual or individuals on data in the public bucket if you would like.

- **I need to share data publicly so that anyone in the world can just access it.  Can I do this?**

  - Yes, this is possible for PI accounts.  Your data will need to be in the public bucket in order for it to be shared, however it will NOT automatically be made public just because it is in the public bucket.  You will need to submit a ticket to the helpdesk with the location of the data you wish to be shared and the CLD team will enable public access on just the data that you indicate.

- **Why would I ever want to share data publicly with anyone?**

  - Certain collaborations for data such as the UCSC Genome Browser require public access to data, so if you wanted to share data with this project then you'll need to have the CLD team enable sharing on the data which must be in your public bucket.  Additionally, if you were to publish a manuscript that included a reference data set that you wanted to be made available to anyone who reads that manuscript, then you may wish to share that reference dataset publicly.

- **I need transfer or receive a very large dataset to/from an external collaborator.  Is there any way you can help me do this more easily?**

  - First, you should ensure that your data is large enough to benefit from an alternative solution. If the data will fit on a thumb drive that is currently commercially available, it most likely won't benefit from this solution.  If it is larger than a thumb drive, and the data is currently stored in an S3 bucket, and is going to be copied into another S3 bucket, then there is a method that the CLD team can use to do a much faster data transfer that may be viable.  Submit a ticket to CLD or visit our office hours for more information.

- **Why am I restricted to only certain prefixes for folders in S3 now?  I never was in the past.**

  - This has to do with how AWS object lifecycles work.  It is not possible to apply a policy globally and then create exceptions to the policy, so instead we chose to use prefixes that are already common to our Fast File storage system.

- **What is a scratch bucket for a compute environment and why do I care?**

  - In running a workflow, it is very common that large numbers of temporary files get created that only exist for the duration of the workflow.  Sometimes, if something crashes, these files do not get removed.  Other times, they stick around for far longer than they need to.  Either way, they waste money by sticking around when they are no longer needed.  Also, if versioning is enabled in an S3 bucket, even if you delete them you'll still have to pay for them for some number of days.  A scratch bucket is configured so that objects are not versioned and by default are automatically deleted after 60 days no matter where you put them in the bucket, however the same *delete10/*, *delete15/*, *delete30/*, and *delete45*/ prefixes will exist and will delete objects under those prefixes in the number of days specified.  This is customizable as well, so if you want a *delete3/* folder then we can provide that, however the largest number of custom *deleteN/* prefixes that we are willing to create is 10.  If you truly need more than that, it is likely that a scratch bucket is just not the optimal solution for you so please contact CLD and we can help to develop a solution that is better suited to your needs.

### AWS Compute

- **How do I get more compute environments created?**

  - Email SciComp with the instance types and sizes that you need and whatever *Project*, *GrantId*, or other Name/value pair that you want to track usage and we'll do the rest.

- **I can't start the EC2 instance type that I need or I can't run enough instances to actually complete my workflow analysis before the heat death of the universe.  How do I get those limits raised?**

  - The PI that owns the account or any persons that they designate will have enough permissions to request limit increases for things like EC2 vCPU counts, however CLD can also help you with this as well.

- **Do I need a scratch bucket for each compute environment?**

  - That's entirely up to you.  We can provision a single bucket that's shared between all compute environments.  If you need to track the expenses incurred by these temporary objects with more granularity than a general "Scratch storage" category, then we can set up additional scratch buckets that each have different tags to enable the level of granularity that you need.

### AWS Credits and Billing

- **What are virtual credits and how are they different from AWS credits?  What do I even do if I have been given a credit grant from AWS?**

  - Please see the [Credits page](compdemos/aws-credits/) for more information.

- **I want to apply for the AWS Cloud Credits for Research program and it's asking me for an account number.  What number do I use for the application?**

  - It is not actually necessary to have an AWS account to apply for the grant due to how our new account structure is set up.  Contact CLD and we will provide you with the correct number to use for your application.

- **Can I set a fixed budget amount per month for certain resources using Tags and then get alerts as I go through that budget?**

  - In most cases, this is possible.  Budgets can be set up monthly, quarterly, yearly, or for a set time period.  They are typically set based on the AWS Service and can also incorporate Cost Allocation Tags so you can track different projects under different budgets.  It will be possible to set percentage thresholds when you will receive an email alert.  **THERE IS A POTENTIAL DELAY IN WHEN YOU WOULD RECEIVE THE EMAIL AND WHEN THE CHARGES ARE INCURRED** so it is possible that by the time you get the alert that you're at 95% of your budget, you're actually exceeding your budget.  Typically this delay is at most 24 hours.  Contact SciComp for more details.

- **What are these 'tags' that you keep mentioning?  What's a *Project* or *GrantId* even mean in this context?**

  - AWS enables tracking costs at various levels of detail.  At a minimum, anything spent in your account is guaranteed to have been spent by you; it is not possible that someone else could accidentally incur charges in your account.  However, in some cases it is necessary to pay for different projects from different budget categories.  The solution that enables a more granular breakdown of expenses is called *Cost Allocation Tags* and are basically a set of tags that, if applied to a resource, will cause all costs associated with that resource to get tracked by the value of that tag.  Currently, your choices for tag names are *Project*, *GrantId*, and *Owner*, however you can set any value you like and you can use these tags in any combination.  For example, if I have a project called Foo and I need to track not only the total costs for that project but also the costs created by individual users in the account, I could use the same *Project: Foo* tag on everything used and set a unique *Owner: Joe Snuffy* tag on only those things used by Joe Snuffy.  At the end of the month, you'll receive the chargebacks for your costs which will include a csv file that contains charges based on whatever tags you specify and their values.

- **Can you guarantee that resources are always tagged properly for tracking costs?**

  - Possibly.  CLD is able to ensure that certain tags are created on certain types of resources and will deny permission to create the resource if those tags are not present or do not have a particular value (or one value out of a set of values).  Additionally, acounts are monitored and anything that is not tagged properly will be flagged as non-compliant so that they can be corrected more proactively.  However, not every single resource is able to be tagged when it is created and it is not possible to prevent people from choosing a valid, yet incorrect tag value.  If you have specific requirements for your accounts, contact SciComp.

### AWS User Permissions

- **Can I designate people in my lab to have a higher level of access to AWS Services for configuring things, viewing budgets, seeing alerts, etc?**

  - Yes, however there are limits as to what permissions can be given to users in an account.  Additionally, there are permissions boundaries in place at higher levels that will restrict your access, even if you have full Administrator permissions.  For example, you will not be able to create a new VPC or create a Route53 Hosted Zone in your account.  If you need things like this, contact CLD.

- **I'm getting a "permission denied" error of some sort when I'm trying to create or modify something, but it looks like I have permissions for what I'm trying to do.  What's going on?**

  - If you are logging into your account for the first time, you will need to set up MFA on your login in order to do anything within AWS.  After setting MFA up, you need to log out and then log back in with MFA.  If you are seeing lots of permissions errors then the most common cause of that is not logging out and logging back in with MFA, so this should be the first thing you try.

  - The permissions you see for your AWS IAM User and Group are restricted by Service Control Policies, which define the maximum extent of what actions you can perform.  It is likely that whatever you're trying to do is either a CLD-managed resource or action, there is a bug in one of the policies, or one of the policies is just overly restrictive and needs to be modified.  Whatever the case, contact CLD and we'll get it straightened out.

- **I really want to be able to create my own resources or manage my own account.  Why can't I just handle all of that myself?**

  - CLD currently maintains five separate AWS Environments consisting of over 100 accounts, each of which has to be managed, secured, monitored, and configured.  Doing this manually is simply not possible, so we leverage a large amount of automation.  Therefore, a change such as adding a user to a different group will likely just get automatically reverted the next time the automation runs (which is at least nightly but often several times per day).  If you need additional permissions or capabilities, there very well could be a gap between what CLD offers and what is actually needed so please contact CLD and we'll work out a solution.

### Collaborators, sharing data, and working with other labs

- **I want to collaborate with another Fred Hutch lab so that we can share data.  Is this possible?**

  - Yes, this can be done easily.  The lab that either wants to grant access to the data OR grant access to another lab to receive data should send a ticket to the helpdesk with the lab that they want to collaborate with, the individual members of that lab that should be granted access, a list of S3 bucket folders to which those users should be granted access, and for each folder whether the user needs read, write, or both.

- **I want to share data with an external collaborator.  Is this possible?**

  - Yes, this can also be done several different ways depending on what that external collaborator needs to do.  First, note that some external collaborators may still be Fred Hutch affiliates or otherwise sponsored by Fred Hutch.  If the person in question has a HutchnetID, then in most cases they are considered an internal collaborator so follow the instructions for requesting access for internal collaborators.  If they do not have a HutchnetID, then submit a ticket to the helpdesk with the External Collaborator checklist.

- **I have a large project that's a collaboration between several different labs.  Who's account will be used for this project?**

  - In cases where there is a large project involving large numbers of different collaborators, it may make sense to create a dedicated account for this specific project.  If you have a project that you think falls under this category, please contact CLD and we'll determine if it makes sense to create a dedicated account for it and how it should be set up.

- **I work with a number of different labs.  Will I need to have a different username for each of those labs?**

  - No, this is usually not necessary.  Typically you will only have an AWS username/password and access keys for the lab that you work for.  To access accounts owned by other labs, you will be able to assume an IAM Role in the account that has the same name as your IAM username.  When you get access to another account, you will receive a URL that you can use to switch to that role from the console (this URL will generally *never* change).  From the command line or from a client program, you will be able to set up an IAM profile that you can use to simplify this process.  A tutorial on how to do this will be provided at a later time and SciComp is always happy to assist you with getting this set up.

- **Having to assume roles in other accounts sounds complicated.  Isn't there a better way?**

  - This is a much better way in terms of security and usability, even though it may not seem like it from how it sounds.  It's much easier to set up than it sounds (yes, there's a script for that) and almost all programs that interact with the cloud support IAM user profiles for assuming roles.  In the rare occasion where multiple sets of credentials are required then we can create those for you as well, however this will be reserved as a solution of last resort.
