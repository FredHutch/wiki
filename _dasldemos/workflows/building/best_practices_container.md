---
title: Best Practices with Execution Code & Containers
hdc: True
---

[Best Practices - Files](/hdc/workflows/building/best_practices_files/)
[Best Practices - Input](/hdc/workflows/building/best_practices_input/)
[Best Practices - Resources](/hdc/workflows/building/best_practices_resources/)
[Best Practices - Execution & Containers](/hdc/workflows/building/best_practices_container/)
[Development Resources](/hdc/workflows/building/development_resources/)
[Frequently Asked Questions (FAQ)](/hdc/workflows/building/faq/)

## Containers


### Use Existing Containers

* Use existing containers. Check `quay.io`, `hub.docker.com`, and other sources


### Build Your Own If Need Be

* Use `quay.io`. Attach it to a GitHub repo.

To get started, build it on a machine. Once it builds cleanly, move it to an automated system like quay.io with a GitHub repo.

Use AWS ECR if need be (if you need the code kept private)

### Using them in workflows


## Gizmo and `module-load`

