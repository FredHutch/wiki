---
title: Advanced SSH config including X11, ssh gateway (snail), and MacOS keychain
last_modified_at: 2018-11-28
main_author: Ben McGough
---
This page contains several configs for advanced (and more convenient) SSH use.

## The SSH config file
Located in your home directory in the `.ssh` folder is a file called `config` (create it if it doesn't exist). Your SSH client will read configuration options from this file when you use it. Any of the command line options can be specified in this config file to avoid overly complex SSH commands. This is what this page is all about.

## Forward X11
You must start from a client that is running an X11 server. These include any Linux system including NoMachine, XQuartz on MacOS, and Xming or Cygwin on Windows.
Config|Command Line|Value|Notes
---|---|---|---
ForwardX11|-X|yes/no|This will instuct your ssh client to set up a tunnel between the X11 server on your client device and a port on the remote machine. This port is specified by the `DISPLAY` environment variable.
ForwardTrustedX11|-Y|yes/no|Trusted X11 connections bypass X11 security features. The traffic is all still encrypted, but root on the remote machine may be able to access your client device. Some SSH implementations do not support X11 security extensions, so you must specify `-Y` or `ForwardTrustedX11` to bypass them.

Check on the remote system that you have a `DISPLAY` environment variable set using `echo $DISPLAY` and test X11 itself by running a simple X11 program like `xeyes`.

## Identity
Often the local user on your client device is not the same as your username on the remote system. You can always `ssh joeuser@remotehost.com` but you can also specify that in the config file.

Config|Command Line|Value|Notes
---|---|---|---
User|<username>@|Your remote system username|Make ssh commands shorter and easier.
Identity|-i|<path to identity file>|SSH supports multiple identities and multiple keys. Use this option to specify a different SSH key from the default `~/.ssh/id_rsa`.

## Keys
If you use your password to ssh, you can certainly continue to do so. However, with a key you will have to type your password less frequently, or sometimes never. Many remote systems do not allow password authentication and require keys.

Create an SSH key - on MacOS or Linux, run `ssh-keygen` and follow the prompts (change the file location if you are creating a new key but want to keep the old one). On Windows you will need `puttygen` if using puTTY or copy the Linux way if using Cygwin.

You will be prompted to enter and then confirm a passphrase. This is the best protection of your ssh key, and should be a longer complex passphrase. See below to automate the use of it, and try to resist creating passphrase-less keys.

This command will create two files in `~/.ssh` - `id_rsa` and `id_rsa.pub`. The first is your private key, and the second is the public key.

## MacOS Keychain
No one wants to type a long passphrase every time they use SSH. Creating an SSH key with no passphrase is unsafe. MacOS keychain to the rescue.

The following steps will get your MacOS device into a state where your SSH key passphrase is unlocked for you when you log into the Mac, and is automatically supplied to SSH. You will need to be logged in to your Mac, have a terminal open, and have an SSH key to start.

* Add your 'key' to the keychain - run `ssh-add -K <path to keyfile>` the default is `~/.ssh/id_rsa`. This will prompt for your passphrase, and then store it in your login keychain.
* Tell ssh to use it - add the following to your ssh config:
Config|Command Line|Value|Notes
---|---|---|---
UseKeychain|-o UseKeychain|yes/no|So not all config options have easy command line options. This tells your ssh client to use your keychain for the passphrase.
AddKeysToAgent|-o AddKeysToAgent|yes/no|Starts and ssh-agent process that will hold your unlocked key safely in memory for subsequent ssh session. Shutdown or reboot and this disappears.

## Good key management
Your SSH key is actually in two parts - the public key, and the private key. Public/Private key pairs are fascinating if you are in to encryption. Be sure to search and read all about them.

### Public Key
Your SSH public key is not secret. It can and should be distributed. Typically your public key is added to your `~/.ssh/authorized_keys` file (just add it to the end). Also, if there is a public key file in `~/.ssh` on the remote system, that will work. You can email this, paste it, whatever. The trust is on the other end - any remote system that accepts your public key in agreeing that it identifies you.

### Private Key
Protect this. This is how you prove you own the public key. It is best to not put this anywhere other than your client device, and perhaps a backup if you like, though no lasting encryption will be done with it, so losing it will not destroy any data.

### Best Practices
The best practices involving keys include:

* limit copies of your private key (there should be only one)
* do not enter a blank passphrase
* add your public key (cut-and-paste is fine) to `~/.ssh/authroized_keys` file
* you do not need to put both of your keys on every machine you want to use, only your client device

### Agents
SSH supports an in-memory agent process that will hold your unlocked private key safely. This alleviates the need to type your passphrase for the duration of time the agent is running. See above for MacOS options. On Linux, you can run `eval $(ssh-agent)` to start an agent, and `ssh-add [path to keyfile if not default]` to add your key to the running agent process.

You can forward key requests from remote machine back to your running agent:
Config|Command Line|Value|Notes
---|---|---|---
ForwardAgent|-o ForwardAgent|yes/no|Forward agent requests back to the agent running on your client device.

## Proxies
Fred Hutch supports use of a VPN to remotely connect with our network. It also supports an SSH gateway. This is allowed as all SSH communication is encrypted, and the gateway system is audited. The gateway is called `snail.fhcrc.org`.

SSH supports using a proxy or "jump host" and can be configured to do so automatically.

Config|Command Line|Value|Notes
---|---|---|---
ProxyJump|-J|hostname|SSH will use the specified host as a middle-point before completing the connection to your desired host.

## All together now
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