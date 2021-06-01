---
title: Best Practices with Execution Code & Containers
hdc: True
---

[Best Practices](best_practices.md)
[Best Practices - Files](best_practices_files.md)
[Best Practices - Input](best_practices_input.md)
[Best Practices - Resources](best_practices_resources.md)
[Development Resources](development_resources.md)
[Frequently Asked Questions (FAQ)](faq.md)

## Containers


### Use Existing Containers

* Use existing containers. Check `quay.io`, `hub.docker.com`, and other sources


### Build Your Own If Need Be

* Use `quay.io`. Attach it to a GitHub repo.

To get started, build it on a machine. Once it builds cleanly, move it to an automated system like quay.io with a GitHub repo.

Use AWS ECR if need be (if you need the code kept private)

### Using them in workflows


## Gizmo and `module-load`

