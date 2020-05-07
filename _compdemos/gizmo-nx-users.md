---
title: Notes for Changes to NoMachine in Bionic
main_author: Michael Gutteridge
primary_reviewers: atombaby
---


With the new roll out of the Bionic nodes for the Gizmo computing environment we have made some changes to NoMachine and what this service is providing.

## Hosts

The most notable change is that the NoMachine service is now provided by the Rhino login nodes.  The newer, more powerful hardware combined with new load management software will allow us to combine these services so we don't have to make extra steps to get to the cluster.

The hosts providing this service are `rhino01`, `rhino02`, and `rhino03`.  The `rhino` and `rhino-new` aliases shouldn't be used for NoMachine connections.

## Connecting

We have opened up the configuration to allow different uses of NoMachine- this is discussed further below.  The basic connection- starting a virtual desktop session- is described here.

Create a new connection: from the NoMachine window choose "new" and where prompted:

   - Protocol:"NX"
   - Host: enter one of `rhino01`, `rhino02`, or `rhino03`
   - Authentication Method: use "password"
   - Proxy: don't use a proxy
   - Name: Choose something descriptive.

The connection will then appear in the list of "Recent Connections".  Right-click that and "Start Connection".  You may be prompted with "Verify host authenticity".  Key fingerprints are:

rhino02:  SHA256 FD 7E ED 2A 5B 74 55 4E 9A 82 F4 32 D8 59 9D F8 B1 BE 36 2D 27 24 D1 24 4D E9 80 5A 1B BF 3C 68

Once verified, click "Accept" where you'll be prompted to enter a username and password- use your HutchnetID.

This creates the connection.  You'll be prompted now to create a session- there is "Create a new virtual desktop" and "Create a new custom session".  The former (virtual desktop) will create a NoMachine session as you'd have in the connections to the old Trusty NoMachine systems.

### Custom Sessions

One of the changes is that you can now run X11 based software without launching a full desktop session.  This is still something of an experimental feature, but thus far seems to work well.

A custom session has a number of different options. For this example we'll run a single X client to create a terminal on the NoMachine server.  When you select the "custom session" option above, you'll have an option to "run the following command". In the field following that radio button enter `mate-terminal`.  To have the command run in a window without the full desktop, make sure that "Run the command in a floating window" is selected.

With these options you'll get a window on your desktop with a prompt on the NoMachine server you've connected to.  This connection will persist even if you stop the NoMachine client on your computer.

Contact Scientific Computing if more help is required

## Browser Based Access

There is now support for sessions in a browser window.  This is a rather more experimental feature.  For these style connections point a browser to a URL:

 - https://rhino01:4443/nxwebplayer
 - https://rhino02:4443/nxwebplayer
 - https://rhino03:4443/nxwebplayer

You will be prompted to enter your username and password.  There are options for both virtual desktop and custom session that function much as the full client does.
