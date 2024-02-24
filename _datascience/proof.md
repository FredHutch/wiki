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

**Workflow Description Language** (**WDL**, pronounced '**widdle**') is a versatile workflow framework for executing bioinformatics and computational workflows. WDL offers:

-   A **standardized** and **modular** approach to specifying and combining computational tasks, using inputs, outputs, and dependencies.
  
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
 
 The prerequisite to running WDL workflows using Cromwell within the Fred Hutch involves two key steps: starting a Cromwell server and having a database setup. Additionally, Cromwell's call caching feature (keeps track of what you’ve already done so you don’t have to re-compute jobs that are done) enables efficient use of computing resources even in the event of workflow failures. Our configuration ensures this capability by setting up a Cromwell server for 7-day intervals and establishing a persistent database (only once per user for their lifetime at Hutch) for communication between Cromwell servers.
 
 
 There are currently two ways to do this:

**The PROOF way _(recommended)_:**
Using one of the three ways (see User guides below for detailed instructions) PROOF will help you

 - Automatically start a Cromwell server for you
> Note: Your Cromwell server by default runs only for 7 days. Make sure to restart it to continue submitting and running
   jobs.
   
 -   Automatically sets up a MariaDB(MySql) database for you


 **The DIY way:**
 
 - Requires you to first setup a MariaBD (MySql) database

 - Requires you to kick-off a Cromwell server 


   > Note: **Irrespective** of which way you use to **start** and configure your **Cromwell** server you can validate, submit, track, troubleshoot and abort your **jobs** using PROOF. More details below in the user guides.


## **Things to do before you start**

