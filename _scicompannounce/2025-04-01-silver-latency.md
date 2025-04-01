---
Title: Increased latency on fast & home
---

We are noticing and getting reports of general slowness on the rhino & gizmo nodes. The underlying issue is the silver storage platform which hosts `/fh/fast` and all home directories. The latency spikes are due to increased utilization of these filesystems. The storage team has additional nodes on the way and are expected to arrive on site this week. They estimate 2 weeks for the nodes to be online and actively participating in the storage pool. 

In the meantime, consider moving work to `/hpc/temp` & `/fh/working` as they are not affected by this issue. All of our storage options are listed here along with guidance on what each one is best suited for: https://sciwiki.fredhutch.org/scicomputing/store_posix/ 

If you have questions about any of this work, please email Scientific Computing.

## You may notice

- Listing directories on fast or in your home directory take longer
- SSH connections take longer to establish
- Delay in loading modules
- Git commands like switching branches take longer to complete
