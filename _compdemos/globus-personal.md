---
title: Using Globus Personal
primary_reviewers: atombaby
---

## About Globus Connect Personal

"Globus Connect Personal" is a tool for using Globus infrastructure to transfer files between different systems.  The "personal" edition is a client with limited capabilities that does not require a subscription to Globus.

A globus transfer is made up of:

 - endpoints
 - a control system

The control system is a service hosted and managed by Globus.  This service manages things like authentication and actual initiation of the transfer, but no data actually passes through this system.

The endpoints are services that have access to the data.  The control system contacts the endpoints to initiate and manage the transfer between endpoints.

Monitoring of the process can happen via any browser session.  Simply navigate to https://app.globus.org/ and log in.

## Setting Up Globus Connect Personal

### Authenticating and Creating the Endpoint

 - Open a browser and navigate to https://app.globus.org/
 - Select "Fred Hutchinson Cancer Research Center" in the lookup box
 - This will prompt you to sign in- use your Hutchnet username and password

Once logged in you need to set up an endpoint.  Log into rhino, load the globus module, and run the setup process:

```
rhino03[~]: ml GlobusConnectPersonal
rhino03[~]: globusconnect -setup --no-gui

Globus Connect Personal needs you to log in to continue the setup process.

We will display a login URL. Copy it into any browser and log in to get a
single-use code. Return to this command with the code to continue setup.

Login here:
-----
https://auth.globus.org/v2/oauth2/authorize?client_id=4d6448ae-8ca040e4-aaa9-...
-----
Enter the auth code: 
```

> NOTE: The URL will be much longer- I've trimmed it for readability's sake

Copy and paste that into the browser session where you are logged into globus.  This will ask for authorization and then provide an auth code which you will paste in as a response in the terminal window where you are running globus:

```
-----
Enter the auth code: nWx4VborHro1lj9BKELcqFqvFbelvV

== starting endpoint setup


Input a value for the Endpoint Name: gizmo
registered new endpoint, id: 73f653ce-b288-11eb-866b-d16fa0cfc9e7
setup completed successfully
```

For the "Endpoint Name" enter something distinct to your transfer- you may need to identify your endpoint in the world-wide population of Globus endpoints.

### Configuring Paths

There aren't many things to configure in the Personal edition of the Globus Connect client.  The most important thing to configure is the path(s) available for transfers.  By default, only your home directory is available.

Updating those paths can be done by starting the GUI in a NoMachine session on a rhino, but this is a little cumbersome.  Editing the configuration file in your home directory will accomplish the same thing.

Open the file `~/.globusonline/lta/config-paths` in a Unix text editor and edit the contents [according to the documentation](https://docs.globus.org/how-to/globus-connect-personal-linux/#config-paths).  As an example, my `config-paths` contains:

```
~/,0,1
/fh/scratch/delete90/_ADM/SciComp,0,1
```

This will make paths in my home directory (the tilde `~` expands to your home directory) and in scratch available in the Globus connect UI.  It's necessary to restart `globusconnect` after updating this file:

```
rhino03[~]: globusconnect -stop
rhino03[~]: globusconnect -start
```

## Using Globus Connect

To transfer data, start the endpoint on a node- either in an interactive session on a rhino or gizmo node (via grabnode).

```
rhino03[~]: ml GlobusConnectPersonal
rhino03[~]: globusconnect -start
```

Once started it will be available when you browse endpoints in the Globus Web UI.  To see the status of the endpoint, select the "Collections" menu from the left bar.  Transfers can be started from here or from the "File Manager" menu.

> Note that you can start the endpoint on any system, including cluster nodes.  However, you will want to be certain that only one is running at any time.
