---
title: Configuring Databases on MyDB
last_modified_at: 2023-02-02
primary_reviewers: fizwit, atombaby
---

## Overview

_MyDB_ is a "database as a service" (DbAAS) providing straightforward, forms-based configuration of many different database technologies.  At this time the following databases are available:

 - postgres
 - mariadb
 - mongodb
 - neo4j

This guide will describe how to select, configure, and provision databases using MyDB.

### Selection Guide

> Why choose which database

### Logging In

Browse to [https://MyDB.fredhutch.org/login](https://MyDB.fredhutch.org/login) and use your HutchNet ID to log in.

## Provisioning Databases

### Common Fields

When you provision a new database, you will be asked for the following information for any of the different database technologies.  Note that not all of the fields have significance in provisioning your database or in the service level- the underlying application has features that have not been fully implemented.

In many cases the defaults are sufficient- if you have a question as to whether your application requires one of those features, please contact _scicomp_.

#### DB/Container Name

MyDB databases are hosted in a docker container- the name cannot match an existing container name, must be less than 128 characters, and be made up of _only_ alphanumeric characters (A-z, 0-9), underscore, period, or dash.

This is not used in the connection string but only identifies the container on the host system. As such, make it significant to you and easy to pick out in a long list.

#### DB Username and DB Password

The username and password you select here will be configured as the administrative credentials for the database you are provisioning.  These will be used in your database client connection (at least initially) and is used for other database management tasks.

Record this in a secure place.  When selecting a password, choose a strong password (suggested guidelines are available [here](https://centernet.fredhutch.org/cn/u/center-it/my-apps/my-apps-faqs.html) in the section "How do I make a safe password")

#### Contact Name

Your full name.

#### Contact Email

Your HutchNet email address.  This is important as any service notices will be sent to this mailbox.

#### Description

A short description of the database's purpose

#### Application Name

This is optional- if this database is supporting an application (e.g. labkey) you could note it here.

#### Support Level

Unused

#### Data Volume Type

There is only "standard" at this time.  MyDB storage is currently on redundant NVMe drives.

#### Data Includes PHI or PII

Unused

> At this time we do not support storage of PHI/PII.

#### Expected Life of DB

Unused

#### Frequency of Backup

Select the frequency for backing up the data in the database. Options are weekly, daily, and never.

Note that backups are made to a bucket in AWS's S3 storage, so if there are restrictions that prohibit cloud storage you will need to select "never".

#### Maintenance Window

Unused

#### Application Type

Unused

#### Preferred time to backup

Unused

## Notes for Database Platforms

### MariaDB

MariaDB is a relational database supporting Structured Query Language (SQL).  It is an open-source fork of MySQL.

To provision a new MariaDB database select "MariaDB" from the list.  Currently versions 10.3 and 10.1 are available.

#### Provisioning

Once logged into MyDB, click over to "Create DB Container" and select "MariaDB (MySQL)" from the list.  This will present a form with fields describing the database and configuring the administrative credentials.  The full reference for these fields is available [here](/compdemos/mydb/#common-fields)

Click "Submit" and your container will be created.  It can take 30 seconds to a minute for the container to be created- when complete you will be presented with a page with the parameters you'd entered and a sample `mysql` command line.  This sample command line contains the port number you will use for connecting to this database.

Record the username, password, and port in a safe and secure location.

#### Use

Many MySQL tools will also work with MariaDB.  There is also a module in the rhino/gizmo compute environment: this can be loaded with the command `ml MariaDB`.

To use your database from a rhino/gizmo node, load the MariaDB module and use the `mariadb` command to connect to the database.  The command and options are very nearly identical to the `mysql` commands:

```
mariadb --host mydb --port <port> --user <username> --password
```
fill in the values for port and username you'd recorded earlier.  You will be prompted to enter the password.  If the connection is successful you will be given a prompt for the database:

```
rhino03[~]: mariadb --host mydb.fredhutch.org --port <port> --user <username> --password
Enter password: *********
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.3.5-MariaDB-10.3.5+maria~jessie mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

### Postgres

Postgres is a relational database supporting Structured Query Language (SQL).  Versions 13.2 and 9.6 are available.

### MongoDB

MongoDB is a NoSQL "document oriented database".  Versions 4.2.2 and 3.4 are available.

Note that MongoDB is governed by the [SSPL](https://en.wikipedia.org/wiki/Server_Side_Public_License).  if you are releasing your application you may have requirements on disclosing source code.

### Neo4j

Neo4j is a graph database management system.  Version 3.2.5 is available.
