---
title: Getting AWS Credentials
last_modified_at: 2018-07-12
---

# Getting AWS Credentials

You can obtain [Amazon Web Services](https://aws.amazon.com/) (AWS) credentials ​​to make use of the Center's AWS account.

By default this will give you access to your lab's S3 bucket, but you can request permission to use other services.

**NOTE**: Do NOT share these credentials with any other user, inside or outside of Fred Hutch. If another Fred Hutch
employee needs credentials, they can obtain their own credentials in this same manner. If you need credentials for an
external collaborator, or if you are having a permissions issue,
please contact [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).



## Methods of Getting Credentials


There are two ways to get credentials. Which one to use depends on how you will use AWS. 

If you are going to use AWS from the command line or scripts, follow the 
[command-line instructions](#command-line-instructions).

If you are going to use AWS from graphical programs such as Cyberduck, follow the [gui-instructions](#gui-instructions).

## Command-line instructions

Obtaining Credentials
​

First, `ssh` to one of the rhino machines (or use NoMachine):

```
ssh rhino
```

Then run the `awscreds` ​command.
​
```
awscreds
```

This will prompt you for your HutchNet password, which will not echo to the screen when you type it in.

​It will then write out your credentials to files, which programs that use AWS will look for. `awscreds` will report exactly what it's doing and where it has written your credentials. ​

`awscreds` includes some options that allow you to customize its behavior. You can see this options by typing the command

```
awscreds --help
```

See the [S3 Page](...) for documentation on accessing AWS S3 from the command line.


## GUI Instructions

Open a web browser and navigate to [https://toolbox.fhcrc.org/sw2srv/aws/account](https://toolbox.fhcrc.org/sw2srv/aws/account). 
This page is only accessible within the Hutch network.

When prompted, enter your HutchNet ID and password.

Your browser will display your access key and secret key. You can use these with graphical applications such as Cyberduck.

See the [Cyberduck Page](...) for documentation on using Cyberduck.

#### ​Accessing other AWS Services
​

S3 is the only service you can access immediately after creating your credentials.​

For questions about accessing other services, please contact [Help Desk​](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html).
