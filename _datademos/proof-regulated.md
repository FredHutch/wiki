---
title: PROOF Regulated
primary_reviewers: seankross
---

Analysis that involves data that is subject to an NIH Data Use Certification (DUC)
often includes the creation of data and other derivative files that are also
subject to the DUC. The Scientific Computing team can configure
[*regulated* storage][wiki-reg] for DUC-governed data, which gives researchers
the space and opportunity to ensure that each piece of their analysis is
compliant with their respective data stewardship plan. If you have read the
previously linked article about our regulated storage resource and you are
interested in using it, please visit the Data Governance team's page about
[NIH Repository Data Access][ocdodg-nihrda] to learn more.

[PROOF][how-to-proof] is configured to store the intermediate data files
generated during [WDL][wdl-workflows] execution in a compliant location. If a user has access
to data on *regulated*, PROOF will automatically create a directory at
`/fh/regulated/[PI name]/temp/user/[username]/cromwell-scratch/`
which will contain the intermediate files produced while running a workflow.

## How to Start a PROOF Server with Regulated Storage with PROOF Workbench

PROOF Workbench users are able to create **Blueprints**, which specify the
configuration of PROOF Servers. Users can create a Blueprint that uses 
regulated data by navigating to the **Account** page and clicking the 
**Create a New Blueprint** button. When creating the Blueprint users can 
check the Regulated Data box, illustrated below.

![check regulated](/datademos/assets/pwb-tutorial/create-blueprint.png)

Users can then use this Blueprint to start a regulated PROOF server by 
selecting the Blueprint from the **Start a server** menu on the Home page,
illustrated below.

If you already had a PROOF server running, you will need to stop that server, and then start a new regulated server.
{: .notice--warn}

![start regulated](/datademos/assets/pwb-tutorial/start-regulated.png)

Once the server starts, there will be several indications that you are using a
regulated PROOF server:

1. You will receive an email confirming that you started a regulated server.
2. A badge that says "Active sever: Regulated" will appear in the navigation bar
on every page.
3. On the Home page, under **Directories and URLs**, the scratch directory will 
be a sub-folder of `/fh/regulated/`.
4. On the Home page, under **Account, start, and stop times**, 
"Regulated Data?" will be `TRUE`.

## How to Start a PROOF Server with Regulated Storage with PROOF Legacy

In the PROOF Server tab, when you click "Start a PROOF Server" you will see a
checkbox with the option to use regulated data:

![](/datascience/assets/proof/start-proof-reg-server.png)

Check the box and click "Start."

If you already had a PROOF server running, you will need to stop that server, and then start a new regulated server.
{: .notice--warn}

Once the server starts, there will be several indications that you are using a
regulated PROOF server:

1. You will receive an email confirming that you started a regulated server.
2. A badge that says "Using regulated data" will appear in the navigation bar
on every page.
3. On the server tab, the scratch directory will be a sub-folder of
`/fh/regulated/`.
4. On the server tab, "Use regulated data" under the troubleshooting heading
will be `TRUE`.

![](/datascience/assets/proof/proof-reg-server-page.png)

## Important Considerations When Using a Regulated PROOF Server

- Good data stewardship practices, which should be outlined your
[data stewardship plan][ocdodg-nihrda], still apply when using this resource.
A regulated PROOF server's main feature is that it automatically utilizes a user's
`temp` directory within `/fh/regulated/`. You can read more about these directories on our page about
[regulated storage][wiki-reg].
- Use of a regulated PROOF server is necessary but not sufficient for using
PROOF in a compliant manner. Please be sure the WDL you are running with PROOF
stores appropriate artifacts on regulated storage. We are happy to help make
sure your WDLs are compliant if you schedule a
[Research Computing Data House Call][dhc].

## Resources

- [PROOF Workbench Tutorial][pwb-tutorial] - An introduction to PROOF Workbench
- [PROOF Legacy How-To][how-to-proof] - Step-by-step guide to using PROOF Legacy
- [WDL Workflows Guide][wdl-workflows] - Learn the fundamentals of WDL
- [WDL Execution Engines][wdl-engines] - Understanding Cromwell and other WDL engines
- [WILDS WDL Library][wilds-wdl] - Tested, ready-to-use WDL workflows and modules

<!--- Always keep this block of links at the bottom --->
[wiki-reg]: /scicomputing/store_regulated
[how-to-proof]: /datademos/proof-how-to
[dhc]: https://ocdo.fredhutch.org/programs/dhc.html
[dg-centernet]: https://centernet.fredhutch.org/u/data-science-lab/data-governance.html
[ocdodg-nihrda]: https://centernet.fredhutch.org/u/data-science-lab/data-governance/data-access-request-data-use-certification-agreement.html
[wdl-workflows]: /datascience/wdl_workflows/
[wdl-engines]: /datademos/wdl_execution_engines/
[wilds-wdl]: /datascience/wilds_wdl/
[pwb-tutorial]: /datademos/pwb-tutorial/