### General instructions:
- #### rhino Access (must have)
	To begin using Cromwell and running workflows you must setup your Fred Hutch credentials and  	get access to the cluster. Learn how to do this [here](https://sciwiki.fredhutch.org/scicomputing/access_credentials/) . 

	Once setup you can run workflows and access data stored within the Fred Hutch.
 
  > Note: See below (Resources and help) for relevant courses to learn more.


- #### AWS credentials (need-based)
	If you want to run workflows on data stored in AWS S3, you’ll need to have [set up your AWS credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws) first.
        
	 PROOF and Cromwell will allow you to use input files directly (_specified using their AWS S3 url_) if you have all the right permissions.
            
	However, if you do not have AWS credentials or aren’t using data stored in AWS S3, then you don’t have to do anything.
 
### Additional instructions before you start using PROOF:

 - If you are on-campus and connected to Marconi you don’t need to do
   anything else.
   
 - If you are off-campus make sure you are connected via    the VPN.

### Additional instructions before you start a Cromwell server DIY:
If you would like to setup your own Cromwell server you would need to do the following 2 things before you can start your first Cromwell server:

#### 1. Setup your database container
First, we need to setup a database container where the database will run. We suggest setting up a database container (once per user) this way:  
1. Go to [DB4Sci](https://mydb.fredhutch.org/login) . To learn more about DB4Sci go [here](https://sciwiki.fredhutch.org/scicomputing/store_databases/#db4sci--previously-mydb).
 
2.  Login using your Fred Hutch credentials ![mydb_login](/_datascience/assets/mydb_login.png)

3.  Select the Create DB Container, and choose the MariaDB (MySQL) option ![create_db](/_datascience/assets/create_db.png)              
4.  Enter/select the following: 
	  DB/Container Name: Give your container a name.                    
      > Note: This will be visible to others at Fred Hutch.                    
    
    DB Username: It can be whatever you want.                    
     > Note: This will be visible to others at Fred Hutch.                    
    
    DB Password: It can be whatever you want.                    
     > Note: Should not be your Fred Hutch password. Do not use special characters. Do not start your password with “#”.                 
	  Contact Name: Your name                    
    > Note: This will be visible to others at Fred Hutch.                    
    
    Contact Email: Your Fred Hutch email                    
    > Note: This will be visible to others at Fred Hutch.                    
    
    Description: Provide a brief description like: Cromwell database                    
    
    Expected Life of DB: Choose: Long (36+ mo)                    
    
    Frequency of Backup: Choose: Never

    ![create_db2](/_datascience/assets/create_db_2.png)               
 
 6.  Save the DB/Container Name, DB Username and DB Password somewhere handy as you will need them for the configuration step.     
     > Note: You want to make sure that you have all the cases noted.                

 7.  Click submit, a confirmation screen will appear (hopefully), and you’ll need to note which Port is specified to you. This is a 5 digit number currently. Save this somewhere handy as you will need them for the configuration step.

  > Note: If you do not see this screen, you can go to the Manage Containers tab in the MyDB interface and scroll down for your container name, and you can look in the Port column. If you have trouble with using DB4Sci, you can email [scicomp@fredhutch.org](mailto:scicomp@fredhutch.org) and share the information or screenshots of what failed to get help.

#### 2. Make Your Empty Database
Now you have a “ container” in which to run a database, but the database itself does not yet exist. Again, this only needs to be done one time per user. You need to create an empty database in that container and then Cromwell will do the rest the first time you start up a server.

1. Go to terminal and connect to rhino.

2.  Load the Mariadb module
  `ml MariaDB/10.5.1-foss-2019b`

3. Then enter the following:

   `mysql --host mydb --port <Port> --user <username> --password`
   
   > Note: Replace <Port> and <username> including the < and > with the port and username you got while setting up your container. For example: mysql --host mydb --port 3456 --user some-username --password

5. You will then be prompted to enter you DB password you specified during setup.

6.  Once you are at the “mysql>” prompt, you can do the following.

    `MariaDB [(none)]> create database <DB Name>;
    ##It should do its magic - if it works it says:
    #Query OK, 1 row affected
    MariaDB [(none)]> exit
    #Bye`
                                
 
  > Note: we suggest you name the database inside the container the same as the container, but you cannot include dashes in your database name.
 
Now you’re ready to go and never have to set up the database part again and you can use this database to manage all your work over time!

## User guide: Starting up your DIY Cromwell Server and testing it

Now that your database is set up to communicate with Cromwell and store your workflow information, you can proceed to customize Cromwell according to your preferences. Once customized, Cromwell will be tailored to work exactly how you want it to, and you'll be all set to start using it!

### Customize Your Configuration

**Setting up your "home" base for Cromwell configuration files**

To start up your first Cromwell server job, you first need some Cromwell configuration files.  But before that you must decide where the configuration files will "live" or have a "Cromwell home base". 

This **must** be a place where `rhino` can access them, such as in your `homes` directory, which is typically the default directory when you connect to the `rhino`.  

To get started, do the following on `rhino`:
```
mkdir -p cromwell-home
```
Wherever you decide your Cromwell home base to be suggest you create a `cromwell-home` folder (or whatever you want to call it). 

**Cloning template configuration files**

Next to make the setup easy clone the following repository into your Cromwell home base. 

To get started, do the following on `rhino`:
```
cd cromwell-home
git clone --branch main https://github.com/getwilds/diy-cromwell-server.git
```
**Customizing Cromwell Configuration Files**

Next you'll want to move the cromUserConfig.txt template file you just downloaded into your main `cromwell-home` directory for customization and keeping in the future. 

```
cp ./diy-cromwell-server/cromUserConfig.txt .
```
 When you are first setting up Cromwell, you'll need to put all of your User Customizations into this `cromUserConfig.txt` which can serve as a template.  

After you've done this once, you just need to keep the path to the file(s) handy for the future.  

> Note: You can manage multiple Cromwell profiles this way by just maintaining different files full of credentials and configuration variables that you want.

In `cromUserConfig.txt` there are some variables that allow users to share a similar configuration file but tailor the particular behavior of their Cromwell server to best suit them.  

The following text is also in this repo but these are the customizations you'll need to decide on for your server.
```
################## WORKING DIRECTORY AND PATH CUSTOMIZATIONS ###################
## Where do you want the working directory to be for Cromwell
## Note: startng the server will create a subdirectory in the directory you specify here called "cromwell-executions"). Please include the leading and trailing slashes!!! You likely will want to include your username in the path just in case others in your lab are ALSO using Cromwell to reduce confusion.
### Suggestion: /fh/scratch/delete90/pilastname_f/username/
SCRATCHDIR=/fh/scratch/delete90/...

## Where do you want logs about individual workflows (not jobs) to be written?
## Note: this is a default for the server and can be overwritten for a given workflow in workflow-options.  Most of the time workflow troubleshooting occurs without having to refer to these logs, but the ability to make them can be useful if you like them. 
### Suggestion: ~/cromwell-home/workflow-logs
WORKFLOWLOGDIR=~/cromwell-home/workflow-logs

## Where do you want to save Cromwell server logs for troubleshooting Cromwell itself?
## You'll want this handy in the beginning as when Cromwell cannot start up, this is where you'll go to do all of your troubleshooting.  
### Suggestion: ~/cromwell-home/server-logs
SERVERLOGDIR=~/cromwell-home/server-logs

################ DATABASE CUSTOMIZATIONS #################
## DB4Sci MariaDB details (remove any `...`'s and use unquoted text):

CROMWELLDBPORT=...
CROMWELLDBNAME=...
CROMWELLDBUSERNAME=...
CROMWELLDBPASSWORD=...

## Number of cores for your Cromwell server itself - usually 4 is sufficient.  
## Increase if you want to run many, complex workflows simultaneously or notice your server is slowing down. Keep in mind these cpu's do count toward your lab's allocations, so you want to keep it fairly minimal. 
NCORES=4

## Length of time you want the server to run for.  
## Note: when servers go down, all jobs they'd sent will continue.  When you start up a server the next time using the same database, the new server will pick up whereever the previous workflows left off.  "7-0" is 7 days, zero hours.
SERVERTIME="7-0" 
```
> Note:  For this server, you will want multiple cores to allow it to multi-task.  If you notice issues, the particular resource request for the server job itself might be a good place to start adjusting, in conjunction with some guidance from SciComp or the Slack [Question and Answer channel](https://fhbig.slack.com/archives/CD3HGJHJT) folks.


### Kick off your first Cromwell server

Now that you've configured your future Cromwell servers, you can kick off your first Cromwell server job.  Go to `rhino` to your "cromwell-home" and do the following:
```
## You'll want to put `cromwell.sh` somewhere handy for future use, we suggest:
cp ./diy-cromwell-server/cromwell.sh .

## Then you'll want to make the script "executable":
chmod +x cromwell.sh

# Then simply start up Cromwell by executing the script and passing it the path to your configuration file. 
./cromwell.sh cromUserConfig.txt
```


Much like the `grabnode` command you may have used previously, the script will run and print back to the console instructions once the resources have been provisioned for the server. You should see something like this:

```
Your configuration details have been found...
Getting an updated copy of Cromwell configs from GitHub...
Setting up all required directories...
Detecting existence of AWS credentials...
Credentials found, setting appropriate configuration...
Requesting resources from SLURM for your server...
Submitted batch job 2733799
Your Cromwell server is attempting to start up on node/port gizmob5:39071.  It can take up to 2 minutes prior to the port being open for use by the shiny app at https://cromwellapp.fredhutch.org or via the R package fh.wdlR. If you encounter errors, you may want to check your server logs at /home/username/cromwell-home/server-logs to see if Cromwell was unable to start up.
Go have fun now.
```
> Note:  Please write down the node and port it specifies here - in this example it's `gizmob5:39071`, but yours will be a different combination.  This is the only place where you will be able to find the particular node/port for this instance of your Cromwell server, and you'll need that to be able to send jobs to the Cromwell server.

Congrats you've started your first Cromwell server!! 

** Checking the status of your Cromwell server on rhino and how to cancel it**

To "see" if your Cromwell server is up and running you can do this once your are logged into `rhino`: 

```
## Here `username` is your Fred Hutch username
squeue -u username
## Or if you want to get fancy:
squeue -o '%.18i %.9P %j %.8T %.10M %.9l %.6C %R' -u username
```

![cromwell_diy](/_datascience/assets/cromwell_diy.png)

You'll see a jobname "cromwellServer".  Thats your job ID for the Cromwell server.

If you ever want to shut down your server before the 7-day default run time (or whichever default you set in your configuration files) or if you forget your node and port information, you can always go to `rhino` in your Terminal and end the server by doing cancel (shown above) your server and start a new one. 

### Starting up your server in the future
Good news! The above instructions are a one-time event. In the future, when you want to start up a Cromwell server to do some computing work, all you'll have to do is:

1. Get onto Rhino in Terminal

2. Change to the `cromwell-home` directory you made in your Cromwell home base

3. Enter: `./cromwell.sh cromUserConfig.txt` and you're off to the races!

4. Wait for a successful response and the node:port information for your server!

That's it! Now, your Cromwell server will run for a week by default (unless you have set a different server length in cromUserConfig.txt). 

It will be accessible for submitting and executing workflows through multiple mechanisms (which we'll describe in the next chapters).

Simply repeat the above process next week to restart your server, and it'll be ready again!

> Note: No need to worry: if you have a workflow running at the end of the week and your server job ends, starting a new server job will automatically check for the current status of any previously running workflows and pick up where it left off. While you can adjust the configuration of your Cromwell server in your configuration file to run for more than 7 days, we've found that servers tend to run much faster when occasionally "rebooted" like this. Additionally, it's more considerate to your lab members not to always have a server running when it's not actively coordinating a workflow.

### Testing your Cromwell server using test workflows

Once you have a server up and running, you'll want to check out our [Test Workflow GitHub repo](https://github.com/getwilds/wdl-test-workflows) and run through the tests specified in the markdowns there.  The next chapters will guide you through the most common mechanisms for submitting workflows to your server, so you'll want to clone this repo to your local computer so you can have the files handy.  They also are useful templates for you to start editing from to craft your first custom workflow later.  

Each of these example workflows is in a folder containing a WDL file (specifying the workflow itself), and any input files that you'll need (in  JSON format).

> Note: For those test workflows that use [Docker](https://docs.docker.com/guides/walkthroughs/what-is-a-container/) containers, know that the first time you run them, you may notice that jobs aren't being sent very quickly. That is because for our cluster, we need to convert those Docker containers to something that can be run by Singularity. The first time a Docker container is used, it must be converted, but in the future Cromwell will used the cached version of the Docker container and jobs will be submitted more quickly.

## User guide: Running WDL workflows on the Shiny-App
The first and most user-friendly way to validate, submit, track, troubleshoot and if needed abort your WDL workflows is through our [Fred Hutch Shiny app]( https://cromwellapp.fredhutch.org). This shiny app will let you use a graphic interface to submit and manage workflows you've written in WDL.  

![welcome](/_datascience/assets/proof_101_shiny_app_welcome.png) 

> Note: At this point you should have either started your own DIY Cromwell server or if you have not, you can use the automation of PROOF to start one. Initially, setting up a Cromwell server may take a few minutes as it configures the database and performs background tasks. Once it's ready to receive workflows, it will begin listening for instructions via the Shiny app or other methods (discussed later). Please allow 2-3 minutes for setup the first time; subsequent setups will be faster, typically around 1 minute.

### Starting a Cromwell server via PROOF
If you have not started your own DIY Cromwell server the first step is to log in to PROOF. 

![login](/_datascience/assets/proof_101_shinyapp_proof_login.png) 

When you click "PROOF Login", a box will appear where you will input your Hutch credentials and then click submit

![login_2](/_datascience/assets/proof_101_shinyapp_proof_login_2.png)

You know you are logged in when the page refreshes automatically and you see the log out button turn red. 

![login_2](/_datascience/assets/proof_101_shinyapp_logged_in.png)

Next click on "Cromwell Servers" to take you to the page where you can start a server

![start_server](/_datascience/assets/proof_101_shinyapp_start_server.png)

Click "Start" to open up a dialog box that asks for optional credentials to start your Cromwell server 

![start_server_2](/_datascience/assets/proof_101_shinyapp_start_server_2.png)

The majority of people usually are authorized to work under one slurm account (working under one PI = one slurm account). In this case just hit start and all Cromwell configurations will default under the slurm account you are authorised under.

However if you have more than one slurm accounts that you can work under then here is your chance to enter the most appropriate one (for example you could be authorized to do work under two PI's with slurm accounts "pi_a" and "pi_b". If the current workflow you want to submit is for "pi_b" enter pi_b where it asks for slurm account). 

![start_server_3](/_datascience/assets/proof_101_shinyapp_start_server_3.png)

You know your server is up and running when the page auto-refreshes and you see the "Start" button gray out and information about your server populated below. 

![start_server_4](/_datascience/assets/proof_101_shinyapp_start_server_4.png)

There will be two sections of information that you would like to pay attention to which should be populated with details that will be relevant. 

**Server information**
- Job status: it should say "RUNNING"
- Workflow log firectory: Gives you the path to where your workflow logs will reside
- Scratch directory: Gives you the path to where your workflow outputs will go
- Server-time: It tells you how long your Cromwell server will be "alive". By default this is set to 7 days. 
- Slurm job account: The slurm account (default/or if specified) under which your jobs should be running. 

**Troubleshooting**
- Slurm job ID: This is the Cromwell server job ID. You can use this to cancel your Cromwell server through `rhino`
- Cromwell directory: The path to where you main Cromwell directory exists 
- Server log directory: The path to where logs associated with the Cromwell server exists
- Singularity cache directory: Path to Singularity cache directory
- Use AWS?: This defaults currently to FALSE
- Cromwell URL: URL for Cromwell server

Once your server is ready for use it you should receive and email from PROOF API ![email](/_datascience/assets/proof_101_shinyapp_email.png)



### Login with your DIY Cromwell server

If you generated your own Cromwell server using the DIY method you can still use this app and login with the `node:port` information. Instead of clicking the PROOF login click the "My Own Cromwell" button!

[proof_101_shinyapp_diy_login](/_datascience/assets/proof_101_shinyapp_diy_login.png)

Next enter the `node:port` combination you were assigned when you created your started up you Cromwell server and click submit.
>Note: You need to add http:// manually before entering your node:port combination.

![proof_101_shinyapp_diy_login_2](/_datascience/assets/proof_101_shinyapp_diy_login_2.png)

You know everything went well and your credential were acceptable if you see the "Exit" button on top in red. 

![proof_101_shinyapp_diy_login_3](/_datascience/assets/proof_101_shinyapp_diy_login_3.png)

If the `node:port` combination was incorrect you will be notified in the dialog box with "Not a valid Cromwell URL". Check that you entered the information correctly and try again! If you have not save the correct `node:port` combination we recommend that you cancel you Cromwell server and start again (see instructions on canceling in the the previous section) 

You can do all the next steps even if you start your Cromwell server using this method!

### Validate your WDL workflow

Now that you have kicked off your Cromwell server (either via PROOF/your DIY Cromwell server) you are ready to start running your WDL workflows. 
The first step to submitting your workflow is to validate if your WDL workflow and accompanying JSON files are "runnable". If you already have a workflow ready, you can perform a "dry run" to check your workflow files (WDL / JSONs) using the "Validate" tab.

![validate](/_datascience/assets/proof_101_shinyapp_validate.png)

You can upload your WDL workflow file and associated JSON file into the respective upload boxes. 

You can either do this by dragging the files into the upload boxes or browsing to the directory where the workflow and JSON files are stored. 
>Note: If you have more that one JSON file required to run your WDL workflow **DO NOT** upload any JSON files. You can still validate your WDL workflow but uploading only one JSON file (when two are needed) will not validate. 

Once uploaded click validate. 
> Note: You can also click "Reset" to clear the upload boxes. 


The validation process evaluates several things:

-   Ensures the files are in a known format that Cromwell can interpret.
-   Verifies that they are properly formatted.
-   Confirms that the tasks are wired up correctly.

> Note : During a dry run, Cromwell does not test the availability of your input files. This is because Cromwell can access files from a variety of sources, including local filesystems, AWS S3, Google buckets, and Azure blobs. Testing for input availability only happens when you execute the workflow for the first time. If some input files are missing, Cromwell will continue to execute tasks for the available input files while skipping tasks where inputs cannot be located.

Here is an example from the [test workflows](https://github.com/getwilds/wdl-test-workflows/tree/main) showing successful validation

![validate_2](/_datascience/assets/proof_101_shinyapp_validate_2.png)

If your workflows and accompanying JSON files are validated you should see in the  console below 
`$valid`
`[1] TRUE`

If your workflow does not validate the  console will provide some "helpful" information on what could potentially be wrong. You can then go back to the drawing board to fix the errors and re-validate. 


### Submit your workflow 

Congratulations! At this point, you should have a validated WDL workflow and you are ready to submit your job. 

To submit your job click the "Submit Jobs" tab on the left

![proof_101_shiny_app_submit_1](/_datascience/assets/proof_101_shiny_app_submit_1.png)

This will open up the "Submit Jobs" page:

![proof_101_shiny_app_submit_2](/_datascience/assets/proof_101_shiny_app_submit_2.png)

Here you can do the following: 

- Upload your WDL workflow 

- Upload upto 3 different JSON files that accompany your workflow

> Note: You can run a workflow with no input JSON or 1-3 input JSONs. If you have multiple JSONs note that these will be concatenates or the second will overwrite the first if the same variable is declared in both.  You can upload a workflow options JSON, as well as providing text labels of your choosing to workflows if you'd like.  

- Add a primary and secondary workflow label to easily track them 

> Note: As you upload your files look for the blue uploading progress bar below the upload box. 

> Note: If you need to add files different from the ones uploaded go ahead an click the "Reset" button. This will clear **all** the upload fields allowing you to upload a new set of files. 

Once everything is uploaded go ahead and click the "Submit Workflow" button. 

You will know that your submission has worked once you see a little table output on the same page!

![proof_101_shiny_app_submit_3](/_datascience/assets/proof_101_shiny_app_submit_3.png)

This output table has an ID which a long string of letters as numbers that you can use to follow-up on your workflow in the "Track Jobs" tab. This workflow id string is unique to an individual workflow run, so if you run the same workflow a second time, you'll get a different string. This means that this unique identifier string can be used to help understand the data source file(s) used to generate each set of results files, helping make your work reproducible.

>Note: You don't need to copy this workflow ID, we have a nifty copy button in the "Track Jobs" tab !


### Track your submitted jobs

Once you've submitted a workflow, you can track the status of your submitted workflows using the "Track Jobs" tab

![proof_101_shiny_app_track_jobs_1](/_datascience/assets/proof_101_shiny_app_track_jobs_1.png)

#### Filter submitted jobs you want to track
You can track your jobs 3 different ways!

![proof_101_shiny_app_track_jobs_2](/_datascience/assets/proof_101_shiny_app_track_jobs_2.png)

You can filter submitted jobs based on: 
1. Days since your server was started
	> Note: This maxes out 7 days. And displays history of the current Cromwell server. 

2. Using the custom workflow name you have given when you submitted your job

3. Based on the status of the job

> Note:  You can use all these three options in succession. For example  you can display as many days of workflow history as you'd like, filter that result for workflows with a specific name or with specific status(es) like 'failed', 'succeeded', etc. This can help if you have submitted a LOT of workflows and you don't want to see them all, or if the Cromwell server is still busy working through all of your submissions and recording their status.

Once you are done filtering down to your choices and click "Update View", the relevant workflows will be returned and you'll see a visual representation on  those workflows.  

![proof_101_shiny_app_track_jobs_3](/_datascience/assets/proof_101_shiny_app_track_jobs_3.png)

Below this tab you will also see a graph showing "Workflow Timing" information along with outcomes (Graph legend = "Status"). The x-axis shows how long it took to run a particular workflow and the y-axis will show you which workflow (from a potentially filtered list of workflows)

![proof_101_shiny_app_track_jobs_4](/_datascience/assets/proof_101_shiny_app_track_jobs_4.png)

Finally below this visual representation of all your workflow runs you will see a "Workflows Run" table showing metadata for each workflow.  Click on the workflow you're interested in to populate the rest of the tables (below). 

> Note: Next to each workflow in the table we have a nifty "copyID" button that you can use to copy your workflow ID for use elsewhere in the app. 
 
![proof_101_shiny_app_track_jobs_5](/_datascience/assets/proof_101_shiny_app_track_jobs_5.png)

You can also see a visual summary of the workflow below

![proof_101_shiny_app_track_jobs_6](/_datascience/assets/proof_101_shiny_app_track_jobs_6.png)

#### Track workflow-level details

To get more information on a particular workflow select a workflow and you'll see some summary information about that workflow as you scroll down.

![proof_101_shiny_app_track_jobs_7](/_datascience/assets/proof_101_shiny_app_track_jobs_7.png)

You can see a plot of the timing and outcomes of each call in that workflow.

![proof_101_shiny_app_track_jobs_8](/_datascience/assets/proof_101_shiny_app_track_jobs_8.png)

#### Track call-level details

To get more detailed information about each "task" in your WDL workflow you can scroll down to see the "Job List" table.  This table has usefule information such as the directory where the job is working (callRoot), its SLURM "job_ID" , what computing resources or software environment were used, and the job's status.  

![proof_101_shiny_app_track_jobs_9](/_datascience/assets/proof_101_shiny_app_track_jobs_9.png)

You can then click on a specific task of choice to get more information on that specific task/call.

You can use the Job Failures, Call Caching, tables to retrieve information relevant to those processes.  You can do this by clicking the "Get/Refresh ... Metadata" buttons (sometimes for complex workflows these can be quite large, and thus they do not load until you want them).  You can also choose to download these tables if you like. 

![proof_101_shiny_app_track_jobs_10](/_datascience/assets/proof_101_shiny_app_track_jobs_10.png)

#### Tracking the location of your outputs

Finally, once a workflow's outputs have all been created successfully, Cromwell can tell you (and this Shiny app can help you download) a table showing where to find the workflow outputs (note this is not every file created, only the ones you specify as "results" using the WDL file's "workflow output" block).  

This lets you find output files and interact with them, archive them, or otherwise copy them to longer term storage for use.  
![proof_101_shiny_app_track_jobs_11](/_datascience/assets/proof_101_shiny_app_track_jobs_11.png)

### Troubleshoot Tab

Last, there is the Troubleshoot tab.  Here you can do things like Abort running workflows or get a complete metadata output for the entire workflow to parse yourself to try to find what's happening with your workflow if it failed running. 

![proof_101_shiny_app_troubleshoot_1](/_datascience/assets/proof_101_shiny_app_troubleshoot_1.png)

#### Abort a workflow

Sometimes you realize you want to kill a workflow.  Using the workflow_id, you can kill specific workflows using this box.  

![proof_101_shiny_app_abort_1](/_datascience/assets/proof_101_shiny_app_abort_1.png)

> Note: it will take Cromwell some time to coordinate SLURM job cancellations particularly for complex workflows, but it will clean everything up for you. 

![proof_101_shiny_app_abort_2](/_datascience/assets/proof_101_shiny_app_abort_2.png)

#### Troubleshoot a workflow

Especially in the beginning if you have catastrophic workflow failures and you can't even figure out what's going on, you can come back to this Troubleshoot box to retrieve the entire, unformatted JSON output of all metadata Cromwell has about your workflow.  You probably are better served by the "Track Jobs" tab for checking how your workflow is going, but if there's nothing there that's helpful, then this box is where you'll want to go.  

![proof_101_shiny_app_troubleshoot_2](/_datascience/assets/proof_101_shiny_app_troubleshoot_2.png)

![proof_101_shiny_app_troubleshoot_3](/_datascience/assets/proof_101_shiny_app_troubleshoot_3.png)

> Note: this output is not for the faint of heart, but it will give you hints once you get used to understanding what Cromwell is telling you.  

### Delete your Cromwell server

Finally if your workflow has finished running before the 7-day timeline (or whatever custom time you set up) you can go ahead and delete your Cromwell server. 

Go back to the Cromwell Server tab and click delete

![proof_101_shiny_app_delete_server_1](/_datascience/assets/proof_101_shiny_app_delete_server_1.png)

A pop-up box will show up and ask you type out the words "delete me". This is an added measure so you don't accidently end your server.

![proof_101_shiny_app_delete_server_2](/_datascience/assets/proof_101_shiny_app_delete_server_2.png)

### Where to report bugs and find help

If you find something is not working with the App or you find a bug please help us make this App better by reporting here 

![proof_101_shiny_app_help](/_datascience/assets/proof_101_shiny_app_help.png)

Here is where you can find the GitHub repository that was used to build the App

![proof_101_shiny_app_code](/_datascience/assets/proof_101_shiny_app_code.png)


## Users guide: Running WDL workflows through R (rcromwell)

### What is rcromwell? 

In addition to running WDL workflows through the Shiny App you can also do this through R using the [rcromwell](https://getwilds.org/rcromwell/index.html) package. 

You can also use this R package through R/RStudio on your local machine (on VPN or on campus) to directly submit workflows to your Cromwell server from the R command line, and to track calls and workflow execution status directly. 

> Note: The package is set up to support both Shiny workflow and a single R user in an R session. Thus, you can pass your Cromwell url and Proof API token in function calls in your R code, but you shouldn’t . The interaface for passing through the function arguments is meant for Shiny. Instead use cromwell_config() and set the API token as an env var from proofr for better security posture.

### Installation 

 You must first install rcromwell by following the instructions [here](https://getwilds.org/rcromwell/index.html)

### Getting started
 To get started with submitting workflow and tracking their progress see details [here](https://getwilds.org/rcromwell/articles/rcromwell.html)

### More details
Look [here](https://getwilds.org/rcromwell/reference/index.html) for more details about the functions in rcromwell. 

### Where to report bugs and find help

The GitHub repository for [rcromwell](https://github.com/getwilds/rcromwell) is the best place to file issues and report bugs. It also has [vignettes](https://github.com/getwilds/rcromwell/tree/971a2f90fd231dc6076f4281b457c8ed9f57a9d9/vignettes) that you may find helpful. 

## Users guide: Running WDL workflows through command line via PROOF
***section in development***

## Developing with PROOF API
***section in development***

## Resources and help
***section in development***

There is [emerging documentation about the WDL specification itself being generated by the openWDL community here](https://wdl-docs.readthedocs.io/en/1.0.0/).  Also, there is some useful, though very detailed, information in the [openWDL GitHub repo for the specification itself where you can learn more](https://github.com/openwdl/wdl/blob/main/versions/development/SPEC.md#introduction). 

## Contributors and reviewers of this document
We would love to get feedback on this document from the community and would love to hear how we can make improvements to make this more helpful to you! Feel free to [email]() us at or directly make recommendations on [GitHub]()
**Contributors**

Sitapriya Moorthi ([GitHub](https://github.com/sitapriyamoorthi)/[E-mail](mailto:smoorthi@fredhutch.org))

Amy Paguirigan

Scott Chamberlain

**Reviewers**

Ted Laderas
