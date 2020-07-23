---
title: Using AWS Cloud Credits
last_modified_at: 2020-07-23
main_author: Jeff Tucker
primary_reviewers: tucker, dtenenba
---

If you have received cloud credits from AWS, you will probably need a different AWS account type in order to apply those credits in our Sandbox environment.

# Sandbox cloud accounts

In order for you to use AWS credits, you will need to have an account in the Sandbox environment where you can apply those credits.  Sandbox accounts are created by SciComp and you can request as many Sandbox accounts as you need depending on how many credit grants you have available.

## Requesting a Sandbox account

To request a Sandbox account, please submit a ticket to SciComp that includes the following information:

- The project's name (a short name is best)
- A short, one-sentence description of the project
- The full name and email address of whomever is going to own this account
- An approximate end date or duration of the project (this is strictly for forecasting our AWS needs and is **not** a hard deadline, so a best estimate is fine)
- A list of HutchnetIDs for everyone that you want to have access to this account.  For each person, indicate whether or not they should be an Administrator or a User.  The account owner should be included in this list.
- Any special requirements or needs that you have for this account e.g. Compute environments, a domain name for a website, types of AWS EC2 instances that you will need to create, etc.

Once SciComp receives the ticket and creates the account, you and all other users you have indicated will receive an encrypted email containing the account information as well as your initial credentials and instructions for accessing the account.  If you need help redeeming the credits in your account, please contact SciComp for assistance or come to SciComp's *Next Generation/Cloud Computing* office hours (currently Tuesdays at 3pm).

## What is a sandbox account?

A Sandbox account is just like any other AWS account, however Sandbox accounts typically allow a much greater amount of access than your lab's account.  All sandbox accounts are intended to be fully funded with AWS credits, so if your credits run out then your account will be placed into an inactive state.  The account owner will become responsible for any charges that are incurred after the credits are used up or expire.

## Accessing and using a sandbox account

Your sandbox account is entirely separate from your lab account, so you will have a different set of credentials for this account and if you have console access, you will be required to set up multi-factor authentication (MFA).  Once you have logged in and set up MFA, you will be able to use most AWS services and have a very broad set of permissions as to what you can access.

### Data storage and accessing data in other locations

It is possible to access data in S3 buckets that are in other accounts, including your economy-cloud S3 buckets, so you will be able to transfer data both in and out of your Sandbox account (contact SciComp for assistance with this).  When your project is complete, any data will need to be transfered out of your account.  It can be downloaded onto the on-prem storage systems, your local computer, or transfered into economy-cloud storage.  SciComp can assist you with transferring your data.

### Compute environments

SciComp can create compute environments for you that are identical to those types of environments that exist in your lab's account, so it is recommended that you have SciComp do this setup for you.  However, in sandbox accounts you will have enough permissions to be able to create and configure your own compute environments if you wish to do so.  You *may* use dedicated EC2 instances for this if you need to, however it is still strongly recommended that you use spot instances whenever possible.

### Restrictions in sandbox accounts

Due to security requirements, there are a few things that you will not directly have access to in your sandbox account.  These are as follows:

- Creating anyting in Route53 including hosted zones or DNS entries
- Creating KMS keys
- Disabling AWS Config rules (although you may add additional rules if you require them)
- Disabling logging or monitoring through CloudWatch or CloudTrail
- Adding new users or moving users into or out of the Admins or Users group (you may create additional groups so long as the group's path attribute is set to `sandbox`)
- Leave the AWS Organization or Organization Unit your account is placed in
- Modify certain low-level networking settings in VPCs
- Create or omit certain tags or tag values (NOTE: this does not apply to S3 object tagging)
- Access EC2 instances or S3 buckets from outside of the Fred Hutch IP address space or a Fred Hutch controlled AWS account (you will need to either be on the VPN or log in to an on-prem resource such as rhino to transfer data or connect to an instance)

The reasons for this is that most of these things are centrally managed by SciComp through our DevOps automation pipelines, both for security reasons and for making it possible to maintain accounts at the scale that Fred Hutch requires.  If you need something that is in this list, please contact SciComp for assistance and we will be able to create whatever resource you need and ensure that your account has access to it.  For example, if you need to host a website, SciComp will be able to create all the DNS entries required and the necessary TLS certificates.  We can either set up a load balancer for you with these things, or provide you with the ARNs of the resources and you can set them up however you need to.  A common example of this is an EC2 instance that is accessible via a fixed hostname e.g. `ssh myname@myhost.hdc-sandbox-aws.fredhutch.org`.  SciComp will need to set this up for you.

### Logging and Monitoring

All activity including S3 object access is centrally logged and monitored, both by SciComp and by ISO for security-related monitoring.  You will have access to CloudTrail and CloudWatch in your own account, however this access is somewhat limited.  If you need access to your log files for some reason beyond what is provided by default, contact SciComp and we can make those available to you or query them for whatever information you're looking for.  You may add additional monitoring via CloudWatch events, however it is strongly advised that you not create additional CloudTrails since all that information is already captured so your account will incur costs for effectively duplicating that same information.  Some of the logging and monitoring (e.g. AWS Config snapshots) will be charged to your account's credits, however this overhead is extremely low (typically less than $5 per month) and is required for security compliance.  

## FAQ

-**I already have a Sandbox account and have received additional credits from AWS for another project.  Do I need a new Sandbox account?**
  - It is recommended that you request a new account, however it is possible to apply the additional credits to your existing account.  Be aware that there is no way to distinguish which credits are consumed by which resources, so you will not be able to track your credit usage by project.  It is possible to set up cost allocation tags for individual resources to track your actual spend by Project, GrantId, Owner, or resource creatore (the *createdBy* tag) however all the credits will effectively be a single pool that is drawn on as usage occurs.
-**I had a sandbox account for a project that is finished and now I have a new project for which I have received credits.  Can I re-use my old sandbox account?**
 - Yes, this is fine.  You will still need to submit a ticket to SciComp, but please include the name or account number of your existing account and indicate that you would like to re-use it.
-**Can I set up alerts for when my credits start to run low?**
  - Yes, this is possible however it's slightly more difficult given how credits work.  Contact SciComp for assistance.
-**I need some AWS limits (service quotas) increased.  Can I do that myself or should I contact SciComp?**
  - You can request limit increases yourself if you would like, or you can contact SciComp and we can handle it for you.  All responses to your request will be sent to an email address that SciComp controls, so you will not be able to see the status updates on your request unless you log in to your account and check the request itself.
