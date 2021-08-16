---
title: NoMachine Client Setup
primary_reviewers: atombaby
---

## NoMachine NX (Multi-OS)
NoMachine NX is a remote desktop software for Linux servers that gives you full remote access to a graphical user interface from Windows or Mac clients. It is installed on the SciComp session Servers `rhino01`, `rhino02` or `rhino03`.  To connect through the local Fred Hutch network or through a VPN connection please download and install the NoMachine Enterprise Client from [NoMachine's Site.](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client)  Windows users can also install an older version from "Software Center".

One of the nicest features of NoMachine is that you can disconnect from the server's desktop environment and later resume the connection and continue right where you left off with all terminal windows in the same place. NoMachine from Windows or Mac is often a better choice than installing a Linux desktop.

## Installation

Installation of the NoMachine client starts with download of the installer from [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client).  Choose the version for your OS and follow the instructions provided by NoMachine.

## Configuration

Start the NoMachine client.  If this is the first time opening the client, you will have no existing connections and will need to create a new one.  Clicking the "new" button will take you through a wizard for creating this new connection:

![](/scicomputing/assets/nx_new_connection.png)

For "protocol", use the default (NX) and click the "continue" button.

 < nx protocol select >
![](/scicomputing/assets/nx_protocol_select.png)

For "host" you need to select one of the rhino nodes- don't use the "rhino" alias.  In this example I've chosen "rhino03".  "rhino01", and "rhino02" are the other options here:

< nx host rhino03 >
![](/scicomputing/assets/nx_host_rhino03.png)

Leave the other options as-is (port 4000 with "use UDP") and click "continue" to get to the "Authentication" configuration.  Here select "Password" and "continue".

< nx authentication >
![](/scicomputing/assets/nx_authentication.png)

which will take you to the "Proxy" configuration.  Again, use the default ("Don't use a proxy").  Click continue and name the connection- this name isn't important and the default is usually fine.

Click "done" here.  This will present the "Recent connections" screen where you can now open this newly created connection.  Double click to start the process.  If this is the first time you have connected to this host you may be presented with a warning:

< nx verify host authenticity >
![](/scicomputing/assets/nx_verify_host_authenticity.png)
![](/scicomputing/assets/nx_host_identification_changed.png)

These warnings can typically be ignored- click yes to continue on to the login screen:

< nx login >
![](/scicomputing/assets/nx_login.png)

Finally you will be asked whether to create a new virtual desktop or a custom connection- choose the former, "create new virtual desktop".

< nx create connection >
![](/scicomputing/assets/nx_create_connection.png)

This will create a new Linux desktop session.

