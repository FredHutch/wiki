---
title: Computing Access Overview
last_modified_at: 2018-07-19
---
This section contains a variety of frequently updated sections where you can find current information about office hours, current software builds, recent notifications, and the Resource Library which contains a growing list of short demo's and articles about a variety of topics not addressed elsewhere in the site.  

Note:  This section is still under construction.  If you have any input for what you'd like to see addressed here, please email your suggestions to `sciwiki`.

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

## Using Linux Resources from a Mac
### Terminal
The default Mac terminal is a good choice for connecting to and using SciComp Linux-based resources. If you are using to using the features of screen I would recommend using [iTerm2](https://www.iterm2.com/) for your local terminal program on your Mac.  iTerm2 is fully integrated with tmux. Tmux provides most of the same features as GNU Screen.  Run tmux from one of the Linux session servers like lynx, manx, sphinx.

```
module load tmux
```


### X11 for Mac
The only X11 client for Mac is XQuartz. Install XQuartz before running any Linux X11 apps such as RStudio or Matlab. Go [here](http://xquartz.macosforge.org), and download and install the latest version of XQuartz.

After installing XQuartz just start the app. The XQuartz icon will appear in the toolbar showing that it is running. XQuartz is now running an X11 client and that is the only interaction that you need to do with XQuartz. After XQuartz is running, open the Mac terminal. The latest version of XQuartz sets the DISPLAY environment with the default Mac terminal window.  I do not recommend using the terminal that comes with XQuartz.

When connecting to a rhino with ssh always use the -X flag to forward your Xsession to your Mac.

```ssh -X jfdey@rhino2
```
After connecting to a Rhino verify that your X11 client is working by typing
`xeyes`.

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
