---
title: Deciding Where to Run a Workflow
hdc: True
---

[Running on AWS](/hdc/workflows/running/on_aws)
[Running on Gizmo](/hdc/workflows/running/on_gizmo)
[Running FAQ](/hdc/workflows/running/faq)


## Things to Consider


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

