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

The endpoints are services that have access to the data.  The control system contacts the endpoints to initiate and manage the transfer between endpoints.  You can use your workstation, but in most cases we want to download data onto one of the campus file systems (fast, working, temp).  The instructions below will configure an endpoint on a rhino or gizmo node which will provide you with fast access to that back-end storage.

Management and monitoring of the process can happen via any browser session.  Simply navigate to https://app.globus.org/ and log in.  From the Web UI you can see your endpoint and move data between it and other Globus endpoints around the world.

## Setting Up Globus Connect Personal

The documentation below will create and configure an endpoint on a rhino/gizmo node.  This endpoint needs to be authenticated to Globus which uses single-signon (SSO) enabling us to use our HutchNet IDs for this process.  This is a two-step process involving command line and web-based steps.

### Authenticating

 - Open a browser and navigate to https://app.globus.org/
 - Select "Fred Hutchinson Cancer Research Center" in the lookup box
 - This will prompt you to sign in- use your Hutchnet username and password

You are now authenticated in this browser session.  We will come back to that browser session when we create the endpoint. 

### Creating the Endpoint

SciComp provides the Globus Connect Personal suite as a module.  Log into rhino, load the globus module, and run the setup process:

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

Copy and paste that into the browser session where you are logged into Globus (see "Authenticating").  This may ask you to re-authenticate, and then ask you to consent to use Globus for data transfer.  Once you've done this, you will be provided an authentication code which you will paste in as a response in the terminal window where you are running the setup:

```
-----
Enter the auth code: nWx4VborHro1lj9BKELcqFqvFbelvV

== starting endpoint setup


Input a value for the Endpoint Name: myendpoint on rhino
registered new endpoint, id: 73f653ce-b288-11eb-866b-d16fa0cfc9e7
setup completed successfully
```

For the "Endpoint Name" enter something distinct to your transfer- this will help identify your endpoint amongst the world-wide population of Globus endpoints.  Your endpoint is now configured, but still needs to be started.

### Starting the Endpoint

To transfer data, start the endpoint on a node- either in an interactive session on a rhino or gizmo node (e.g. via grabnode).  Because Globus runs in the foreground, you will want to run this inside a `tmux` or `screen` session or background the process with `nohup` and `&`.

> While it's possible to use a cluster node note that the endpoint will only run so long as you have an active allocation.  Once the job ends, the Globus processes will be killed.

```
rhino03[~]: ml GlobusConnectPersonal
rhino03[~]: nohup globusconnect -start &
```

Once started it will be available when you browse endpoints in the Globus Web UI.  To see the status of the endpoint, select the "Collections" menu from the left bar and click on "Administered By You".  Transfers can be started from the "File Manager" menu.

> Note that you can start the endpoint on any system, including cluster nodes.  However, you will want to be certain that only one is running at any time.

By default, only your home directory will be available in the file manager.  To expand the file systems available you'll need to configure the paths that will be presented by Globus.

### Configuring Paths

Adding and updating paths will allow you to upload and download data to paths other than your home directory.  Updating those paths can be done by starting the GUI in a NoMachine session on a rhino, but this is a little cumbersome.  Editing the configuration file in your home directory will accomplish the same thing.

Open the file `~/.globusonline/lta/config-paths` in a Unix text editor and edit the contents [according to the documentation](https://docs.globus.org/how-to/globus-connect-personal-linux/#config-paths).  As an example, my `config-paths` contains:

```
~/,0,1
/hpc/temp/_ADM/SciComp,0,1
```

The format of this file is `<path>,<sharing>,<read|write>`.  Sharing is not currently possible- any values here are ignored.  The read/write field uses `0` for read-only, and `1` for read-write.  In this example I can see my home directory (the tilde is expanded to your home directory) and a path in temp.  In both locations I'm allowing read-write so I can both upload data to another Globus endpoint and download into a local path.

It's necessary to restart `globusconnect` after any updates to this file:

```
rhino03[~]: globusconnect -stop
rhino03[~]: globusconnect -start
```
