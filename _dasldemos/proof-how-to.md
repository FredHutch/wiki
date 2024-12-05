---
title: How to Use PROOF
main_authors: vortexing, sitapriyamoorthi
primary_reviewers: vortexing
---

This guide is intended to describe how to use the [**PROOF** app](https://proof.fredhutch.org) (**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility) to run [**WDL**](https://sciwiki.fredhutch.org/compdemos/Cromwell/#writing-workflows) workflows on the [**Fred Hutch cluster**](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/). Learn more about PROOF on its [SciWiki product page](https://sciwiki.fredhutch.org/datascience/proof/), read through our [quick-start guide](https://hutchdatascience.org/Developing_WDL_Workflows/) to building a WDL workflow, and check out our pre-built [WILDS WDL workflows](https://github.com/getwilds?q=ww-&type=all&language=&sort=) for ready-to-submit bioinformatic pipelines.





## Using PROOF
The following diagram shows basic usage of PROOF once you have done the preliminary setup. Each box corresponds to a section in the documentation.

![](/dasldemos/assets/proof_101_workflow.png) 

### Before you begin

Before you begin using PROOF, make sure you have the following:
- [Valid Fred Hutch credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
- Access to the Fred Hutch network
    - If on-campus, make sure you are connected to the Research Staff network.
    - If off-campus, make sure you connect via [VPN](https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn).
- [Access to the rhino cluster of Fred Hutch](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#accessing-slurm-clusters)
- [AWS credentials (if needed for S3 file storage for your workflows)](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)






### Log in to PROOF

The first step is to log in to PROOF. 

![login](/dasldemos/assets/proof_101_shinyapp_proof_login.png) 

When you click "PROOF Login", a box will appear where you will input your Hutch credentials and then click submit.

![login_2](/dasldemos/assets/proof_101_shinyapp_proof_login_2.png)

You'll know you are logged in when the page refreshes automatically and a red logout button appears in the top right corner.

![login_2](/dasldemos/assets/proof_101_shinyapp_loggedin.png)





### Setup your PROOF/Cromwell server

**Starting a PROOF server**
Next click on "Server" to take you to the page where you can start a server.

![start_server](/dasldemos/assets/proof_101_shinyapp_start_server.png)

Click "Start Server". You will get a dialog box that asks for optional credentials to start your PROOF Server. It may take a moment to appear. 

![start_server_2](/dasldemos/assets/proof_101_shinyapp_start_server_2.png)

The majority of people are only authorized to work under one SLURM account (working under one PI = one SLURM account). In this case, just hit start and all Cromwell configurations will default under the SLURM account you are authorized under.

However, if you have more than one SLURM account that you can work under, then here is your chance to enter the most appropriate one. For example, you could be authorized to do work under two PI's with SLURM accounts "pi_a" and "pi_b". If the current workflow you want to submit is for "pi_b", enter "pi_b" where it asks for SLURM account.

![start_server_3](/dasldemos/assets/proof_101_shinyapp_start_server_3.png)

You know your server is up and running when the page auto-refreshes, the "Start" button grays out, and information about your server populates below. 

![start_server_4](/dasldemos/assets/proof_101_shinyapp_start_server_4.png)

> Initially, setting up a PROOF Server may take a few minutes as it configures the database and performs background tasks. Once it's ready to receive workflows, it will begin listening for instructions via the Shiny app or other methods (discussed later). Please allow 2-3 minutes for setup the first time; subsequent setups will be faster, typically around 1 minute.

There will be two sections of information to pay attention to which should be populated with relevant details. These details may take a moment to appear on the page, even if your server is already running.

**Server information**
- Job status: should say "RUNNING"
- Workflow log directory: path to where your workflow logs will reside
- Scratch directory: path to where your workflow outputs will go
- Server-time: how long your PROOF Server will be "alive" (set to 7 days by default)
- SLURM job account: SLURM account (default/or if specified) under which your jobs should be running 

**Troubleshooting**
- SLURM job ID: PROOF server job ID that can be used to cancel your PROOF server through `rhino`
- Cromwell directory: path of your main Cromwell directory 
- Server log directory: path where logs associated with the PROOF server will be saved
- Singularity cache directory: path where Singularity/Apptainer/Docker images will be saved for caching purposes
- Use AWS?: This option is not currently available but may be in future.
- Cromwell URL: URL for PROOF server

Once your server is ready for use, you should receive an email from PROOF API ![email](/dasldemos/assets/proof_101_shinyapp_email.png)

**Stopping a PROOF server**

Finally, if your workflow has finished running before the 7-day timeline (or whatever custom timeline you set up), you can stop your PROOF server. Note that your job can run for longer than 7 days, it is only the PROOF server that will stop. At the bottom of the PROOF server tab, click "Stop a PROOF Server":

![proof_101_shiny_app_delete_server_1](/dasldemos/assets/proof_101_shiny_app_delete_server_1.png)

A pop-up box will show up and ask you to confirm that you would like to stop your server as this action cannot be undone, but you can always start up a new server anytime!

![proof_101_shiny_app_delete_server_2](/dasldemos/assets/proof_101_shiny_app_delete_server_2.png)






### Validate your WDL workflow

Now that you have kicked off your PROOF server, you are ready to start running your WDL workflows. If you already have a workflow ready, you can optionally do a "dry run" with your workflow files (WDL/JSONs) using the 'Validate' tab. This tab checks to see if your workflows are formatted correctly before you submit them, to save you time in case they are not runnable.

![validate](/dasldemos/assets/proof_101_shinyapp_validate.png)

You can upload your WDL workflow file and associated JSON file into the upload boxes by either dragging the files into the respective boxes or browsing to the directory where the workflow and JSON files are stored. Once uploaded, click 'Validate Workflow'.

>Note: If you have more than one input JSON file required to run your WDL workflow, you'll need to consolidate them and upload them as a single file. If you do not consolidate them and only upload one, the WDL will not validate correctly.

The validation process evaluates several things:

-   Ensures the files are in a known format that Cromwell can interpret.
-   Verifies that they are properly formatted.
-   Confirms that the tasks are wired up correctly.

> Note: During a dry run, Cromwell does not test the availability of your input files. This is because Cromwell can access files from a variety of sources, including local filesystems, AWS S3, Google buckets, and Azure blobs. Testing for input availability only happens when you execute the workflow for the first time. If some input files are missing, Cromwell will continue to execute tasks for the available input files while skipping tasks where inputs cannot be located.

Here is an example from a ["hello world" workflow](https://github.com/getwilds/wdl-test-workflows/tree/main) showing successful validation:

![validate_2](/dasldemos/assets/proof_101_shinyapp_validate_2.png)

If your workflow and accompanying JSON files are validated, you should see `$valid` `[1] TRUE` in the textbox beneath the submission form.

If your workflow does not validate, the console will provide some helpful information on what could potentially be wrong. You can then go back to the drawing board to fix the errors and re-validate. For pointers and examples on how to use this validation tool, check out our [troubleshooting documentation](/dasldemos/proof-troubleshooting/#validate-your-workflow).





### Submit your WDL workflow

Congratulations! At this point, you should have a validated WDL workflow and you are ready to submit your job. First, click on the "Submit" tab on the top menu bar to open up the "Submit a Workflow" page:

![proof_101_shiny_app_submit_2](/dasldemos/assets/proof_101_shiny_app_submit_2.png)

Here you can upload your WDL workflow and its associated input/options JSON files. If desired, you can also add a primary and secondary workflow label to easily track your workflows (e.g., compare versions or batches). If you do not add a primary label, PROOF will autopopulate a label upon submission with an adjective and animal (e.g., "InquisitivePenguin").

> Note: As you upload your files look for the blue uploading progress bar below the upload box. If you need to add files different from the ones uploaded, click the "Reset Form" button. This will clear **all** the upload fields allowing you to upload a new set of files. 

Once everything is uploaded, click the "Submit Workflow" button. When your submission is done, you will see a confirmation and workflow ID appear below the submit button on the form. Depending on your window size, you may need to scroll down. 

![proof_101_shiny_app_submit_3](/dasldemos/assets/proof_101_shiny_app_submit_3.png)

The workflow ID is a long string of letters and numbers. This string is unique to an individual workflow run, so if you run the same workflow a second time, you'll get a different string. This means that this unique identifier string can be used to help understand the data source file(s) used to generate each set of results files, helping make your work reproducible.

> Note: You don't need to copy this workflow ID, it will appear on the 'Track Workflows' screen along with the workflow name and label(s).





### Track your WDL workflow
Once you've submitted a workflow, you can track the status of your submitted workflows using the "Track Jobs" tab:

![proof_101_shiny_app_track_jobs_1](/dasldemos/assets/proof_101_shiny_app_track_jobs_1.png)

**Filter submitted jobs you want to track**

In the "Workflow Runs" table, you can filter your jobs three different ways: workflow name, status, and date. Initially, this is likely not needed, however as you submit more analyses via PROOF (potentially at the same time), you'll eventually want to filter results to track specific work over time.

![proof_101_shiny_app_track_jobs_2](/dasldemos/assets/proof_101_shiny_app_track_jobs_2.png)






### Check WDL workflow details
You can filter submitted jobs based on: 
1. Submission date range
2. Workflow name provided in the WDL script
3. Job status

> Note: You can use all these three options in succession. For example, you can display as many days of workflow history as you'd like, filter that result for workflows with a specific name or with specific status(es) like 'failed', 'succeeded', etc. This can help if you have submitted a LOT of workflows and you don't want to see them all, or if the PROOF server is still busy working through all of your submissions and recording their status.

Once you are done filtering down to your choices and click "Update View", the relevant workflows will be returned and you'll see a comprehensive list of details about those workflows.

![proof_101_shiny_app_track_jobs_3](/dasldemos/assets/proof_101_shiny_app_track_jobs_3.png)

Next to "Workflow Runs", you will also see a tab for "Workflow Timing" which displays a graph containing timing information along with workflow outcomes (Graph legend = "Status"). The x-axis shows how long it took to run a particular workflow and the y-axis shows workflow name (from a potentially filtered list of workflows).

![proof_101_shiny_app_track_jobs_4](/dasldemos/assets/proof_101_shiny_app_track_jobs_4.png)

Finally, below this visual representation of all your workflow runs, you will see a "Workflow Runs" table showing metadata for each workflow. Click on the workflow you're interested in to populate the rest of the tables (below). 

> Note: Next to each workflow in the table we have a nifty "copyID" button that you can use to copy your workflow ID for use elsewhere in the app. 
 
![proof_101_shiny_app_track_jobs_5](/dasldemos/assets/proof_101_shiny_app_track_jobs_5.png)

You can also see a visual summary of the workflow below

![proof_101_shiny_app_track_jobs_6](/dasldemos/assets/proof_101_shiny_app_track_jobs_6.png)

**Track workflow-level details**

To get more information on a particular workflow select a workflow and you'll see some summary information about that workflow as you scroll down.

![proof_101_shiny_app_track_jobs_7](/dasldemos/assets/proof_101_shiny_app_track_jobs_7.png)

You can see a plot of the timing and outcomes of each call in that workflow.

![proof_101_shiny_app_track_jobs_8](/dasldemos/assets/proof_101_shiny_app_track_jobs_8.png)

**Track call-level details**

To get more detailed information about each "task" in your WDL workflow you can scroll down to see the "Job List" table.  This table has usefule information such as the directory where the job is working (callRoot), its SLURM "job_ID" , what computing resources or software environment were used, and the job's status.  

![proof_101_shiny_app_track_jobs_9](/dasldemos/assets/proof_101_shiny_app_track_jobs_9.png)

You can then click on a specific task of choice to get more information on that specific task/call.

You can use the Job Failures, Call Caching, tables to retrieve information relevant to those processes.  You can do this by clicking the "Get/Refresh ... Metadata" buttons (sometimes for complex workflows these can be quite large, and thus they do not load until you want them).  You can also choose to download these tables if you like. 

![proof_101_shiny_app_track_jobs_10](/dasldemos/assets/proof_101_shiny_app_track_jobs_10.png)

**Tracking the location of your outputs**

Finally, once a workflow's outputs have all been created successfully, Cromwell can tell you (and this Shiny app can help you download) a table showing where to find the workflow outputs (note this is not every file created, only the ones you specify as "results" using the WDL file's "workflow output" block).  

This lets you find output files and interact with them, archive them, or otherwise copy them to longer term storage for use.  
![proof_101_shiny_app_track_jobs_11](/dasldemos/assets/proof_101_shiny_app_track_jobs_11.png)







### Troubleshoot your WDL workflow

Last, there is the Troubleshoot tab.  Here you can do things like Abort running workflows or get a complete metadata output for the entire workflow to parse yourself to try to find what's happening with your workflow if it failed running. 

![proof_101_shiny_app_troubleshoot_1](/dasldemos/assets/proof_101_shiny_app_troubleshoot_1.png)

**Abort a workflow**

Sometimes you realize you want to kill a workflow.  Using the workflow_id, you can kill specific workflows using this box.  

![proof_101_shiny_app_abort_1](/dasldemos/assets/proof_101_shiny_app_abort_1.png)

> Note: it will take Cromwell some time to coordinate SLURM job cancellations particularly for complex workflows, but it will clean everything up for you. 

![proof_101_shiny_app_abort_2](/dasldemos/assets/proof_101_shiny_app_abort_2.png)

**Troubleshoot a workflow**

Especially in the beginning if you have catastrophic workflow failures and you can't even figure out what's going on, you can come back to this Troubleshoot box to retrieve the entire, unformatted JSON output of all metadata Cromwell has about your workflow.  You probably are better served by the "Track Jobs" tab for checking how your workflow is going, but if there's nothing there that's helpful, then this box is where you'll want to go.  

![proof_101_shiny_app_troubleshoot_2](/dasldemos/assets/proof_101_shiny_app_troubleshoot_2.png)

![proof_101_shiny_app_troubleshoot_3](/dasldemos/assets/proof_101_shiny_app_troubleshoot_3.png)

> Note: this output is not for the faint of heart, but it will give you hints once you get used to understanding what Cromwell is telling you.  


## Resources and Help

#### Reporting bugs

If you find something is not working with the app or you find a bug, please help us make this app better by reporting here:

![proof_101_shiny_app_help](/dasldemos/assets/proof_101_shiny_app_help.png)

![proof_101_shiny_app_help2](/dasldemos/assets/proof_101_shiny_app_help2.png)

### Useful courses to get started
#### Cluster computing
- [How to Rhino](https://sciwiki.fredhutch.org/compdemos/howtoRhino/)
- [Cluster 101](https://leanpub.com/courses/fredhutch/fredhutchcluster101)

#### Building WDL workflows
- [Developing WDL Workflows](https://hutchdatascience.org/Developing_WDL_Workflows/)
- [Open WDL Documentation](https://docs.openwdl.org/en/latest/)

#### PROOF technical documentation and repositories [here](https://sciwiki.fredhutch.org/datascience/proof/#technical-documentation-and-repositories)
- [PROOF Troubleshooting](/dasldemos/proof-troubleshooting)


### Contact Us
We would love to get feedback on this document from the community and would love to hear how we can make improvements to make this more helpful to you! Feel free to [email](mailto:wilds@fredhutch.org) us or directly make recommendations on [GitHub](https://github.com/FredHutch/wiki/). Or if you'd like to talk through things face-to-face, schedule a [Data House Call](https://calendly.com/data-house-calls/resources?back=1&month=2024-12) with us! 


