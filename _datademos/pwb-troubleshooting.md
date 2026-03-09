---
title: PROOF Workbench Troubleshooting
---

PROOF Workbench aims to make it easier for researchers to get computing and 
analysis work done on the Fred Hutch cluster, and the PROOF system itself is
also run on the Fred Hutch Cluster. This means that PROOF Workbench benefits 
from the advantages of the cluster, but also shares some of the cluster's 
boundaries and limitations. 

## Get Live Help

PROOF is a collaborative partnership between 
[Scientific Computing][cnet-scicomp] and the 
[Office of the Chief Data Officer (OCDO)][cnet-dasl], and we are eager to help
PROOF users with troubleshooting. You can get live help with PROOF through
several avenues:

- If you need help debugging a workflow, schedule a 
[Research Computing Data House Call][dhc-rc].
- If you are having trouble using PROOF Workbench, or you want to provide feedback or report an issue, schedule a [Code & Software Data House Call][dhc-code].
- As us anything in the PROOF Users Group on Teams: [PROOF User Group][pug].
- If you are already a member of the [FH-Data Slack][fh-slack], ask us anything in the `#workflow-managers` channel. If you are not yet a member, you are welcome to join if you have a Fred Hutch email address.
- Email the PROOF team at [wilds@fredhutch.org](mailto:wilds@fredhutch.org).

## Common PROOF Server Issues

A common point of failure for PROOF is your PROOF server. The Home page of PROOF Workbench allows you to start, stop, and see the status of your PROOF server. There are two healthy states for this page. The first state is **when you do not have a PROOF server running**. You should see that you can connect to the PROOF API, which PROOF Workbench uses to launch a PROOF Server on the Fred Hutch cluster, and that the API is reporting to PROOF Workbench that it is ready to start a PROOF server:

![start a server](/datademos/assets/pwb-tutorial/start-server.png)

If you do not have a PROOF server running and the Home page does not look like the image above, please contact us via any of the methods mentioned above.

Once you start a PROOF server, each of the status indicators on the Home page will either be green, meaning they are up and running, yellow, meaning they are starting up, or gray, meaning they have not yet started. It may take several minutes for each of these steps to start up. Once all the status indicators are green, your PROOF server has started:

![server is running](/datademos/assets/pwb-tutorial/server-is-running.png)

If any of the status indicators remain yellow or gray for a long time, please contact us via any of the methods mentioned above. As you can see in the image above, below the status indicators, you can click **Copy all status information**. Please send us that information when you contact us.

### Is this thing on? Make sure your PROOF server is running

Many of the core features of PROOF Workbench, including WDL validation, submitting a workflow, and viewing running and past workflows depends on making sure that your PROOF server is running. You can view the current status of your server on the Home page, and as discussed above, all status indicators should been green when your PROOF server is running.

### Turn it off and turn it back on again: Restarting your PROOF Server

Some of the most common issues with PROOF can be solved by stopping a running PROOF server, and then starting a new one. To stop your PROOF server, go to the Home page and click the **Stop server** button. 

![stop server dropdown](/datademos/assets/pwb-tutorial/stop-server-dropdown.png)

Make note of whether or not you are using a blueprint before you stop your server. Click **Yes, stop the server** to confirm. Once your PROOF server has stopped, you will be able to click the **Start a server button**. If you were using a blueprint before stopping your server, make sure to use that blueprint.

## Diagnosing a failing workflow

Workflows can fail for many reasons, and PROOF tries to surface as much information as possible to help you diagnose a failing workflow. Pinning down the exact reason a workflow failed can be difficult for anyone, but it is easier when we work together. For that reason we encourage you to get in touch with via any of the methods mentioned at the top of this page, especially via a [Research Computing Data House Call][dhc-rc].

Each workflow that you submit through PROOF should appear on the Workflows page. When you click on a workflow, you will see a series of tabs, including the Jobs tab. Click on the Jobs tab to view all of the jobs that we a part of that workflow. Failed jobs will be highlighted in red.

![failed jobs tab](/datademos/assets/pwb-tutorial/failed-jobs-tab.png)

Clicking on an individual job will display error messages captured by PROOF that may help you diagnose why the job failed.

![failed jobs tab detail](/datademos/assets/pwb-tutorial/failed-jobs-tab-detail.png)

PROOF also surfaces errors at the level of the workflow overall, which you can see in the Troubleshoot tab.

![troubleshoot-tab](/datademos/assets/pwb-tutorial/troubleshoot-tab.png)

It is also wise to check the workflow logs for more granular debugging. You can find the path to your **workflow log directory** on the cluster at the bottom of the Home page under **Directories and URLs**.

## Other resources

- Check out the [PROOF Legacy troubleshooting guide][proof-legacy-trouble].
- Learn more about [PROOF][wiki-proof].

<!--- Always keep this block of links at the bottom --->
[proof-legacy-trouble]: _datademos/proof-troubleshooting/
[cnet-scicomp]: https://centernet.fredhutch.org/u/it/research-it-and-scientific-computing/scicomp.html
[cnet-dasl]: https://centernet.fredhutch.org/u/data-science-lab.html
[dhc-rc]: https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management
[dhc-code]: https://ocdo.fredhutch.org/programs/dhc.html#code-and-software-r-python-and-beyond
[pug]: https://teams.microsoft.com/l/team/19%3A8dMC1Joe-eP9Q_VPiA0fsfuTMlHZIrV1w3cCyzTXens1%40thread.tacv2/conversations?groupId=f1eb8b59-8250-4d36-9543-6718a77bda1f&tenantId=0054a3ea-b394-418b-ad1a-174138231fd6
[fh-slack]: https://ocdo.fredhutch.org/resources.html#peer-to-peer-support
[wiki-proof]: _datascience/proof.md
