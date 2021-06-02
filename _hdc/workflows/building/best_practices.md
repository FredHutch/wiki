---
title: Best Practices for Writing Workflows
hdc: True
---

[Best Practices - Files](best_practices_files.md)
[Best Practices - Input](best_practices_input.md)
[Best Practices - Resources](best_practices_resources.md)
[Best Practices - Execution & Containers](best_practices_container.md)
[Development Resources](development_resources.md)
[Frequently Asked Questions (FAQ)](faq.md)



* Do one thing in each step
* Make each step deterministic (the same input produces the same output)
* The most important thing is to connect processes together correctly, using channels. Learning how to manipulate channels (filtering, grouping, joining, parsing) is *the* key to making effective workflows.

