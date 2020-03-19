---
title: Synology Storage Appliances
last_modified_at: 2018-09-27
main_author: Dirk Peterson
primary_reviewers: dirkpetersen
---

Some labs use Synology Storage appliances (e.g. to store data from instruments). Synology can backed up to Economy File.

## Installing Synology Cloud Sync

- Open the Synology NAS web interface and login as an Administrator
- Open Package Center
- Install Cloud Sync

## Configuring Synology Cloud Sync

- Open "Cloud Sync" and click the + to add a new connection
- Choose OpenStack Swift as the Provider
- Enter in the values for your connection to Economy  File:
Identity Service Endpoint:  https://tin.fhcrc.org/auth/1.0
Identity Service Version: 1.0
Username: <the account name you copied>
API Key: <the password you copied> (not the key)
Create a new container named "synology_backup" (or similar desciptive name --- this is the equivalent of a folder)

Setup a syncing task:

- Name the connection
- Choose the local path (on the Synology Appliance)
- Choose the remote path in Economy file (do not select the root folder as it will sync the entire economy file account preventing you from adding new tasks)
- Select the sync direction: Choose “Upload local changes only”, this is a backup
- Make sure encryption is unchecked. You don't need encryption because the data is already encrypted in the storage system which is local in a hutch data center and not in the cloud. **If you decide to use encryption, make sure you do not lose the key or your data will be lost forever** as IT does not have any backdoor to get your data back if you use this type of encryption.
- Confirm your settings, click Apply and OK on congratulations message.
