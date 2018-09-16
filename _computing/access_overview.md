---
title: Computing Access Overview
last_modified_at: 2018-07-19
---
This section contains a variety of frequently updated sections where you can find current information about office hours, current software builds, recent notifications, and the Resource Library which contains a growing list of short demo's and articles about a variety of topics not addressed elsewhere in the site.  

Note:  This section is still under construction.  If you have any input for what you'd like to see addressed here, please email your suggestions to `sciwiki`.

## Which accounts / credentials do I need ?

This section describes how to get access and credentials to computing systems on campus and in the cloud.

### `HutchNet ID`

a HutchNet ID is the standard login name and password you receive when you start working at the Hutch or are an official affiliate. It is also called Network login or Active Directory credentials. You can use it to login to most resources at the Center (Desktop Computer, Employee Self Service, VPN, Webmail) as well to Scientific Computing systems such as Rhino (`ssh rhino`), which is the login system to large scale cluster computing resources like Gizmo, Beagle and Koshu.

If one of your collaborators requires access to the Fred Hutch network you can submit a [non-employee action form](https://centernet.fredhutch.org/cn/f/hr/lcex/non-employee-action-form.html). Non-employees is a generic administrative term for affiliates, students, contractors, etc.

Please see the Service Desk site on CenterNet for more information about [HutchNet ID](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) incl. password rotation, etc.

#### `Login to Rhino`

A working HutchNet ID is all you need to login to Rhino (`ssh rhino`). Some users will see an error message that their home directory was not found. This can happen if you are in a newly created department or in one that is typically not working with SciComp resources. Please contact SciComp to have your home directory created.

### `GitHub.com`

The FredHutch GitHub organization at https://github.com/FredHutch offers free access to public and private git repostories to all FredHutch staff and collaborators. If you are a Fred Hutch employee working with source code and don't have a github.com account yet, please [create one](https://github.com/join) and ask SciComp: "Please add my github user id xyz to organization github.com/FredHutch". Once you are a member of the organization you can create repostories, teams and invite external collaborators to share and edit code.

Note: github.com/FredHutch is the only officially approved cloud based source code system at Fred Hutch. It has security features that are otherwise not available. 

A GitHub account is different from other accounts. If you leave the Hutch you keep your GitHub account, however you will just be removed from the FredHutch organization on GitHub and your former colleagues can still add you as an external collaborator to their GitHub repositories.

More information about [git and GitHub](/bioinformatics/compute_github/)

### `Amazon Web Services (AWS)`

You can obtain [Amazon Web Services](https://aws.amazon.com/) (AWS) credentials ​​to make use of the Center's AWS account. By default this will give you access to your lab's S3 bucket, but you can request permission to use other services such as AWS Batch.

**NOTE**: Do NOT share these credentials with any other user, inside or outside of Fred Hutch. If another Fred Hutch
employee needs credentials, they can obtain their own credentials in this same manner. If you need credentials for an external collaborator, or if you are having a permissions issue, please contact [Scientific Computing](https://centernet.fredhutch.org/cn/u/center-it/cio/scicomp.html).

There are two ways to get credentials. Which one to use depends on how you will use AWS, either via the command line on Rhino/Gizmo or via graphical programs on your local computer such as via Cyberduck or Mountainduck.

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


## How can I get access from remote ?

The Fred Hutch network is protected by a firewall and there are currently 2 options to get access to resources inside the network 

### VPN 

The Fred Hutch desktop VPN service is the default choice for all remote coennections. Please see the [VPN page on Centernet](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html for more details.

### ssh to `snail.fhcrc.org`

Snail is a SSH gateway (also called bastion host or jump host) you can use to get remote access if you do not require the features that VPN provides. Using SSH can be easier for some users, for example if you have a network printer at home you cannot use it while connected to VPN. 
By default you login to snail.fhcrc.org first and then to rhino. However, if you add these 2 lines your ~/.ssh/config file you only have to type `ssh` once

    Host rhino*.fhcrc.org
    ProxyCommand ssh yourusername@snail.fhcrc.org exec nc %h %p 2> /dev/nul

if you are outside the Fred Hutch network type `ssh rhino.fhcrc.org` to use the snail gateway and if you are inside type `ssh rhino` to bypass the gateway.
 
Please see [this page](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts) to learn more about ProxyCommand 


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

### NoMachine NX access

Please see [NoMachine access](/computing/access_nomachine/)

## Using Linux Resources from a Mac

### Terminal

The default Mac terminal is a good choice for connecting to and using SciComp Linux-based resources. If you are using to using the features of screen we recommend using [iTerm2](https://www.iterm2.com/) for your local terminal program on your Mac.  iTerm2 is fully integrated with tmux. Tmux provides most of the same features as GNU Screen.  If you run tmux on rhino you must remember on which of the 3 rhinos you ran it and the connect directly to that machine using SSH.  

```
module load tmux
```

### X11 for Mac
The only X11 client for Mac is XQuartz. Install XQuartz before running any Linux X11 apps such as RStudio or Matlab. Go [here](http://xquartz.macosforge.org), and download and install the latest version of XQuartz.

After installing XQuartz just start the app. The XQuartz icon will appear in the toolbar showing that it is running. XQuartz is now running an X11 client and that is the only interaction that you need to do with XQuartz. After XQuartz is running, open the Mac terminal. The latest version of XQuartz sets the DISPLAY environment with the default Mac terminal window.  I do not recommend using the terminal that comes with XQuartz.

When connecting to a rhino with ssh always use the -X flag to forward your Xsession to your Mac.

```
ssh -X jfdey@rhino2
```

After connecting to a Rhino verify that your X11 client is working by typing
`xeyes`.
