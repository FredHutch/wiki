---
title: Cloud Computing at Fred Hutch
last_modified_at: 2020-03-03
main_author: Sam Minot & Dan Tenenbaum
primary_reviewers: dtenenba
---

If you are at all interested or curious about cloud solutions and would like to talk over options, Scientific Computing hosts a cloud-specific office hours every week.  Dates and details for SciComp office hours can be found in
FIXME: Kate to update broken link [CenterNet](https://centernet.fredhutch.org/cn/e/center-it/scicomp_nextgen_officehours10092018.html).

## AWS Services
The Amazon Web Service (AWS) is a "cloud" computing provider which sells access to computational resources on a minute-by-minute basis. The "cloud" is actually just a simple idea that you can buy *access* to computers, instead of buying the computers themselves. Anytime you have a bunch of computers sitting in a warehouse running code for a bunch of different users around the world, that's the "cloud."

Among the different products offered by AWS, the three most relevant to bioinformatics are:
- [Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/), or **EC2**: a service that provides access to cloud-based computers of various sizes that allow temporary use by researchers to run computing jobs that require larger processors (CPU's) or more memory than is typically available on a land-based computer.  The computing resources available for a task depend on the choices made about the CPU's or memory allocation in the specific EC2 instance (a virtual computing environment).  
- [Amazon Simple Storage Service](https://aws.amazon.com/s3/), or **S3**:
a service that provides cloud-based data storage in the form of "buckets", or a pool of data that can be accessed anywhere, anytime via the web by users with credentials allowing the access to that specific bucket. The size and particular security and credentials associated with individual S3 buckets are particularly well suited to scaling and flexibility with respect to access.
- [AWS Batch](https://aws.amazon.com/batch/): a service which wraps around AWS EC2 resources such that researchers can more easily do computing processes with EC2 instances on data stored in S3.  
For more information on using AWS Batch,
please see [this entry in the Resource Library](/compdemos/aws-batch/)

FIXME: cross reference with content in /compdemos/aws-batch/, 
confirm if anything else needs to be moved back here

## [Nextflow at Fred Hutch](/compdemos/nextflow/)

Another option for using cloud resources, especially when performing a series of tasks (a workflow) repeated, while not necessarily having to understand or coordinate the individual components of the AWS infrastructure is to use the workflow manager [Nextflow](https://www.nextflow.io/).  Nextflow can be configured to use AWS as the backend execution resource, and thus it is very helpful to understand the basics of AWS Batch in order to get your data to a place where it can be analyzed easily via Nextflow.

Ultimately, Nextflow will reduce the amount of backend retooling required when transitioning from on-premise computing to cloud computing. This is an emerging service that is not currently fully supported. However, resource documentation is available [here](/compdemos/nextflow/) and will be updated with forthcoming releases.
