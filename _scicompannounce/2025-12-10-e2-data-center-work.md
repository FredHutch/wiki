---
Title: E2 Data Center and Gizmo Node Maintenance
---

In coordination with the Network Engineering group we are replacing network switches and power distribution for rhino/gizmo nodes in the E2 data center over the months of January and February 2026.  This work will address a couple of problems:  

 - The “top of rack” switches have reached end-of-life and need to be refreshed with newer ones.
 - The power distribution gear in these cabinets have a common fault with the monitoring firmware and require replacement with models that will allow monitoringof power at the cabinet level.

This will be a rolling upgrade.  Each Tuesday morning we'll be powering down nodes (approximately 24 each time), replacing the network and power equipment, then returning the nodes back into service.

To avoid killing running jobs we'll be putting reservations in place to keep jobs off of those nodes during their designated maintenance time.  We are also reducing the over-time allowance for jobs in the campus-new and interactive partitions from 36 hours to 3 hours.

This will result in a net decrease in overall throughput even though the nodes themselves will be up and running for most of the time.

While your job is pending, you may see messages indicating "Node Not Available" or "Reserved".  This is normal- your job will still be run as other, un-reserved nodes free up and not held for a particular node.

If you have any questions, please email SciComp.
