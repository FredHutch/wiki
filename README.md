## Contributing
This curated Wiki is just that, curated and a wiki, and as such relies upon the Fred Hutch research community itself to improve, expand and evolve over time.  Because the content of this Wiki spans a wide range of research realms, we need and welcome contributions from a similarly wide range of researchers whether as novice reviewers for a topic outside of their particular domain of expertise or as expert contributors for those topics of most interest to them.  No contribution is too little (or too large), and this section describes the various modes and types of contributions each researcher on the Fred Hutch campus can make to this effort.  

The strength of the Wiki lies in it's collaborative and unified approach. To facilitate the curation of content seen in this site, we have employed a GitHub repository to which any Fred Hutch based researcher can be a part of and contribute to.  The instructions for how to get started via GitHub are below as well as additional information about the ways to communicate with and participate in the Wiki Contributor team in other ways as well.

### Wiki Content Style Guide
Go here: https://github.com/FredHutch/wiki/blob/master/wikiStyleGuide.md, to see the current, and continually growing, style guide for content in this Wiki as decided upon by the Wiki Contributors group.  

### Contributing Directly Via GitHub

We manage the content of this site via a set of markdown files that
  1. Create a branch off the master branch for your edits.  Consider naming the branch in such a way that indicates what domain the edits will primarily be in (such as "generation-typos" or "computing-newcontent").  
  2. Commit any edits or new material to only the markdown files in the "pages" directory.  
  3. Publish/push your branch to GitHub to save your work and let us know you're working on something.
  4. When done editing, create a pull request from your branch.  Suggest reviewers based on the content of the edits.
  5. Reviewers will sign off on edits by approving or providing comments on a pull request, ideally one "expert" and one "novice" based on field of expertise.  
  6. Once pull requests are merged, then any edits go live to the site [here.](https://fredhutch.github.io/wiki/)

## Repo structure

### Folders and Files that may be Edited:
####  Draft Folders with Templates for New Content
NOTE:  All draft content should be stored in the `draft` folder until it is ready for publication, and then an admin will move it to where it needs to go if it is new content, OR the writer can move demo's themselves when they are ready to go live.  

For new content: https://github.com/FredHutch/wiki/blob/master/draft/contentTemplate.md

For new contributor entries: https://github.com/FredHutch/wiki/blob/master/draft/contributorTemplate.md

####  Folders with Existing Content
Data Generation Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_generation

Bioinformatics Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_bioinformatics

Bioinformatics Demos (note all markdowns in this folder will be rendered as demo's): https://github.com/FredHutch/wiki/tree/master/_infdemos

Computing Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_computing

Computing Demos (note all markdowns in this folder will be rendered as demo's): https://github.com/FredHutch/wiki/tree/master/_compdemos

Contributors List (note all markdowns in this folder will be rendered as contributors): https://github.com/FredHutch/wiki/tree/master/_contributors

### Please Do Not Edit these folders and files:
####  Pages that run Demo and Contributors Collection pages:
Computing:  https://github.com/FredHutch/wiki/blob/master/computingdemos.md

Bioinformatics:  https://github.com/FredHutch/wiki/blob/master/informaticsdemos.md

Contributors list: https://github.com/FredHutch/wiki/blob/master/contributorslist.md

#### Folders containing website configuration files
Main website configuration file: https://github.com/FredHutch/wiki/blob/master/_config.yml

Navigation yml:
https://github.com/FredHutch/wiki/tree/master/_data

Custom styling that overrides the remote theme:
https://github.com/FredHutch/wiki/tree/master/assets/css

Header and footer configs:
https://github.com/FredHutch/wiki/tree/master/_includes
