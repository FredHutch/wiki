---
title: How to Use PROOF
---

This guide is intended to describe how to use the [**PROOF** app](https://proof.fredhutch.org) (**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility) to run [**WDL**](https://sciwiki.fredhutch.org/compdemos/Cromwell/#writing-workflows) workflows on the [**Fred Hutch cluster**](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/). Learn more about PROOF on its [SciWiki product page](https://sciwiki.fredhutch.org/datascience/proof/), read through our [quick-start guide](https://hutchdatascience.org/Developing_WDL_Workflows/) to building a WDL workflow, and check out our pre-built [WILDS WDL workflows](https://github.com/getwilds?q=ww-&type=all&language=&sort=) for ready-to-submit bioinformatic pipelines.





## Using PROOF
The following diagram shows basic usage of PROOF once you have done the preliminary setup. Each box corresponds to a section in the documentation.

![](/dasldemos/assets/proof_101_workflow.png) 





### Before you begin
Before you begin using PROOF, make sure you have the following:
- [Valid Fred Hutch credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
- Access to the Fred Hutch network
    - If on-campus, make sure you are connected to the Fred Hutch network.
    - If off-campus, make sure you connect via [VPN](https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn).
- [Access to the rhino cluster of Fred Hutch](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#accessing-slurm-clusters)
- [AWS credentials (if you have files stored on S3 that are required to run your workflows)](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)





### Log in to PROOF

The first step in the process is to login by clicking the green **PROOF Login** button.

![login](/dasldemos/assets/proof_101_shinyapp_proof_login.png) 

When you click "PROOF Login", a pop-up will appear where you need to input your Hutch credentials and then click submit.

![login_popup](/dasldemos/assets/proof_101_shinyapp_proof_login_2.png)

You'll know you are logged in when the page refreshes automatically and a red logout button appears in the top right corner.

![login_2](/dasldemos/assets/proof_101_shinyapp_loggedin.png)



### Setup your PROOF server

**Starting a PROOF server**

Next, click on "Server" to take you to the page where you can start a server.

![start_server](/dasldemos/assets/proof_101_shinyapp_start_server.png)

Click "Start a PROOF Server" to open up a dialog box that asks for optional information to start your PROOF Server.

![start_server_2](/dasldemos/assets/proof_101_shinyapp_start_server_2.png)

The majority of people are only authorized to work under one SLURM account (working under one PI = one SLURM account). In this case, just hit start and the Cromwell configuration will default to the SLURM account you are authorized under.

However, if you have more than one SLURM account that you can work under, then here is your chance to enter the most appropriate one. For example, you could be authorized to do work under two PI's with SLURM accounts "pi_a" and "pi_b". If the current workflow you want to submit is for "pi_b", enter "pi_b" where it asks for SLURM account.

![start_server_3](/dasldemos/assets/proof_101_shinyapp_start_server_3.png)

You know your server is up and running when the page auto-refreshes, the "Start" button grays out, and information about your server populates below. 

![start_server_4](/dasldemos/assets/proof_101_shinyapp_start_server_4.png)

> Initially, setting up a PROOF Server may take a few minutes as it configures the database and performs background tasks. Once it's ready to receive workflows, it will begin listening for instructions via the Shiny app or other methods (discussed later). Please allow 2-3 minutes for setup the first time; subsequent setups will be faster, typically around 1 minute.

There will be two sections of server information populated with relevant details. These details may take a moment to appear on the page, even if your server is already running.

**Server information**
- Job status: should say "RUNNING"
- Workflow log directory: path where your workflow logs will be saved
- Scratch directory: path where your intermediate workflow data will be saved (`/hpc/temp/` by default)
- Server-time: how long your PROOF Server will be "alive" (set to 7 days by default)
- SLURM job account: SLURM account (default/or if specified) under which your jobs should be running 

**Troubleshooting**
- SLURM job ID: PROOF server job ID that can be used to cancel your PROOF server through `rhino`
- Cromwell directory: path of your main Cromwell directory 
- Server log directory: path where logs associated with the PROOF server will be saved
- Singularity cache directory: path where Singularity/Apptainer/Docker images will be saved for caching purposes
- Use AWS?: This option is not currently available but may be in future.
- Cromwell URL: URL for PROOF server

Once your server is ready for use, you should receive an email from PROOF API like the one shown below:
![email](/dasldemos/assets/proof_101_shinyapp_email.png)

**Stopping a PROOF server**

Finally, if your workflow has finished running and you're done with your server before its 7-day lifespan, you can stop your PROOF server manually. Note that your _analyses_ submitted by the server can run for longer than 7 days, it is only the PROOF server that will stop. At the bottom of the PROOF server tab, click "Stop a PROOF Server":

![proof_101_shiny_app_delete_server_1](/dasldemos/assets/proof_101_shiny_app_delete_server_1.png)

A pop-up box will show up and ask you to confirm that you would like to stop your server as this action cannot be undone, but you can always start up a new server anytime!

![proof_101_shiny_app_delete_server_2](/dasldemos/assets/proof_101_shiny_app_delete_server_2.png)






### Validate a WDL workflow

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





### Submit a WDL workflow run

Congratulations! At this point, you should have a validated WDL workflow and you are ready to submit your job. First, click on the "Submit" tab on the top menu bar to open up the "Submit a Workflow" page:

![proof_101_shiny_app_submit_2](/dasldemos/assets/proof_101_shiny_app_submit_2.png)

Here you can upload your WDL workflow and its associated input/options JSON files. If desired, you can also add a primary and secondary workflow label to easily track your workflows (e.g., compare versions or batches). If you do not add a primary label, PROOF will autopopulate a label upon submission with an adjective and animal (e.g., "InquisitivePenguin").

> Note: As you upload your files look for the blue uploading progress bar below the upload box. If you need to add files different from the ones uploaded, click the "Reset" button. This will clear **all** the upload fields allowing you to upload a new set of files. 

Once everything is uploaded, click the "Submit Workflow" button. When your submission is done, you will see a confirmation and workflow ID appear below the submit button on the form. Depending on your window size, you may need to scroll down. 

![proof_101_shiny_app_submit_3](/dasldemos/assets/proof_101_shiny_app_submit_3.png)

The workflow ID is a long string of letters and numbers. This string is unique to an individual workflow run, so if you run the same workflow a second time, you'll get a different string. This means that this unique identifier string can be used to help understand the data source file(s) used to generate each set of results files, helping make your work reproducible.

> Note: You don't need to copy this workflow ID, it will appear on the 'Track Workflows' screen along with the workflow name and label(s).





### Track WDL workflow runs
Once you've submitted a workflow, you can track the status of your submitted workflow runs using the "Track Jobs" tab:

![proof_101_shiny_app_track_jobs_1](/dasldemos/assets/proof_101_shiny_app_track_jobs_1.png)

**Filter submitted jobs you want to track**

In the "Workflow Runs" table, you can filter your jobs three different ways: 

1. Submission date range
2. Workflow name provided in the WDL script
3. Job status

> Note: You can use all these three options in succession. For example, you can display as many days of workflow history as you'd like, filter that result for workflows with a specific name or with specific status(es) like 'failed', 'succeeded', etc. This can help if you have submitted a LOT of workflows and you don't want to see them all, or if the PROOF server is still busy working through all of your submissions and recording their status.

Once you are done filtering down to your choices and click "Update View", the relevant workflows will be returned and you'll see a comprehensive list of details about those workflows. Initially, this filtering is likely not needed, however as you submit more analyses via PROOF (potentially at the same time), you'll eventually want to filter results to track specific work over time.

![proof_101_shiny_app_track_jobs_2](/dasldemos/assets/proof_101_shiny_app_track_jobs_2.png)

Next to "Workflow Runs", you will also see a tab for "Workflow Timing" which displays a graph containing timing information along with workflow outcomes (Graph legend = "Status"). The x-axis shows how long it took to run a particular workflow and the y-axis shows workflow name (from a potentially filtered list of workflows).

![proof_101_shiny_app_track_jobs_4](/dasldemos/assets/proof_101_shiny_app_track_jobs_4.png)

### Abort a WDL workflow run

Sometimes, due to unforeseen circumstances, you might realize you want to prematurely stop a workflow. On the far right of each entry in the "Workflow Runs" table, you'll notice an "Abort Workflow" button. To cancel a specific workflow run, simply click the corresponding "Abort Workflow" button and it should update to "Workflow aborted!" upon successful cancellation.

![proof_101_shiny_app_abort_1](/dasldemos/assets/proof_101_shiny_app_abort_1.png)

> Note: it will take Cromwell some time to coordinate SLURM job cancellations particularly for complex workflows, but it will clean everything up for you. 


### Get workflow run details
On the "Track workflows" page, you'll notice that each entry has a "**Workflow Details**" button just above the "Abort Workflow" button. If you have a particular workflow run of interest that you'd like a detailed status report on, click on the corresponding "Workflow Details" button to dig into the details of the jobs within the workflow of your interest. 

![view_workflow_details](/dasldemos/assets/proof_101_shiny_app_track_jobs_5.png)

On this page, you'll notice nine sub-tabs containing different kinds of metadata about the workflow run of interest:

![workflow_details_job_list](/dasldemos/assets/proof_101_shiny_app_track_jobs_7.png)

**Job List**

The first page upon clicking "Workflow Details" will be the **Job List** page (see screenshot above). This provides a wealth of details about each task within the workflow, things like status, duration, working directory, software environment, CPU/memory usage, and logfile locations. You can download the entire table shown here by clicking the **Download Workflows Jobs Data** button. You can also adjust the number of entries to view in a given page by adjusting the "Show ____ entries" dropdown.


<!-- | **Field**                  | **Description**                                                                                                                                                                |
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
| **workflow_id**            | Unique identifier assigned to each workflow run.                                                                                                                              | -->



**Workflow Description**

The workflow description tab provides summary details of the overarching workflow run, such as status, duration, workflow ID, and user-provided labels.

![workflow_description](/dasldemos/assets/proof_101_shiny_app_track_jobs_6.png)

<!-- | Field                             | Description                                                                                     |
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
| **workflowUrl**                  | A URL linking to the workflow's details or execution logs, useful for debugging or review purposes. | -->

**Diagram**

This tab produces a pictorial representation of you workflow to understand how different tasks are connected.

> Note: currently, this visualization tool does not support "Object" datatypes, which were rendered obsolete in WDL v1.1+.

![Diagram](/dasldemos/assets/proof_101_shiny_app_track_jobs_9.png)

**Job Failures**

If one or more of your tasks fail, this tab is where you will find information about what may have happened. To populate the table with failure metadata, click the "Get/Refresh Failed Job Metadata" button. You can also download the table on this page using the "Download Call Failure Data".

![Job_failures_2](/dasldemos/assets/proof_101_shiny_app_track_jobs_11.png)

<!-- | Field               | Description                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------|
| **callName**        | The name of the specific task/call within the workflow that failed.                       |
| **workflow_id**     | A unique identifier assigned to the workflow run    |
| **shardIndex**      | The index of the shard in the case of parallel execution, indicating which subset of data failed. |
| **attempt**         | The number of attempts made to execute the call, useful for tracking retries.                |
| **failures.message**| The error message or reason provided for the failure, giving insight into what went wrong.   |
| **workflowName**     | The name assigned to the workflow          | -->

**Call Caching**

Call caching is a feature that allows the reuse of task outputs when the same inputs and commands have been provided. This significantly improves efficiency by skipping redundant computations for tasks that have been previously run with identical parameters. Cached results are automatically invalidated if inputs change or if the task code is updated, ensuring that users always have access to the most current outputs. To populate the table with caching metadata, click the "Get/Refresh Call Caching Metadata" button. You can also download the table on this page using the "Download Call Caching Data".

![Call_caching](/dasldemos/assets/proof_101_shiny_app_track_jobs_12.png)

<!-- | Field                                      | Description                                                                                     |
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
| **outputs**                                | The outputs produced by the task, which may include results, files, or other data types.      | -->


**Workflow Options**

This tab provides configuration settings that influence the execution and management of the workflow specified by the user. Parameters such as the directory for final outputs, the maximum number of retries for tasks in case of failure, and the failure mode of the workflow (e.g., whether it should continue or abort on errors) can be provided when submitting the workflow. It also includes options for selecting the execution backend, determining whether to read from and write to the cache, and specifying the use of relative output paths. These options help optimize workflow performance, enhance fault tolerance, and manage output handling efficiently.

![Workflow_Options](/dasldemos/assets/proof_101_shiny_app_track_jobs_16.png)

<!-- | Field                             | Description                                                                                      |
|-----------------------------------|--------------------------------------------------------------------------------------------------|
| **final_workflow_outputs_dir**    | The directory where the final outputs of the workflow will be written |
| **maxRetries**                    | The maximum number of times a task will be retried in case of failure, allowing for fault tolerance in execution. |
| **workflow_failure_mode**         | Specifies the behavior of the workflow in case of failure, such as "Continue" or "Abort".      |
| **backend**                       | The execution backend used for running the workflow, such as Local, Google Cloud, or AWS.      |
| **read_from_cache**              | A flag indicating whether to read results from the cache if available, enabling faster execution by avoiding redundant calculations. |
| **use_relative_output_paths**     | A flag indicating whether to use relative paths for output files instead of absolute paths, which can aid in portability. |
| **write_to_cache**                | A flag indicating whether to write task results to cache, allowing for future reuse of outputs. | -->

**Workflow Inputs**

This tab shows the user the specific input json file that was used for the workflow run in question. This can be a handy tab especially when trying to troubleshoot errors that are caused due to input issues.

![Workflow_Inputs](/dasldemos/assets/proof_101_shiny_app_track_jobs_14.png)

**Workflow Outputs**

This tab displays the results produced by the executed workflow and where they were saved to. It includes essential information allowing users to easily locate and access the results, thus providing a comprehensive summary of the results generated by the workflow.

![Workflow_Outputs](/dasldemos/assets/proof_101_shiny_app_track_jobs_17.png)

<!-- | Field                | Description                                                                                   |
|----------------------|-----------------------------------------------------------------------------------------------|
| **workflowName**     | The name of the workflow, which helps identify the specific workflow that produced the outputs. |
| **workflowOutputType** | The type of output generated by the workflow, which may include results, reports, or other data types. |
| **pathToOutput**     | The file path or URI where the output files are located, indicating where results can be accessed. |
| **shardIndex**       | The index of the shard for outputs generated from parallel execution, indicating which subset of data the output corresponds to. |
| **workflow_id**      | A unique identifier for the workflow run, used to track or reference the specific execution and its outputs. | -->


**Troubleshoot**

Lastly, there is the "Troubleshoot" tab. Here you can access a complete metadata output for the mechanics of the WDL workflow itself, i.e. not the commands within the tasks themselves but rather the connections between tasks. For instance, if the output from one task is improperly linked to the input of the next task, or if the workflow can't find one of the inputs you provided, this is the most likely place where you'll find that error message.

![proof_101_shiny_app_troubleshoot_1](/dasldemos/assets/proof_101_shiny_app_troubleshoot_1.png)

Especially in the beginning, if you have catastrophic workflow failures and you can't even figure out what's going on, you can come to this Troubleshoot box to retrieve the entire, unformatted JSON output of all metadata that Cromwell has about your workflow. For more details on how to use this troubleshooting tool, check out our [PROOF Troubleshooting documentation](/dasldemos/proof-troubleshooting/#validate-your-workflow).

## Resources and Help

### PROOF "Help" Tab

![proof_101_shiny_app_help](/dasldemos/assets/proof_101_shiny_app_help.png)

![proof_101_shiny_app_help2](/dasldemos/assets/proof_101_shiny_app_help2.png)

### Useful Courses & Documentation

**Cluster computing**
- [How to Rhino](https://sciwiki.fredhutch.org/compdemos/howtoRhino/)
- [Cluster 101](https://leanpub.com/courses/fredhutch/fredhutchcluster101)

**Building WDL workflows**
- [Developing WDL Workflows](https://hutchdatascience.org/Developing_WDL_Workflows/)
- [Open WDL Documentation](https://docs.openwdl.org/en/latest/)

**Additional PROOF documentation**
- [PROOF GitHub Repository](https://github.com/getwilds/proof)
- [PROOF Troubleshooting](/dasldemos/proof-troubleshooting)

### Contact Us
We would love to get feedback on this document from the community and would love to hear how we can make improvements to make this more helpful to you! Feel free to [email](mailto:wilds@fredhutch.org) us or directly make recommendations on [GitHub](https://github.com/FredHutch/wiki/). Or if you'd like to talk through things face-to-face, schedule a [Data House Call](https://calendly.com/data-house-calls/resources) with us! 


