---
title: Introduction to rslurm
date: 2020-02-27
main_author: Michael Gutteridge
primary_reviewers: vortexing, atombaby, jennylsmith
---

## Changing Download Destination for Aspera Downloads

The default location for Aspera downloads is typically unsatisfactory as it defaults to a local path (OSX and Windows) or to your home directory (on Linux).  Fortunately we can change this via the Aspera client.

> Each OS variant requires different specific steps- I've attempted to capture as best as possible in this document.  Future work will describe these steps in greater detail

### Start the Aspera Client

The client typically starts when you browse to the [Aspera URL](https://aspera.fhcrc.org).  The client will be shown as an icon in the session's toolbar- this will enable you to access the preferences window.

### Locate Preferences

On OSX and Linux, a context click (right click) will bring up a menu from which you can select the preferences for the application.  In Windows this is available by starting the application then choosing the "Hamburger Button" at the top left.

### Update Transfers Configuration

One of the tabs in the preferences window is "transfers".  This is where you can configure the destination for downloads.  Two options are available- a fixed path and "always prompt".

Most find the "always prompt" the better option- you'll be prompted for a download path each time you download data from Aspera.  If you do have a regular path you'd prefer, update the path in the "save to" text box.

### Apply and Go

Now all that is left is to apply those changes via the appropriate button (OK, apply) and start your downloads.
