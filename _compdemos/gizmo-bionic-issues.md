---
title: Gizmo Bionic Environment Known Issues and Limitations
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

This is a summary list of the most apparent issus and limitations in the new Bionic environment.  More information on issues we are working on may be found in the [GitHub project](https://github.com/FredHutch/scicomp-todo/projects/5).

Last Update: 17 June 2020

## Open Issues

### SSH Host Key Changed for Rhino

The host key for the name "rhino" has changed as the name now points to a new host.  This results in rather ominous messages suggessting that "spoofing" is going on.  The new key fingerprint is:

     SHA256:Hd8BcmYflVY41wvC6W0ati0Qhc8OrhfE0jbuPVvUuyg.

Remediation steps are platform and SSH client specific, but generally can be resolved by reviewing the documentation for your client on how to update "known hosts".

### Hostname "gizmo" Retired

The hostname "gizmo" was a round-robin alias for the rhino nodes.  This has been removed from DNS
