---
title: Overview of Fred Hutch Computing Platforms for Bioinformatics
last_modified_at: 2018-06-06
---

Sometimes the most basic question for computational analysis is "what computer can
I use to run my code?" In this section we briefly describe a range of options, all
the way from a single laptop to the FH on prem cluster (`gizmo`), to various "cloud"
options, with a brief description and links for further onramping materials.

Raw data, whether from an array or sequencing for example, are not interpretable results, but typically require some degree of processing. The nature of the processing depends on the data type, the platform upon which the data was made, and the biological question being asked of the data set.  How this process is performed depends on the specific project, but support and resources for this process are available at the Fred Hutch for a variety of needs.  

### Desktop computing platforms
While most bioinformatic analysis of Genomics data will likely require more compute resources than are typically available in a desktop computer around campus, some smaller compute jobs can be done on a desktop or laptop.  For these smaller compute jobs, scientific computing languages [R](https://www.r-project.org)or [Python](https://www.python.org) may be useful. You can obtain assistance in installing a copy of R and RStudio on PC's through the Center IT desktop software resource.  Macs come with an installation of Python 2 that is used by the operating system and can be accessed by using the Terminal application.  Also, the installation of a commonly used Python and R package management system called Conda can be done on either PCs or Macs and more information about Anaconda and Miniconda (two versions of the Python oriented version of Conda package manager) can be found [here.](https://conda.io/docs/glossary.html#anaconda)

---
### Interactive Computing:  Easy Access, Moderate Capability
These systems are provided by the Fred Hutch to serve the community with the intention of:
1. being immediately accessible by everyone, regardless of skill set,
2. allow for interactive development of code and/or approaches to analyses, and
3. are supported by compute resources larger than a typical desktop computer.

 These systems are best used for situations such as training of new users in development of R or python code or curation of Galaxy-style workflows that need connectivity to our local filesystem in a way not accessible via the [public instance of Galaxy.](https://usegalaxy.org/)  These systems also provide compute resources that serve as a step above a typical desktop computer, thus are good systems for slightly more compute-intensive jobs that still require interactivity.  Each is a managed resource with actively managed packages/modules/tools depending on the system, and thus work well for fairly standard platforms for interactive computing that does not require highly specialized software components.  Additionally, these systems may not be appropriate for analyses that require a higher level of data security, please contact FH username **scicomp** to inquire.


Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage | Documentation Link Out
--- | --- | --- | --- | ---
[RStudio Server](http://rstudio.fhcrc.org) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast | -
[Fred Hutch Galaxy Instance](http://galaxy.fredhutch.org/)| web, platform-specific credentials | Matsen Group (Brian Claywell) | Limited to staged data | -
[JupyterHub](https://jupyterhub.fhcrc.org/) | web, FH credentials, no setup required | Center IT | Native to python, default access to /fh/fast | -

#### Meet Rhino (technically all the Rhinos)
The specific resources listed below are actually not stand alone systems like the above section; instead, they are all based on the Rhino platform supported by Center IT.  Rhino, or more specifically the Rhinos are the locally managed HPC resources that are actually four different Rhino servers. Together, they function as a data and compute hub for a variety of data storage resources and high performance computing.  The specific guidance for the use of each of the approaches to HPC access are slightly different, but will all require the user to learn how to access and interact with Rhino.  Any user interacting with the following systems will be dependent on being proficient with the care and keeping of the Rhinos.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage | Documentation Link Out
--- | --- | --- | --- | ---
Rhino | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types | [SciComp Wiki - Rhino]
NoMachine/Linux Session Servers | CLI, FH credentials on campus/VPN off campus | Scientific Computing | Direct to all local storage types |  [SciComp Wiki - Linux Servers](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Using%20the%20Linux%20Session%20Servers.aspx)
Python/Jupyter Notebooks | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types | [SciComp Wiki- Jupyter Notebooks]
R/R Studio | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types | [SciComp Wiki - RStudio]


### Interactive Computing: Command Line Interface (CLI), Moderate to High Capability
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.  Often reasons to move to these HPC resources include the need for version controlled, specialized package/module/tool configurations, higher compute resource needs, or rapid access to large data sets in data storage locations not accessible with the required security for the data type by the above systems.  

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage | Documentation Link Out
--- | --- | --- | --- | ---
Gizmo | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing | Direct to all local storage types |  [SciComp Wiki - Gizmo](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Gizmo%20and%20slurm,%20when%20use%20srun,%20sbatch%20or%20salloc.aspx)
AWS Batch | Via Rhino (CLI, FH credentials on campus/VPN off campus) | Scientific Computing |Direct to all local storage types |  [SciComp Wiki - AWS-Batch]

### Interactive Computing: Future Systems Currently Under Development
These systems are provided by the Fred Hutch to serve needs that rise above those that can be met using the above listed platforms.

Compute Resource | Access Interface | Resource Admin | Connection to FH Data Storage| Documentation Link Out
--- | --- | --- | --- | ---
Beagle | CLI | Center IT | - | -
Globus Genomics | web, FH credentials after being linked to Globus | HDC (Bret Dodson) | Economy Cloud ONLY, Requires specific data organization | -
Zeppelin | - | Center IT | - | -

---

### Available Resources
- Request access to the [FH Bioinformatics Interest Group (FHBig) Slack team at this link to participate in discussions and share knowledge about available resources.](https://slack.com/signin) Put in the workspace URL:  "FHBig.slack.com" and create a login with your Fred Hutch email address (this Slack team is limited to Fred Hutch email addresses, but does not use your Fred Hutch credentials).  
- Request to have an existing GitHub username ([which you can make here](https://github.com/)) added to the Fred Hutch Institutional GitHub and added to the FHBig GitHub team by emailing scicomp.  
- Take courses offered from [fredhutch.io](http://www.fredhutch.io/)
- Go to the Scientific Computing Office hours:
  - All SciComp resource help ([typically Wednesdays from 1am-12pm in Arnold M2-B102, but check here for current info.](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/SciComp%20Office%20Hours.aspx))
  - High Performance Computing and Cloud resource help ([typically Tuesdays from 3-4pm in Thomas D3-106, but check here for current info.](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/SciComp%20Office%20Hours.aspx))
- Go to the Bioinformatics Core's Office hours ([typically Tuesdays from 1:30-3:30pm in Thomas, DE-795 but check here for current info.](https://sharedresources.fredhutch.org/training/bioinformatics-drop-consulting))
- Read through [Scientific Computing wiki's and documentation](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Home.aspx?TreeField=Wiki_x0020_Page_x0020_Categories))
