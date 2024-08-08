---
title: Creating Guest Collections in HutchGO
last_modified_at: 2024-07-01
primary_reviewers: atombaby
---

Guest collections are used in HutchGO to share data with people outside your immediate group.  You can share data with Hutch staff or external collaborators.

To create a collection your lab must already be configured to use HutchGO, including setting up the base mapped collection- see documentation [here](scicomputing/hutchgo_overview) on setting that up.

Only data managers are allowed to create guest collections.  If you are not a data manager, locate your lab's data manager group [here](https://app.globus.org/groups){:target="_blank"} and reach out to one of them with the information described below.

## Creating the Collection

Creating the collection begins with accessing the base mapped collection via Globus: [this link](https://app.globus.org/file-manager/collections){:target="_blank"} will take you to a page where you can locate collections you have access to.  There is a search functionality as well as quick links for bookmarked collections and collections you have access to.

Selecting a collection there will return you to the file manager- use the file manager browser to navigate to the directory you'd like to share and click on the "share" link between the navigation panes.

This will take you to the list of guest collections configured on the base mapped collection- the "Add Guest Collection" link on the right is then used to start the process of configuring the new collection.

Use the "view more fields" link to show all of the fields available for the collection.  You will then see the following fields:

Directory
: Use the "browse" button you can use to select the directory to share.
: The path indicated is relative to where the base mapped collection starts, not the path on any of our servers

Display Name
: A friendly name for the collection

Description
: A short description of the share- this is not a required field, but may have use for providing some information about the share to those that will use it. Not required, but helpful.

Keywords
: Keywords aid in searching- just a space-separated list of words that your collaborators can use to locate this collection. Not required, but helpful.

Force Encryption (checkbox)
: Requires encryption for the transfer- leave this checked.

Information Link
: An HTTP URI that hosts more information about the collection- this is not required.

Contact Email
: An email address that collection users can use to get assistance or information about the collection- typically someone from the lab who can answer questions about the data itself.

Organization
: Enter "Fred Hutch Cancer Center" here.  We're hoping to have a way of setting that automatically.

Department
: Enter your lab's name here. Not required, but helpful.

Other Contact Info
: Just any other information you'd like to add to help people use your collection. Not required.

Default Directory
: The default directory indicates the path inside the guest collection where new connections will be started.  Typically you'll want people to connect at the top level (the path represented by `/`).

When this is all configured, click on the "Create Collection" button.  After a bit of processing the page will refresh and put you on a page where you can configure the actual sharing.

## Configuring Sharing

By default there are two permissions for the guest collection- you (or the creator of the collection) and a permission for the endpoint (this is administrative and necessary for Globus to share the collection).

The "Add Permissions - Share With" button in the upper right is where you would add new permissions.  There are three options here:

User
: shares with an individual using their email address or Globus ID

Group
: shares with a _Globus_ group.  This is something you would set up using the "Groups" link in the navigation toolbar on the left of the page

All Users:
: shares with anyone logged into Globus.  **Use Carefully.** Please do not use this to test or debug a connection problem, contact SciComp.

Depending on the option selected, the form will update to allow you to enter a Globus username or email or search terms to locate a Globus user.

_Permissions_ options are _read_ and _write_.   _Read_ is the base permission for anyone with permissions.  Write will allow the user to modify and write data in the path shared in this collection.  Your collaborators will not be able to upload data without adding write permission. 

### High Assurance Collections

Our collections are covered by our "High Assurance" subscription.  This means that your collaborators _must_ use sign into their Globus session with the ID you've shared with.

Suppose you are sharing data with "pat@example.edu". You create a guest collection to a path in the scratch file system and give "pat@example.edu" read-write access.

Now Pat may have multiple authentication mechanisms configured- they may have linked another institutional login (e.g. "pat@other-example.edu") with their Globus ID.  They may have also linked their Gmail account with this Globus ID.

Any one of those IDs can be used by Pat to log into their Globus. However, when they attempt to access the share you've configured, they will be prompted to log in with their "example.edu" account before they will be allowed to access your guest collection.

### Sharing Inside the Hutch

It's completely appropriate to create a guest collection for others at the Hutch to use for upload/download of data from your lab.  The process is identical, simply search for their HutchNet ID when configuring permissions.

High Assurance protections still apply- these individuals must use the ID you configured in this collection to access data.

