---
title: Using AWS Cloud Credits
main_author: Jeff Tucker
primary_reviewers: jefftucker, dtenenba
---

AWS credits are a simple idea, yet applying them so that they are used optimally is surprisingly complex.  

## Where do credits come from?

Credits ultimately come from AWS however there are several ways in which they can be granted.  The most common way is through a redeemable code that can be applied to an AWS account.  This will most likely be the case when you apply for a grant from AWS.  Credits can also come from various AWS teams themselves, which can be the same as a grant however for team collaborations the AWS team itself may apply the credits directly to your AWS account.

## Virtual credits

We have developed a system known as "Virtual Credits" to help ensure optimal usage of AWS credits.  This allows for improved flexibility in how credits can be applied and vastly reduces the liklihood that credits will be wasted.  

### Why virtual credits?

There are a number of technical issues behind how credits are applied to billing by AWS itself.  The biggest issues are:

- Credits have an expiration date; any credits not used by that time are wasted.
- Credits can also be consumed by other AWS accounts within the Fred Hutch organization.  It is not possible to limit credit consumption between only a certain number of accounts; it's either all accounts or one account.
- Credit usage and application can be difficult to track and difficult to understand on your bill.
- Some AWS services are sponsored or subsidized by Fred Hutch, and credits are unable to take this into account.
- AWS credit grants cannot directly be applied to AWS Professional Services ("Proserv") as these are not charged as part of AWS billing.

Virtual credits were designed to help solve all of these problems.  While this is not a perfect solution, in many cases it will work quite well.  If you're interested in the technical details behind this, you can skip to the end of this page.

### What are virtual credits and how do they work?

Virtual credits are created by CIT BizOps to replace actual AWS credits.  What happens is that the actual AWS Credits will be applied globally in a manner such that they are virtually guaranteed to be spent prior to their expiration date.  In effect, CIT is buying your AWS credits, spending them immediately, and then issuing you a credit memo that will be applied to your monthly AWS bill.  The application of these credits is stored securely in Sharepoint, so the application of virtual credits to accounts is backed up and auditable.  Unfortunately this solution limits transparency, however the CLD team is actively developing a more robust solution that will improve visibility, transparency, and allow you to have much more control over how your credits are applied.

Virtual credits can be applied to ANY of your AWS accounts and in any combination.  For example, if you are developing a web-based application as part of a research study, you will typically have at least a Test and a Production environment which will typically each be within their own dedicated AWS account.  With actual AWS credits, you would only be able to apply those credits to a single account.  With virtual credits, BizOps will deduct the costs from both of your accounts from your remaining virtual credits each month.

### What do I do if I cannot use virtual credits for some reason?

If an AWS internal team intends to directly apply credits to your account, then most likely virtual credits will not work for you.  This is unusual, but it does happen for certain collaborations.  In this case, you will need an account in the Sandbox environment.

## Sandbox cloud accounts

Sandbox accounts are created by CLD and you can request as many Sandbox accounts as you need depending on how many credit grants you have available.  Geneally, you will only need one.

A Sandbox account is just like any other AWS account, however Sandbox accounts typically allow a much greater amount of access than your lab's account.  All sandbox accounts are intended to be fully funded with AWS credits, so if your credits run out then your account will be placed into an inactive state.  The account owner will become responsible for any charges that are incurred after the credits are used up or expire.

### Requesting a Sandbox account

To request a Sandbox account, please submit a ticket that includes the following information:

- The project's name (a short name is best)
- A short, one-sentence description of the project
- The full name and email address of whomever is going to own this account
- An approximate end date or duration of the project (this is strictly for forecasting our AWS needs and is **not** a hard deadline, so a best estimate is fine)
- A list of HutchnetIDs for everyone that you want to have access to this account.  For each person, indicate whether or not they should be an Administrator or a User.  The account owner should be included in this list.
- Any special requirements or needs that you have for this account e.g. AWS Batch Compute environments, a domain name for a website, types of AWS EC2 instances that you will need to create, etc.

Once SciComp receives the ticket and creates the account, you and all other users you have indicated will receive an encrypted email containing the account information as well as your initial credentials and instructions for accessing the account.  If you need help redeeming the credits in your account, please contact SciComp for assistance or come to SciComp's *Next Generation/Cloud Computing* office hours (currently Tuesdays at 3pm).

### Accessing and using a sandbox account

Your sandbox account is entirely separate from your lab account, so you will have a different set of credentials for this account and if you have console access, you will be required to set up multi-factor authentication (MFA).  Once you have logged in and set up MFA, you will be able to use most AWS services and have a very broad set of permissions as to what you can access.

### Data storage and accessing data in other locations

It is possible to access data in S3 buckets that are in other accounts, including your economy-cloud S3 buckets, so you will be able to transfer data both in and out of your Sandbox account (contact CLD for assistance with this).  When your project is complete, any data will need to be transfered out of your account.  It can be downloaded onto the on-prem storage systems, your local computer, or transfered into economy-cloud storage.  CLD can assist you with transferring your data.

### AWS Batch Compute environments

CLD can create AWS Batch Compute environments for you that are identical to those types of environments that exist in your lab's account, so it is recommended that you have CLD do this setup for you.  However, in sandbox accounts you will have enough permissions to be able to create and configure your own AWS Batch Compute environments if you wish to do so.

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

