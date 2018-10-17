# Contributing
This curated Wiki is just that, curated and a wiki, and as such relies upon the Fred Hutch research community itself to improve, expand and evolve over time.  Because the content of this Wiki spans a wide range of research realms, we need and welcome contributions from a similarly wide range of researchers whether as novice reviewers for a topic outside of their particular domain of expertise or as expert contributors for those topics of most interest to them.  No contribution is too little (or too large), and this section describes the various modes and types of contributions each researcher on the Fred Hutch campus can make to this effort.  

The strength of the Wiki lies in it's collaborative and unified approach. To facilitate the curation of content seen in this site, we have employed a GitHub repository to which any Fred Hutch based researcher can be a part of and contribute to.  The instructions for how to get started via GitHub are below as well as additional information about the ways to communicate with and participate in the Wiki Contributor team in other ways as well.

## Contributing Directly Via GitHub

We manage the content of this site via a set of markdown files that contain long article-style text with an emphasis on the use of outline structures to allow related content to show up near each other but with the ability to use the automatically rendered Table of Contents to allow users to jump around the documents.  

To edit one of the content-containing markdowns (see below regarding Repo structure for more info about where these markdowns are), the process for each user is:

  1. Create a branch off the master branch for your edits (do not fork the repo or create branches of branches).  Consider naming the branch in such a way that indicates what domain the edits will primarily be in (such as "generation-typos" or "intro-to-rhino").  Avoid making branches with uninformative names if at all possible, as in order for your content to be merged into the master, it will need to be edited by others, and it is possible that others may have substantial content to add to your content.  If the branches are named according to content being added (generally) then others can contribute to that content too.  
  2. Commit your edits to existing markdowns as you go, and update from the master branch before continuing to work on your branch.  You will reduce future conflicts if you get in the habit of updating from the master and committing frequently.  
  3. Publish/push your branch to GitHub to save your work and let us know you're working on something.
  4. When you are done editing, create a pull request from your branch.  Suggest reviewers based on the content of the edits.  Request admin assistance if your content may be new and need to be hooked up to the sidebar or other web-specific needs (this is currently done by tagging `vortexing` or `bmcgough` for a review).  
    >Note: If you are editing existing content and the page has a listing for the Primary Reviewers like this:  `primary_reviewers: somegithubusername` then when you submit the pull request please request a review from those usernames.  
  5. Reviewers will sign off on edits by approving or providing comments on a pull request, ideally one "expert" and one "novice" based on field of expertise.  If there is a `primary_reviewer` listed for content then one of the reviews must be from one of those members.  Others may move your content to combine it with other work, or make edits that you may want to review as well.  Keep an eye on your pull requests and comments on it in order to check back in if someone's edits need your review as well.  
  6. Once reviews have been obtained, the pull request can be merged into the master and then any edits go live to the site [here.](https://sciwiki.fredhutch.org/)


>Afterwards:  Please remember to make a [markdown for yourself](https://github.com/FredHutch/wiki/blob/master/_drafts/contributorTemplate.md) in our `_contributors` directory so that we can give you credit for your contributions publicly on the site.


## Wiki Content Style Guide
### Github-Flavored Markdown
The content of this site is generated using GitHub "flavored" markdown.  A cheat sheet for the code required to use things like headings and table is [here.](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Our page TOC's are generated from these headings, so use ## H2 as your first level, and headings H2, H3 and H4 show up automatically in our TOC's).

### Content Structure
Our goal is the generate article-style content (with the exception of the demo's pages), with the following general sections:

#### Introduction
An introductory paragraph explaining the summary of the content of the page must be included and be interpretable for a novice OR expert.  This paragraph is a good place to define commonly used words that may be domain-specific or be used with a domain-specific definition.  Also include a description or set of examples that might highlight why the reader might want to keep reading for a novice and an expert.  Good examples of this would have direct relationships to one's research project that would allow the reader to understand a bit about how the content might impact the research one does.  

#### Graduated Content
The main content of the pages is up to you to structure.  Keep in mind that the purpose of these articles is mainly to provide enough background for a variety of readers to know what sorts of questions related to their particular research to pose when looking for in-person help in the course of their research.  Endeavor to use headings to separate text in such a way that an advanced user could use the TOC links to go directly to the content they want but also allow novices to browse and slowly increase the complexity of the material throughout the page.  This gradual increase in complexity of content is intended to range from basic to somewhat generalizable across researchers, so that a reader can have some basic understanding of the topic before heading directly to the particular web-based (Fred Hutch sponsored or otherwise), in-person training/office hours, or on-campus expert to discuss or learn about their project in more detail.

#### Available Resources
Given that we are not intending to write comprehensive explanations of how things are done, the Available Resources sections in our Wiki are really the intended endpoint for our readers. This section should focus on linking to comprehensive and established external educational resources of interest to the topic, online training tools from established entities, additional more detailed Fred Hutch documentation provided by Fred Hutch based experts/providers, in-person training opportunities at the Fred Hutch or locally, and if possible and approved by the expert, specific highlights of on-campus experts in a given field who are willing and able to provide consulting or advice on the topic.  Please make sure all links to any other site are correct and tested!!!!

If a content section is relatively short and cohesive, there should be one Available Resources section at the bottom of the page.  However, as content sections grow and perhaps themes evolve, consider having a specific Available Resources section after the end of a unified topic section for which the resources mentioned are thematically related.  


### Inserting Links and Placeholders

If you would like to insert a link to another page in our site, please use:  
```
[text you want to have highlighted](/page_name/)
```

If it is a link to an external site use:  
```
[text you want to have highlighted](https://my.url.com)
```


### In-text Images
If you'd like to add images to your text, use Atom or VSCode both have packages/plugins that can allow for copy/paste accessibility for easy adding and organizing of images.  You can read some instructions on how to get set up with VSCode in one of the Computing Demo's.  

One edit is that in order for Jekyll to correctly render the images in a page, the following text is the example format that that call to the image needs to be in for a markdown in the **_compdemos** folder:
```
![]({{ site.baseurl }}/compdemos/assets/2018-06-13-16-47-59.png)
```
If the markdown you are editing is in one of the other folders you'll need to change the `compdemos` string to whatever the text of your folder is.  

Both Atom and VSCode will make a directory called `assets` in the directory where the markdown is, and then will copy your in-text image file there so you can commit it all to the repo.  

### External Videos and Images

#### Youtube

When linking to videos such as screencasts you typically want to show an image screenshot and clicking on that screenshot starts the video. Images of videos are stored at https://img.youtube.com/vi and they use the same video id you find in Youtube URLs, so The Gift of Time is ```https://youtu.be/rN7cmb1K2yA```. To embed, insert this into markdown:

    [![The Gift of Time](https://img.youtube.com/vi/rN7cmb1K2yA/0.jpg)](https://youtu.be/rN7cmb1K2yA "Click to see The Gift of Time")

It is also important to consider the following parameters for videos from outside sources:
* `rel=0` - this restricts the related videos shown at the end of payback to videos from the same channel rather than account-based recommendations
* `iv_load-policy` - set to *1* to display video annotations by default and *3* to disable annotations

So the above link modified would be:

    [![The Gift of Time](https://img.youtube.com/vi/rN7cmb1K2yA/0.jpg)](https://youtu.be/rN7cmb1K2yA?rel=0&iv_load_policy=3 "Click to see the amazing kitten")

A good free screen cast tool (for Windows) is https://www.apowersoft.com/free-online-screen-recorder


### Referencing a Fred Hutch username
Please if you need to reference a Fred Hutch username, do not write the entire email address out, just put the username in backticks like this:
```
`username`
```



## Repo structure

### Folders and Files that may be Edited:
####  Draft Folders with Templates for New Content
>NOTE:  All draft content should be stored in the `draft` folder until it is ready for publication, and then an admin will move it to where it needs to go if it is new content, OR the writer can move demo's themselves when they are ready to go live.  

For new content: https://github.com/FredHutch/wiki/blob/master/draft/contentTemplate.md

For new contributor entries: https://github.com/FredHutch/wiki/blob/master/draft/contributorTemplate.md

####  Folders with Existing Content
Data Generation Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_generation

Bioinformatics Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_bioinformatics

Bioinformatics Resource Library (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_infdemos

Computing Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_computing

Computing Resource Library (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_compdemos

Contributors List (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_contributors



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

## Building the site locally

You may want to build the site locally
(on your own computer) to make sure
that it looks like you expect it to
before pushing your changes.

### Steps

1. Install Ruby (version 1.9.2 or later).
**Note**: most modern Mac computers already have Ruby installed. If you still need Ruby,
it can be found [here](https://www.ruby-lang.org/en/downloads/).

1. You may need to install `bundler`. Type
   `which bundler` to see if it is already
   installed. If nothing is returned, then
   install `bundler` with `gem install bundler`.
   If that fails, try `sudo gem install bundler`.

1. To build and view the site locally, type
   `bundle install`  then enter `bundle exec jekyll serve`. Once the
   site is built you can view it at
   [http://localhost:4000](http://localhost:4000).


## Checking for broken links
To check for broken links, you can type
`rake test`. This will exit with an error if there
are any broken links, and list the broken
links and the files they are found in.

If you are inside the Fred Hutch network, you can type
`rake testlocal` and that will include internal URLs
in the check (these are normally excluded because CircleCI does
not have access to them).

You can also look at the most recent
[CircleCI build](https://circleci.com/gh/FredHutch/wiki) to see
the list of broken links.
