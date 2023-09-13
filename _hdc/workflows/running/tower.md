---
title: Monitoring Workflow Progress with Tower
hdc: True
---

An added feature which makes Nextflow particularly attractive is
the ability to monitor workflow progress over the internet. This service
is called [Tower](https://tower.nf/), and if you set up an account
then you will be able to log in and view the progress of any workflows
which you have started using your private Tower token.

NOTE: If you are concerned with the privacy of any of the metadata
associated with your workflow, do not use Tower. While no actual file
data is transmitted, the file names will be contained in the associated
logs and this external resources has not undergone any security review.

## Getting Started

After setting up an account at [https://tower.nf/](https://tower.nf/),
follow their instructions to copy your private access token. That 
access token can be added to your Nextflow configuration file, regardless
of whether you are running jobs [on gizmo](/hdc/workflows/running/on_gizmo)
or [AWS](/hdc/workflows/running/on_aws).

If you would rather use Tower for one individual workflow (and not
add it to your global configuration), the access token can be provided
using the `-with-tower` option in [the run script](/hdc/workflows/running/run_script).

## Monitoring Workflows

Once you've started a workflow, just open up [Tower](https://tower.nf)
and select your workflow from the list. The progress of each individual
job, as well as the overall workflow, will be displayed alongside
any additional execution metadata which Nextflow can collect (e.g. 
estimating the cost of workflows in AWS).