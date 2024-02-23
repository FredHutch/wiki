---
title: PROOF
main_authors: vortexing, sitapriyamoorthi
primary_reviewers: vortexing
---

## What is PROOF?

**PROOF** (PRoving cOmpute On cloud Foundations) is a user-friendly tool designed for managing and executing [**WDL**](https://docs.openwdl.org/en/1.0.0/) (Workflow Description Language) workflows using the [**Cromwell**](https://cromwell.readthedocs.io/en/stable/) workflow manager, configured to run on the [**Fred Hutch cluster**.](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/) 

PROOF :

- Automates all the backend configurations necessary to run your workflows instantly.

- Allows researchers to validate, troubleshoot, assess performance, and run their workflows all under one roof.

- Also functions as a 'proofing' resource, enabling researchers to refine their workflows before potential transitions to cloud-based infrastructures.

This guide is intended to describe how you can run PROOF, catering to varying levels of computational expertise. 

We also have a WDL 101 course that will be a quick-start guide to building a WDL workflow.

## What is a WDL?

The **Workflow Description Language** (**WDL**, pronounced '**widdle**') is a versatile tool for executing bioinformatics and computational workflows. WDL offers:

-   A **standardized** approach to describing computational tasks, including inputs, outputs, and dependencies.
  
-   A task-oriented approach promoting **code reuse** and modularity.
  
-   Support for **parallel execution**, enabling efficient processing of large datasets.
  
-   Explicit data type definitions and **immutability of variables** by default, ensuring data consistency.
  
-   Built-in support for specifying **data locations**, facilitating seamless collaboration across environments.
  
-   Support for **scatter-gather** operations, improving workflow performance.
  
-   **Flexible syntax** for concise and readable workflow definitions.
  
-   **Platform independence**, allows WDL workflows to run across different environments.
  
-   The requirement of an **engine like Cromwell** for interpreting and executing WDL on various backends enhances usability and versatility.


## What is Cromwell?

Cromwell, originally developed at the Broad Institute, is a WDL workflow engine, that facilitates the orchestration of multi-step workflows. It efficiently handles individual tasks, monitors job metadata, offers an intuitive API interface, and enables users to oversee multiple workflows concurrently. While other WDL engines exist, here are some of the reasons Cromwell stands out :

-   **Integration with the Fred Hutch cluster:** Cromwell has been configured to run on the Fred Hutch cluster to make running WDL workflows very simple. Additionally, it seamlessly integrates with various cloud platforms, and workflow description formats, enhancing compatibility and facilitating workflow execution across different computing infrastructures.

-   **Robust Workflow Management**: Cromwell offers a robust engine for managing complex workflows, ensuring efficient execution of tasks, and streamlined workflow orchestration.

-   **Scalability**: With its ability to handle large-scale workflows, Cromwell accommodates projects of varying sizes, from small-scale analyses to large-scale data processing pipelines.

-   **Comprehensive Job Monitoring**: It provides comprehensive job monitoring and metadata tracking, enabling users to closely monitor workflow progress, identify bottlenecks, and troubleshoot issues effectively.

-   **Community Support and Documentation**: Cromwell benefits from a supportive community and extensive documentation, offering users access to resources, tutorials, and community-driven solutions to common challenges.

-   **Open Source and Customizability**: Being open-source, Cromwell allows for customization and adaptation to specific workflow requirements, empowering users to tailor workflows to their unique needs and preferences.


## Running a WDL workflow using Cromwell at Fred Hutch
   
   In general, Cromwell works best when run in **server mode**, which means that users start a **Cromwell server** as a job on our local SLURM cluster that can connect to a **database** specifically for Cromwell workflow tracking.
  
This Cromwell server job then behaves as the workflow **coordinator** for that **user**, allowing a user to send workflow instructions for **multiple workflows** running simultaneously.

The Cromwell server will then **parse** these workflow instructions, find and copy the relevant input files, **send** the tasks to the cluster (Gizmo) to be processed, **coordinate** the results of those tasks and **record** all of the metadata about what is happening in its database.

This means that individual users can:

 - run **multiple independent workflows** at the same time using **one Cromwell server**

 - use **cached results** when identical to the current task

 - **track** the status of workflows and tasks
 
 - **customize** the locations of input data, intermediate data, and workflow outputs to data storage resources appropriate to the data type (re: cost, backup and accessibility)

 - **query** the Cromwell database for information about workflows run in the past, including where their workflow outputs were saved or a variety of other workflow and task level metadata.


### How to get setup with Cromwell at Fred Hutch
 
 The prerequisite to running WDL workflows using Cromwell within the Fred Hutch involves two key steps: starting a Cromwell server and having a database setup. There are currently two ways to do this:

**The PROOF way _(recommended)_:**
Using one of the three ways (see User guides below for detailed instructions) PROOF will help you

 - Automatically start a Cromwell server for you
_Note: Your Cromwell server by default runs only for 7 days. Make sure to restart it to continue submitting and running
   jobs._
   
 -   Automatically sets up a MariaDB(MySql) database for you


 **The DIY way:**
 
 - Requires you to first setup a MariaBD (MySql) database

 - Requires you to kick-off a Cromwell server 


   _Note: **Irrespective** of which way you use to **start** and configure your **Cromwell** server you can validate, submit, track, troubleshoot and abort your **jobs** using PROOF. More details below in the user guides._


## **Things to do before you start**

### General instructions:
- #### rhino Access (must have)
	To begin using Cromwell and running workflows you must setup your Fred Hutch credentials and  	get access to the cluster. Learn how to do this [here](https://sciwiki.fredhutch.org/scicomputing/access_credentials/) . 

	Once setup you can run workflows and access data stored within the Fred Hutch.
 
  _Note: See below (Resources and help) for relevant courses to learn more._


- #### AWS credentials (need-based)
	If you want to run workflows on data stored in AWS S3, you’ll need to have [set up your AWS credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws) first.
        
	 PROOF and Cromwell will allow you to use input files directly (_specified using their AWS S3 url_) if you have all the right permissions.
            
	However, if you do not have AWS credentials or aren’t using data stored in AWS S3, then you don’t have to do anything.
 
### Additional instructions before you start using PROOF:

 - If you are on-campus and connected to Marconi you don’t need to do
   anything else.
   
 - If you are off-campus make sure you are connected via    the VPN.

### Additional instructions before you start a Cromwell server DIY:
Cromwell's call caching feature (keep track of what you’ve already done so you don’t have to re-compute jobs that are done) enables efficient use of computing resources even in the event of workflow failures. Our configuration ensures this capability by setting up a Cromwell server for 7-day intervals and establishing a persistent database (only once per user for their lifetime at Hutch) for communication between Cromwell servers.

#### Setup your database container
First, we need to setup a database container where the database will run. We suggest setting up a database container (once per user) this way:  
1. Go to [DB4Sci](https://mydb.fredhutch.org/login) . To learn more about DB4Sci go [here](https://sciwiki.fredhutch.org/scicomputing/store_databases/#db4sci--previously-mydb).
 
2.  Login using your Fred Hutch credentials ![mydb_login](/_datascience/assets/mydb_login.png)

3.  Select the Create DB Container, and choose the MariaDB (MySQL) option ![create_db](/_datascience/assets/create_db.png)              
4.  Enter/select the following: 
	  DB/Container Name: Give your container a name.                    
      _Note: This will be visible to others at Fred Hutch._                    
    
    DB Username: It can be whatever you want.                    
     _Note: This will be visible to others at Fred Hutch._                    
    
    DB Password: It can be whatever you want.                    
     _Note: Should not be your Fred Hutch password. Do not use special characters. Do not start your 		password with “#”._                 
	  Contact Name: Your name                    
    _Note: This will be visible to others at Fred Hutch._                    
    
    Contact Email: Your Fred Hutch email                    
    _Note: This will be visible to others at Fred Hutch._                    
    
    Description: Provide a brief description like: Cromwell database                    
    
    Expected Life of DB: Choose: Long (36+ mo)                    
    
    Frequency of Backup: Choose: Never

    ![create_db2](/_datascience/assets/create_db_2.png)               
 
 6.  Save the DB/Container Name, DB Username and DB Password somewhere handy as you will need them for the configuration step.     
     _Note: You want to make sure that you have all the cases noted._                

 7.  Click submit, a confirmation screen will appear (hopefully), and you’ll need to note which Port is specified to you. This is a 5 digit number currently. Save this somewhere handy as you will need them for the configuration step.

  _Note: If you do not see this screen, you can go to the Manage Containers tab in the MyDB interface and scroll down for your container name, and you can look in the Port column._ 
  
  _Note: If you have trouble with using DB4Sci, you can email [scicomp@fredhutch.org](mailto:scicomp@fredhutch.org) and share the information or screenshots of what failed to get help._

#### Make Your Empty Database
Now you have a “ container” in which to run a database, but the database itself does not yet exist. Again, this only needs to be done one time per user. You need to create an empty database in that container and then Cromwell will do the rest the first time you start up a server.

1. Go to terminal and connect to rhino.

2.  Load the Mariadb module
  `ml MariaDB/10.5.1-foss-2019b`

3. Then enter the following:

   `mysql --host mydb --port <Port> --user <username> --password`
   
   _Note: Replace <Port> and <username> including the < and > with the port and username you got while setting up your container. For example: mysql --host mydb --port 3456 --user some-username --password_

5. You will then be prompted to enter you DB password you specified during setup.

6.  Once you are at the “mysql>” prompt, you can do the following.

    `MariaDB [(none)]> create database <DB Name>;
    ##It should do its magic - if it works it says:
    #Query OK, 1 row affected
    MariaDB [(none)]> exit
    #Bye`
                                
 
  _Note: we suggest you name the database inside the container the same as the container, but you cannot include dashes in your database name._
 
Now you’re ready to go and never have to set up the database part again and you can use this database to manage all your work over time!

## User guide: Running WDL workflows on the Shiny-App
***section in development***

## Users guide: Running WDL workflows through R (rcromwell)
***section in development***

## Users guide: Running WDL workflows through command line via PROOF
***section in development***

## Developing with PROOF API
***section in development***

## Resources and help
***section in development***
