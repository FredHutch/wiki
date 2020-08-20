---
title: Cloud FAQ
last_modified_at: 2020-08-19
main_author: Jeff Tucker
primary_reviewers: tucker
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

- **How do I get my new credentials?**
  - Initially, when your lab is migrated everyone will receive an encrypted email with their login and temporary password.  It will also contain their AWS access key and secret key (these are the same keys that the `awscreds` command will write to your home directory's `.aws/credentials` file).
  - In the future, you will be able to get your credentials via the `awscreds` command on Rhino or logging into the Toolbox.  SciComp will send an announcement when this changes.
- **How do I get more compute environments created?**
  - Email SciComp with the instance types and sizes that you need and whatever *Project*, *GrantId*, or other Name/value pair that you want to track usage and we'll do the rest.
- **When my data is migrated from the HSE account, will my object tags also be migrated?**
  - Yes, your object tags will be preserved.  You will be able to verify that the tags are correct but in the unlikely event that something goes horribly wrong, the original data will still be preserved in the HSE account in Glacier Deep Archive for at least one year so it will still be possible to fix whatever went wrong.  Contact SciComp if you need assistance with this or if you think that there is an error.
- **Why do I get two buckets for Economy Cloud storage now instead of just one?**
  - While it is technically possible to have public and private data in the same bucket, security is vastly improved by separating these into two different buckets and it is much easier to know what you are sharing publicly and whom you are sharing it with.  In the HSE account, it was impossible to provide two buckets per lab due to fundamental limits in AWS S3.  The new account architecture was designed so that these limits would not be a factor.  Additionally, if you do not need to share any data publicly then you do not need to have a public bucket created.  Contact SciComp for assistance with this.
- **Can I store and use PHI or other sensitive data in my new account like I did in the HSE account?**
  - Generally, yes.  Your S3 buckets will be configured in a way that is HIPAA compliant and your account is covered under our Data Security Agreement with AWS (the BAA).  If you have an application or workflow that needs to access PHI, please contact SciComp to ensure that everything gets set up in a way that's fully compliant.
- **Why am I restricted to only certain prefixes for folders in S3 now?  I never was in the past.**
  - This has to do with how AWS object lifecycles work.  It is not possible to apply a policy globally and then create exceptions to the policy, so instead we chose to use prefixes that are already common to our Fast File storage system.
- **Why was this policy changed in the first place?  Can't I just store data in Economy Cloud wherever I want to?**
  - An analysis was done on the usage patterns for Economy Cloud in the HSE account that determined that 80% of all data stored was never accessed again beyond approximately two weeks after it was created.  We determined with a 99% confidence interval that if a file is more than approximately 30 days old, it will never be accessed again.  As a result, we can reduce the costs of storage drastically by migrating files to Glacier Deep Archive and this will have an extremely low impact on the actual usage of that data.  For cases where you know for a fact that your data will be used again, certain prefixes are available for you to keep that data from being migrated (contact SciComp for assistance).  In the event that you do need to retrieve a file again after 30 days, it can be made available again usually within 6-12 hours (this is the case regardless of how many files you need to retrieve).  At some point, a self-service process will be created to allow you to manage and retrieve your data but for now, SciComp will handle this process for you.
- **What is a scratch bucket for a compute environment and why do I care?**
  - In running a workflow, it is very common that large numbers of temporary files get created that only exist for the duration of the workflow.  Sometimes, if something crashes, these files do not get removed.  Other times, they stick around for far longer than they need to.  Either way, they waste money by sticking around when they are no longer needed.  Also, if versioning is enabled in an S3 bucket, even if you delete them you'll still have to pay for them for some number of days.  A scratch bucket is configured so that objects are not versioned and by default are automatically deleted after 60 days no matter where you put them in the bucket, however the same *delete10/*, *delete15/*, *delete30/*, and *delete45*/ prefixes will exist and will delete objects under those prefixes in the number of days specified.  This is customizable as well, so if you want a *delete3/* folder then we can provide that, however the largest number of custom *deleteN/* prefixes that we are willing to create is 10.  If you truly need more than that, it is likely that a scratch bucket is just not the optimal solution for you so please contact SciComp and we can help to develop a solution that is better suited to your needs.
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
- **I want to apply for the AWS Cloud Credits for Research program and it's asking me for an account number.  What number do I use for the application?**
  - It is not actually necessary to have an AWS account to apply for the grant due to how our new account structure is set up.  Contact SciComp and we will provide you with the correct number to use for your application.
- **I can't start the EC2 instance type that I need or I can't run enough instances to actually complete my workflow analysis before the heat death of the universe.  How do I get those limits raised?**
  - The PI that owns the account or any persons that they designate will have enough permissions to request limit increases for things like EC2 vCPU counts, however SciComp can also help you with this as well.
- **I'm getting a "permission denied" error of some sort when I'm trying to create or modify something, but it looks like I have permissions for what I'm trying to do.  What's going on?**
  - The permissions you see for your AWS IAM User and Group are restricted by Service Control Policies, which define the maximum extent of what actions you can perform.  It is likely that whatever you're trying to do is either a SciComp-managed resource or action, there is a bug in one of the policies, or one of the policies is just overly restrictive and needs to be modified.  Whatever the case, contact SciComp and we'll get it straightened out.
- **I really want to be able to create my own resources or manage my own account.  Why can't I just handle all of that myself?**
  - SciComp currently maintains three separate AWS Environments consisting of dozens of accounts (by the time this is published, it will likely be several hundred), each of which has to be managed, secured, monitored, and configured.  Doing this manually is simply not possible, so we leverage a large amount of automation.  Therefore, a change such as adding a user to a different group will likely just get automatically reverted the next time the automation runs (which is at least nightly but often several times per day).  If you need additional permissions or capabilities, there very well could be a gap between what SciComp offers and what is actually needed so please contact SciComp and we'll work out a solution.  
- **It sounds like SciComp is going to be managing a lot of things now, so if I need something like an additional compute environment or a delete29/ prefix in a scratch bucket, how long will it take for that to be handled?**
  - The entire environment was architected towards making the automation of these tasks extremely simple.  It used to take an entire day to provision a new account, set up user accounts, create S3 buckets, and create a compute environment.  As of the time of this writing, my last benchmark for this process was approximately 7 minutes due to the volume of automation that we have created.  Some requests for things that have to be done manually due to limits on automation (such as verifying an SES email address or creating a totally new domain name for an account to host a website in).  Other things will be entirely new, so automation will need to be created for these cases.  However, the vast majority of things are now substantially less work and take less time to deploy than they previously did and even totally new solutions are still much easier to create due to leveraging the automation.
- **I have a large project that's a collaboration between several different labs.  Who's account will be used for this project?**
  - In cases where there is a large project involving large numbers of different collaborators, it may make sense to create a dedicated account for this specific project.  If you have a project that you think falls under this category, please contact SciComp and we'll determine if it makes sense to create a dedicated account for it and how it should be set up.
- **I work with a number of different labs.  Will I need to have a different username for each of those labs?**
  - No, this is usually not necessary.  Typically you will only have an AWS username/password and access keys for the lab that you work for.  To access accounts owned by other labs, you will be able to assume an IAM Role in the account that has the same name as your IAM username.  When you get access to another account, you will receive a URL that you can use to switch to that role from the console (this URL will generally *never* change).  From the command line or from a client program, you will be able to set up an IAM profile that you can use to simplify this process.  A tutorial on how to do this will be provided at a later time and SciComp is always happy to assist you with getting this set up.
- **Having to assume roles in other accounts sounds complicated.  Isn't there a better way?**
  - This is a much better way in terms of security and usability, even though it may not seem like it from how it sounds.  It's much easier to set up than it sounds (yes, there's a script for that) and almost all programs that interact with the cloud support IAM user profiles for assuming roles.  In the rare occasion where multiple sets of credentials are required then we can create those for you as well, however this will be reserved as a solution of last resort.
