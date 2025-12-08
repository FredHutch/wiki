---
Title: E2 Data Center and Gizmo Node Maintenance
---

In coordination with the Network Engineering group we are replacing network switches and power distribution for rhino/gizmo nodes in the E2 data center over the months of January and February 2026.

## What We're Doing

The “top of rack” switches have reached end-of-life and need to be refreshed with the supported versions.  We will aso be replacing the power distribution gear in these cabinets as these units have fault with the monitoring firmware and require replacement

As this requires we power down the nodes, we'll be putting reservations in place to keep jobs off of those nodes during their designated maintenance time.  We are also reducing the over-time allowance for jobs in the campus-new and interactive partitions from 36 hours to 3 hours.

If the backlog grows we may reduce limits.

## When We're Doing it

Every Tuesday morning in January and February we'll be powering down nodes (approximately 24 each time), replacing the network and power equipment, then returning the nodes back into service.  We expect the actual work to take around three hours.

The exact dates are:

 - 6  January
 - 13 January
 - 20 January
 - 27 January
 - 3  February
 - 10 February
 - 17 February
 - 24 February

## What to Expect

This will result in a net decrease in overall throughput even though the nodes themselves will be up and running for most of the time.  There will be some delay of job allocations: jobs requesting larger amounts of walltime (4 days and more) will be affected the most.

You may see messages indicating "Node Not Available" or "Reserved".  This is normal- your job will still be run as resources on other nodes become available.

## Would You Like to Know More?

If you have any questions, please email SciComp.
