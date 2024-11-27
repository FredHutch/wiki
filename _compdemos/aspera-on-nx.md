---
title: Managing Aspera Connect on NoMachine
last_modified_at: 2021-05-25
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

[Aspera](/scicomputing/store_aspera/) can be used on the NoMachine systems (rhino).  Using Aspera requires that the plugin be installed in the browser you are running in a NoMachine session- this is a per-user installation.

This document describes management of the Aspera plugin on NoMachine.

## New Installations

> NOTE: these instructions indicate Firefox as the browser.  This process is very similar with Chromium though some of the terminology is different

 - Start a NoMachine session and run Firefox
 - Enter "https://aspera.fhcrc.org" in the address bar
 - Log in when prompted
 - Wait a little bit- it needs a moment to detect the plugin
 - It will pop up a "Required Steps".  Step 1 is to install the add-on to the browser.  Click the "Install add-on" button.
 - This will take you to mozilla.org where you can install the add-on.  Click the "Add to Firefox" button.
 - Once the add-on install is complete it will pop up a window indicating "Launching IBM Aspera Connect".  After a moment it will return the "Required Steps" window
 - Follow the prompt to complete step 2: "Install Connect"
 - This will download an archive named something like "ibm-aspera-connect".  Save this file
 - Start a terminal session and `cd` into your downloads directory (most likely `~/Downloads`.
 - Extract this archive: `tar xvf ibm-aspera-connect-3.11.2.63-linux-g2.12-64.tar.gz` (change the name of the target file to that downloaded in the previous step)
 - this will output the name of a shell script to run- run this script with: `./ibm-aspera-connect-3.11.2.63-linux-g2.12-64.sh`
 - It will have some output indicating that it's being installed.  Once complete the browser will refresh, returning you to the Aspera start page.


## Upgrading

If you have an old version of Aspera installed you will (on login to Aspera) be prompted to update.

 - from a terminal session, remove the old installation (e.g. `rm -r ~/.aspera`) or move it out of the way (e.g. `mv .aspera .aspera.no`)
 - follow the steps above.  It will skip past the installation of the add-on and take you straight to Step 2
 


