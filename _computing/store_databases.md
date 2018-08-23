---
title: Data Storage in Databases
last_modified_at: 2018-08-02
author: John Dey
---

Database Management Systems (DBMS) are useful if you need to manage large data tables of structured data and / or multiple tables that can be linked to each other (relational databases)
Databases are most successfully used by researches that do not change the structure (e.g. column names) on a very frequent basis.
The Hutch offers multiple database platforms:

## DB4Sci  (previously MYDB)
_DB4Sci_ is a service supported by Scientific Computing (SciComp) that allows you to provision a dedicated server (aka instance).  DB4Sci is a self-service website for creating containerized databases. The service is available to anyone at the center without cost. Users are given full admin rights to the database but are not given shell access to the database system. DB4Sci service performs daily database backups which are stored in the Amazon cloud. 
To access [DB4Sci](https://mydb.fredhutch.org/) click the link and use your Hutch credentials to log in.

- _MariaDB_ Is the latest open source version of MySQL. MariaDB is traditional
relational database that supports SQL. MariaDB has an option
for data encryption and data encryption in transit (TLS).  If your project
requires encryption at rest you should use MariaDB. For more information
visit the [MariaDB official site](https://mariadb.org/)
- _Postgres_ Postgres is a very popular open source relational database.
Postgres is very performant and capable of storing large databases. For more information
visit the [Postgres official site.](https://www.postgresql.org)
- _MongoDB_ Mongo is a specialized database for storing JSON documents. Mongo
is a NoSQL database. For more information
visit the [MongoDB official site](https://mongodb.org)
- _Neo4j_ is a NoSQL database for representing graph data. For more information
visit the [Neo4j official site](https://neo4j.com)

More detailed information about _DB4Sci_ can be found on the application website. DB4Sci is and open source project that is under development.
Future features are: Self serve restore
and Point in Time recovery. Project web site [DB4Sci.org](https://db4sci.org) 

## MS SQL Server
Microsoft SQL technology is available in conjunction with Database Administrator Services such as:

- Requirements analysis, review and documentation for internally developed and third party application databases
- Provision of database environments for testing and development
- Management of database users and permissions
- Support for SQL reporting (SSRS), analysis (SSAS) and integrated services (SSIS) platforms

For further info please see [Database Hosting on Centernet](https://centernet.fredhutch.org/cn/u/center-it/services/database_hosting.html)

## REDCap
Supported at Fred Hutch by CDS.  
