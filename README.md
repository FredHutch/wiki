# wiki
Collective KnowledgeBase for Science

## Overview of Content Planned

Three Domains:
- Data Generation
- Bioinformatics
- Scientific Computing


The goal for each of the three main domains covered in this site would be to have multi-tiered content such that the following levels are represented:
1.  Landing page that serves to introduce the domain itself to a novice reader and orient them to the categories of content specific to the domain that will be covered in additional pages.
2.  A set of 3-5 categories of content related to the domain in which each category has enough detailed description of the preliminaries required for a person with intermediate experience can interpret the content and know which level 3 content they might be interested in.  
3.  Final level detailed documentation intended to be consumed by experts in the domain.  


## Content Structure
We are housing the page content in the /pages directory in this repo.  The pages that correspond to the three domains live in the folder specific to each domain simply to organize them within the repo, as the permalink in the front matter of each page is what determines the url of the final rendered page.  

Each domain will have:
- an x_index.md:  This is the landing page for the domain that explains the basics of what the domain includes and should be interpretable for novice+ readers.
- any x_topicOverview.md pages:  There needs to be one page PER folder in the sidebar of each domain that serves as an overview for the topic.  These pages are the landing pages for those topics and should be interpretable for novice+ readers.  
- /folderitems/x_topicDetails.md pages:  There is a "folderitems" directory in each of the domain directories where we will store the markdowns containing the more detailed pages listed in each Folder of the sidebar.  Consider using page prefixes for these filenames (and their permalinks), that indicate what Folder in the sidebar they correspond to (e.g., clinSpec_clinicalcov.html for a page in the Clinical and Specimen folder).  These pages should aim to have initial introductory material that is interpretable to an intermediate+ reader, and then additional detail lower in the page that can be for expert only readers.  

*In the future, we may consider moving to a structure like this:  
- Landing pages:  Novice+
- Folder items: Intermediate+
- Subfolder items: Expert+

BUT, this would be the case only if someone makes a really good case that for a specific topic, this structure is needed due to the large amount of documentation required.  In the short term, we should aim to make more Folder topics that go less deep for ease of use/findability.*

## New Page Front Matter
All new pages should be organized into the folder within the /pages directory in this repo that corresponds to their domain (generation, bioinformatics, computing).  The actual page location inside the website, sidebars and formatting is then set by the YAML front matter that is required.  

Example front matter:
*NOTES:* Options for alternate values for each variable for our instance are commented out, and remember that YAML requires exact spacing.  

```
---
title: Clinical Covariates and Specimens
keywords: Jordan Smith, Amy Paguirigan
last_updated: April 25, 2018
#summary: "Landing page for IRB Resources at the Fred Hutch"
sidebar: generation_sidebar #bioinformatics_sidebar, scicomp_docs_sidebar
permalink: gen_clinLanding.html
layout: page
search: include #exclude
published: true #false
#tags: [formatting]
---
```

### Variable Explanations:
1.  "title":  The title that will appear on the top of the frame where your markdown text will go.
2.  "keywords": Currently these are the contributors or people who should be expert reviewers for any content updates, but this may not be the place for this long term.  When using the search feature on the site, adding these keywords will bring up pages associated with them even if the word does not show up in the page.  
3.  "last_updated": When an edit is made to the content of the page, update this to the date it was made.
4.  "summary": This puts another line under the title of the page.  For now we are not using this.
5.  "sidebar": We have three different sidebars, one for each domain, and this is where you specify which one you want to use on this particular page.  
6.  "permalink": Indicates the final url that the page will be rendered to once it's converted into an html.  Our plan is to have the page name begin with "gen_" for data generation domain pages, "inf_" for bioinformatics pages, and "comp_" for computing pages.  Be sure to include the .html, and  no initial "/".  **NOTE:** We should aim to have the name of the md be the same as the html in the permalink so things are less confusing!! However this is not required by Jekyll.  
7.  "layout": Keep this as page, as this tells Jekyll how to render the page.
8.  "search": "include" will include the page in the search feature, and "exclude" will exclude it.
9.  "published": "true" will render the page in the public site, and "false" will prevent that.  We will use this in order to curate new content and will keep this value set to "false" until it is decided that we want it to go public.  
10.  "tags": These will actually show on the bottom of the pages and work better in the context of posts than pages.  For now we are not using them.  
