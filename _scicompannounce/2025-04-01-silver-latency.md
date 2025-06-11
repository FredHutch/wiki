---
Title: Increased latency on fast & home
---

We are noticing and getting reports of general slowness on the rhino & gizmo nodes. The underlying issue is the silver storage platform which hosts `/fh/fast` and all home directories. The latency spikes are due to capacity- this system is filling up which causes a decline in performance. The storage team has additional nodes on the way and are expected to arrive on site this week. They estimate 2 weeks for the nodes to be online and actively participating in the storage pool. 

You may notice:

- Listing directories on fast or in your home directory take longer
- SSH connections take longer to establish
- Delay in loading modules
- Git commands like switching branches take longer to complete

This has also been impacting Rstudio and VSCode- we have adjusted Rstudio, but VSCode users may need to make some changes for those sessions to work properly (see [below](#VScode_Timeouts))

In the meantime, consider moving work to `/hpc/temp` & `/fh/working` as they are not affected by this issue.  If you have any large data sets you can move or remove, that will help the situation overall. All of our storage options are listed here along with guidance on what each one is best suited for: https://sciwiki.fredhutch.org/scicomputing/store_posix/ 

If you have questions about any of this work, please email Scientific Computing.

## VSCode Timeouts

It is necessary to increase the default timeout for the VSCode connection.  [Edit the connection settings](https://code.visualstudio.com/docs/remote/ssh#_ssh-hostspecific-settings) and add:

```
ConnectTimeout 60
```

For connections to rhino/gizmo nodes.

