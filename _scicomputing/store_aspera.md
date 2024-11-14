---
title: Aspera Faspex Storage
primary_reviewers: atombaby
---

## Aspera Faspex -- File Transfer Application

Use [this link](https://aspera.fhcrc.org/aspera/faspex/) to skip this introduction and proceed directly to Aspera Faspex.

## Overview

### Accounts

Anyone with a HutchNetID can login to Aspera Faspex.

### Policies

 - Our license is limited to ten concurrent logins.
 - Sessions timeout after one hour of inactivity.
 - Faspex accounts are locked after five failed login attempts within one minute. Locked accounts are unlocked after one hour.
 - An account can only login from one client at a time.

### Support

If you are unable to log in, contact HelpDesk. If you are able to log in but have other questions, contact SciComp.

## Sending Files to External Collaborators

Go to the login page and login using your HutchNetID and password.  The first time you log in you'll be prompted to install the Aspera Connect plug-in- download and install the appropriate plug-in for your operating system.

>Note: You may need admin rights on your computer to install the plug-in. Please contact your division IT if you need assistance installing the plug-in.

Once installed, click "New Package" in the menu. This will take you to the "New Package" page.

On the "New Package" page:

 - "To:" enter the recipient email addresses.
 - "Cc" check the "Upload" or "Download" boxes if you'd like to receive email notifications for successful upload and/or download.
 - "Title:" this is the title of the package and the subject of the email message.
 - "Note:" this is the body of the email message.
 - "Contents:" click the "Browse for files..." button to open an upload dialog box or drag-and-drop your files to the "Drop Files and Folders Here" section.
 - Click the "Send Package" button to upload the files. An email message will be automatically sent to the recipients after the files were successfully uploaded.

The recipients will receive an email with a link to download the files. If they have an account on the system, then they will be required to log in before retrieving the files. External collaborators and Center personal without a Faspex account can download the files directly without logging in.

### Notes:

 - This system is for file transfers only and storage space is temporary. Packages are deleted after all recipients have downloaded the package. Unreserved packages are deleted after 7 days.
 - Packages are transferred through a secure SSH tunnel.
 - If you send a package to an external collaborator the link can only be used once to download the package; however, the collaborator could share the link with another person and that person could download the file.
 - If you're transferring sensitive data, please make sure the recipient has a Faspex user account. This will require them to login to Faspex before retrieving the package. If the recipient doesn't have a HutchNetID, contact the HelpDesk and we'll create a Faspex account.

## Receiving Files from External Collaborators

### Send Invitation to Submit

To invite someone to upload a file into Aspera you need to send them an invitation:

 - In the top navigation click on "Received".
 - On the "Received Packages" page click on the "Invitations" link.
 - On the "Invitations" page click on, "Invite Outside Email".
 - On the "Invite Outside Email User" page:
   - "Email address:" enter the submitter's email address.
   - "Submission link expires:" specify when the submitter's invitation expires. The default is, "Never".
   - Click, "Save (sends invitation email)".

The submitter will receive an email with a URL to upload files directly to your Aspera Faspex account. There is no authentication mechanism for this feature, so anyone with the URL will be able to upload files.

### Upload

The submitter will click on the URL in the email they receive.  If this is the first time the submitter has used the Aspera they will be prompted to install the Aspera Connect browser plug-in- they will need to download and install the appropriate plug-in for their operating system.

> Note: They may need admin rights on their computer to install the plug-in.

On the "Send to" page:

 - "Title:" this is the title of the package and the subject of the email message.
 - "Note:" this is the body of the email message.
 - "Notifications: Email me with result of upload" check this box if to receive an email notification after the upload completes.
 - "Contents:" click the "Browse for files..." button to open an upload dialog box or drag-and-drop your files to the "Drop Files and Folders Here" section.
 - Click the "Send Package" button to upload the files. An email message will be automatically sent to the recipients after the files were successfully uploaded.
 - After the upload completes you will receive an email with a link to download the package. Click the link and login with your username and password to download the package.
