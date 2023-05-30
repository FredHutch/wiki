---
title: AWS Accounts at Fred Hutch
primary_reviewers: dtenenba
---
Each lab can be granted their own individual AWS account, giving the members of the lab access to AWS S3 for data storage, AWS Batch for running compute jobs, and many other AWS services.  In general, the lab "type" account is suitable for most AWS usage at Fred Hutch.  The lab "type" AWS accounts themselves are all regular AWS accounts and as such the [documentation that AWS provides](https://docs.aws.amazon.com/index.html?nc2=h_ql_doc_do) will be relevant for investigators looking for assistance.  What differentiates each "type" of account is how the account is pre-configured, what AWS services and regions users are allowed to use, and what restrictions are in place.

## AWS Account Types
### Lab Account

The Lab account type is granted to any PI at Fred Hutch that requests one via submitting a ticket to the `helpdesk`.  This account comes pre-configured with AWS S3 buckets with appropriate security rules enforced for private research data storage and a default AWS Batch compute environment suitable for running many compute workflows. In general, this account type should be suitable for almost all cases where a lab needs to use AWS.  

### Specialized Use Account

A Specialized Use Account type is an AWS account that allows access to almost all AWS Services with very few restrictions or guardrails.  The primary restriction is that you will not be able to grant user access to the account, however you can create just about whatever you like in terms of AWS Services.  In general, these accounts are best suited for Software Development Teams to use for specific cloud-hosted software products.  The other typical usage for these account types is if you are currently conducting a research project that requires a hosted website, dedicated persistent AWS services, or some other similar need exists that cannot be met by the Lab type account.  Specialized Use accounts are typically only granted to a lab when every single expense that would occur in the account is always a direct and will never be an indirect.  These accounts are configured in conjunction with the Cloud and Data team in CIT, via a `helpdesk` ticket.  

### Proof-of-concept Account

This account type is typically used when a lab has an AWS Credit grant designated for a specific purpose related to determining if a particular technology, workflow, etc. is capable of being run effectively in AWS.  Just because you have AWS Credits does not mean that you need this account type.  These are almost always created in the Sandbox environment. These accounts are configured in conjunction with the Cloud and Data team in CIT, via a `helpdesk` ticket.  

## How do I access my AWS account resources?

First, you will need [AWS credentials](/scicomputing/access_credentials/).  
Then you can read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) in our wiki pages.  

## How does pricing work?

Unless otherwise specified, all accounts follow the same pricing model:
•	S3 usage (sometimes called Economy Cloud) is free up to 100TBs.
•	After 100TB, the cost is $3/TB/Month. 
•	There is a free tier for compute that comes standard with every AWS account. After that free tier, charges are pay-as-you-go (minus an 11% discount FHCC has negotiated with AWS). 

In the background, IT pays all AWS charges up front and then bills back to researchers; this is done to maximize the institutional discount. Any credits that get issued to a researcher are redeemed with IT; IT tracks them on researchers’ behalf and subtracts them from monthly bills until the credits have been used. When a researcher begins to use AWS services, they will receive a monthly invoice from IT BizOps with itemized charges; those charges are assigned to grants (Project IDs) and the amounts deducted accordingly. 

Here are some links to learn more. Keep in mind that tools provided by AWS will not reflect FHCC institutional discounts or offerings. However, they can be used to get a general idea of costs):
•	[AWS Pricing 101](https://aws.amazon.com/pricing/?aws-products-pricing.sort-by=item.additionalFields.productNameLowercase&aws-products-pricing.sort-order=asc&awsf.Free%20Tier%20Type=*all&awsf.tech-category=*all)
•	[AWS Pricing Calculator](https://calculator.aws/#/?nc2=pr)


## I have more questions

Please check out the [FAQ](/scicomputing/store_objectstore/#faq)for more information.
