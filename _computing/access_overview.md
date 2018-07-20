---
title: Computing Access Overview
last_modified_at: 2018-07-19
---

## Our Network
Overview of physical network and datacenter.
### VPN
Describe the VPN and link to helpdesk.

## Client Devices
Overview of supported client devices.

### Laptops and Desktops
Laptops: Windows, MacOS
Desktops: Windows, MacOS, Ubuntu Linux

### Mobile Devices
Link to CIT resources.

### Operating Systems
Overview of available OSes (perhaps comparison table?)

## Access Methods
Terminal/SSH including X11, NoMachine, and browser-based services access

## Access Requirements or Credentials
HutchnetID, cluster account. Include a way to check on these.

### Getting AWS S3 Credentials
You can obtain [Amazon Web Services](https://aws.amazon.com/) (AWS) credentials ​​to make use of the Center's AWS account. By default this will give you access to your lab's S3 bucket, but you can request permission to use other services.

**NOTE**: Do NOT share these credentials with any other user, inside or outside of Fred Hutch. If another Fred Hutch
employee needs credentials, they can obtain their own credentials in this same manner. If you need credentials for an
external collaborator, or if you are having a permissions issue,
please contact [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).

There are two ways to get credentials. Which one to use depends on how you will use AWS, either via the command line on Rhino/Gizmo or via graphical programs on your local computer such as via Cyberduck.  

#### Command Line (Rhino/Gizmo) Instructions
First, `ssh` to one of the `rhino machines` (or use NoMachine):

```
ssh rhino
```

Then run the `awscreds` ​command.
​
```
awscreds
```

This will prompt you for your HutchNet password, which will not echo to the screen when you type it in.  It will then write out your credentials to files, which programs that use AWS will look for. `awscreds` will report exactly what it's doing and where it has written your credentials. ​`awscreds` includes some options that allow you to customize its behavior. You can see this options by typing the command

```
awscreds --help
```

See more about accessing AWS S3 via the command line [here.](/computing/store_collaboration/)


#### GUI Instructions

Open a web browser and navigate to [https://toolbox.fhcrc.org/sw2srv/aws/account](https://toolbox.fhcrc.org/sw2srv/aws/account).
This page is only accessible within the Hutch network. When prompted, enter your HutchNet ID and password. Your browser will display your access key and secret key. You can use these with graphical applications such as Cyberduck. See the more about how to use Cyberduck to connect to AWS S3 [here.](/computing/store_collaboration/)
