---
title: Fred Hutch Biomedical Data Science Wiki Style Guide
permalink: /styleguide/
layout: single
toc: true
toc_label: "On This Page"
sidebar:
  - title: "Who We Are"
    text: "This collaboratively curated wiki was created by contributions from Fred Hutch investigators and staff.  The project team is led by the Translational Genomics Data Coordination Center.  For more information about this project or contributing, email Amy Paguirigan (apaguiri)."
    - title: "Links"
      text: "[Contributors List](http://sciwiki.fredhutch.org/contributors/)"
    - title: ""
      text: "[Outreach Programs](http://sciwiki.fredhutch.org/outreach/)"
    - title: ""
      text: "[Style Guide](http://sciwiki.fredhutch.org/styleguide/)"
---
## Github-Flavored Markdown
The content of this site is generated using GitHub "flavored" markdown.  A cheat sheet for the code required to use things like headings and table is [here.](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Our page TOC's are generated from these headings, so use ## H2 as your first level, and headings H2, H3 and H4 show up automatically in our TOC's).

## Content Structure
Our goal is the generate article-style content (with the exception of the demo's pages), with the following general sections:

### Introduction
An introductory paragraph explaining the summary of the content of the page must be included and be interpretable for a novice OR expert.  This paragraph is a good place to define commonly used words that may be domain-specific or be used with a domain-specific definition.  Also include a description or set of examples that might highlight why the reader might want to keep reading for a novice and an expert.  Good examples of this would have direct relationships to one's research project that would allow the reader to understand a bit about how the content might impact the research one does.  

### Graduated Content
The main content of the pages is up to you to structure.  Keep in mind that the purpose of these articles is mainly to provide enough background for a variety of readers to know what sorts of questions related to their particular research to pose when looking for in-person help in the course of their research.  Endeavor to use headings to separate text in such a way that an advanced user could use the TOC links to go directly to the content they want but also allow novices to browse and slowly increase the complexity of the material throughout the page.  This gradual increase in complexity of content is intended to range from basic to somewhat generalizable across researchers, so that a reader can have some basic understanding of the topic before heading directly to the particular web-based (Fred Hutch sponsored or otherwise), in-person training/office hours, or on-campus expert to discuss or learn about their project in more detail.

### Available Resources
Given that we are not intending to write comprehensive explanations of how things are done, the Available Resources sections in our Wiki are really the intended endpoint for our readers. This section should focus on linking to comprehensive and established external educational resources of interest to the topic, online training tools from established entities, additional more detailed Fred Hutch documentation provided by Fred Hutch based experts/providers, in-person training opportunities at the Fred Hutch or locally, and if possible and approved by the expert, specific highlights of on-campus experts in a given field who are willing and able to provide consulting or advice on the topic.  Please make sure all links to any other site are correct and tested!!!!

If a content section is relatively short and cohesive, there should be one Available Resources section at the bottom of the page.  However, as content sections grow and perhaps themes evolve, consider having a specific Available Resources section after the end of a unified topic section for which the resources mentioned are thematically related.  


## Inserting Links and Placeholders

If you would like to insert a link to another page in our site, please use:  
`<!-- INSERT INTERNAL LINK -->`

If it is a link to an external site use:  
`<!-- INSERT EXTERNAL LINK -->`  

If you want to put in an image, use:  
`<!-- INSERT IMAGE FROM THIS LINK:  https://example.com -->`

If you want to insert links to publications as references, put:
`<!-- INSERT REFERENCES HERE -->`


These flags will alert contributors, admin and reviewers to the need for another round of edits.  Internal links can be set up by Wiki admins, but other types of insertions can be done by anyone.  


## In-text Images Temporary (hopefully) Hack
If you'd like to add images to your text, use Atom or VSCode both have packages/plugins that can allow for copy/paste accessibility for easy adding and organizing of images.  You can read some instructions on how to get set up with VSCode in one of the Computing Demo's.  

One edit is that in order for Jekyll to correctly render the images in a page, the following text is the example format that that call to the image needs to be in for a markdown in the "_compdemos" folder:
```
![]({{ site.baseurl }}/compdemos/assets/2018-06-13-16-47-59.png)
```
If the markdown you are editing is in one of the other folders you'll need to change the `compdemos` string to whatever the text of your folder is.  

Both Atom and VSCode will make a directory called `assets` in the directory where the markdown is, and then will copy your in-text image file there so you can commit it all to the repo.  However, for now, when pull requests get merged, if a file is added to an asset folder in the pull request then that file needs to be COPIED to the main directory `assets` folder.  **NOTE:** Please don't MOVE the file there.  Amy will go back and clean up any files that are in both the main assets folder AND a subfolder's asset folder when we fix this hack.  

## Referencing a Fred Hutch username
Please if you need to reference a Fred Hutch username, do not write the entire email address out, just put the username in backticks like this:
```
`username`
```
