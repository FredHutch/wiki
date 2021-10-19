---
title: AWS Accounts at Fred Hutch
primary_reviewers: jefftucker, dtenenba
---

# AWS accounts

Each lab can be granted their own individual AWS account, giving the members of the lab access to S3 for data storage, AWS Batch for running compute jobs, and many other AWS services.  In general, the lab account is suitable for most AWS usage at Fred Hutch.  The CLD team designated an account "type" for each account, which is used to designate how an AWS account is pre-configured in terms of various AWS services, permissions, restrictions, etc.  The AWS accounts themselves are all regular AWS accounts and as such are no different from the documentation that AWS provides for them.  What differentiates each "type" of account is how the account is pre-configured, what AWS services and regions users are allowed to use, and what restrictions are in place.

## PI Account

The PI Account type is granted to any lab at Fred Hutch that requests one (submit a ticket to the helpdesk).  This account comes pre-configured with S3 buckets for data storage and a default AWS Batch compute environment suitable for running many workflows.  In general, this account type should be suitable for almost all cases where a lab needs to use AWS.  

## General-Purpose Account

A General-Purpose Account type is an AWS account that is mostly empty but allows access to almost all AWS Services with very few restrictions.  The primary restriction is that you will not be able to grant user access to the account, however you can create just about whatever you like in terms of AWS Services.  In general, these accounts are best suited for Software Development Teams to use for specific cloud-hosted software products or potentially developing new workflows.  The other typical usage for these account types is if you are currently conducting a research project that requires a hosted website, dedicated persistent AWS services, or some other similar need exists.  GP accounts are typically only granted to a lab when every single expense that would occur in the account is always a direct and will never be an indirect.

## Proof-of-concept Account

This account type is typically used when a lab has an AWS Credit grant designated for a specific purpose related to determining if a particular technology, workflow, etc. is capable of being run effectively in AWS.  Just because you have AWS Credits does not mean that you need this account type.  These are almost always created in the Sandbox environment.

## How do I access my account?

You will need [credentials](/scicomputing/access_credentials/) in order to do so.

## I have more questions

Please check out the [FAQ](/compdemos/cloud-faq/) for more information.
