---
title: Hutch Globus Online - HutchGO
last_modified_at: 2024-08-16
primary_reviewers: atombaby
---

HutchGO- Hutch Globus Online- is a deployment of the Globus data transfer services for the Hutch research community. HutchGO can be used for moving data within the Hutch and to make data available to external collaborators.  Via HutchGO you can move data between storage platforms and share data with internal and external collaborators without creating new accounts, changing storage groups, or moving data.

Globus is a non-profit service of the University of Chicago.  It is a combination of software (the Globus server and client tools) and services (the Globus control services) providing a number of different functions useful in research- data transfer, compute, and automation.

Globus is the preferred way to transfer sensitive data, but it is essential that you are confident that transferring data with Globus won't violate any terms of use - contact `dataprotection@fredhutch.org` for advice regarding your data transfer.
{: .notice--warning}

## Key Concepts

### Account and Identity

To access HutchGO you log in to a _Globus account_.  The Globus account contains one or more _identities_ provided by an "identity provider" which are connected to your Globus account.  Mutliple identity providers are available to connect to your Globus account: you can connect using your login to ORCID, Google account, GitHub account, or HutchNet ID.

While a single Globus ID can be linked to many different authentication sources, most of the operations described here require you to log into Globus with your HutchNet ID.  For example, authenticating with your ORCID will not get you access to the same resources as logging in with your "@fredhutch.org" login.
{: .notice--info}

### Collections 

Central to the use of Globus is the _collection_- a collection of paths to data on the underlying storage gateway. Data is transferred between collections.  Policies (like who can access data via Globus, how paths are shared, etc) are set on the collection. There are two kinds of collections- _mapped_ and _guest_.

#### Mapped Collection

A mapped collection _maps_ the Globus identity to an identity on the storage behind the collection.  For example, when accessing fast via a mapped collection, the "you@fredhutch.org" identity you used to authenticate is _mapped_ to your HutchNet ID on the storage system by stripping off the "@fredhutch.org" portion of your email address: "alice@fredhutch.org" is mapped to the user "alice" on the storage.

#### Guest Collection

Guest collections are used to share data (internally and externally).  Guest does not mean anonymous access- a guest collection allows Globus users to access data _as you_ on the storage configured in the guest collection.  For your "guest" user to access the data shared in a guest collection they must have a Globus ID, the guest collection must allow their Globus identity to access the data, and your HutchNetID must have access to the storage on the back-end (see [Permissions and Access](#permissions-and-access-control) below.

You can also create a guest collection to share data with other Hutch staff.  Guest collections are not limited to non-Hutch staff.
{: .notice--info}

#### Collection Visibility

Mapped collections can be set to _private_ or _public_. A public collection may show up in search results for anyone logged into Globus.  A private collection is only visible to Globus users with role assignments to the collection.

This only manages visibilty of the collection _metadata_: the collection name, description, organization, UUID, and other attributes describing the collection.  A public collection's contents are **not accessible without a HutchNetID allowing access to the collection contents**.
{: .notice--info}

### Roles

Because Globus allows easy sharing of data and because we want to have the individual labs to have as much control as possible over how data is shared,  we are creating specialized roles that control access to the various Globus capabilities.  Taking on a role means having a basic level of knowledge about how Globus works, constraints and controls necessary for the data being shared, and accepting responsibility for ongoing maintenance of data sharing within Globus.

HutchGO is a partnership between research labs and SciComp.  We are here to support, maintain, and inform; ultimately labs are responsible for maintaining the HutchGO features being used.

#### Data Owner

The data owner for a lab or project handles delegation of other roles to other lab staff (if needed).  Changes to the manager role needs to come from the owner.

In most cases, the lab PI is the data owner.

#### Data Managers

Data Managers have nearly full control over data sharing within Globus.  These individuals will manage guest collections, request updates to configuration of the mapped collections, and will monitor and respond to communications from SciComp about management of Globus.

#### Data Users

If a mapped collection is marked private an additional role- the data user- is required.  Only individuals with this role (or a more privileged role) will be able to see and use a private mapped collection

### Permissions and Access Control

There are multiple layers where access to files and data are enforced.  You can restrict which paths a collection can access on our storage systems, who has access to collection, and what kind of access is allowed via that collection.

#### Collection Access Controls

Mapped collections are configured with:

Root Path
: The root path controls which parts of the file system you are allowed to access via Globus

Path Restrictions
: Path restrictions control guest collection access- paths can be configured with no-access, read-only access, and read-write access on a per-directory basis within the root path.  "No access" will prevent guest collections from being created.  "Read Write" and "Read Only" will control access for guest collection users.

#### File System Permissions

When you connect to a mapped collection, your access is further controlled by your account's permissions on the file system.  If the underlying file system does not allow you to write into a path then you won't be able to write to files or directories via Globus.

#### Guest Permissions

When you create a guest collection, you are creating an additional layer of permissions for those configured with access to your guest collection.  Guest permissions to a collection can be read-only or read-write.

## Availability

HutchGO is available for all Hutch researchers and staff to use for data transfer needs in furtherance of the Hutch's mission. At this time HutchGO is not to be used to access or share covered (clinic) data.

### Getting Set Up

Getting your data set up to be accessible via Globus starts with an email to scicomp with the following information:

 - are necessary agreements in place? Do you have a DUA or DTA?
 - who is the data owner (where it's not a lab PI)
 - who are the data managers
 - should the mapped collection be [public or private](#collection-visibility)
 - which data sources should be made available via Globus- fast, working, economy, temp, etc.

After this, the data owner and managers will be given links to information about creating guest collections for collaborations and signed up for notices about the Globus services.

Meanwhile SciComp will set up the Globus collection for the lab/project according to the specifications above.  SciComp will also create the groups for the various roles and assign the appropriate person(s) to those groups.  This will make data available to lab staff via their HutchNet ID.

## Sharing Data

Once the base mapped collection has been created, data managers will be able to create guest collections to share data internally and externally.  Once a path within a collection has been shared, those with access will be able to access the data _as you_.  Thus you must be sure that _you_ have access to the data being shared.  When sharing data there are options to configure read-write or read-only access.  The former is required for data upload, the latter will only allow download.  See [this documentation](/scicomputing/hutchgo_guest_collection) for details on creating the guest collection.

Your collaborator must have a Globus endpoint- this can be either a full endpoint (like we have here) or they can use Globus Connect Personal.  Connect Personal allows them to access the data you've shared and download using the workstation where they've installed Connect Personal.

Globus Connect Personal is free and is available for Linux, OSX (Mac), and Windows. The host must have outbound connectivity, but inbound firewall rules are not necessary for Connect Personal.  Connect Personal cannot be used for sharing data.

## Monitoring and Management

SciComp will provide (via email) monthly reports for each of the collections within the purview of the data owners and managers.  The owners and managers should use this information to regularly audit their collections to make sure that the collections are needed and that the collections have the appropriate access permissions.
