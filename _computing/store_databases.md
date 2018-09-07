---
title: Data Storage in Databases
last_modified_at: 2018-08-24
---

Database Management Systems (DBMS) are useful if you need to manage large data tables of structured data and / or multiple tables that can be linked to each other (relational databases). Databases are most successfully used by researches for data set for which the data structure (e.g. column names or tables) on a very frequent basis.  

Important issues to consider before choosing a data storage location for a data set are:
- How does the data need to be accessed by staff members and what is their experience level with databases?
- What is the structure of the data set?  E.g., could it be contained in an Excel file, or a set of related Excel worksheets in a file, or are the data more complex in their structure?
- Are logging, user-specific permissions, or data capture features desired or required?
- How will backups and maintenance be addressed by the research staff?

Depending on the particular needs of the project, there are different data set storage options available supported by the Fred Hutch.  

## REDCap
REDCap, or Research Electronic Data Capture, is an open source, mature, secure web application for building and managing CRFs, data forms, and participant-completed surveys. REDCap is HIPAA-compliant and supports advanced features such as logging, validation, branching logic, e-signatures, randomization, calculated fields, and programming hooks. REDCap's mobile app allows allows for offline data capture using iPad and Android tablets. Collected data can be easily exported from REDCap to Excel and common statistical packages (SPSS, SAS, Stata, and R) and has an API.

The beauty of REDCap is that it's easy to get started but it also has advanced features and programming hooks to serve researchers needs when creating simple surveys all the way to conducting large complex research studies and projects.  For other types of research data, the ability to customize the data dictionary to meet the needs of a particular use make it an excellent option to consider when multiple users need to have a common data source with easy access and no database management knowledge is required.  

REDCap has been used by thousands of non-profit institutions throughout the world on hundreds of thousands of projects. The REDCap group at Vanderbilt University manages the development of the REDCap code base; new features are being added every month that make REDCap better and better. At Fred Hutch, the instance of REDCap is supported by Collaborative Data Services (CDS), which is an active member of the REDCap consortium, regularly maintains our REDCap installation so that it remains up-to-date.

CDS provides backup services, database maintenance, support for developing REDCap projects, and is very accessible for staff without previous database experience.  

For more information about REDCap at the Fred Hutch, training materials and documentation provided by CDS, [visit their site here.](http://research.fhcrc.org/cds/en/redcap.html)  

Look for in-person trainings available on a regular basis around campus, [here.](http://research.fhcrc.org/cds/en/redcap-training.html) You will also find recorded training videos and presentation materials at this [url.](http://research.fhcrc.org/cds/en/redcap-training.html). 

The login page for the Fred Hutch instance is [here.](http://redcap.fredhutch.org/)

## MS SQL Server
For groups for whom a REDCap system is not suitable, Microsoft SQL technology is available in conjunction with Database Administrator Services such as:

- Requirements analysis, review and documentation for internally developed and third party application databases
- Provision of database environments for testing and development
- Management of database users and permissions
- Support for SQL reporting (SSRS), analysis (SSAS) and integrated services (SSIS) platforms

For further info about how to get started with a SQL server, please see [the Database Hosting page on Centernet.](https://centernet.fredhutch.org/cn/u/center-it/services/database_hosting.html)


## DB4Sci  (previously MYDB)
_DB4Sci_ is a service supported by Scientific Computing (SciComp) that allows you to provision a dedicated server (aka, instance).  DB4Sci is a self-service website for creating containerized databases. The service is available to anyone at the center without cost. Users are given full admin rights to the database but are not given shell access to the database system. DB4Sci service performs daily database backups which are stored in the Amazon cloud.
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
visit the [MongoDB official site](https://mongodb.com/)
- _Neo4j_ is a NoSQL database for representing graph data. For more information
visit the [Neo4j official site](https://neo4j.com)

More detailed information about _DB4Sci_ can be found on the application website. DB4Sci is and open source project that is under development.
Future features are: Self serve restore
and Point in Time recovery. Project web site [DB4Sci.org](http://db4sci.org)
