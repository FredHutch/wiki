---
title: Gizmo Bionic Updates
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Changes to Bionic Nodes

### 19 May 2020

#### Fixes to csh/tcsh Logins

Errors in the Lmod login files would raise error messages and result in a malfunctioning Lmod environment.  These fixes address those problems and should restore Lmod functionality to users using those shells

#### Ubuntu Update

We are applying the latest set of updated pacakges to the Bionic distribution. As this is an LTS release we expect that this will only fix bugs- there isn't any new functionality introduced by these changes.

> Note that this may take 24-36 hours to fully apply over the environment and doesn't include kernel updates.

This change will also add automatic updating of OS packages.

#### Lmod Update

We are updating Lmod to version 8.3 from the current 7.8.  A full changelog is available [here](https://github.com/TACC/Lmod), but the most significant change for the community is the "extended default" matching of modules.

#### New Software

 - `tree`
 - `chromium-browser` (on rhino nodes)

#### Postfix/SMTP

Fixed mail relay settings to allow nodes to send email

#### Disable ecryptfs Unwrap 

Disabled the PAM settings to disable unwrap of ecryptfs directories at login.  Users with ecryptfs volumes will need to manually unwrap.
