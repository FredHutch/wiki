---
title: Configuring Database on db4sci
last_modified_at: 2023-02-02
primary_reviewers: fizwit, atombaby
---

## Overview

_db4sci_ is a "database as a service" (DbAAS) providing straightforward, forms-based configuraiton of many different database technologies.  At this time the following databases are available:

 - postgres
 - mariadb
 - mongodb
 - neo4j

This guide will describe how to select, configure, and provision databases using db4sci.

### Selection Guide

> Why choose which database

### Logging In

Browse to https://mydb.fhcrc.org/login and use your HutchNet ID to log in.

## Provisioning Databases

### Common Fields

When you provision a new database, you will be asked for the following information for any of the different database technologies.  Note that not all of the fields have significance in provisioning your database or in the service level- the underlying application has features that have not been fully implemented.

In many cases the defaults are sufficient- if you have a question as to whether your application requires one of those features, please contact _scicomp_.

#### DB/Container Name

db4sci databases are hosted in a docker container- the name cannot match an existing container name, must be less than 128 characters, and be made up of _only_ alphanumeric characters (A-z, 0-9), underscore, period, or dash.

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

Makes no difference

#### Data Volume Type

There is only "standard" at this time.  _<describe disk volume with databases>_

#### Data Includes PHI or PII

> At this time we do not support storage of PHI/PII. This will have significance when db4sci better supports encryption

#### Expected Life of DB

This is an advisory for SciComp- should we run into constraints on the system (e.g. disk space) we'll use this information to contact you to see if the database is still needed.

#### Frequency of Backup

Select the frequency for backing up the data in the database. Options are weekly, daily, and never.

Note that backups are made to a bucket in AWS's S3 storage, so if there are restrictions that prohibit cloud storage you will need to select "never".

#### Maintenance Window

Advisory- indicates to SciComp when containers can be restarted.

#### Application Type

Advisory

#### Preferred time to backup

Indicates a window of time for backing up the database.  If you have regularly scheduled high-demand processing it may be advisable to schedule backups outside that time frame.

## Notes for Database Technologies

### MariaDB

MariaDB is a relational database supporting Structured Query Language (SQL).  It is an open-source fork of MySQL.

To provision a new MariaDB database select "MariaDB" from the list.  Currently versions 10.3 and 10.1 are available.

### Postgres

Postgres is a relational database supporting Structured Query Language (SQL).  Versions 13.2 and 9.6 are available.

### MongoDB

MongoDB is a NoSQL "document oriented database".  Versions 4.2.2 and 3.4 are available.

Note that MongoDB is governed by the [SSPL](https://en.wikipedia.org/wiki/Server_Side_Public_License).  if you are releasing your application you may have requirements on disclosing source code.

### Neo4j

Neo4j is a graph database management system.  Version 3.2.5 is available.
