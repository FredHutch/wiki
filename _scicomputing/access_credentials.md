---
title: Computing Resource Credentials
primary_reviewers: dtenenbaum, atombaby
---

This section describes how to get access and credentials to computing systems on campus and in the cloud.

## HutchNet ID

### Overview
- HutchNet ID is the standard login name and password you receive when you start working at the Hutch or are an official affiliate.
- Also known as Network login or Active Directory credentials.
- Use it to login to most resources at the Center (e.g., Desktop Computer, Employee Self Service, VPN, Webmail) and to Scientific Computing systems like `Rhino` (`ssh rhino`).

### Collaboration
- For collaborators requiring access to the Fred Hutch network, submit a [non-employee action form](https://centernet.fredhutch.org/cn/f/hr/lcex/non-employee-action-form.html).
- Non-employees include affiliates, students, contractors, etc.

### More Information
- Visit the Service Desk site on CenterNet for more details about [HutchNet ID](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html), including password rotation.

## SciComp Self-Service

[SciComp Self-Service](https://scicomp-self-service.fredhutch.org/) allows you to access some resources without submitting a ticket.

### Features
- Add a new member to your lab group.
- Enable cluster access for yourself under your lab's Slurm account.
- Ensure you have the correct access for the [Intro to Fred Hutch Cluster Computing workshop](https://hutchdatascience.org/FH_Cluster_101/).

## Accessing Slurm Clusters

### Requirements
- HutchNet ID must be associated with a PI account to use Slurm clusters like `gizmo`.
- Errors like "Invalid account or account/partition" indicate issues with this setup.
- Contact Scientific Computing for corrections or use [SciComp Self-Service](#scicomp-self-service).

## GitHub.com

### Fred Hutch GitHub Organization
- Provides free access to public and private repositories to all Fred Hutch staff and collaborators.
- If you are a Fred Hutch employee working with source code, create a GitHub account and email `scicomp` to add your user ID to the organization.

> Note: www.github.com/FredHutch is the only officially approved cloud-based source code system at Fred Hutch, featuring security not available in other systems.

### Collaboration
- Create repositories, teams, and invite external collaborators post membership.
- Consider creating a team for permissions control when collaborating.
- See [GitHub help article](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/organizing-members-into-teams) for more information.

### Account Independence
- GitHub account is independent from employment at Hutch.
- Upon leaving, you will be removed from the Fred Hutch organization but can be added as an external collaborator.

### Code Management Primer
- Provides more information on [git and GitHub](/scicomputing/software_managecode/) at Fred Hutch.

### Credential Management
- Avoid pushing sensitive data like API tokens, usernames, passwords, or AWS credentials to GitHub.
- Structure code to load secrets from external files or environment variables.
- Refer to the [Security page](/datascience/privacy_security/) for more details.

## Amazon Web Services (AWS)

### Access Requirements
- AWS credentials tied to HutchNet IDs; necessary for using AWS services.
- Obtain temporary Access and Secret Keys using your HutchNet ID.
- Separate credentials needed for each employee and lab account.

> Note: Keys obtained through AWS SSO portal are temporary and must be refreshed every 12 hours.

### Security Precautions
- Ensure AWS credentials are never shared directly or indirectly.
- For external collaborator credentials or permissions issues, contact `helpdesk` for cloud team support (CLD).

### Obtaining Credentials
- Visit [MyApps](https://myapps.microsoft.com) dashboard and select `AWS Portal`.
- Sign in with your HutchNet ID and password.
- Your account will be listed (e.g., `fh-pi-doe-j` for PI Jane Doe).
- Two links provided:
  - **Left**: AWS console (web browser interface).
  - **Right**: `Access keys` for AWS usage outside a browser.

### More Information
- Read more about [AWS Storage](/scicomputing/store_objectstore/) and [AWS Computing](/scicomputing/compute_cloud/) on our wiki pages.

### Configure AWS CLI

- Connect to a `rhino` machine via [ssh](https://sciwiki.fredhutch.org/scicomputing/access_methods/#ssh-clients-for-remote-computing-resources).
- Load the `awscli` module (`ml awscli`).
- Run `aws configure sso` and follow prompts:

  - For `SSO session name`, enter any string.
  - For `SSO start URL`, enter the URL shown in your browser.
  - For `SSO region`, enter `us-west-2`.
  - For `SSO registration scopes`, press Enter.

- Follow further instructions to authorize access and set up the CLI profile.

### Using Motuz and AWS CLI for SSO

- Access AWS accounts using SSO authentication via provided portal URL.
- Configure AWS CLI profiles for each account, allowing specific command executions.
- Use [Motuz](/compdemos/motuz/) with SSO credentials:
  - Select `Access keys` in the SSO portal.
  - Set `S3 Connection Type` to `Temporary Security Credentials (STS)`.
  - Paste Access Key ID, Secret Access Key, and Session Token.
  - Update these every 12 hours due to credential expiration.

## Using the AWS CLI with SSO:

### Steps
1. **Configure SSO profile:** 

   ```bash
   aws configure sso
   ```
to set up your SSO profile locally on your machine. [More information here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#cli-configure-sso-configure  
).

2. Login with SSO: 

Run `aws sso login --profile yourProfileName` in your terminal to initiate an SSO session and retrieve temporary credentials. If you are using the default profile you do not need to specify the profile name 
3. Access AWS services:

Once logged in, use the AWS CLI commands as usual, utilizing the temporary credentials obtained through SSO. 

## Important point to remember: 

The SSO session has a set expiration time, so you may need to re-authenticate periodically. 


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
