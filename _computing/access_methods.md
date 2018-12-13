---
title: Computing Resource Access Methods
last_modified_at: 2018-09-27
main_authors:
primary_reviewers:
---
>Note:  This page is still a work in progress.  If you have specific input on topics related to access methods, please email them to `sciwiki`.

## Client Devices

Client devices are supported by Center IT (ADM, CRD, VIDD) as well as Division IT groups (BSD, HB, PHS).  

### Laptops and Desktops

Center IT supports 3 different operating systems:

- Laptops:
    - Windows
    - MacOS
- Desktops:
    - Windows
    - MacOS
    - Ubuntu Linux LTS

Please see Center IT's page in CenterNet about [Laptops and Desktops](https://centernet.fredhutch.org/cn/u/center-it/help-desk/laptops-and-desktops.html) for more information about support.  

>Note: If you request a Linux Desktop, Center IT will recommend that you use NoMachine from a Windows or Mac system instead as this is the most appropriate choice for most users but not all. If it is required for your work, it can be supported.  

### Mobile Devices

Please see Center IT pages for more information on [Mobile Device Services](https://centernet.fredhutch.org/cn/u/center-it/services/mobile_device_service.html) or contact [Help Desk](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) with questions or problems.  


## Access Methods (Terminals, X11, ssh)

There are multiple ways you can get access Scientific Computing resources which are all running on a supported version of Ubuntu Linux. The most simple form of access is using a secure shell terminal software such as `ssh` or `putty`. You may also need graphical output (GUI), for example to use tools like R Studio or advanced text editors. For this you will need X11 tools which can either be installed as add-ons to your ssh program or a dedicated tool such as NoMachine.  See this page for more information about [ssh configurations.](/compdemos/ssh/)

### Putty (Windows)

Putty is the most widely used secure shell software for Windows. You can install putty through "Software Center" and then simply connect to host name `rhino`


### iTerm2 (Mac OSX)

The default Mac terminal is a good choice for connecting to and using SciComp Linux-based resources.  We also recommend using [iTerm2](https://www.iterm2.com/) for your local terminal program on your Mac- it has a richer feature set that comes in handy as your computing needs grow.

### xquartz X11 (Mac OSX)

The only X11 client for Mac is XQuartz. Install XQuartz before running any Linux X11 apps such as RStudio or Matlab. Go [here](http://xquartz.macosforge.org), and download and install the latest version of XQuartz.

After installing XQuartz just start the app. The XQuartz icon will appear in the toolbar showing that it is running. XQuartz is now running an X11 client and that is the only interaction that you need to do with XQuartz. After XQuartz is running, open the Mac terminal. The latest version of XQuartz sets the DISPLAY environment with the default Mac terminal window. We do not recommend using the terminal that comes with XQuartz.

When connecting to a rhino with ssh always use the -X flag to forward your Xsession to your Mac.

```
ssh -X jfdey@rhino2
```

After connecting to a Rhino verify that your X11 client is working by typing `xeyes`.


### Terminator (Linux)

Terminator is a convenient terminal emulator that can have multiple terminals in a single window. You can use Terminator on your Linux desktop. Windows and Mac users will need a X11 software to use SciComp resources as graphical desktop. We recommend [NoMachine NX](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/NX%20Client%20for%20Windows.aspx) to connect to a Linux machine with Terminator.  

After starting Terminator you can right click on the terminal window and either split it horizontally or vertically. This 1 min video shows you how it works:

[![Terminator](https://img.youtube.com/vi/OmkkbvH_JZU/0.jpg)](https://youtu.be/OmkkbvH_JZU "See how Terminator works")



### NoMachine NX access (Multi-OS)
NoMachine NX is a remote desktop software for Linux servers that gives you full remote access to a graphical user interface from Windows or Mac clients. It is installed on the SciComp session Servers `lynx`, `sphinx` or `manx` which you use to access the `rhino` systems. To connect through the local Fred Hutch network or through a VPN connection please download and install the NoMachine Enterprise Client from [NoMachine's Site.](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client)  Windows users can also install an older version from "Software Center".

Configuration is very quick and the process is described in this video:

[![NoMachine](https://img.youtube.com/vi/I3znzb9M_Ms/0.jpg)](https://youtu.be/I3znzb9M_Ms "See how to connect with NoMachine")

One of the nicest features of NoMachine is that you can disconnect from the server's desktop environment and later resume the connection and continue right where you left off with all terminal windows in the same place. NoMachine from Windows or Mac is often a better choice than installing a Linux desktop.



## How can I get access from remote locations?

The Fred Hutch network is protected by a firewall and there are currently 2 options to get access to resources inside the network, using VPN or `snail.fhcrc.org`.

### VPN

The Fred Hutch desktop VPN service is the default choice for all remote connections. Please see the [VPN page on CenterNet](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html) for more details.

### ssh to `snail.fhcrc.org`

Snail is a SSH gateway (also called bastion host or jump host) you can use to get remote access if you do not require the features that VPN provides. Using SSH can be easier for some users, for example if you have a network printer at home you cannot use it while connected to VPN.
By default you login to `snail.fhcrc.org` first and then to `rhino`. However, if you add these 2 lines your ~/.ssh/config file you only have to type `ssh` once
```
    Host rhino*.fhcrc.org
    ProxyCommand ssh yourusername@snail.fhcrc.org exec nc %h %p 2> /dev/nul
```
If you are outside the Fred Hutch network type `ssh rhino.fhcrc.org` to use the snail gateway and if you are inside type `ssh rhino` to bypass the gateway.

Please see [this page](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts) to learn more about ProxyCommand.  See this page for more information about [ssh configurations.](/compdemos/ssh/)
