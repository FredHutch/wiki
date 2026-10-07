---
Title: October Maintenance
---
We have some upcoming maintenance in the E2 data center which will require we take the cluster out of service.  The power distribution units supplying power to the racks need replacement- this requires we power down systems for the duration of the work.  This work has been scheduled for two weekends in October:

Sunday, 10/18 9:00 AM to Monday, 10/19 12:00 PM
Sunday, 10/25 12:00 PM to Sunday, 10/25 9:00 PM

Our hope is that we can complete this work in the first maintenance window- if we are able to complete everything on the weekend of the 18th we will release the second reservation.

A maintenance reservation is now active across the cluster for these dates. Any job whose requested runtime would extend into the 10/18 9:00 AM start of the maintenance window will be held until maintenance concludes. During the outage the rhino and maestro login nodes, and the gizmo cluster nodes will be powered down.  Any active sessions will be terminated, and any running jobs will be terminated.  

You can find more information about maintenance reservations [here](https://sciwiki.fredhutch.org/compdemos/maintenance_reservations/).

The updates we have planned for the computing environment are:

Update Slurm to 26.05.4
Update NVIDIA drivers on chorus nodes to the 595 series
Update Open OnDemand
Update NoMachine

None of these are expected to require any change to how you use these compute resources.

We will be sending additional notices and updates over the next few weeks- in the meantime, please add these dates to your calendar. If you have any questions, please email SciComp.