The reasons for this is that most of these things are centrally managed by CLD through our DevOps automation pipelines, both for security reasons and for making it possible to maintain accounts at the scale that Fred Hutch requires.  If you need something that is in this list, please contact SciComp for assistance and we will be able to create whatever resource you need and ensure that your account has access to it.  For example, if you need to host a website, CLD will be able to create all the DNS entries required and the necessary TLS certificates.  We can either set up a load balancer for you with these things, or provide you with the ARNs of the resources and you can set them up however you need to.  A common example of this is an EC2 instance that is accessible via a fixed hostname e.g. `ssh myname@myhost.hdc-sandbox-aws.fredhutch.org`.  CLD will need to set this up for you.

### Logging and Monitoring

All activity including S3 object access is centrally logged and monitored, both by CLD and by ISO for security-related monitoring.  You will have access to CloudTrail and CloudWatch in your own account, however this access is somewhat limited.  If you need access to your log files for some reason beyond what is provided by default, contact CLD and we can make those available to you or query them for whatever information you're looking for.  You may add additional monitoring via CloudWatch events, however it is strongly advised that you not create additional CloudTrails since all that information is already captured so your account will incur costs for effectively duplicating that same information.  Some of the logging and monitoring (e.g. AWS Config snapshots) will be charged to your account's credits, however this overhead is extremely low (typically less than $5 per month) and is required for security compliance.  

## FAQ

- **I already have a Sandbox account and have received additional credits from AWS for another project.  Do I need a new Sandbox account?**
  - It is recommended that you request a new account, however it is possible to apply the additional credits to your existing account.  Be aware that there is no way to distinguish which credits are consumed by which resources, so you will not be able to track your credit usage by project.  It is possible to set up cost allocation tags for individual resources to track your actual spend by Project, GrantId, Owner, or resource creatore (the *createdBy* tag) however all the credits will effectively be a single pool that is drawn on as usage occurs.
  
- **I had a sandbox account for a project that is finished and now I have a new project for which I have received credits.  Can I re-use my old sandbox account?**

  - Yes, this is fine.  You will still need to submit a ticket to SciComp, but please include the name or account number of your existing account and indicate that you would like to re-use it.

- **Can I set up alerts for when my credits start to run low?**

  - Yes, this is possible however it's slightly more difficult given how credits work.  Contact CLD for assistance.

- **I need some AWS limits (service quotas) increased.  Can I do that myself or should I contact SciComp?**

  - You can request limit increases yourself if you would like, or you can contact SciComp and we can handle it for you.  All responses to your request will be sent to an email address that SciComp controls, so you will not be able to see the status updates on your request unless you log in to your account and check the request itself.

## AWS credits, virtual credits, and the technical details

At Fred Hutch, we utilize AWS Organizations to help manage all of our accounts.  Within this, there is a setting called "Credit Sharing" that is applied globally and is either "on" or "off" for the entire Organization.  Each of these settings causes its own unique set of problems.  If credit sharing is turned on, then credits will be consumed each month first by the account to which they were applied, and then by every single additional account within the Organization.  If credit sharing is off, then credits will only be consumed by the account to which they were applied.  It is not possible to share credits only among a certain subset of AWS accounts and this is a technical limitation of AWS itself.  Additionally, credits have an expiration date after which time they will vanish.  It is sometimes possible for AWS to extend the duration of credits, however this is not a guarantee that it will actually happen.

So what happens in practice?  Let's examine two scenarios with credit sharing both on and off.

### Credit sharing turned off

With credit sharing turned off, credits are only consumed by the account to which they are applied.  This seems like a fine solution in many cases, however it causes problems in the long run.  For example, if you have precisely $10,000 in AWS credits that expire in one year, then that means you have one year to spend precisely $10,000 in that specific account.  If you are able to achieve your goals without spending the full amount, then there is no way to apply the remaining credits elsewhere.  If your research takes longer than one year but you haven't spent the full $10,000 at expiration, then any remaining credits will be wasted.  Either of these situations are sub-optimal.  Additionally, if you have multiple accounts for your project or even multiple different projects with different AWS credit grants, then it becomes impossible to share these credits or differentiate between the spend on both.

### Credit sharing turned on

Credit sharing turned on is actually the optimal setting to ensure that credits are not wasted.  However, this means that other accounts for other labs will spend your credits.  If you have a $10,000 credit grant from AWS with credit sharing enabled then it is likely that those credits will be entirely spent by the other accounts within a week or two at most, leaving you with 0 remaining credits to spend on your own work.  The only benefit to this is that at least it ensures that the credits aren't wasted, however it is certainly undesirable for other labs to be able to spend your credit grant.  

What would be ideal is if AWS implemented a way to apply credits at a more granular level than all-or-nothing and we have requested that they implement this feature.  However, since no such feature currently exists then we have to make a choice on how we enable credit sharing.  

### The actual implementation

The Production environment has credit sharing turned on.  The Sandbox environment has credit sharing turned off.  What this means is that if you have a project where you absolutely cannot use virtual credits and the credits must be applied directly to a specific account, you will need to request a Sandbox account.  In all other circumstances, it is optimal to use virtual credits instead.
