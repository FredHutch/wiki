---
title: Creating Guest Collections in HutchGO
last_modified_at: 2024-07-01
primary_reviewers: atombaby
---

Guest collections are used in HutchGO to share data with people outside your immediate group.  You can share data with Hutch staff or external collaborators.

To create a collection your lab must already be configured to use HutchGO, including setting up the base mapped collection- see documentation [here](scicomputing/hutchgo_overview) on setting that up.

Only data managers are allowed to create guest collections.  If you are not a data manager, locate your lab's data manager group [here](https://app.globus.org/groups) and reach out to one of them with the information described below.

## Creating the Collection

Creating the collection begins with accessing the base mapped collection via Globus: [this link](https://app.globus.org/file-manager/collections) will take you to a page where you can locate collections you have access to.  There is a search functionality as well as quick links for bookmarked collections and collections you have access to.

Selecting a collection there will return you to the file manager- use the file manager browser to navigate to the directory you'd like to share and click on the "share" link between the navigation panes.

This will take you to the list of guest collections configured on the base mapped collection- the "Add Guest Collection" link on the right is then used to start the process of configuring the new collection.

Use the "view more fields" link to show all of the fields available for the collection.  You will then see the following fields:

#### Directory

This should be pre-populated by the file manager when you use the "share" link.  There is also a "browse" button you can use to select the directory to share.

The path indicated is relative to where the base mapped collection starts, not the path on any of our servers (e.g. /fh/fast).

#### Display Name

A friendly name for the collection

#### Description

A short description of the share- this is not a required field, but may have use for providing some information about the share to those that will use it. Not required, but helpful.

#### Keywords

Keywords aid in searching- just a space-separated list of words that your collaborators can use to locate this collection. Not required, but helpful.

#### Force Encryption (checkbox)

Requires encryption for the transfer- leave this checked.

#### Information Link

An HTTP URI that hosts more information about the collection- this is not required.

#### Contact Email

An email address that collection users can use to get assistance or information about the collection- typically someone from the lab who can answer questions about the data itself.

#### Organization

Enter "Fred Hutch Cancer Center" here.  We're hoping to have a way of setting that automatically.

#### Department

Enter your lab's name here. Not required, but helpful.

#### Other Contact Info

Just any other information you'd like to add to help people use your collection. Not required.

#### Default Directory

The default directory indicates the path inside the guest collection where new connections will be started.  Typically you'll want people to connect at the top level (the path represented by `/`).
