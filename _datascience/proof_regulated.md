---
title: PROOF Regulated
primary_reviewers: seankross
---

## Overview

Analysis that involves data that is subject to a data use agreement (DUA)
often includes the creation of data and other derivative files that are also 
subject to the DUA. The Scientific Computing team can configure 
[*regulated* storage][wiki-reg] for DUA-governed data, which gives researchers
the space and opportunity to ensure that each piece of their analysis is 
compliant with their respective DUAs. If you have read the previously linked
article about our regulated storage resource and you are interested in using it,
please [schedule a Data House Call][dhc] with the 
[Data Governance][dg-centernet] team.

[PROOF][how-to-proof] is configured to store the intermediate data files 
generated during WDL execution in a compliant location. If a user has access 
to data on *regulated*, PROOF will automatically create a directory at 
`/fh/regulated/[PI name]/temp/user/[username]/cromwell-scratch/`
which will contain the intermediate files produced while running a workflow.

## How to Start a PROOF Server with Regulated Storage

In the PROOF Server tab, when you click "Start a PROOF Server" you will see a
checkbox with the option to use regulated data:

![](/datascience/assets/proof/start-proof-reg-server.png)

Check the box and click "Start."

If you already had a PROOF server running, you will need to stop that server, and then start a new regulated server.
{: .notice--warn}

Once the server starts, there will be several indications that you are using a
regulated PROOF server:

1. A badge that says "Using regulated data" will appear in the navigation bar
on every page.
2. On the server tab, the scratch directory will be a sub-folder of 
`/fh/regulated/`.
3. On the server tab, "Use regulated data" under the troubleshooting heading 
will be `TRUE`.

![](/datascience/assets/proof/proof-reg-server-page.png)

## Important Considerations When Using a Regulated PROOF Server

- Good data stewardship practices still apply when using this resource. A 
regulated PROOF server's main feature is that it automatically utilizes a user's
`temp` directory. You can read more about these directories on our page about
[regulated storage][wiki-reg].
- Use of a regulated PROOF server is necessary but not sufficient for using
PROOF in a compliant manner. Please be sure the WDL you are running with PROOF
stores appropriate artifacts on regulated storage. We are happy to help make
sure your WDLs are compliant if you schedule a 
[Research Computing Data House Call][dhc].

<!--- Always keep this block of links at the bottom --->
[wiki-reg]: /scicomputing/store_regulated
[how-to-proof]: /datademos/proof-how-to
[dhc]: https://ocdo.fredhutch.org/programs/dhc.html
[dg-centernet]: https://centernet.fredhutch.org/u/data-science-lab/data-governance.html
