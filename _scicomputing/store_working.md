---
title: Working File Service
primary_reviewers: scicomp
---

## Overview

The _working_ storage platform provides a location for longer term storage of research data.  It is intended to be used much like _scratch_ is today.  _Working_ is more robust than _scratch_ with more redundancy built into its service.

_Working_ is not backed up and **must not** be used as a primary data store.
{: .notice--warning}

As with other SciComp supported file systems, the _working_ file system is available on rhino/gizmo compute systems and to managed workstations connected to the campus network.

## Using Working Storage

_Working_ is provisioned on-request.  If your lab would like to use this storage system, please have your lab's PI email SciComp.  It is organized similar to how we have organized _fast_, _temp_, and _scratch_, with subdirectories named for the lab (e.g. `/fh/working/pi_n`)

_Working_ is available on rhino/gizmo compute nodes at the path `/fh/working`.  Mac and Windows workstations have access via smb://center.fhcrc.org/fh/working.

## Quotas 

Quotas are used to manage utilization of working.  This is a hard quota- once the limit has been reached, attempts to write to _working_ will fail.

The default quota on _working_ is 20TB.  If this is insufficient, the PI will need to send that request to SciComp.  The maximum quota available is 50TB.

Optional notifications can be configured to send an e-mail when you have used 90% of your allocated quota and when you reach 100%. Contact Scicomp and provide a contact e-mail address to have this enabled for your account. Notifications can be sent to multiple people; however, the use of a mailing or distribution list is recommended in these cases. The listed contact(s) will need to be kept current.

## Chargebacks

The first 20TB of working storage is provided without charge.  If a lab has extended their quota, the lab will be charged 6$/TB/month for the allocated quota over the 20TB base quota.

This charge is for the quota allocated, not for how much is used.  If a lab requests an increase of the quota to 30TB, that lab will be charged 10$ every month (30TB less the 20TB base is a charge of 10TB * 6$/TB/month)
{: .notice--info}
