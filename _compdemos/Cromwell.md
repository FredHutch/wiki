---
title: Cromwell Workflow Manager and WDL Workflows
primary_reviewers: vortexing
---
This page should get you started using using the [Cromwell workflow manager](https://cromwell.readthedocs.io/en/stable/) from the Broad as well as useful tidbits and links regarding WDL based workflows at the Fred Hutch. If you have questions about what Cromwell is, how it might help you or to get started, feel free to email Amy Paguirigan (Senior Staff Scientist), `apaguiri`.   For support or to ask questions and get help troubleshooting, please also see our #workflow-managers channel in the [FH-Data Slack workspace](https://fhdata.slack.com/).  You can get started running Cromwell at Fred Hutch using this [Data Science Lab guide](https://hutchdatascience.org/FH_WDL101_Cromwell/), and there are example workflows to get you started [in this GitHub repo](https://github.com/FredHutch/wdl-test-workflows) and the wider list of Fred Hutch WDL workflwo repo's(https://github.com/fredhutch?q=wdl&type=all&language=&sort=).

##  What Is Cromwell?
Cromwell is a software tool that can be used to coordinate and streamline the actual running of bioinformatic (or other analytic) workflows. It is the software that underlies the Broad Institute's [Terra platform](https://terra.bio/).  It's one of several tools and platforms that are able to run workflows written in the WDL language, including [miniWDL](https://miniwdl.readthedocs.io/en/latest/)from the Chan-Zuckerburg initiative, [DNANexus](https://www.dnanexus.com/), and other emerging tools.  

### Abstracting Storage and Computing Details
At the Hutch, we have many resources for data storage, software installations and high performance computing available to researchers, which themselves are evolving.  Using a workflow manager that is configured specifically to the types of data storages available at an institution can provide the benefits of "abstracting" or hiding some degree of the logistics involved with actually accessing those data for use in an analysis from the user.  

For instance, beyond data storage in our local file system, researchers now have the ability to store data in AWS S3 storage.  Accessing those data for the purposes of using them in workflows requires slightly different knowledge and mechanisms of retrieval (e.g. knowledge of how to use the AWS CLI).  By providing one configuration (or set of instructions for accessing data) for Cromwell that is tailored to what is available at the Hutch, any individual researcher can use Cromwell as an interface to their data, wherever they may be stored.  This intermediate tool then reduces the amount of time and effort on the part of the researcher in understanding the data storage flavor of the day, allowing them to focus more on their data and their analyses.

An even more valuable benefit exists for high performance computing resources.  When Cromwell is used as an intermediary, the backend configurations (or instructions for how to send jobs to HPC resources) can be defined once for all those resources currently available to Hutch users (such as our local SLURM cluster or AWS Batch for cloud computing).  This means that individual users do not have to become SLURM or AWS Batch experts in order to be able to run jobs on them.  They instead can focus on building their workflow and analyzing their results.  

### Reproducibility and Portability
Beyond the benefits of abstracting some of the institution-specific details from the analysis itself, this creates a convenient side effect.  The lack of need to tailor a workflow itself to the unique combination of data storage and computing resources, means that researchers focus their time on developing workflows using the workflow language WDL.  WDL is an open source workflow description language that one can use to describe the inputs, environments and outputs of individual tasks and how they are strung together for an analysis.  By creating workflows using tasks with these features defined, it makes these workflows far more reproducible (e.g. running a given workflow on any compute infrastructure will create results that are identical), and far more portable.  In academia where collaborations and career transitions mean potential loss of time spent tailoring analyses to various institutions' infrastructure is the name of the game, this benefit holds substantial value.  

### Software and Environments
One challenge associated with reproducibility and portability that is something often undervalued in many bioinformatic analyses, is the management of computing software and environments.  As projects evolve, they often begin in a testing phase with small datasets using readily available software or packages on a desktop computer or even potentially on a shared, remote computing resource. As they scale, it often is natural to simply do X, but Y times, all using the same computing environment of the user who originally developed the workflow.  

While this is common, it also creates headaches later. Using a workflow manager like Cromwell as a tool for deploying your analyses also means that you can begin your work directly by developing a WDL and running the tests via Cromwell. As you develop your workflow and want to scale it to an entire analysis, you can simply edit your workflow and Cromwell will keep track of all the tasks and their interrelations.

While workflows are being developed in the context of a WDL for running with Cromwell (or other WDL runners that are being developed), each task must be defined to occur in a specific environment.  That could be a user's environment on the local SLURM cluster, or that could be a clean environment with specific software packages loaded, or it could be a docker or singularity container that directly specifies the software and environment in which to run the task. 

#### EasyBuild and Lmod
One approach to making software versioning and environment management easier, and accessible to users on a shared HPC cluster like our SLURM cluster, is the use of a "module" system. We have more information in this Wiki on [managing your software environment at the Hutch](/scicomputing/compute_environments/), but to summarize here, essentially two users can load a single, defined module when they want to run a task and the versions of all the software required for that module to work will be loaded identically for either user.  That means that regardless of who is running a task, all users can load the same version of a software package to ensure that they get the same results!  For those of us here at the Hutch who have access to a [wide variety of software modules](/scicomputing/compute_scientificSoftware/) (built via [EasyBuild](https://github.com/FredHutch/easybuild-life-sciences) for us!), this is a useful and time-saving system that can very easily be leveraged using our configuration of Cromwell. 

#### Docker and Singularity
For all of those, however, who do not have access to our SLURM cluster and all those magic software modules, our workflows are not directly portable or shareable. For that scenario, a containerization approach like using [Docker](/scicomputing/compute_environments/#docker-containers) would be more appropriate. What this looks like in the context of workflows is that every task described in a workflow is given as a runtime variable, a Docker container name and tag, which specifies the exact container to run the task inside that will have all the software required for the task to be performed. In the case of workflows running on our local SLURM cluster, Cromwell is configured to use Singularity in order to pull and convert Docker images prior to running the task. Meanwhile, on cloud based backends like AWS Batch, it means that the Docker containers can be pulled and used without conversion. Designing workflows to use publicly available Docker containers provides a substantial improvement in the likelihood that another user or collaborator would be able to run your workflow, reproducibly, on our or their own HPC resources.
  


### Bells and Whistles of Workflow Managers
Beyond the issues associated with reproducibility and the burden of institution-specific computing knowledge, using a workflow manager like Cromwell has a number of other advantages that can make your work much faster, more efficient and scalable. 

#### Call Caching and Workflow Restarts
Call caching is a major strength of workflow managers and essentially is a function performed by the workflow manager software that identifies, for a given task, what the inputs, task instructions and expected outputs are, and queries it's database to determine if that exact combination has been successfully done previously.  In the event that an exact match is found, then the workflow manager finds the output of the previously run task and immediately moves forward in the workflow, avoiding re-computing that output.  

This is a valuable benefit because often when a complex or highly parallel workflow is run, there may be a variety of individual task failures due to problems that aren't in the code itself but rather things like internet connectivity problems or other intermittent problems.  Workflow managers can manage both the direct resubmission of individual failed tasks that failed due to HPC resource failures, as well as allow the user to restart an entire workflow should a task fail.  This means that work can be done more efficiently even if individual tasks fail, because when the user might provide a fix or even directly resubmit a workflow, only the tasks that were impacted will be re-run, not those that completed successfully.  

#### Using `Scratch` Space
A real strength of using workflow managers is that your need to retain and archive large amounts of intermediate data involved in a workflow is substantially reduced and thus your data management and storage burdens are as well.  During your customization of your Cromwell server via our configuration, you can specify a location in `/fh/scratch` as your working directory for all your Cromwell workflows.  You can read more about `Scratch` storage at the Hutch [here.](/scicomputing/store_scratch/)  Cromwell will then create unique workflow- and task-level directories in that location for all of the input staging and task results.  Then, on a workflow-by-workflow level OR at the Cromwell server level, you can specify a location elsewhere (like in `Fast` or somewhere more long term) to store only the final workflow outputs specified. 

In AWS, this is slightly different, but users specify prefixes in their [AWS S3 bucket](/scicomputing/store_objectstore/#economy-cloud-s3) where they want intermediate files to be saved, and then a prefix where they want their final outputs to go.  This allows us to then either manually or automatically (via help from `scicomp`), remove the intermediate files from S3 by deleting just a single prefix.  

That allows users to use temporary, inexpensive storage for the workings of Cromwell, and then store their input data and their results in more long term storage.  This is critical for workflows that generate large amounts of intermediate data, which is commonly the case in genomics work. A workflow may produce 1-2TB of intermediate data, but the user may only want 500G of that data as their "final" outputs.  By being able to re-generate exactly any necessary intermediate file of a workflow, the need to retain and organize these data long term is eliminated.  


## Using Cromwell
In general, Cromwell works best when run in server mode, which means that users run a Cromwell server as a job on our local SLURM cluster that can connect to a database specifically for Cromwell workflow tracking.  This Cromwell server job then behaves as the workflow coordinator for that user, allowing a user to send workflow instructions for multiple workflows running simultaneously.  The Cromwell server will then parse these workflow instructions, find and copy the relevant input files, send the tasks to either `Gizmo` or AWS Batch to be processed, coordinate the results of those tasks and record all of the metadata about what is happening in its database.  

This means that individual users can:
- run multiple independent workflows at the same time using one Cromwell server,
- use cached results when identical to the current task,
- track the status of workflows and tasks via multiple methods while they are running,
- customize the locations of input data, intermediate data, and workflow outputs to data storage resources appropriate to the data type (re: cost, backup and accessibility),
- query the Cromwell database for information about workflows run in the past, including where their workflow outputs were saved or a variety of other workflow and task level metadata.  

### Writing Workflows
The Workflow Description Language, or WDL, is intended to be a relatively easy to read workflow language.  There are other workflow languages and workflow managers that run them, but WDL was/is primarily intended to be shared and interpreted by others that may or may not have experience with any given domain-specific language (like Nextflow).  Writing workflows in WDL, therefore, has a fairly low barrier to entry for those of us new to writing workflows.  The specification of the language is actually open source itself, and more about the language can be [found at the OpenWDL site](https://openwdl.org/).  

>From OpenWDL:  The Workflow Description Language (WDL) is a way to specify data processing workflows with a human-readable and -writeable syntax. WDL makes it straightforward to define analysis tasks, chain them together in workflows, and parallelize their execution. The language makes common patterns simple to express, while also admitting uncommon or complicated behavior; and strives to achieve portability not only across execution platforms, but also different types of users. Whether one is an analyst, a programmer, an operator of a production system, or any other sort of user, WDL should be accessible and understandable.

The basics of this workflow language includes a similar pattern where you specify workflow inputs, the order of tasks and how they pass data between them, and which files are the outputs of the workflow itself.  Then tasks are constructed in the same WDL file  by naming them and providing similar information.  Here's an example of a task that runs `bwa mem` on an interleaved fastq file using a Fred Hutch docker container.  Notice there are sections for the relevant portions of the task, such as `input` (what files or variables are needed), `command` (or what it should run), `output` (which of the generated files is considered the output of the task), and `runtime` (such as what HPC resources and software should be used for this task).  

```
task BwaMem {
  input {
    File input_fastq
    String base_file_name
    File ref_fasta
    File ref_fasta_index
    File ref_dict
    File ref_alt
    File ref_amb
    File ref_ann
    File ref_bwt
    File ref_pac
    File ref_sa
  }
  command {

    bwa mem \
      -p -v 3 -t 16 -M \
      ${ref_fasta} ${input_fastq} > ${base_file_name}.sam 
    samtools view -1bS -@ 15 -o ${base_file_name}.aligned.bam ${base_file_name}.sam
  }
  output {
    File output_bam = "${base_file_name}.aligned.bam"
  }
  runtime {
    memory: "32 GB"
    cpu: 16
    docker: "fredhutch/bwa:0.7.17"
  }
}
```


You can find additional WDL documentation in the wild at the [WDL-docs site](https://wdl-docs.readthedocs.io/en/stable/) and the Data Science Lab's [future WDL 102 class that is under devleopment](https://hutchdatascience.org/FH_WDL102_Workflows/).

### Submitting and Monitoring Workflows
The real strength of Cromwell in particular, as a workflow manager, is that baked into the tool is the ability to interact with the server via an API.  That means that the language of the server is defined and that you can talk to it via anything that can speak that language.  At the Hutch we currently have three ways to interact with Cromwell servers:
- Via a web browser using a Swagger UI created by the Cromwell server itself (basically a website you go to that interfaces directly with the Cromwell server API),
- Via a web based Shiny app available on campus only at [cromwellapp.fredhutch.org](https://cromwellapp.fredhutch.org/) that was put together by Amy Paguirigan, a researcher at the Hutch,
- Via a basic R package that wraps the various commands in R code and parses the responses from the server into data frames, called [fh.wdlR](https://github.com/FredHutch/fh.wdlR), also developed by Amy Paguirigan.  

The ability to send your workflows, regardless of whether they will be using local or cloud based data, or will involve SLURM or AWS Batch based computing resources via one common, very simple method makes your work far more efficient. 

### Workflow Sharing and Publishing
If you are ok with sharing your workflow for use by others in our community or you would like to get some help making your workflow work, please put your workflow into a GitHub repo in the Fred Hutch organization, with one workflow per repo, the above file structure for workflow, inputs and batch, and a quick README.md explaining what the workflow does, what inputs are needed, what assumptions are made.
> Note:  In the title of the GitHub repo, please include `-wdl` so that others can more easily find your repo and so it will show up in our Fred Hutch Project listing.
If you make your GitHub repository public, then that repository can be directly used as part of a publication of your results, allowing you to share the exact workflow run publicly.  

## Cromwell Resources at Fred Hutch

To run your own Cromwell server at the Fred Hutch, a variety of possible configurations tailored to the specific resources at Fred Hutch have been created.  You can get started running Cromwell at Fred Hutch using this [Data Science Lab guide: WDL 101](https://hutchdatascience.org/FH_WDL101_Cromwell/), and there are example workflows to get you started [in this GitHub repo](https://github.com/FredHutch/wdl-test-workflows) and the wider list of Fred Hutch WDL workflwo repo's(https://github.com/fredhutch?q=wdl&type=all&language=&sort=). There is also an associated R package called [fh.wdlR](https://github.com/FredHutch/fh.wdlR) should you want to interact with your server primarily from your desktop R/RStudio.  

Other public GitHub repositories containing WDL or Cromwell related content at the Fred Hutch can be found [via this link to search results](https://github.com/FredHutch?utf8=%E2%9C%93&q=wdl+OR+cromwell&type=&language=) and also the [Fred Hutch Workflow Manager GitHub Project](https://github.com/orgs/FredHutch/projects/8) is a resource that is intended to be a collection of links for either of the two Fred Hutch workflow managers that Sam Minot and Amy Paguirigan will be maintaining.  

Beyond the basic workflows for testing included in the [WDL test workflow repo](https://github.com/FredHutch/wdl-test-workflows), there is an example [unpaired variant calling workflow](https://github.com/FredHutch/tg-wdl-unpairedVariantCaller) that can be run by Fred Hutch users on campus that has example data linked via the inputs json file. This should be runnable by anyone at the Hutch, but alas, if that is not the case, please file an issue on that repo or email Amy Paguirigan. 


More to come!  Contact Amy Paguirigan (`apaguiri`) for more information about using Cromwell at Fred Hutch.  For more support or to ask questions and get help troubleshooting, please see our #workflow-manager channel in the [FH Data Slack workspace](https://fhdata.slack.com/).




## Other Fred Hutch based resources


### Docker Hub 
If you are using Cromwell with containers, there some Docker containers suitable for using with a workflow manager in the [Fred Hutch DockerHub](https://hub.docker.com/u/fredhutch). Ideally we'll continue to grow that resource as more containers are requested by users.  


## Additional WDL Resources

These plugins help when you are editing your workflow in Atom or VS Code by color coding and finding errors:
- [WDL Viewer Package](https://atom.io/packages/atom-wdl-viewer) for Atom
- [WDL Syntax Highlighter](https://marketplace.visualstudio.com/items?itemName=broadinstitute.wdl) for VS Code

These relate to the WDL workflow language itself and example workflows to start from:
- The OpenWDL [learn WDL GitHub repo](https://github.com/openwdl/learn-wdl)
- [Open WDL](https://github.com/openwdl/wdl) for more about development of WDL as a standard
- [bioWDL](https://biowdl.github.io/) for template workflows relating to bioinformatics/sequencing analysis
- The OpenWDL [WDL 1.0 specification site](https://github.com/openwdl/wdl/blob/master/versions/1.0/SPEC.md)
- Dave Tang's [Blog post](https://davetang.org/muse/2020/01/09/learning-wdl/) for learning WDL.  

These are more Cromwell/Broad oriented instructions and resources:
- Cromwell [GitHub Repo](https://github.com/broadinstitute/cromwell)
- Some basic Broad [WDL Tutorials](https://support.terra.bio/hc/en-us/sections/360007347652?name=wdl-tutorials)
[GATK Workflows](https://github.com/gatk-workflows?language=wdl)
- The [Terra support forum WDL section](https://support.terra.bio/hc/en-us/sections/360007274612)
