---
title: Fred Hutch Software Development Standards
last_modified_at: 2019-04-28
primary_reviewers: k8hertweck
---

Coding projects are similar to other facets of research, in that they require review (by someone familiar with the research domain as well as code review), and that they must be readable to other researchers. In terms of software, readability means that it should be clear what the code is doing and how to update it. There are several standard programming practices at Fred Hutch meant to increase code readability to yourself and other scientists. These are included below, along with several tools and resources.

## Using Templates

A cloneable project template is available in the [linked repository](https://github.com/FredHutch/wiki-templates). This template contains the minimum file system required to meet Fred Hutch software development standards, and should be a starting point for any new software development project. By using the standard template, the components of your project (data, source code, results) can be easily found by fellow researchers, and you are provided with some additional tools for managing and packaging your code.

By design, the templates meet several of the coding standards at Fred Hutch. Results and source code are organized and clearly labeled, raw and processed data are stored separately, and a README file contains usage documentation for the project.

Supported project types are detailed in the following sections, and include both stand-alone data analysis and package/tool creation. The standards vary between the two projects, with greater organizational structure and testing requirements for tool development projects. Both project types require a license and README file, as well as a designated location for separate raw and processed data. Each project folder contains a README file detailing usage and all template components.

Currently, only Python templates are supported. However, a similar framework is anticipated for R development in the near future.

### Python Templates

#### [Data Analysis Project](https://github.com/FredHutch/wiki-templates/tree/master/DataAnalysis-Python-Template)

This project template is built to accommodate a Python project used primarily for data analysis. With this template, you can choose between building your data analysis project in an interactive Jupyter notebook, or in a python script to be run on the command line. All additional files in the template are documented in the local [README](https://github.com/FredHutch/wiki-templates/tree/master/DataAnalysis-Python-Template) file and represent the minimum requirements to keep in mind when developing or sharing any data analysis project.

While sharing results is encouraged, it is not anticipated that the underlying code for this type of project will be packaged for re-use.

#### [Tool and Package Development](https://github.com/FredHutch/wiki-templates/tree/master/ToolDev-Python-Template)

This project template is built to accommodate any Python project focused on tool or package development, which can ultimately be shared or imported by other users. The template file structure has the flexibility to support a notebook interface, an automated script, package creation, or some hybrid thereof. Some projects will require building out additional subfolders and modules, but the basic skeleton should be consistent across all projects at Fred Hutch. This will aid in reproducibility, and make it easier for other researches to review and adapt code to their own purposes. All template components are documented in the local [README](https://github.com/FredHutch/wiki-templates/ToolDev-Python-Template/README.md) file.

### [Example Coding Projects](https://github.com/FredHutch/wiki-code-examples)

A growing repository of examples developed from these templates is available [here](https://github.com/FredHutch/wiki-code-examples/). Contributions to the examples repository are welcome and encouraged. We hope to develop a robust resource for researchers to see applications of existing packages, as well as share their own results and homegrown code across an open science framework for the Hutch.

## Coding Practices

In addition to building your project within the file structure of the template, you should apply these coding practices to all your software development work:
1. Raw and processed data should be stored separately.
1. Source code and results should be organized and clearly labeled.
1. All projects should contain a license and a README file, with a project overview and details about each component in the README.
1. Code should be fully documented. Additional documentation, instructions and examples can be included in a separate folder.
1. Reuse existing code (or packages) when available.
1. Code should be automated to reduce transcription errors.
1. Use inline comments and meaningful variable names to help make your code readable to reviewers, researchers, and your future self.
1. For Python packages and modules, include Help documentation.

## Additional Resources
For more information on these coding practices, we recommend the following guides:
 - [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745): This article from PLOS Biology is written for researchers in science who are primarily self-taught and interested in adopting effective practices for designing and maintaining code in research settings.
 - [Good Enough Practices in Scientific Computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510): This article from PLOS Computational Biology is a follow-up to the article above, and highlights the most essential practices for researchers to consider adopting if they are writing code for research purposes.


# Tools and Ideas to Further Improve Software

There are times when you may want to go beyond the minimum requirements to build a more robust piece of software. This may be the case if you are working with many collaborators, plan to publish/release your code, or anticipate a need to update your code and/or data over time.


## Manage Dependencies (Environments and Containers)

When working with others or sharing your code, you'll want to make sure it will run consistently on different machines. In order to manage software installation and package dependencies, we use environments and containers. For more information about these tools and how to use them at Fred Hutch, see the [Large-Scale Computing](/compute_environments/) section of this wiki.

## Use Standard Styles

Using a standard coding style along with meaningful variable names will significantly enhance the readability of your code.

For Python coding, we recommend the PEP8 style guide as a common standard, with reference documentation available [here](https://www.python.org/dev/peps/pep-0008/). Fortunately, there are automated tools available to check your code against the PEP8 style guide and give you feedback when there are issues. Two options are [Pylint](https://www.pylint.org/) and [pycodestyle](https://pypi.org/project/pycodestyle/).

## Unit Testing
While coding allows us to harness information and analysis aiding in our research, to identify patterns and hypothesis much more efficiently, we must not forget the importance of review and sanity checks. All code is vulnerable to human error, both in the initial build and in later updates. While peer review is always recommended; automated testing, when appropriately implemented, has an advantage of checking throughout all code for far-reaching unintended consequences.

Information about the Python unit test package can be found online in the [Python documentation](https://docs.python.org/3/library/unittest.html). For R developers, there is a unit testing library called [testthat](https://testthat.r-lib.org/).

## Version Control and Issue Tracking
 For code that you plan to share or update over time, or code with several contributers, it is important to manage version control. [Git](www.github.com) allows for code, data, documentation control, with the ability to merge or revert to previous versions of your work, and track issues and review processes. For information on using GitHub at Fred Hutch, see our wiki page on [Managing and Sharing Code](/scicomputing/software_managecode/).

## Continuous Integration
With any project that will require ongoing updates or major releases, it is important to take some general development practices under consideration. Things like how often you commit code updates, and running automated testing in each commit can greatly affect how much effort is required for each update. The idea behind [Continuous Integration](https://www.thoughtworks.com/continuous-integration) is that in terms of software development, several small steps will be easier than a few large ones. If automated testing of incremental changes is run frequently, then larger issues are likely resolved before they come up in major milestone updates. While your release schedule may differ from a typical software developer, conscientious decisions behind the size of updates and built-in testing will still have a beneficial impact on your process.

### Git Badges
When using GitHub and applying automated testing or continuous integration, [Travis](https://travis-ci.org/) is a tool that will allow you to both monitor and share the the testing standards you have met. It indicates to other users/researchers that your project is reliable and tested, and it assists in your practice of Continuous Integration by testing each commit to GitHub.

The communication of your build/testing success is efficient; Travis creates badge stickers that appear on your GitHub repository page. While there are several options, some useful ones to start with are `buildpassing` (which tests your code and environment for a successful build) and `codecov` (which checks the percentage of your code covered by unit tests). You can even set up a linter (such as [Pylint](https://www.pylint.org/)) to check your code for standardized style on each build. (This can take some getting used to, but the ultimate benefits are worth it).

Travis badges do not replace peer review, but they are an excellent tool for a project with multiple contributers or ongoing updates.
