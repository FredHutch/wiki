---
title: Galaxy Service on Gizmo (beta)
last_modified_at: 2020-06-16
main_author: Dirk Petersen
primary_reviewers: atombaby, k8hertweck
---

Galaxy is an open, web-based platform for accessible, reproducible, and transparent computational research. Maintaining a central Galaxy instance requires significant effort. 

As this point Fred Hutch does not offer a production ready Galaxy installation. Instead we offer Galaxy self service installations with the following features:

- Galaxy server will run on a Gizmo node.
- HutchNet ID authentication will be used 
- Simple database (sqlite instead of Postgres)
- Each user has Admin access to one or more Galaxy installations
- Galaxy server run with the launching user's permissions, these will be used for all data library access (e.g. file system)
- User can self install toolshed software
- Cannot run cluster jobs, compute capacity is limited to single node (36 cores)
- User maintains own workflows and exports / migrates them to newer installation


Please check the [Galaxy Documentation](https://docs.galaxyproject.org/) !


## How to use Galaxy on Gizmo:

Starting Galaxy is simple. You just run the `galaxy` command on Rhino. Run this command in a new shell that won't be canceled/closed for a while. We recommend tmux or NoMachine for long running shells. Run this for example:

```bash
petersen@rhino03:~ galaxy
Enter number to select your Galaxy install
1) /fh/fast/_HDC/user/petersen/galaxies/demo/
2) /fh/fast/_HDC/user/petersen/galaxies/production/
3) /fh/fast/_HDC/user/petersen/galaxies/latest/
4) /fh/fast/_HDC/user/petersen/galaxies/solarsystem/
5) New-Install
#? 5
New Install: Enter a name for the Galaxy instance: brandnew
```

A few minutes after the installation has been started you receive an email like this:

![](assets/2020-06-17-01-10-04.png)

Now you wait about 30 min. If you click on the link before Galaxy has finished installing you will see a proxy error: 

![](assets/2020-06-17-01-12-09.png)


Try again after a while. Then you should see the Galaxy login screen. Use your HutchnetID and password to login to the Galaxy interface:

![](assets/2020-06-17-01-19-43.png)


### Current Issues

When using Chrome, you might see this error message:

"Wrong session Token found." 

![Error with Chrome](assets/2020-06-17-01-03-11.png)

To fix the issue please reset all Cookies from your Chrome browser or use a new incognito window or use a different browser such as Firefox.


## Future 

TBD