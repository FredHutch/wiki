---
title: Computing Resource Credentials
primary_reviewers: dtenenbaum, atombaby
---

This section describes how to get access and credentials to computing systems on campus and in the cloud.

## HutchNet ID

A HutchNet ID is the standard login name and password you receive when you start working at the Hutch or are an official affiliate. It is also called Network login or Active Directory credentials. You can use it to login to most resources at the Center (Desktop Computer, Employee Self Service, VPN, Webmail) as well to Scientific Computing systems such as `Rhino` (`ssh rhino`), which is the login system to large scale cluster computing resources like `Gizmo`.

If one of your collaborators requires access to the Fred Hutch network you can submit a [non-employee action form](https://centernet.fredhutch.org/cn/f/hr/lcex/non-employee-action-form.html). Non-employees is a generic administrative term for affiliates, students, contractors, etc.

Please see the Service Desk site on CenterNet for more information about [HutchNet ID](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) including password rotation, etc.

## Accessing Slurm Clusters

To use Slurm clusters like _gizmo_ you also need to have your HutchNet ID associated with a PI account.  Errors similar to "Invalid account or account/partition" typically indicate that this association hasn't been set up.  Contact Scientific Computing to have this corrected.

## GitHub.com

The [Fred Hutch GitHub organization](https://github.com/FredHutch) offers free access to public and private git repositories to all Fred Hutch staff and collaborators. If you are a Fred Hutch employee working with source code and don't have a github.com account yet, please [create one](https://github.com/join) and email `scicomp`: "Please add my GitHub user id `xyz` to organization github.com/FredHutch". Once you are a member of the organization you can create repositories, teams and invite external collaborators to share and edit code.

>Note: www.github.com/FredHutch is the only officially approved cloud based source code system at Fred Hutch. It has security features that are otherwise not available via other systems.

Once you are a member of the organization you can create repositories and invite external collaborators to share and edit code. If you plan to work collaboratively with a group of people, we recommend you learn about roles available to GitHub users, and consider creating a team to control permissions and access (members of the Fred Hutch GitHub organization are allowed to create teams). Please see [this GitHub help article](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/organizing-members-into-teams) for more information.

A GitHub account is different from other accounts in that your account is independent from your employment at the Hutch. If you end your employment with the Hutch, you will be removed from the Fred Hutch organization on GitHub. If you have continuing collaborations, your colleagues still working at the Hutch can add you as an external collaborator to their GitHub repositories.

We have a Code Management primer that provides more information about [git and GitHub](/scicomputing/software_managecode/) in general and specifically here at the Fred Hutch.  

### Guidance for Managing Credentials and Passwords
One issue to note when using GitHub to do version control in your code is that it can be very straightforward to inadvertently push content to GitHub that includes things such as API tokens, usernames and passwords, or even your AWS credentials themselves.  Please take care to structure your code in such a way that these "secrets" or anything you perceive to be private information (see our [Security page](/generation/human_privacySecurity/) for more information about what this might be) are loaded from an external file or environment variables that themselves are not sent to GitHub!!

## Amazon Web Services (AWS)

[Amazon Web Services](https://aws.amazon.com/) (AWS) credentials are required to use AWS.
AWS credentials are designated per user, so each Fred Hutch employee should obtain their own credentials. Each lab has their own AWS account, allowing access to both data storage (e.g., the lab's S3 bucket) and compute (e.g., _AWS Batch_).

>Note: Beyond precautions taken to protect any other credentials listed here, take care to ensure AWS credentials are never shared with or disclosed to any other user, directly (e.g., by email) or indirectly (e.g., by including them in code and sharing the code/committing to GitHub).  If you need credentials for an external collaborator, or if you are having a permissions issue, please email `helpdesk` to request support from [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).

You will receive your AWS credentials via an encrypted email when you are onboarded, or if you need to request credentials for an existing employee, please email `helpdesk`.  

Once you have working credentials, you can read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) in our wiki pages. 

### Testing Your Credentials
To test your credentials to ensure that you have the correct permissions to your PI bucket, execute the following to copy a file from your local computer to your PI's bucket. 

In these examples, please replace `lastname-f` with the last name and first initial of your PI.

#### Create a file in S3:

```
module load awscli
echo hello | aws s3 cp - s3://fh-pi-lastname-f-eco/hello.txt
```

#### Download the file from S3

```
aws s3 cp s3://fh-pi-lastname-f-eco/hello.txt .
```

Now you can examine the file:

```
cat hello.txt
```

If you notice any errors with these, please email the commands you executed and the output to `scicomp` for assistance with your AWS S3 credentials.

#### Delete the file from S3


Once you have confirmed your credentials, remember to remove the test file:

```
aws s3 rm s3://fh-pi-lastname-f-eco/hello.txt
```

See more about accessing AWS S3 via the command line [here](/compdemos/aws-s3/).
