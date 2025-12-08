---
Title: E2 Data Center and Gizmo Node Maintenance
---

In coordination with the Network Engineering group we are replacing network switches and power distribution for rhino/gizmo nodes in the E2 data center over the months of January and February 2026.

## What We're Doing

The “top of rack” switches servicing SciComp systems in the E2 datacenter have reached end-of-life and need to be refreshed with supported versions.  We will also be replacing the power strips in these cabinets as these have a fault in the firmware which has caused problems with monitoring power consumption.

Because this requires we power down the nodes, we'll be putting reservations in place to keep jobs off of nodes during their designated maintenance time.

We will have outages for other, non-gizmo systems including login nodes like rhino and maestro.  There will be dedicated announcements for those systems.

We are reducing the over-time allowance for jobs in the campus-new and interactive partitions from 36 hours to 3 hours.  If the backlog grows or if allocation times increase too much we may reduce limits.

## When We're Doing it

Every Tuesday morning in January and February we'll be powering down nodes (approximately 24 each time), replacing the network and power equipment, then returning the nodes back into service.  We expect the actual work to take around three hours.

The exact dates are:

| Week | Date | Nodes|
|------|------|------|
| 1 | 6  January | rhino01, canto[1-2], gizmoj[1-11], gizmok[12,19,22-24,32-35,37,39-44,46-50], harmony06 |
| 2 | 13 January | Nodes=gizmok[63-76,78-85], harmony03 |
| 3 | 20 January | Nodes=rhino02, gizmoj[12,15-22,35-40], gizmok[29,36], harmony[01,07] |
| 4 | 27 January | Nodes=gizmok[87-94,96-98,135-146], harmony08 |
| 5 | 3  February| Nodes=rhio03, gizmoj[23-33], gizmok[51-62] |
| 6 | 10 February| Nodes=gizmok[147-169], harmony05 |
| 7 | 17 February| Nodes=gizmok[1-11,13-18,20-21,25-27,30,38] |
| 8 | 24 February| Nodes=maestro, gizmok[99-118,120-122], harmony[02,04] |

Work is planned to start around 10:00AM and should be done by early afternoon.

## What You Can Expect

This work will result in a net decrease in overall throughput even though the nodes themselves will be up and running for most of the time.  There will be some delay of job allocations: jobs requesting larger amounts of walltime (4 days and more) will be affected the most.

You may see messages indicating "Node Not Available" or "Reserved".  This is normal- your job will still be run as resources on other nodes become available.

You may need to shift work to a different login node ahead of the scheduled outage that affects that node.

## Would You Like to Know More?

If you have any questions, please email SciComp.
