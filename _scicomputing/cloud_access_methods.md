---
title: Cloud Computing Resource Access Methods
primary_reviewers: spanda, mbullman
---

# Accessing EC2 Instances with AWS SSM

Fred Hutch Cloud offers access to Amazon Batch Computing environments and AWS EC2 instances. EC2 instances cannot have public IP addresses. Use AWS Systems Manager (SSM) for terminal access instead of SSH.

## Key Points

- **No Public IP Addresses**: EC2 instances are restricted from having public IP addresses.
- **IAM Role**: Set the IAM Role to `EC2-Default-SSM-AD-Role` when configuring an EC2 instance.
- **Connection Method**: Use AWS SSM for terminal access instead of SSH.
- **AWS CLI with SSO**: Use SSM through the AWS CLI with your SSO profiles.

## Prerequisites

1. **AWS CLI Installed**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure with your SSO profile.
2. **SSM Plugin Installed**: [Install SSM plugin](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html).
3. **IAM Permissions**: Ensure IAM user has permissions for SSM and EC2 access.
4. **EC2 Instance Role**: Configure instances with `EC2-Default-SSM-AD-Role`.
5. **SSM Agent Installed**: Confirm the AMI includes [pre-installed SSM Agent](https://docs.aws.amazon.com/systems-manager/latest/userguide/ami-preinstalled-agent.html) or install via [user data](https://repost.aws/knowledge-center/install-ssm-agent-ec2-linux).

## Adding IAM Role to Existing EC2 Instance

Follow [this guide](https://repost.aws/knowledge-center/attach-replace-ec2-instance-profile) to add the IAM role to the EC2 instance profile. 
**Note:** Stop and start the instance for SSM Agent to recognize the change.

## Generate a Key Pair (Optional)

Needed for accessing EC2 over SSH session.

While launching EC2, under **Key pair (login)**, choose an existing key pair or create a new key pair and download the private key to your local machine. Ensure you have the private key if using an existing key pair.

## Accessing EC2 Instances

### Using Console

With SSM Agent running and the right IAM role, access EC2 using Session Manager through the console without additional configuration. Follow the [AWS guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-with-systems-manager-session-manager.html).

### Using Command Line

Two ways to access EC2 via command line:

1. **Using SSM start-session**
   - Start SSM session: 
   ```sh
   aws ssm start-session --target <instance-id> --profile <sso-profile>
   ```
2. Using SSH with SSM 
Uses SSH as the frontend and SSM start-session as the proxy.
Requires SSH keys.
         
     

#### Configure AWS CLI with SSO 

Configure AWS CLI to log into the right account: 
sh
1. aws configure sso
Follow the AWS SSO guide . 

2. Access EC2 Using SSM start-session 
Follow the guide  to start a session with EC2 using SSM start-session. 

#### Connect to EC2 from VS Code using Remote - SSH extension 

To connect using VS Code’s Remote - SSH extension, add an entry to your `~/.ssh/config`: 
```Host aws-ssm-instance
  HostName {your-instance-id-here}
  User ec2-user
  IdentityFile {location-of-your-keypair}
  ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p' --profile {the-profile-you-created-with-aws-configure-sso}"
  ``` 
 

Explanation of placeholders: 
```
    {your-instance-id-here}: The EC2 instance ID (e.g., i-0123456789abcdef0)
    {location-of-your-keypair}: Full path to your SSH private key file (e.g., ~/.ssh/my-ec2-keypair.pem)
    {the-profile-you-got-from-aws-configure-sso}: The name of your AWS SSO profile configured using aws configure sso
```   

Once added, open VS Code, press F1, search for "Remote-SSH: Connect to Host...", and select aws-ssm-instance to start the session. 
Establish SSH Session using SSM 

Start a session using SSH: 
sh``` 
ssh -i /path/my-key-pair.pem ec2-user@instance-id
 ```
 
Change the user to ubuntu if the OS is Ubuntu. 
Copy Files using SCP and SSM 

Use SCP to transfer files between local machine and EC2: 
sh
```
scp -i /path/my-key-pair.pem /path/ExampleFile.txt ec2-user@instance-id:/destination_path
```
