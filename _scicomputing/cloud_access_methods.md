---
title: Cloud Computing Resource Access Methods
primary_reviewers: spanda, mbullman
---

>Note: The `Compute Resource Access Methods` page provides a comprehensive guide to on-prem access to remote resources.

# Accessing EC2 Instances with AWS SSM

Fred Hutch Cloud offerings include access to Amazon Batch Computing environments and AWS EC2 instances. AWS Batch is an ephemeral compute service to run batch jobs such as Nextflow in the cloud. EC2 provides remote cloud-based servers of varying sizes depending on your needs. As per Fred Hutch policy, EC2 instances cannot have public IP addresses. This is enforced at both the policy and technical level, with restrictions in place to prevent this possibility. 

As an alternative to using SSH to interact with remote servers, it is encouraged to use AWS Systems Manager (SSM) to get terminal access to remote instances.

## Key Points

- **No Public IP Addresses**: EC2 instances are restricted from having public IP addresses.
- **IAM Role**: Ensure to set the IAM Role to `EC2-Default-SSM-AD-Role` when configuring an EC2 instance.
- **Connection Method**: Use AWS SSM for terminal access instead of SSH.
- **AWS CLI with SSO**: You can use SSM through the AWS CLI with your SSO profiles.

## Prerequisites

1. **AWS CLI Installed**: Ensure you have the AWS CLI installed and configured with your SSO profile.
2. **Necessary Permissions**: Your IAM user should have the necessary permissions to use SSM and connect to the EC2 instances.
3. **EC2 Instance Role**: Ensure the EC2 instances are assigned the IAM Role 
`EC2-Default-SSM-AD-Role`.
4. **SSM plugin installed**: Follow the instructions for your OS (here)[https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html] to install the ssm plugin on you CLI. This is required to establish a remote terminal session with the EC2 instance.

## Steps to Access EC2 Instances Using SSM

### Step 1: Configure AWS CLI with SSO

Follow the instructions to configure your AWS CLI with an SSO profile.

1. Open a terminal and run the following command:
    ```sh
    aws configure sso
    ```
2. Follow the prompts to set up the SSO profile. see (Access Credentials)[https://sciwiki.fredhutch.org/scicomputing/access_credentials/#configure-aws-cli] for details.

### Step 2: Start Session with AWS SSM

To start a session with an EC2 instance, use the `aws ssm start-session` command:

1. Obtain the instance ID of the EC2 instance you want to connect to. You can find this in the AWS Management Console or by using the AWS CLI.
2. Start the session by running:
    ```sh
    aws ssm start-session --target <instance-id> --profile <sso-profile>
    ```

### Example

Assume your instance ID is `i-0abcd1234efgh5678` and your SSO profile is named `example`.

1. Run the following command in your terminal:
    ```sh
    aws ssm start-session --target i-0abcd1234efgh5678 --profile example
    ```

### Additional SSM Commands

#### Listing SSM Managed Instances
To list all instances that are managed by SSM:
```sh
aws ssm describe-instance-information --profile <sso-profile>