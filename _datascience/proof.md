---
title: PROOF
primary_reviewers: seankross, tefirman, sitapriyamoorthi
---

**PROOF** (**PR**oduction **O**n-ramp for **O**ptimization and **F**easibility)
is a collection of software designed to help researchers manage and execute
[**WDL**][wiki-wdl] (Workflow Description Language)
workflows using the [**Cromwell**][wiki-cromwell] workflow manager, 
configured to run on the [**Fred Hutch cluster**][wiki-cluster]. PROOF allows 
users to:

- Validate, run, track, troubleshoot, and assess the performance of workflows in one application.
- Automate all the backend configurations necessary to submit your workflows instantly.
- Test, refine, and harden your workflows before potentially transitioning to 
cloud-based infrastructures, all in a **no-cost** 'proofing' environment that 
enables quick iterations.

PROOF is a collaborative partnership between 
[Scientific Computing][cnet-scicomp] and the 
[Office of the Chief Data Officer (OCDO)][cnet-dasl]. PROOF is only available
on the Fred Hutch network at this time.

## PROOF Workbench

PROOF Workbench is the flagship product of the overall PROOF effort. Get your
computational workflows up, running, and organized with this web application 
built in partnership with Fred Hutch researchers. Track multiple workflows 
simultaneously while caching correct results so you do not have to waste time
recreating them.

### Getting Started

- Access PROOF Workbench on the Fred Hutch network at: [pwb.fredhutch.org][pwb].
- Read the PROOF Workbench tutorial: 
[Getting Started with PROOF Workbench][pwb-tutorial].
- Consult the troubleshooting guide: 
[Troubleshooting PROOF Workbench][pwb-trouble].
- Learn more about developing WDL workflows: 
[*Developing WDL Workflows* by the Fred Hutch Data Science Lab ][dev-ww].
- Explore the [WILDS WDL Library][wiki-wilds-wdl] for tested, ready-to-use WDL
workflows, developed and maintained by the 
[Office of the Chief Data Officer (OCDO)][cnet-dasl].
- Partner with the OCDO to build workflows for your research via the 
[WILDS WDL Development Program][cnet-wwdp].
- Need help debugging a workflow? Get live help by scheduling a 
[Research Computing Data House Call][dhc-rc].
- Having trouble using PROOF Workbench? Want to provide feedback or report an 
issue? Please schedule a [Code & Software Data House Call][dhc-code].

### Connect with PROOF Users and Developers

- Join the community of Fred Hutch researchers using PROOF on Teams: [PROOF User Group][pug].
- Contact the PROOF team by sending an email to [wilds@fredhutch.org](mailto:wilds@fredhutch.org).

## PROOF Legacy

PROOF Legacy, formerly known as simply *PROOF*, or *Shiny Cromwell*, was our 
first iteration of building the web application that inspired PROOF 
Workbench. We plan to support PROOF Legacy through the end of 2026, but we 
encourage PROOF Legacy users to adopt PROOF Workbench. If there are features of
PROOF Legacy that you feel are missing from PROOF Workbench, please let us know
by sending an email to [wilds@fredhutch.org](mailto:wilds@fredhutch.org).

### Getting Started

- Access PROOF Legacy on the Fred Hutch network at: 
[proof.fredhutch.org][proof-legacy].
- Find out more about PROOF Legacy in our [How-To in the DaSL Resource Library](/datademos/proof-how-to/)
- Explore more advanced troubleshooting capabilities in our [PROOF Legacy Troubleshooting Guide](/datademos/proof-troubleshooting/)
- Using regulated data or data covered under a DUA? Read about running [PROOF Legacy with regulated data](/datascience/proof_regulated/).

## Technical Documentation and Repositories
- PROOF Legacy is based on an open-source R Shiny application. Browse the source code [on GitHub](https://github.com/getwilds/shiny-cromwell).
- The open source R packages [proofr](https://github.com/getwilds/proofr) and [rcromwell](https://github.com/getwilds/rcromwell) power the PROOF Legacy application.

<!--- Always keep this block of links at the bottom --->
[wiki-wdl]: /datascience/wdl_workflows/
[wiki-cromwell]: /datascience/wdl_execution_engines/#cromwell
[wiki-cluster]: /scicomputing/compute_jobs/
[pwb]: https://pwb.fredhutch.org/
[dev-ww]: https://hutchdatascience.org/Developing_WDL_Workflows/
[wiki-wilds-wdl]: /datascience/wilds_wdl/
[pug]: https://teams.microsoft.com/l/team/19%3A8dMC1Joe-eP9Q_VPiA0fsfuTMlHZIrV1w3cCyzTXens1%40thread.tacv2/conversations?groupId=f1eb8b59-8250-4d36-9543-6718a77bda1f&tenantId=0054a3ea-b394-418b-ad1a-174138231fd6
[cnet-scicomp]: https://centernet.fredhutch.org/u/it/research-it-and-scientific-computing/scicomp.html
[cnet-dasl]: https://centernet.fredhutch.org/u/data-science-lab.html
[proof-legacy]: https://proof.fredhutch.org/
[cnet-wwdp]: https://centernet.fredhutch.org/u/data-science-lab/data-science/wilds-wdl.html
[dhc-rc]: https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management
[dhc-code]: https://ocdo.fredhutch.org/programs/dhc.html#code-and-software-r-python-and-beyond
[pwb-tutorial]: /datademos/pwb-tutorial/
[pwb-trouble]: /datademos/pwb-troubleshooting/
