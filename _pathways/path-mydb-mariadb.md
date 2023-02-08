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
 - {% glossary mysql %}
 - {% glossary db4sci %}
 - {% glossary mydb %}
 - {% glossary gizmo %}

## Steps

### Log in to MyDB

Browse to https://mydb.fredhutch.org/login and enter your HutchNet ID

### Create the Database Container

Follow the instructions [here](/compdemos/mydb#provisioning) to configure an instance of a MariaDB container.  Record the username, password, and port in a secure location.

### Start a Session on a Rhino

Open a shell on rhino with SSH or NoMachine.

### Load the MariaDB Module

Load the MariaDB module with the command `ml MariaDB`.

### Connect to the Database

Use the command you recieved when you created the database container to connect to the database.  Detailed documentation on using your database is available [here](/compdemos/mydb#use). 

## Where to go from here

### Alternate Tools

Any tool that can connect to MySQL will most likely work with a MariaDB.  _MySQL Workbench_ is a very popular tool.  Other graphical interfaces can be found [here](https://mariadb.com/kb/en/graphical-and-enhanced-clients/)

### Thinking Securely

 - TLS and SSL aren't currently supported- if you have an "in transit" requirement contact _SciComp_
 - The `password` option can take the password as an argument- this is not advisable as the password will be shown in the process tables and is therefore available to anyone on the system.

