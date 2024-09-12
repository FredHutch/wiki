---
title: AWS Accounts at Fred Hutch
primary_reviewers: dtenenba
---

Each lab can be granted their own individual AWS account, giving the members of the lab access to AWS S3 for data storage, AWS Batch for running compute jobs, and many other AWS services.  The lab accounts are regular AWS accounts and as such the [documentation that AWS provides](https://docs.aws.amazon.com/index.html?nc2=h_ql_doc_do) will be relevant for your use of AWS services.

There are restrictions on access to some services- if you encounter any problems with those access restrictions, email `helpdesk`
{: .notice--info}

## AWS Account Types

### Lab Account

The Lab account type is granted to any PI at Fred Hutch that requests one via submitting a ticket to the `helpdesk`.  This account comes pre-configured with AWS S3 buckets with appropriate security rules enforced for private research data storage and a default AWS Batch compute environment suitable for running many compute workflows. In general, this account type should be suitable for almost all cases where a lab needs to use AWS.

## How do I Access my AWS Account Resources?

First, you will need [AWS credentials](/scicomputing/access_credentials/).
Then you can read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) in our wiki pages.

## How Does Pricing Work?

Unless otherwise specified, all accounts follow the same pricing model:

 - S3 usage (sometimes called Economy Cloud) is subsidized up to 100TB.
 - After 100TB, the cost is $3/TB/Month. 
 - Compute and other services are billed back to the lab at full rate (less institutional discounts and any lab credits, see below).

### Credits

In the background, IT pays all AWS charges up front and then bills back to researchers; this is done to maximize the institutional discount. Any credits that get issued to a researcher are redeemed with IT; IT tracks them on researchers’ behalf and subtracts them from monthly bills until the credits have been used. When a researcher begins to use AWS services, they will receive a monthly invoice from IT BizOps with itemized charges; those charges are assigned to grants (Project IDs) and the amounts deducted accordingly. 

Here are some links to learn more. Keep in mind that tools provided by AWS will not reflect FHCC institutional discounts or offerings. However, they can be used to get a general idea of costs):

 - [Pricing 101](https://aws.amazon.com/pricing/?aws-products-pricing.sort-by=item.additionalFields.productNameLowercase&aws-products-pricing.sort-order=asc&awsf.Free%20Tier%20Type=*all&awsf.tech-category=*all)
 - [Pricing Calculator](https://calculator.aws/#/?nc2=pr)

## Where to go Next

 - For information on using storage, see the S3 storage [FAQ](/scicomputing/store_objectstore/#faq).


