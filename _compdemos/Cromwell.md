---
title: Cromwell Workflow Manager and WDL Workflows
primary_reviewers: vortexing
---
This page will house our Fred Hutch knowledge-base for setting up and using the [Cromwell workflow manager](https://cromwell.readthedocs.io/en/stable/) from the Broad as well as useful tidbits and links regarding WDL based workflows. If you have questions about what Cromwell is, how it might help you or to get started, feel free to email Amy Paguirigan (Senior Staff Scientist in CRD), `apaguiri`.  

For now, relevant GitHub resources for setting up and running your own Cromwell server on our local cluster can be found in the [DIY-cromwell-server repo](https://github.com/FredHutch/diy-cromwell-server) and the associated R package called [fh.wdlR](https://github.com/FredHutch/fh.wdlR) should you want to interact with your server primarily from your desktop R/RStudio.  The [readme](https://github.com/FredHutch/diy-cromwell-server) in the DIY repo is currently the most up to date set of instructions for setting up Cromwell at the Fred Hutch.

Other public GitHub repositories containing WDL or Cromwell related content at the Fred Hutch can be found [via this link to search results](https://github.com/FredHutch?utf8=%E2%9C%93&q=wdl+OR+cromwell&type=&language=)and also the [Fred Hutch Workflow Manager GitHub Project](https://github.com/orgs/FredHutch/projects/8) is a resource that is intended to be a collection of links for either of the two Fred Hutch workflow managers that Sam Minot and Amy Paguirigan will be maintaining.  

Beyond the basic workflows for testing included in the [DIY-cromwell-server repo](https://github.com/FredHutch/diy-cromwell-server), there is an example [unpaired variant calling workflow](https://github.com/FredHutch/tg-wdl-unpairedVariantCaller) that can be run by Fred Hutch users on campus that has example data linked via the inputs json file. This should be runnable by anyone at the Hutch, but alas, if that is not the case, please file an issue on that repo or email Amy Paguirigan. 


More to come!  Contact Amy Paguirigan (`apaguiri`) for more information about using Cromwell at Fred Hutch.  Join the discussion in The Coop Slack in the [#cromwell-wdl channel](https://fhbig.slack.com/archives/CTFU13URJ).  


## Design Recommendations for WDL workflows at Fred Hutch
In order to improve sharability and also leverage the R package, as well as future UI based submission tools being developed, we recommend you structure your WDL based workflows with the following input files:

1.  Workflow Description file:  [Example here](/batchFileScatter/batchFileScatter.wdl)
  - in WDL, a list of tools to be run in a sequence, likely several, otherwise using a workflow manager is not the right approach.  
  - This file describes the process that is desired to occur every time the workflow is run.
2.  Parameters file: [Example here](/batchFileScatter/batchFileScatter-params.json)
  - in json, a workflow-specific list of inputs and parameters that are intended to be set for every group of workflow executions.
  - Examples of what this input may include would be which genome to map to, reference data files to use, what environment modules to use, etc.
3.  Batch file:  [Example here](/batchFileScatter/batchFileScatter-batch.json)
  - in csv or tsv, a batch-specific list of the raw input data sets intended to be processed using the same set of inputs/parameters for the same workflow, WITH HEADERS!!
  - This file is a list of data locations and any other sample/job-specific information the workflow needs.  Ideally this would be relatively minimal so that the consistency of the analysis between input data sets are as similar as possible to leverage the strengths of a reproducible workflow.  
4.  Workflow options (OPTIONAL): [Example here](workflow-options.json)

Example:

```
  {
    "workflow_failure_mode": "NoNewCalls",
    "default_runtime_attributes": {
        "maxRetries": 1
    },
    "write_to_cache": true,
    "read_from_cache": true
}
```

Workflow options can be applied to any workflow to tune how the individual instance of the workflow should behave. There are more options than these that can be found in the Cromwell docs site, but of most interest are the following parameters:

- `workflow_failure_mode`: `NoNewCalls` indicates that if one task fails, no new calls will be sent and all existing calls will be allowed to finish.  `ContinueWhilePossible` indicates that even if one task fails, all other task series should be continued until all possible jobs are completed either successfully or not.
- `default_runtime_attributes.maxRetries`: The maximum number of times a job can be retried if it fails in a way that is considered a retryable failure (like if a job gets dumped or the server goes down).
- `write_to_cache`: Do you want to write metadata about this workflow to the database to allow for future use of the cached files it might create?
- `read_from_cache`: Do you want to query the database to determine if portions of this workflow have already completed successfully, thus they do not need to be re-computed. 

## Workflow Publishing
If you are ok with sharing your workflow for use by others in our community or you would like to get some help making your workflow work, please put your workflow into a GitHub repo in the Fred Hutch organization, with one workflow per repo, the above file structure for workflow, inputs and batch, and a quick README.md explaining what the workflow does, what inputs are needed, what assumptions are made.
> Note:  In the title of the GitHub repo, please include `-wdl` (or `-cwl`) so that others can more easily find your repo and so it will show up in our Fred Hutch Project listing.


## Other Fred Hutch based resources

### Reference Data in S3
While additional development is going on to make Cromwell work better in AWS (currently it works well in Google and SLURM among other backends), we are anticipating that it will be more widely available for use with AWS based computing.  To support that there is a growing public data set AWS S3 bucket at `fh-ctr-public-reference-data`.  Contact Amy Paguirigan or Sam Minot if you'd like something to be added here and we can help you do that.  

### Docker Hub 
If you are using Cromwell with AWS (currently still in beta), there are some Docker containers suitable for using with a workflow manager in the [Fred Hutch DockerHub](https://hub.docker.com/u/fredhutch). 
