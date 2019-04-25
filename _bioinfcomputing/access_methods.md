---
title: Computing Resource Access Methods
last_modified_at: 2019-04-11
primary_reviewers: bmcgough
---

## Desktop Computing and Mobile Devices

Client devices are supported by Center IT (ADM, CRD, VIDD) as well as Division IT groups (BSD, HB, PHS).  Please see Center IT's page in CenterNet about [Laptops and Desktops](https://centernet.fredhutch.org/cn/u/center-it/help-desk/laptops-and-desktops.html) for more information about support for desktop computing.

>Note: If you request a Linux Desktop, Center IT will recommend that you use NoMachine from a Windows or Mac system instead as this is the most appropriate choice for most users but not all. If it is required for your work, it can be supported.  

Please see Center IT pages for more information on [Mobile Device Services](https://centernet.fredhutch.org/cn/u/center-it/services/mobile_device_service.html) or contact [Help Desk](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html) with questions or problems.  


## SSH Clients for Remote Computing Resources

We use two common protocols to access remote compute resources. The first is the Hypertext Transfer Protocol (HTTP). This is the way your browser communicates with remote web servers. The second common protocol is Secure SHell (SSH). This is the method used to run a program on a remote server. Typically the program run is a `shell` that gives you an interactive command line on the remote host.

Many programs you will want to run on a remote compute server are command line programs. These are easily executed from your `shell` remote process. You use this method when opening a terminal (`shell`) on a compute server (like `rhino`) and typing the name of the program or script.

You may also need graphical output (GUI) to use tools like R Studio or advanced text editors. If the remote program has a Graphical User Interface (GUI) then you use a Windows-like system called X (or X11 or XOrg or officially The X Window System). The X Window System is backward from the way you may think it works - what you run on your laptop or desktop is actually the X server, and the remote program you want to display on your device is the client. All SSH clients support tunneling the X traffic, so usually you will use SSH to start the remote GUI program, which is then displayed on your device.

This is a list of clients and servers by OS:

| OS | SSH client and `command` | X server | Availability
| --- | --- | --- | --- |
| MacOS | OpenSSH `ssh` | [XQuartz](https://www.xquartz.org/) | OpenSSH is already installed on MacOS
| Linux | OpenSSH `ssh` | Xorg | Both likely already installed on most systems
| Windows | puTTY `puTTY` | Windows Subsystem for Linux | Must be installed by admin (email `helpdesk`)


### Windows

puTTy is the most widely used secure shell software for Windows. You can install puTTy through "Software Center" and then simply connect to host name `rhino`.

### Mac OS

The default Mac terminal is a good choice for connecting to and using SciComp Linux-based resources.  We also recommend using [iTerm2](https://www.iterm2.com/) for your local terminal program on your Mac.  It has a richer feature set that comes in handy as your computing needs grow.

The only X11 client for Mac is XQuartz. Install XQuartz before running any Linux X11 apps such as RStudio or Matlab. Go [here](http://xquartz.macosforge.org), and download and install the latest version of XQuartz.

After installing XQuartz just start the app. The XQuartz icon will appear in the toolbar showing that it is running. XQuartz is now running an X11 client and that is the only interaction that you need to do with XQuartz. After XQuartz is running, open the Mac terminal. The latest version of XQuartz sets the DISPLAY environment with the default Mac terminal window. We do not recommend using the terminal that comes with XQuartz.

When connecting to a `rhino` with `ssh` always use the -X flag to forward your Xsession to your Mac.

```
ssh -X HutchID@rhino2
```

After connecting to a `rhino` verify that your X11 client is working by typing `xeyes`.


### Linux

Terminator is a convenient terminal emulator that can have multiple terminals in a single window. You can use Terminator on your Linux desktop. Windows and Mac users will need a X11 software to use SciComp resources as graphical desktop. We recommend [NoMachine NX](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/NX%20Client%20for%20Windows.aspx) to connect to a Linux machine with Terminator.  

After starting Terminator you can right click on the terminal window and either split it horizontally or vertically. This 1 min video shows you how it works:

[![Terminator](https://img.youtube.com/vi/OmkkbvH_JZU/0.jpg)](https://youtu.be/OmkkbvH_JZU "See how Terminator works")



## SSH Connections
SSH uses the TCP network protocol to make connections between systems. TCP is a persistent, stateful connection that is resilient to network interruptions. When you use SSH to run a program on a remote system (even a shell) the connection you make is tied to an SSH process on the remote machine, and all programs are children of that SSH process. If that process stops, all children stop as well. If the network connection does drop between your client and the server, your SSH process stops, and all your running programs stop.

There are several ways around this:

* NoMachine - you can use the NoMachine service
* GNU Screen or tmux - these utilities run a separate process on the remote host that is not tied to your SSH connection
* Cluster jobs - you can run your programs using our [slurm cluster](/bioinfcomputing/compute_jobs/), which queues and executes programs independently of your SSH connection

### NoMachine NX (Multi-OS)
NoMachine NX is a remote desktop software for Linux servers that gives you full remote access to a graphical user interface from Windows or Mac clients. It is installed on the SciComp session Servers `lynx`, `sphinx` or `manx` which you use to access the `rhino` systems. To connect through the local Fred Hutch network or through a VPN connection please download and install the NoMachine Enterprise Client from [NoMachine's Site.](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client)  Windows users can also install an older version from "Software Center".

Configuration is very quick and the process is described in this video:

[![NoMachine](https://img.youtube.com/vi/I3znzb9M_Ms/0.jpg)](https://youtu.be/I3znzb9M_Ms "See how to connect with NoMachine")

One of the nicest features of NoMachine is that you can disconnect from the server's desktop environment and later resume the connection and continue right where you left off with all terminal windows in the same place. NoMachine from Windows or Mac is often a better choice than installing a Linux desktop.

### Screen and tmux
GNU Screen and tmux are both terminal multiplexers. They run one or more shell processes on a remote system and enable you to disconnect and reconnect while leaving the process(es) running. They are both full-featured utilities that take a long time to learn. Using the command below, you can get working with tmux quickly.

1. Use SSH to connect to a remote system: `ssh rhino`
1. On Fred Hutch systems, load the tmux environment module: `module load tmux` or just `ml tmux`
1. Start a tmux session by entering `tmux`, or attach to your running tmux session using `tmux attach` or just `tmux a`
1. When in a session, typing `exit` or `ctrl-d` will exit the tmux session
1. Closing the lid of your laptop and/or exiting your local ssh client will leave the tmux session running
1. Explicitly disconnect with `ctrl-b d` (ctrl-b puts tmux into command mode, and the disconnect command is d)

A note about tmux iterm2 integration. If you are using iterm2 on a Mac, add `-CC` to your tmux command. This will run a tmux console as well as tmux in that terminal. From there, you can use iterm2 commands to create a new tmux sessions in a new window (`command-n`) or a new tab (`command-t`). When you disconnect, simply reattach to that first tmux session, and iterm2 will re-open all your windows and/or tabs.

A note about the X Window System and terminal multiplexers. As stated above, on your laptop you are running an X server, and the remote program is a client. Terminal multiplexing allow your laptop to disconnect because the multiplexing server is running on the remote system and your device is the client. When you close your laptop, the X server stops. Clients exit at that point as a client cannot do anything without a server. See [NoMachine](#nomachine-nx-(multi-os)) for a workaround for X programs.

## Making Things Easier: The SSH config file
Located in your home directory in the `.ssh` folder is a file called `config` (create it if it doesn't exist). Your SSH client will read configuration options from this file when you use it. Any of the command line options can be specified in this config file to avoid overly complex SSH commands and make frequent use of remote servers more straightforward.  

### Forward X11
You must start from a client that is running an X11 server. These include any Linux system including NoMachine, XQuartz on MacOS, and Xming or Cygwin on Windows.

Config|Command Line|Value|Notes
---|---|---|---
ForwardX11|-X|yes/no|This will instruct your ssh client to set up a tunnel between the X11 server on your client device and a port on the remote machine. This port is specified by the `DISPLAY` environment variable.
ForwardTrustedX11|-Y|yes/no|Trusted X11 connections bypass X11 security features. The traffic is all still encrypted, but root on the remote machine may be able to access your client device. Some SSH implementations do not support X11 security extensions, so you must specify `-Y` or `ForwardTrustedX11` to bypass them.

Check on the remote system that you have a `DISPLAY` environment variable set using `echo $DISPLAY` and test X11 itself by running a simple X11 program like `xeyes`.

### Identity
Often the local user on your client device is not the same as your username on the remote system. You can always `ssh joeuser@remotehost.com` but you can also specify the alternate username in the config file.

Config|Command Line|Value|Notes
---|---|---|---
User|<username>@|Your remote system username|Make ssh commands shorter and easier.
Identity|-i|<path to identity file>|SSH supports multiple identities and multiple keys. Use this option to specify a different SSH key from the default `~/.ssh/id_rsa`.

### Keys
If you use your password to ssh, you can certainly continue to do so. However, with a key you will have to type your password less frequently, or sometimes never. Many remote systems do not allow password authentication and require keys.

Create an SSH key - on MacOS or Linux, run `ssh-keygen` and follow the prompts (change the file location if you are creating a new key but want to keep the old one). On Windows you will need `puttygen` if using puTTY or copy the Linux way if using Cygwin.

You will be prompted to enter and then confirm a passphrase. This is the best protection of your ssh key, and should be a longer complex passphrase. See below to automate the use of it, and try to resist creating passphrase-less keys.

This command will create two files in `~/.ssh` - `id_rsa` and `id_rsa.pub`. The first is your private key, and the second is the public key.

#### MacOS Keychain
No one wants to type a long passphrase every time they use SSH. Creating an SSH key with no passphrase is unsafe. MacOS keychain to the rescue!

The following steps will get your MacOS device into a state where your SSH key passphrase is unlocked for you when you log into the Mac, and is automatically supplied to SSH. You will need to be logged in to your Mac, have a terminal open, and have an SSH key to start.

* Add your 'key' to the keychain - run `ssh-add -K <path to keyfile>` the default is `~/.ssh/id_rsa`. This will prompt for your passphrase, and then store it in your login keychain.
* Tell ssh to use it - add the following to your ssh config:

Config|Command Line|Value|Notes
---|---|---|---
UseKeychain|-o UseKeychain|yes/no|So not all config options have easy command line options. This tells your ssh client to use your keychain for the passphrase.
AddKeysToAgent|-o AddKeysToAgent|yes/no|Starts and ssh-agent process that will hold your unlocked key safely in memory for subsequent ssh session. Shutdown or reboot and this disappears.

#### Good key management
Your SSH key is actually in two parts - the public key, and the private key. Public/Private key pairs are fascinating if you are in to encryption. Be sure to search and read all about them.

##### Public Key
Your SSH public key is not secret. It can and should be distributed. Typically your public key is added to your `~/.ssh/authorized_keys` file (just add it to the end). Also, if there is a public key file in `~/.ssh` on the remote system, that will work. You can email this, paste it, whatever. The trust is on the other end - any remote system that accepts your public key in agreeing that it identifies you.

##### Private Key
Protect this. This is how you prove you own the public key. It is best to not put this anywhere other than your client device, and perhaps a backup if you like, though no lasting encryption will be done with it, so losing it will not destroy any data.

#### Best Practices
The best practices involving keys include:

* limit copies of your private key (there should be only one)
* do not enter a blank passphrase
* add your public key (cut-and-paste is fine) to `~/.ssh/authroized_keys` file
* you do not need to put both of your keys on every machine you want to use, only your client device

#### Agents
SSH supports an in-memory agent process that will hold your unlocked private key safely. This alleviates the need to type your passphrase for the duration of time the agent is running. See above for MacOS options. On Linux, you can run `eval $(ssh-agent)` to start an agent, and `ssh-add [path to keyfile if not default]` to add your key to the running agent process.

You can forward key requests from remote machine back to your running agent:

Config|Command Line|Value|Notes
---|---|---|---
ForwardAgent|-o ForwardAgent|yes/no|Forward agent requests back to the agent running on your client device.

### All together now
Your SSH config supports multiple 'stanzas' to help you as your config may not be the same for remote hosts. The 'stanza' keyword is `Host`. In the example below, everything from one `Host` line to the next `Host` line is applied the specified host.
```
Host *.fhcrc.org !snail.fhcrc.org
	ProxyJump snail.fhcrc.org

Host *.fhcrc.org
	UseKeychain yes
	AddKeysToAgent yes
	IdentityFile ~/.ssh/id_rsa
	ForwardX11 yes
	ForwardX11Trusted yes
	ForwardAgent yes
   	User bmcgough
```
This config contains all of the features mentioned above and will apply them to all `fhcrc.org` hosts. It will use `snail` (the SSH gateway host) for all hosts except `snail` itself, as this would create a loop. Obviously you would replace your identity file path and username if needed.

One final note - SSH does not do DNS resolution before consulting the config file, so typing `ssh rhino` will not trigger the `*fhcrc.org` Host entries. You can add `rhino` to the Host line to have this trigger the config as well.


## Access via a Remote Location

Fred Hutch supports use of a VPN to remotely connect with our network. The network is protected by a firewall and there are currently 2 options to get access to resources inside the network, using VPN or the SSH gateway `snail.fhcrc.org`. This is allowed as all SSH communication is encrypted, and the gateway system is audited.

SSH supports using a proxy or "jump host" and can be configured to do so automatically.

Config|Command Line|Value|Notes
---|---|---|---
ProxyJump|-J|hostname|SSH will use the specified host as a middle-point before completing the connection to your desired host.

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

Please see [this page](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts) to learn more about ProxyCommand.
