---
Title: Using VSCode Remote Sessions with Environment Modules
---

A common way to use VScode is to have VScode running on your local system and using the remote feature to connect and run code on rhino/gizmo nodes with a Python interpreter provided by Lmod.

As of today (15 Dec. 2023) this does not seem to be possible.  The way the remote session is started does not have a mechanism to load those environment modules.

This is a [known issue](https://stackoverflow.com/questions/71484282/loading-an-lmod-module-using-vscode-with-remote-ssh).  While this question has an approved answer, we do not recommend the method described (loading an environment module in your `.profile`).  We have also been unable to get this to work in our testing.

If you have questions, please contact SciComp.
