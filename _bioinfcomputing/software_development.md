---
title: Software Development Practices
last_modified_at: 2019-04-10
primary_reviewers: Kate Hertweck
---

This page documents coding standards at Fred Hutch, along with several helpful tool suggestions and examples. In an effort to create high-quality, transparent, and reproducible software-aided research, it is important that best software practices be fused into the process.


## Fred Hutch Software Development Standards

 - Use template to start with necessary file structure components
   - README.md (Summary Documentation, Title, Author, Technical and Domain Reviewer(s))
   - LICENSE.md (What's an okay default? MIT license?)
   - Raw data stored unmodified (note: do not store data on github)
   - src code
 - Within Code
   - meaningful variable names
   - help and error for all functions
   - docstring for all functions
   - automate tasks
   - use libraries when available
 - Consider sharing (wiki examples)
     - additional technical review and feedback
     - create reference for other Hutch researchers
     - local notoriety for writing awesome code
 - Consider publishing (DOI?)

## Tools and Ideas to Further Improve Software

There are times when you may want to go beyond the minimum requirements to build a more robust piece of software. This may be the case if you are working with many collaborators, plan to publish/release your code, or anticipate a need to update your code and/or data over time.


### Manage Dependencies (Environments and Containers)


### Use Standard Styles (PEP8, linter tools)


### Unit Testing


### Version Control and Issue Tracking
 - Link to managecode
 - Reiterate importance of review

### Continuous Integration


#### Git Badges

## Examples

Pointer to specific wiki code examples:
 - Jupyter notebook
 - R?
 - src code file system
