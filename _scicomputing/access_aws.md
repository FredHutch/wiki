---
title: AWS Accounts at Fred Hutch
primary_reviewers: jefftucker, dtenenba
---

Describe overall what will be on this page. 

## AWS accounts

Each lab can be granted their own individual AWS account, giving the members of the lab access to S3 for data storage, AWS Batch for running compute jobs, and many other AWS services.  In general, the lab account is suitable for most AWS usage at Fred Hutch.  The CLD team designated an account "type" for each account, which is used to designate how an AWS account is pre-configured in terms of various AWS services, permissions, restrictions, etc.  The AWS accounts themselves are all regular AWS accounts and as such are no different from the documentation that AWS provides for them.  What differentiates each "type" of account is how the account is pre-configured, what AWS services and regions users are allowed to use, and what restrictions are in place.

### PI Account

The PI Account type is granted to any lab at Fred Hutch that requests one (submit a ticket to the helpdesk).  This account comes pre-configured with S3 buckets for data storage and a default AWS Batch compute environment suitable for running many workflows.  In general, this account type should be suitable for almost all cases where a lab needs to use AWS.  

### General-Purpose Account

A General-Purpose Account type is an AWS account that is mostly empty but allows access to almost all AWS Services with very few restrictions.  The primary restriction is that you will not be able to grant user access to the account, however you can create just about whatever you like in terms of AWS Services.  In general, these accounts are best suited for Software Development Teams to use for specific cloud-hosted software products or potentially developing new workflows.  The other typical usage for these account types is if you are currently conducting a research project that requires a hosted website, dedicated persistent AWS services, or some other similar need exists.  GP accounts are typically only granted to a lab when every single expense that would occur in the account is a Direct and will never be an indirect.

### Proof-of-concept Account

This account type is typically used when a lab has an AWS Credit grant designated for a specific purpose related to determining if a particular technology, workflow, etc. is capable of being run effectively in AWS.  Just because you have AWS Credits does not mean that you need this account type.

## FAQ

I'm a new PI at Fred Hutch or I do not have an AWS account for my lab and I need to store data in S3.  How do I get an account?

Submit a ticket to the helpdesk with the "New Account Checklist" included.

I just joined a lab at Fred Hutch, how do I get access to my lab's AWS account?

Your lab may not have an account yet, so it may be necessary to set one up.  You can get credentials to access your lab account by sending an email to the helpdesk.

I want to collaborate with another Fred Hutch lab so that we can share data.  Is this possible?

Yes, this can be done easily.  The lab that either wants to grant access to the data OR grant access to another lab to receive data should send a ticket to the helpdesk with the lab that they want to collaborate with, the individual members of that lab that should be granted access, a list of S3 bucket folders to which those users should be granted access, and for each folder whether the user needs read, write, or both.

I want to share data with an external collaborator.  Is this possible?

Yes, this can also be done several different ways depending on what that external collaborator needs to do.  First, note that some external collaborators may still be Fred Hutch affiliates or otherwise sponsored by Fred Hutch.  If the person in question has a HutchnetID, then in most cases they are considered an internal collaborator so follow the instructions for requesting access for internal collaborators.  If they do not have a HutchnetID, then submit a ticket to the helpdesk with the External Collaborator checklist.

I need to share data publicly so that anyone in the world can just access it.  Can I do this?

Yes, this is possible for PI accounts.  Your data will need to be in the public bucket in order for it to be shared, however it will NOT automatically be made public just because it is in the public bucket.  You will need to submit a ticket to the helpdesk with the location of the data you wish to be shared and the CLD team will enable public access on just the data that you indicate.

Why would I ever want to share data publicly with anyone?

Certain collaborations for data such as the UCSC Genome Browser require public access to data, so if you wanted to share data with this project then you'll need to have the CLD team enable sharing on the data which must be in your public bucket.  Additionally, if you were to publish a manuscript that included a reference data set that you wanted to be made available to anyone who reads that manuscript, then you may wish to share that reference dataset publicly.

If I want to share data with a specific external collaborator, do I need to use the public bucket?

Not usually.  As long as you want to share data with someone that will have AWS credentials then sharing data can be enabled in the private bucket.  However, you may still grant access specifically for an individual or individuals on data in the public bucket if you would like.

I need transfer or receive a very large dataset to/from an external collaborator.  Is there any way you can help me do this more easily?

First, you should ensure that your data is large enough to benefit from an alternative solution. If the data will fit on a thumb drive that is currently commercially available, it most likely won't benefit from this solution.  If it is larger than a thumb drive, and the data is currently stored in an S3 bucket, and is going to be copied into another S3 bucket, then there is a method that the CLD team can use to do a much faster data transfer that may be viable.  Submit a ticket to CLD or visit our office hours for more information.