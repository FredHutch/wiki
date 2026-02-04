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
- Check to see if you have the correct access needed to complete the [Intro to Fred Hutch Cluster Computing workshop](https://hutchdatascience.org/FH_Cluster_101/)

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

[Amazon Web Services](https://aws.amazon.com/) (AWS) credentials are required to use AWS.  AWS credentials are designated per user, so each Fred Hutch employee should obtain their own credentials. Each lab has their own AWS account, allowing access to both data storage (e.g., the lab's S3 bucket) and compute (e.g., _AWS Batch_).

>Note: Beyond precautions taken to protect any other credentials listed here, take care to ensure AWS credentials are never shared with or disclosed to any other user, directly (e.g., by email) or indirectly (e.g., by including them in code and sharing the code/committing to GitHub).  If you need credentials for an external collaborator, or if you are having a permissions issue, please email `helpdesk` to request support from the cloud team (CLD)

To get AWS credentials, visit the [MyApps](https://myapps.microsoft.com) dashboard and click the square entitled `AWS Portal` (or, for some accounts, it will be called `AWS IAM Identity Center`). Sign in with your HutchNet ID and password. 

This will take you to a screen called `AWS accounts`. You should see your account listed.  For example, if your PI is Jane Doe, you should see `fh-pi-doe-j` listed.  Click the triangle to the left of the account name. Now you'll see two links.  The link on the left will take you to the AWS console, which is web browser interface to Amazon Web Services. The link on the right (`Access keys`) will give you the credentials you need to use AWS outside of a browser.

Once you have working credentials, you can read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) in our wiki pages. 

### Configure AWS CLI Using Single Sign-On (SSO)
Fred Hutch uses AWS Single Sign-On (SSO) for all AWS access. This section walks you through how to quickly set up AWS CLI access on rhino using SSO. 

You would want to do this because:
- once configured, you will not need to manage access keys manually
- a single session can last up to 24 hrs (as opposed to 12 hours if you signed in via the console)

[Go here](https://centernet.fredhutch.org/u/it/research-it-and-scientific-computing/cloud-access.html) for more detailed instructions on how to access AWS using Single Sign-On (SSO). 


#### Before You Start

You will need:
- A valid [HutchNet ID](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
- Access to the AWS SSO portal [MyApps](https://myapps.microsoft.com) and credentials for at least one [AWS account and role](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)
- Able to[SSH into rhino](https://sciwiki.fredhutch.org/scicomputing/access_methods/#mac-os) 


#### Step 1. [SSH](https://sciwiki.fredhutch.org/scicomputing/access_methods/#ssh-clients-for-remote-computing-resources) into Rhino. 
```ml
ssh <your-username>@rhino
user@rhino's password: <enter the HutchNet ID password>
```

#### Step 2. Load the AWS CLI [module](https://sciwiki.fredhutch.org/scicomputing/compute_scientificSoftware/)
```
ml awscli
```

Verify that AWS CLI v2 is available:

```
aws --version
```

#### Step 3. One-time SSO configuration
```
aws configure sso
```
You will be prompted for the following:
```
SSO session name (Recommended): 	     Any name (e.g. fredhutch)
SSO start URL: 	                       Copy from the AWS SSO portal for the bucket you want to authenticate (format: https://d-<id>.awsapps.com/start/#)
SSO region:       	                   us-west-2
SSO registration scopes:               Press Enter
```
You will then see:
- A **URL**
- A **one-time verification code**

#### Step 4. Authenticate in Your Browser
Do the following:
1. Copy the URL into your browser
2. Enter the verification code and press Confirm and Continue
3. Click Allow access
4. The page will refresh and say "Request approve". You can close this window and return to your terminal window.

#### Step 5. Select Account, Role, and Profile
Back in the terminal, you will be prompted to:

1. **Choose an AWS account**
-> Select the same account you normally use in the AWS Console

2. **Choose a role**
-> Select the role you were granted access to

Then press Enter for the following prompts:
```
CLI default client Region:
CLI default output format:
CLI profile name: When prompted for CLI profile name: Use 'default' if this is your first AWS setup and is your only/defualt account (setting your default profile has implications, so choose wisely); Otherwise, choose a descriptive name (e.g. fh-research-project-1)
```

The terminal will now display the following:

```
To use this profile, specify the profile name using --profile, as shown:

aws s3 ls --profile default
```

The `--profile default` flag is not necessary if you are using the default profile.

#### 6. Re-Logging In
Your SSO credentials expire automatically (this is expected). To re-login for a profile you have already configured (using the steps above) simply run the command below after doing step 1 and 2 above :

```
aws sso login --profile <profile-name>
```
You will then be asked to repeat only Step 4 from above and your authentication will be complete. 


### Configure Motuz for AWS Single Sign-on (SSO)

To use [Motuz](/compdemos/motuz/) with SSO credentials, click `Access keys` in the SSO portal for your account. Scroll down to the bottom where it says `Option 3`. 
In Motuz, create a new Cloud Connection. Be sure and change `S3 Connection Type` to `Temporary Security Credentials (STS)`. Copy and paste the values for Access Key ID, Secret Access Key, and Session Token from the SSO portal to the corresponding fields in Motuz. 
You will need to update these fields each time you use motuz, as the credentials expire after 8 hours. 

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

### Resources

- [Fred Hutch Cloud Access Documentation](https://centernet.fredhutch.org/u/it/research-it-and-scientific-computing/cloud-access.html)
- [AWS S3 Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- [AWS Command Line Interface (CLI) Documentation](https://docs.aws.amazon.com/cli/)
- [AWS documentation to configure SSO in CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-configure)
- [AWS documentation to re-login through SSO](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-login)
