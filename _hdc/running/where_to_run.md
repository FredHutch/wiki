---
title: Deciding Where to Run a Workflow
---

[Running on AWS](running/running_on_aws.md)
[Running on Gizmo](running/running_on_gizmo.md)
[Running FAQ](running/running_faq.md)


# Things to Consider


**Storage Size & Locations**

* Do you have more than 50GB on AWS/S3?
> AWS
* Do you have more than 50GB on Fast or Scratch?
> Gizmo

**Applications & Libraries**

* Are you using existing Docker containers?
> AWS
* Are you using the `ml` or `module-load` system on Rhino/Gizmo?
> Gizmo

**Publication and Collaboration**

* Do you want/need people outside Fred Hutch to run this workflow?
> AWS

