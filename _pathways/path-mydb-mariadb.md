---
title: Configure and Use a MariaDB Database on MyDB
main_author: Michael Gutteridge
primary_reviewers: atombaby, dtenenba, fizwit
---

This pathway will show you how to configure a MariaDB (MySQL) database on MyDB and connect to it using the command line tools on a rhino/gizmo node.

## Pre-requisites
A workstation, HutchNet ID, access to the internet and campus network, and browser

If you are unfamiliar with any of these terms, hover over them to find more information.
 - {% glossary rhino %}
 - {% glossary gizmo %}

## Steps

### Log in to MyDB

Browse to https://mydb.fredhutch.org/login and enter your HutchNet ID

### Create the Database Container

Once logged into MyDB, click over to "Create DB Container" and select "MariaDB (MySQL)" from the list.  This will present a form with a number of fields describing the database and configuring the administrative credentials.  The full reference for these fields is available [here](/compdemos/mydb/#common-fields)

Click "Submit" and your container will be created.  It can take 30 seconds to a minute for the container to be created- when complete you will be presented with a page with the parameters you'd entered and a sample `mysql` command line.  This sample command line contains the port number you will use for connecting to this database.

Record the username, password, and port in a secure location.

### Start a Session on a Rhino

Open a shell on rhino with SSH or NoMachine.

### Load the MariaDB Module

Load the MariaDB module with the command `ml MariaDB`.

### Connect to the Database

Use the `mariadb` command to connect to the database.  The command and options are very nearly identical to the `mysql` commands:

```
mariadb --host mydb --port <port> --user <username> --password
```
fill in the values for port and username you'd recorded earlier.  You will be prompted to enter the password.  If the connection is successful you will be given a prompt for the database:

```
rhino03[~]: mariadb --host mydb.fhcrc.org --port <port> --user <username> --password
Enter password: *********
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.3.5-MariaDB-10.3.5+maria~jessie mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

## Where to go from here

### Alternate Tools

Any tool that can connect to MySQL will most likely work with a MariaDB.  _MySQL Workbench_ is a very popular tool.  Other graphical interfaces can be found [here](https://mariadb.com/kb/en/graphical-and-enhanced-clients/)

### Thinking Securely

 - TLS and SSL aren't currently supported- if you have an "in transit" requirement contact _SciComp_
 - The `password` option can take the password as an argument- this is not advisable as the password will be shown in the process tables and is therefore available to anyone on the system.

