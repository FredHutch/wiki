---
title: AWS CLI for Windows Subsystem for Linux
primary_reviewers: staciefase
---

Windows Subsystem for Linux is a useful tool for interacting with a Windows machine using Linux commands. WSL allows users and developers to run Linux within a Windows environment partition. For many users, Linux commands are more comfortable when running scripts or just interacting programmatically with cloud resources. This guide will show you how to install the WSL on Windows 10, configure the AWS CLI to run in this environment, how to start/stop WSL, how to keep WSL up to date, and how to use WSL to interact with AWS S3 buckets.

## Helpful Links

•	[What is WSL?](https://docs.microsoft.com/en-us/windows/wsl/about)
•	[What is the AWS CLI?](https://aws.amazon.com/cli/#:~:text=The%20AWS%20Command%20Line%20Interface,and%20automate%20them%20through%20scripts.)
•	[WSL on Window 10](https://docs.microsoft.com/en-us/windows/wsl/install)
•	[Installing the AWS CLI on WSL](https://docs.aws.amazon.com/cli/v1/userguide/install-linux.html)
•	[Setting up WSL creds for sudo operations](https://docs.microsoft.com/en-us/windows/wsl/setup/environment)
•	[Setting up AWS CLI to use with S3](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
•	[Interacting with S3 using the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html)
•	[Navigating to local drive in WSL](https://askubuntu.com/questions/943006/how-to-navigate-to-c-drive-in-bash-on-wsl-ubuntu)
•	[AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html)



## Installing WSL on Windows 10

Open the command line on your Windows machine (Start Menu and type “Command Prompt”). You should get a black box. This is the terminal for your machine. From here, you can tell your computer to perform a variety of tasks directly, if you know the correct commands to give it.

Copy/paste this command (you may have to use CTRL+SHIFT+V):

`wsl –install`

WSL should automatically install the latest Ubuntu version available in the app store, although it may give you an extra y/n prompt, depending on the version. You will get a confirmation once WSL is installed. Now, you will be able to see the WSL in the Start Menu anytime you need to access it again.

**Note**: If this is the first-time using WSL on your machine, you will need to create a Linux username and password (much like how you must have one for your Windows machine). You may need to follow the instructions [here](https://docs.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password) to set your username and password, as well as request administrative permissions by emailing helpdesk@fredhutch.org. This will allow you to run sudo commands, which require an elevated level of access. You can check for updates on-demand by typing `sudo apt-get` update in the WSL terminal window. It is best practice to do this semi-regularly (once a month or so).

### Configuring the AWS CLI (v2) to use on WSL

Open the WSL and copy/paste these commands (you may have to use CTRL+SHIFT+V or right-click):

`curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"`
`unzip awscliv2.zip`
`sudo ./aws/install`

This should install the latest version of the CLI on your machine. When it is complete, you should be able to type `aws –version` in the WSL terminal and verify that it is installed (step by step [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)).

To interact with a specific AWS account or S3 bucket, you will need a few pieces of information first. When interacting with the CLI, rather than using a username and password, you use an access key (AK) and a secret access key (SAK). In addition, you’ll need the region the account lives in (FHCC uses us-west-2 for almost everything), and the output (json or text depending on preference and need). You can contact the Helpdesk to get an AK and SAK generated for you. These keys generally expire after 6 months and are specific to your level of permissions. **Do not share keys with anyone.**

Type `aws configure` to start the process and follow the prompts. More detailed instructions are [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config). Once this is done, you are all set to perform operations within a specific AWS account.

### Accessing Windows Explorer (locally stored files) using WSL

You can easily access locally stored files using WSL by navigating to the top (root) folder and then typing `ls`. To do this, type `cd /mnt/c` into WSL. The `cd` command in this instance refers to “change directory” and `ls` refers to “list”. You can learn more about navigating through local files [here](https://askubuntu.com/questions/943006/how-to-navigate-to-c-drive-in-bash-on-wsl-ubuntu).

### Working with S3 using the AWS CLI

Detailed instructions are [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html) and [here](https://qiita.com/alokrawat050/items/56820afdb6968deec6a2), but a few key commands to get you started are:

Move objects from one S3 bucket to another:
`aws s3 mv s3://your-source-bucket/example-file-name s3://your-target-bucket/`

Move objects from local directory to S3:
`aws s3 cp test.txt s3://mybucket/test2.txt`

Copy objects from one S3 bucket to another:
`aws s3 cp s3://your-source-bucket/example-file-name s3://your-target-bucket/`

List all S3 buckets in account:
`aws s3 ls`

Delete an S3 bucket:
`aws s3 rb s3://mybucket`
