---
title: Computing Resource Credentials
primary_reviewers: dtenenbaum, atombaby
---

This section describes how to get access and credentials to computing systems on campus and in the cloud.

## HutchNet ID

A HutchNet ID is the standard login name and password you receive when you start working at the Hutch or are an official affiliate. It is also called Network login or Active Directory credentials. You can use it to login to most resources at the Center (Desktop Computer, Employee Self Service, VPN, Webmail) as well to Scientific Computing systems such as `Rhino` (`ssh rhino`), which is the login system to large scale cluster computing resources like `Gizmo`.

If one of your collaborators requires access to the Fred Hutch network you can submit a [non-employee action form](https://centernet.fredhutch.org/cn/f/hr/lcex/non-employee-action-form.html). Non-employees is a generic administrative term for affiliates, students, contractors, etc.

Please see the Service Desk site on CenterNet for more information about [HutchNet ID](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) including password rotation, etc.

## SciComp Self-Service

[SciComp Self-Service](https://scicomp-self-service.fredhutch.org/) allows you to gain access to some resources without submitting a ticket.  You can currently use this to do the following:

- Add a new member to your lab group 
- Enable cluster access for yourself under your lab's Slurm account
- Check to see if you have the correct access needed to complete the [Cluster 101 course](https://hutchdatascience.org/FH_Cluster_101/)

## Accessing Slurm Clusters

To use Slurm clusters like `gizmo` you also need to have your HutchNet ID associated with a PI account.  Errors similar to "Invalid account or account/partition" typically indicate that this association hasn't been set up.  Contact Scientific Computing to have this corrected or use [SciComp Self-Service](#scicomp-self-service).

## GitHub.com

The [Fred Hutch GitHub organization](https://github.com/FredHutch) offers free access to public and private git repositories to all Fred Hutch staff and collaborators. If you are a Fred Hutch employee working with source code and don't have a github.com account yet, please [create one](https://github.com/join) and email `scicomp`: "Please add my GitHub user id `xyz` to organization github.com/FredHutch". Once you are a member of the organization you can create repositories, teams and invite external collaborators to share and edit code.

>Note: www.github.com/FredHutch is the only officially approved cloud based source code system at Fred Hutch. It has security features that are otherwise not available via other systems.

Once you are a member of the organization you can create repositories and invite external collaborators to share and edit code. If you plan to work collaboratively with a group of people, we recommend you learn about roles available to GitHub users, and consider creating a team to control permissions and access (members of the Fred Hutch GitHub organization are allowed to create teams). Please see [this GitHub help article](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/organizing-members-into-teams) for more information.

A GitHub account is different from other accounts in that your account is independent from your employment at the Hutch. If you end your employment with the Hutch, you will be removed from the Fred Hutch organization on GitHub. If you have continuing collaborations, your colleagues still working at the Hutch can add you as an external collaborator to their GitHub repositories.

We have a Code Management primer that provides more information about [git and GitHub](/scicomputing/software_managecode/) in general and specifically here at the Fred Hutch.  

### Guidance for Managing Credentials and Passwords
One issue to note when using GitHub to do version control in your code is that it can be very straightforward to inadvertently push content to GitHub that includes things such as API tokens, usernames and passwords, or even your AWS credentials themselves.  Please take care to structure your code in such a way that these "secrets" or anything you perceive to be private information (see our [Security page](/datascience/privacy_security/) for more information about what this might be) are loaded from an external file or environment variables that themselves are not sent to GitHub!!

## Amazon Web Services (AWS)

[Amazon Web Services](https://aws.amazon.com/) (AWS) credentials are required to use AWS.
AWS credentials are designated per user, so each Fred Hutch employee should obtain their own credentials. Each lab has their own AWS account, allowing access to both data storage (e.g., the lab's S3 bucket) and compute (e.g., _AWS Batch_).

>Note: Beyond precautions taken to protect any other credentials listed here, take care to ensure AWS credentials are never shared with or disclosed to any other user, directly (e.g., by email) or indirectly (e.g., by including them in code and sharing the code/committing to GitHub).  If you need credentials for an external collaborator, or if you are having a permissions issue, please email `helpdesk` to request support from [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).

You will receive your AWS credentials via an encrypted email when you are onboarded, or if you need to request credentials for an existing employee, please email `helpdesk`.  

Once you have working credentials, you can read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) in our wiki pages. 

### Configure AWS CLI

Load the `awscli` module, then run `aws configure` and enter your Access Key ID & Secret Access Key. You can read more about access key creation/modification [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey).

```
module load awscli
aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE 
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: 
```
This will create the following files that store your credentials `~/.aws/config` & `~/.aws/credentials`

### Configure AWS CLI for Single Sign-on (SSO)
To access an AWS account using SSO authentication, a user signs in to the AWS access portal URL provided, IAM Identity Center redirects the request to an authentication service. 

After authentication with a HutchNet ID, the user will have SSO access to all AWS account and applications without additional sign-in requirements (Username and Password)  

## How to navigate to the AWS SSO Portal

Key Steps: 

1. Access the SSO portal: Go to the unique SSO login URL: [https://d-92674cb6d7.awsapps.com/start/#/?tab=accounts ](https://d-92674cb6d7.awsapps.com/start/#/?tab=accounts )
2. Sign in with Credentials: Enter your HutchID to authenticate following MFA authentication. 
 ![MFA Screen](../assets/CLD_PickAccount.png)
3. Select AWS account: Once logged in, choose the AWS account you want to access from the list of available accounts. Expanding the arrow will show the account name, the sso-role attached to the user. Each user will see only the account it has access to and the role mapped to the user. PowerUserAccess is an example. 
 ![AccountSelection](../assets/CLD_LZALandingPage.png)
4. Choose a role: Select the specific role assigned to you within the chosen AWS account. PowerUserAccess is a link and clicking the role will take you to the AWS account. 
5.  Access AWS services: You can now access the AWS Management Console or use the AWS CLI with temporary credentials obtained from your SSO session. 

## Using the AWS CLI with SSO: 

1. Configure SSO profile: Use the command

```bash
aws configure sso 
```

to set up your SSO profile locally on your machine. [More information here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-configure  
).

2. Login with SSO: 

Run `aws sso login` in your terminal to initiate an SSO session and retrieve temporary credentials. 
3. Access AWS services:

Once logged in, use the AWS CLI commands as usual, utilizing the temporary credentials obtained through SSO. 

<div class=".notice">

## Important point to remember: 

The SSO session has a set expiration time, so you may need to re-authenticate periodically. 
</div>

### Testing Your Credentials

To test your credentials to ensure that you have the correct permissions to your PI bucket, execute the following to copy a file from your local computer to your PI's bucket. 

In these examples, please replace `lastname-f` with the last name and first initial of your PI.

#### Create a file in S3:

```
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

## Resources

- [Fred Hutch GitHub Organization](https://github.com/FredHutch)
- [AWS S3 Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- [AWS Command Line Interface (CLI) Documentation](https://docs.aws.amazon.com/cli/)
