---
title: How to Use PROOF
main_authors: vortexing, sitapriyamoorthi
primary_reviewers: vortexing
---

**UPDATING DOCS IN PROGRESS**

[**PROOF**](https://proof.fredhutch.org)(**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility) is a point-and-click application to run [**WDL**](https://sciwiki.fredhutch.org/compdemos/Cromwell/#writing-workflows) workflows via the [**Cromwell**](https://cromwell.readthedocs.io/en/latest/) workflow manager on the [**Fred Hutch cluster**](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/). PROOF **automates the setup** of Cromwell, allowing you to focus on building, testing and getting your workflows running!

Learn more about PROOF [**here**](https://sciwiki.fredhutch.org/datascience/proof/). We have a **quick-start guide** to building [WDL workflows](https://hutchdatascience.org/Developing_WDL_Workflows/) and a repository of [**validated WDL workflows**](https://github.com/orgs/getwilds/repositories?q=ww). Get support on all things WDL and PROOF through our [**Data House Calls**](https://calendly.com/data-house-calls/resources?back=1&month=2024-11) or get support from the workflow community [**on slack**](https://fhdata.slack.com/archives/CJFP1NYSZ).





## PROOF Overview
An overview of steps to get started on PROOF
![](/dasldemos/assets/proof_101_workflow.png) 





## Before you begin
Before you begin using PROOF, make sure you have the following:
- [Valid Fred Hutch credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
- Access to the Fred Hutch network
    - If on-campus, make sure you are connected to the Fred Hutch network.
    - If off-campus, make sure you connect via [VPN](https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn).
- [Access to the rhino cluster of Fred Hutch](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#accessing-slurm-clusters)
- [AWS credentials (if you have files stored on S3 required to run your workflows)](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)





## Log in to PROOF with your Fred Hutch credentials

The first step to get started on submitting you WDL workflows via PROOF is to login by clicking the green **PROOF Login** button (green).

![login](/dasldemos/assets/proof_101_shinyapp_proof_login.png) 

When you click "PROOF Login", a pop-up will appear where you need to input your Hutch credentials and then click submit.

![login_popup](/dasldemos/assets/proof_101_shinyapp_proof_login_2.png)

You know you are logged in when the page refreshes automatically and you see the red **PROOF Logout** button.

![logged_in](/dasldemos/assets/proof_101_shinyapp_loggedin.png)

**Congratulations! You are now logged into PROOF!**



## Server

This tab allows you to Start (or Stop) your PROOF/Cromwell server

###Start your server
Next click on "PROOF Servers" to take you to the page where you can start a server.

![start_server](/dasldemos/assets/proof_101_shinyapp_start_server.png)

Click "Start" to open up a dialog box that asks for optional credentials to start your PROOF Server.

![start_server_2](/dasldemos/assets/proof_101_shinyapp_start_server_2.png)

The majority of people usually are only authorized to work under one SLURM account (working under one PI = one SLURM account). In this case, just hit start and all Cromwell configurations will default under the SLURM account you are authorised under.

However, if you have more than one SLURM account that you can work under, then here is your chance to enter the most appropriate one (for example you could be authorized to do work under two PI's with SLURM accounts "pi_a" and "pi_b". If the current workflow you want to submit is for "pi_b" enter pi_b where it asks for SLURM account). 

![start_server_3](/dasldemos/assets/proof_101_shinyapp_start_server_3.png)

You know your server is up and running when the page auto-refreshes and you see the "Start" button gray out and information about your server populated below. 

![start_server_4](/dasldemos/assets/proof_101_shinyapp_start_server_4.png)

> Initially, setting up a PROOF Server may take a few minutes as it configures the database and performs background tasks. Once it's ready to receive workflows, it will begin listening for instructions via the Shiny app or other methods (discussed later). Please allow 2-3 minutes for setup the first time; subsequent setups will be faster, typically around 1 minute.

There will be two sections of information that you would like to pay attention to which should be populated with details that will be relevant. 

####Manage your PROOF Server
- Job status: it should say "RUNNING"
- Workflow log directory: Gives you the path to where your workflow logs will reside
- Scratch directory: Gives you the path to where your workflow outputs will go
- Server-time: It tells you how long your PROOF Server will be "alive". By default this is set to 7 days
- SLURM job account: The SLURM account (default/or if specified) under which your jobs should be running 

####Troubleshooting Your PROOF Server
- SLURM job ID: This is the PROOF server job ID. You can use this to cancel your PROOF server through `rhino`
- Cromwell directory: The path to where you main Cromwell directory exists 
- Server log directory: The path to where logs associated with the PROOF server exists
- Singularity cache directory: Path to Singularity cache directory
- Use AWS?: This defaults currently to FALSE
- Cromwell URL: URL for PROOF server

Once your server is ready for use, you should receive an email from PROOF API ![email](/dasldemos/assets/proof_101_shinyapp_email.png)

####Stop your PROOF Server

Finally if your workflow has finished running before the 7-day timeline (or whatever custom time you set up) you can go ahead and stop your PROOF server. 

Go back to the PROOF server tab and click Stop Server

![proof_101_shiny_app_delete_server_1](/dasldemos/assets/proof_101_shiny_app_delete_server_1.png)

A pop-up box will show up and ask you type out the words "delete me". This is an added measure so you don't accidentally end your server.

![proof_101_shiny_app_delete_server_2](/dasldemos/assets/proof_101_shiny_app_delete_server_2.png)






## Validate 

Now that you have kicked off your PROOF server, you are ready to start running your WDL workflows. The first step to submitting your workflow is to validate if your WDL workflow and accompanying JSON files are "runnable". If you already have a workflow ready, you can perform a "dry run" to check your workflow files (WDL/JSONs) using the "Validate" tab.

![validate](/dasldemos/assets/proof_101_shinyapp_validate.png)

You can upload your WDL workflow file and associated JSON file into the respective upload boxes. You can do this by either dragging the files into the upload boxes or browsing to the directory where the workflow and JSON files are stored. Once uploaded, click validate.

>Note: If you have more that one JSON file required to run your WDL workflow **DO NOT** upload any JSON files. You can still validate your WDL workflow but uploading only one JSON file (when two are needed) will not validate. 

The validation process evaluates several things:

-   Ensures the files are in a known format that Cromwell can interpret.
-   Verifies that they are properly formatted.
-   Confirms that the tasks are wired up correctly.

> Note : During a dry run, Cromwell does not test the availability of your input files. This is because Cromwell can access files from a variety of sources, including local filesystems, AWS S3, Google buckets, and Azure blobs. Testing for input availability only happens when you execute the workflow for the first time. If some input files are missing, Cromwell will continue to execute tasks for the available input files while skipping tasks where inputs cannot be located.

Here is an example from the [test workflows](https://github.com/getwilds/wdl-test-workflows/tree/main) showing successful validation

![validate_2](/dasldemos/assets/proof_101_shinyapp_validate_2.png)

If your workflows and accompanying JSON files are validated you should see in the  console below 
`$valid`
`[1] TRUE`

If your workflow does not validate, the console will provide some "helpful" information on what could potentially be wrong. You can then go back to the drawing board to fix the errors and re-validate. 





## Submit 

Using this tab you can submit your WDL, json files and parameter files

Congratulations! At this point, you should have a validated WDL workflow and you are ready to submit your job. 

To submit your job click the "Submit Jobs" tab on the left

![proof_101_shiny_app_submit_1](/dasldemos/assets/proof_101_shiny_app_submit_1.png)

This will open up the "Submit Jobs" page:

![proof_101_shiny_app_submit_2](/dasldemos/assets/proof_101_shiny_app_submit_2.png)

Here you can do the following: 

- Upload your WDL workflow 

- Upload up to three different JSON files that accompany your workflow.

> Note: You can run a workflow with no input JSON or 1-3 input JSONs. If you have multiple JSONs, note that these will be concatenated or the second will overwrite the first if the same variable is declared in both.  You can upload a workflow options JSON, as well as providing text labels of your choosing to workflows if you'd like.

- Add a primary and secondary workflow label to easily track them 

> Note: As you upload your files look for the blue uploading progress bar below the upload box. If you need to add files different from the ones uploaded, click the "Reset" button. This will clear **all** the upload fields allowing you to upload a new set of files. 

Once everything is uploaded, click the "Submit Workflow" button. 

You will know that your submission has worked once you see a little table output on the same page!

![proof_101_shiny_app_submit_3](/dasldemos/assets/proof_101_shiny_app_submit_3.png)

This output table has an ID which a long string of letters as numbers that you can use to follow-up on your workflow in the "Track Jobs" tab. This workflow id string is unique to an individual workflow run, so if you run the same workflow a second time, you'll get a different string. This means that this unique identifier string can be used to help understand the data source file(s) used to generate each set of results files, helping make your work reproducible.

>Note: You don't need to copy this workflow ID, we have a nifty copy button in the "Track Jobs" tab !





## Track workflows
This tab allows you to track your workflows
And also allows you to see how long it takes and if it succeeds or fails
Once you've submitted a workflow, you can track the status of your submitted workflows using the "Track Jobs" tab

![proof_101_shiny_app_track_jobs_1](/dasldemos/assets/proof_101_shiny_app_track_jobs_1.png)

**Filter submitted jobs you want to track**
You can filter your jobs 3 different ways! Initially this is likely not needed, however as PROOF can manage several different workflows running at once you'll eventually want to filter results to track specific work at a time.  

![proof_101_shiny_app_track_jobs_2](/dasldemos/assets/proof_101_shiny_app_track_jobs_2.png)
You can filter submitted jobs based on: 
1. Days since your server was started
    > Note: This maxes out 7 days. And displays history of the current PROOF server. 

2. Using the custom workflow name you have given when you submitted your job

3. Based on the status of the job

> Note:  You can use all these three options in succession. For example  you can display as many days of workflow history as you'd like, filter that result for workflows with a specific name or with specific status(es) like 'failed', 'succeeded', etc. This can help if you have submitted a LOT of workflows and you don't want to see them all, or if the PROOF server is still busy working through all of your submissions and recording their status.

Once you are done filtering down to your choices and click "Update View", the relevant workflows will be returned and you'll see a visual representation on  those workflows.  

![proof_101_shiny_app_track_jobs_3](/dasldemos/assets/proof_101_shiny_app_track_jobs_3.png)

Below this tab you will also see a graph showing "Workflow Timing" information along with outcomes (Graph legend = "Status"). The x-axis shows how long it took to run a particular workflow and the y-axis will show you which workflow (from a potentially filtered list of workflows)

![proof_101_shiny_app_track_jobs_4](/dasldemos/assets/proof_101_shiny_app_track_jobs_4.png)

Finally below this visual representation of all your workflow runs you will see a "Workflows Run" table showing metadata for each workflow.  Click on the workflow you're interested in to populate the rest of the tables (below). 

> Note: Next to each workflow in the table we have a nifty "copyID" button that you can use to copy your workflow ID for use elsewhere in the app. 
 
![proof_101_shiny_app_track_jobs_5](/dasldemos/assets/proof_101_shiny_app_track_jobs_5.png)

You can also see a visual summary of the workflow below

![proof_101_shiny_app_track_jobs_6](/dasldemos/assets/proof_101_shiny_app_track_jobs_6.png)
To get more information on a particular workflow select a workflow and you'll see some summary information about that workflow as you scroll down.

![proof_101_shiny_app_track_jobs_7](/dasldemos/assets/proof_101_shiny_app_track_jobs_7.png)

You can see a plot of the timing and outcomes of each call in that workflow.

![proof_101_shiny_app_track_jobs_8](/dasldemos/assets/proof_101_shiny_app_track_jobs_8.png)

###Abort a workflow

Sometimes you realize you want to kill a workflow.  Using the workflow_id, you can kill specific workflows using this box.  

![proof_101_shiny_app_abort_1](/dasldemos/assets/proof_101_shiny_app_abort_1.png)

> Note: it will take Cromwell some time to coordinate SLURM job cancellations particularly for complex workflows, but it will clean everything up for you. 

![proof_101_shiny_app_abort_2](/dasldemos/assets/proof_101_shiny_app_abort_2.png)



## Workflow Details
While you are on the "Track workflows" page you can click the **Workflow Details** button to dig into the details of the jobs within the workflow of your interest. 

![view_workflow_details](/dasldemos/assets/proof_101_shiny_app_track_jobs_5.png)


### Job List
The first page that you get to when you click the **Workflow Details** button on the "Track workflows" page lands on this Job List page. 

![workflow_details_job_list](/dasldemos/assets/proof_101_shiny_app_track_jobs_7.png)

The **Job List** tab and other workflow information is intended to provide you with relevant information as it pertains to your workflow.

You can download the entire table shown here by clickin the **Download Workflows Jobs Data** button. You can also adjust the number of entries to view in a given page by adjusting the "Show ____ entries" dropdown.
The Job List page summarizes all the information you need about each of your jobs/tasks/calls that are being executed in your workflow. 



| **Field**                  | **Description**                                                                                                                                                                |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **detailedSubName**        | Detailed name for the sub-task or call.                                                                                                                                      |
| **callName**               | The name of the task or call.                                                                                                                                                 |
| **executionStatus**        | Current status of the task or call.                                                                                                                                          |
| **shardIndex**             | The specific sub-task or call being processed within a parallelized workflow.                                                                                                |
| **callRoot**               | Path to the directory where outputs of a specific workflow task or call are stored.                                                                                          |
| **start**                  | Start date and time of the task or call.                                                                                                                                     |
| **end**                    | End date and time of the task or call.                                                                                                                                       |
| **callDuration**           | Total time taken to finish the task or call.                                                                                                                                 |
| **docker**                 | The Docker container used to perform the task or call.                                                                                                                       |
| **modules**                | The module used to perform the task or call, if applicable.                                                                                                                 |
| **workflowName**           | Name of the workflow.                                                                                                                                                         |
| **stdout**                 | Contains all standard output messages generated by commands run within the task, such as print statements or command-line output.                                            |
| **compressedDockerSize**   | Size of the compressed Docker image used for the task.                                                                                                                      |
| **returnCode**             | Exit code of the task's command; 0 indicates success, and any non-zero value indicates an error.                                                                             |
| **backend**                | Execution environment or platform (e.g., Local, Google, AWS Batch, SLURM) where the task is run.                                                                            |
| **stderr**                 | All error messages and diagnostic output generated by the task's command, stored in a file within the task’s execution directory.                                             |
| **attempt**                | Number of times a task has been retried; 1 represents the first attempt, with higher numbers for subsequent retries.                                                          |
| **failOnStderr**           | Parameter that, when set to true, causes the task to fail if any output is written to `stderr`, treating error messages as fatal.                                            |
| **partition**              | Subset of resources allocated for running the task or call.                                                                                                                  |
| **continueOnReturnCode**   | Allows the workflow to proceed to subsequent tasks even if the current task returns a specified non-zero exit code, permitting certain failures without halting the workflow. |
| **gpus**                   | Specifies the number of GPU resources requested for the task.                                                                                                               |
| **maxRetries**             | Maximum number of times a task can be retried upon failure, allowing automated attempts to complete the task before ultimately failing the workflow.                         |
| **cpu**                    | Number of CPU resources allocated for the task.                                                                                                                              |
| **memory**                 | Amount of RAM allocated for the task.                                                                                                                                         |
| **commandLine**            | The exact command executed for a task or call, including any parameters and arguments specified in the WDL script.                                                            |
| **jobId**                  | Unique identifier assigned by the execution backend (like a cluster or cloud provider) to track and manage the specific job associated with a task or call.                  |
| **backendStatus**          | Status of a task or call on the execution backend, showing states like "Queued," "Running," or "Done."                                                                       |
| **dockerImageUsed**        | Specific Docker image utilized for running the task.                                                                                                                          |
| **workflow_id**            | Unique identifier assigned to each workflow run.                                                                                                                              |



### Workflow Description
The workflow description tab provides information of the entire workflow.

![workflow_description](/dasldemos/assets/proof_101_shiny_app_track_jobs_6.png)

| Field                             | Description                                                                                     |
|-----------------------------------|-------------------------------------------------------------------------------------------------|
| **workflowName**                  | Name of your workflow               |
| **workflowRoot**                  | The root directory of the workflow, where the workflow files and any associated resources are stored. |
| **submission**                    | The timestamp indicating when the workflow was submitted for execution.                       |
| **start**                         | The timestamp marking the beginning of the workflow execution.                                 |
| **end**                           | The timestamp when the workflow execution completed.                                          |
| **status**                        | The current state of the workflow (e.g., Completed, Running, Failed).                        |
| **workflowDuration**              | The total time taken for the workflow to execute, typically displayed in a human-readable format (e.g., minutes, hours). |
| **actualWorkflowLanguageVersion** | The version of the Workflow Description Language that the workflow adheres to.                 |
| **actualWorkflowLanguage**        | The programming or scripting language used in the workflow, usually WDL for Cromwell.        |
| **workflow_id**                  | A unique identifier assigned to the workflow run, which can be used to track or reference it in logs or reports. |
| **secondaryLabel**               | An optional label that can be used to provide additional categorization or identification for the workflow run. |
| **Label**                         | A general label for the workflow that can provide additional context or categorization.       |
| **workflowType**                  | The type of workflow being executed, which might include designations such as "AppSubmission" |
| **root**                          | Similar to `workflowRoot`, this field indicates the main directory or starting point for the workflow. |
| **option**                        | A parameter or setting that can modify the behavior of the workflow, often specified at submission time. |
| **workflowUrl**                  | A URL linking to the workflow's details or execution logs, useful for debugging or review purposes. |

### Diagram
This is a pictorial representation of you workflow to understand how different tasks are connected.

![Diagram](/dasldemos/assets/proof_101_shiny_app_track_jobs_9.png)

### Job Failures
If one or more of your tasks/calls fail this is where you will find information about what happened.
You may have to click the "Get/Refresh Failed Job Metadata" button to get a table with information about failed tasks/calls.
![Job_failures_1](/dasldemos/assets/proof_101_shiny_app_track_jobs_10.png)

You can also downlad the table on this page using the "Download Call Failure Data"

![Job_failures_2](/dasldemos/assets/proof_101_shiny_app_track_jobs_11.png)

| Field               | Description                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------|
| **callName**        | The name of the specific task/call within the workflow that failed.                       |
| **workflow_id**     | A unique identifier assigned to the workflow run    |
| **shardIndex**      | The index of the shard in the case of parallel execution, indicating which subset of data failed. |
| **attempt**         | The number of attempts made to execute the call, useful for tracking retries.                |
| **failures.message**| The error message or reason provided for the failure, giving insight into what went wrong.   |
| **workflowName**     | The name assigned to the workflow          |

### Call Caching
Call caching is a feature that allows the reuse of task outputs when the same inputs have been provided. This significantly improves efficiency by skipping redundant computations for tasks that have been previously run with identical parameters. Cached results are automatically invalidated if inputs change or if the task code is updated, ensuring that users always have access to the most current outputs.

You may have to click the "Get/Refresh Call Caching Metadata" button to get a table with information about cache information.
![Call_caching](/dasldemos/assets/proof_101_shiny_app_track_jobs_12.png)

You can also download the table on this page using the "Download Call Caching Data"

| Field                                      | Description                                                                                     |
|--------------------------------------------|-------------------------------------------------------------------------------------------------|
| **workflow_id**                            | A unique identifier assigned to the workflow run    |
| **callName**                               | The name of the specific task/call within the workflow.                                     |
| **shardIndex**                             | The index of the shard in the case of parallel execution, indicating which subset of data was processed. |
| **executionStatus**                        | The current status of the task execution (e.g., Running, Succeeded, Failed).                   |
| **workflowName**                           | The name assigned to the workflow               |
| **output.analysisReadySorted**             | The output indicating whether the analysis results are sorted and ready for further use.       |
| **callCaching.effectiveCallCachingMode**   | The mode of call caching applied to the task (e.g., ReadAndWriteCache, CallCahingOff                          |
| **callCaching.result**                     | Indicates whether the cached result was used for the task execution (e.g., Cache Hit, Cache Miss). |
| **callCaching.allowResultReuse**          | A flag indicating whether result reuse is permitted for this task.                             |
| **callCaching.hit**                        | The inputs that matched the cached results, leading to a cache hit for the task.              |
| **inputs**                                 | The inputs provided to the task for execution, which may include file paths and parameter values. |
| **returnCode**                             | The exit code returned by the task execution, indicating success (0) or failure (non-zero).   |
| **jobId**                                  | A unique identifier for the specific job or execution instance of the task.                    |
| **outputs**                                | The outputs produced by the task, which may include results, files, or other data types.      |


### Workflow Options

This tab provides configuration settings that influence the execution and management of the workflow specified by the user. Parameters such as the directory for final outputs, the maximum number of retries for tasks in case of failure, and the failure mode of the workflow (e.g., whether it should continue or abort on errors) can be provided when submitting the workflow. It also includes options for selecting the execution backend, determining whether to read from and write to the cache, and specifying the use of relative output paths. These options help optimize workflow performance, enhance fault tolerance, and manage output handling efficiently.

![Workflow_Options](/dasldemos/assets/proof_101_shiny_app_track_jobs_16.png)

| Field                             | Description                                                                                      |
|-----------------------------------|--------------------------------------------------------------------------------------------------|
| **final_workflow_outputs_dir**    | The directory where the final outputs of the workflow will be written |
| **maxRetries**                    | The maximum number of times a task will be retried in case of failure, allowing for fault tolerance in execution. |
| **workflow_failure_mode**         | Specifies the behavior of the workflow in case of failure, such as "Continue" or "Abort".      |
| **backend**                       | The execution backend used for running the workflow, such as Local, Google Cloud, or AWS.      |
| **read_from_cache**              | A flag indicating whether to read results from the cache if available, enabling faster execution by avoiding redundant calculations. |
| **use_relative_output_paths**     | A flag indicating whether to use relative paths for output files instead of absolute paths, which can aid in portability. |
| **write_to_cache**                | A flag indicating whether to write task results to cache, allowing for future reuse of outputs. |

### Workflow Inputs

This tab shows the user all the input file and their paths being used to run the workflow. This can be a handy tab especially when trying to troubleshoot errors that are caused due to input issues. 

![Workflow_Inputs](/dasldemos/assets/proof_101_shiny_app_track_jobs_14.png)

### Workflow Outputs

The Workflow Outputs tab displays the results produced by the executed workflow. It includes essential information allowing users to easily locate and access the results, thus providing a comprehensive summary of the results generated by the workflow.

![Workflow_Outputs](/dasldemos/assets/proof_101_shiny_app_track_jobs_17.png)

| Field                | Description                                                                                   |
|----------------------|-----------------------------------------------------------------------------------------------|
| **workflowName**     | The name of the workflow, which helps identify the specific workflow that produced the outputs. |
| **workflowOutputType** | The type of output generated by the workflow, which may include results, reports, or other data types. |
| **pathToOutput**     | The file path or URI where the output files are located, indicating where results can be accessed. |
| **shardIndex**       | The index of the shard for outputs generated from parallel execution, indicating which subset of data the output corresponds to. |
| **workflow_id**      | A unique identifier for the workflow run, used to track or reference the specific execution and its outputs. |


### Troubleshoot
Last, there is the Troubleshoot tab.  Here you can do things like Abort running workflows or get a complete metadata output for the entire workflow to parse yourself to try to find what's happening with your workflow if it failed running. 

![proof_101_shiny_app_troubleshoot_1](/dasldemos/assets/proof_101_shiny_app_troubleshoot_1.png)

Especially in the beginning if you have catastrophic workflow failures and you can't even figure out what's going on, you can come back to this Troubleshoot box to retrieve the entire, unformatted JSON output of all metadata Cromwell has about your workflow.  You probably are better served by the "Track Jobs" tab for checking how your workflow is going, but if there's nothing there that's helpful, then this box is where you'll want to go.  

![proof_101_shiny_app_troubleshoot_2](/dasldemos/assets/proof_101_shiny_app_troubleshoot_2.png)

![proof_101_shiny_app_troubleshoot_3](/dasldemos/assets/proof_101_shiny_app_troubleshoot_3.png)

> Note: this output is not for the faint of heart, but it will give you hints once you get used to understanding what Cromwell is telling you.  


## Quick Links

[Report and issue with PROOF](https://github.com/getwilds/proof/issues/new?template=Blank+issue) <br>
[Troubleshooting tips](https://sciwiki.fredhutch.org/dasldemos/proof-troubleshooting/) <br>
[Learn about WDL and Cromwell](https://sciwiki.fredhutch.org/compdemos/Cromwell/)<br>
[Learn how to make a WDL workflow](https://hutchdatascience.org/Developing_WDL_Workflows/)<br>
[Curated WDL Workflows](https://github.com/orgs/getwilds/repositories?q=wdl)<br>
[Data House Calls](https://calendly.com/data-house-calls/resources?back=1&month=2024-11)<br>
[Workflow slack channel](https://fhdata.slack.com/archives/CJFP1NYSZ)<br>
