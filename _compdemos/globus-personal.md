---
title: Using Globus Personal
primary_reviewers: atombaby
---

Log into Globus using https://app.globus.org/
Your options are using a Google identity, ORCID, or HutchNet via O365 authentication.
For HutchNet authentication, find "Fred Hutchinson Cancer Research Center" in the lookup box
This will prompt you to sign in- use your _@fredhutch.org_ username and HutchNet password

Once logged in you need to set up an endpoint.  Log into rhino, load the globus module, and set up

```
rhino03[~]: ml GlobusConnectPersonal/3.1.4-GCCcore-10.2.0
rhino03[~]: globusconnectpersonal  -setup --no-gui

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

Copy and paste that into a browser session where you are logged into globus.  This will ask for authorization and then provide an auth code which you will paste in as a response in the terminal window where you are running globus:

```
-----
Enter the auth code: nWx4VborHro1lj9BKELcqFqvFbelvV

== starting endpoint setup


Input a value for the Endpoint Name: gizmo
registered new endpoint, id: 73f653ce-b288-11eb-866b-d16fa0cfc9e7
setup completed successfully
```

Start the endpoint:

```
rhino03[~]: globusconnectpersonal  -start
```

Now it will be available when you browse endpoints in the Globus Web UI.  Note that you can start the endpoint on any system, including cluster nodes.  However, you will want to be certain that only one is running at any time.


