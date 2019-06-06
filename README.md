> Note on the AllFredHutch team.  We want everyone included, but GitHub can be chatty.  Go [here](https://help.github.com/articles/watching-and-unwatching-team-discussions/) to see how to set your personal settings to NOT automatically watch every team you are part of.  

# Contributing to this wiki
This curated Wiki relies upon the Fred Hutch research community itself to improve, expand and evolve over time.  Because the wiki's content spans many research areas, we need and welcome contributions from a similarly wide range of researchers and Fred Hutch staff whether as novice reviewers for a topic outside of their expertise or as expert contributors for those topics of most interest to them.  No contribution is too little (or too large).  We have recently opened up the ability to contribute to allow public contributions, with the contributions being reviewed by those Fred Hutch members who opt-in to the Wiki-Reviwer GitHub team.  If you'd like to be added to the Wiki-Reviewer team, please email Fred Hutch username `sciwki` and provide your GitHub username.  

# Details
[Content Contribution and Review Process](#content-contribution-and-review-process)

[Contributing via an external editor](#contributing-via-an-external-editor)

[Wiki content style guide](#wiki-content-style-guide)

[Repository structure](#repo-structure)

[Building a copy of this Wiki locally](#building-the-site-locally)

[For Admins](#for-admins)


## Content Contribution and Review Process

We manage the content of this site via a set of markdown files that contain long article-style text and a handful of cookbook/demo style documents (Resource Libraries). Articles use an outline structure to allow graduated content, starting from basic information and progressing to more detailed content for expert users/readers. Using headers (H2 through H4) in the text allows the automatically rendered Table of Contents to facilitate readers' ability to jump around the documents to get to needed content.  Resource Library entries can use headers as well to population the Table of Contents, but these documents are intended to be fairly detailed examples or content that is linked to by Articles, but address a specific use case or example scenario that may be only intended for advanced users/readers.  Both Articles and Resource Library entries are full-text searchable using the search feature (the magnifying glass in the header).  This search ability is the primary strength behind this Wiki, as members of the community providing content are not web designers, but no existing documentation source yet allows community members to search full text.   

### Adding/Editing Content

To edit one of the content-containing markdowns (see below regarding Repo structure for more info about where these markdowns are) from GitHub, follow these steps:

1. **For those users in the Fred Hutch institution**, please create a branch off the master branch for your edits. Do not fork the repo or others cannot submit additional edits to your content. Consider naming the branch in such a way that indicates what domain the edits will primarily be in (such as "generation-typos" or "intro-to-rhino").  Avoid making branches with uninformative names whenever possible. For your content to be merged into the master, it will need to be edited by others, and it is possible that others may have substantial content to add to your edits.  If the branches are named according to content being added (generally) then others can contribute to that content too.  
  - **For those users outside the Fred Hutch institution**, the easiest way to contribute is actually via one of the "Edit this Page" links on all of our pages.  GitHub will force you to fork the repository, which is fine but does not allow anyone else to edit your edits!  This method does focus your contributions to more targeted improvements and corrections and is a great way to weigh in to the evolution/discussion.  Remember to submit your pull request promptly to highlight your edits for the Wiki-Reviewers team.  
2. Publish/push your branch to GitHub to save your work and let us know you're working on something.
3. Commit your edits to existing markdowns as you go and push those edits to GitHub when finished with an editing session. Remember to pull a new copy of the branch prior to editing in case other people have contributed to your branch too!
4. When you are done editing, create a pull request from your branch to the master.  Suggest reviewers based on the content of the edits if that user is not part of the Wiki-Reviewer team.  Request admin assistance if your content may be new and need to be hooked up to the sidebar or other web-specific needs (this is currently done by tagging `vortexing` or `bmcgough` for a review).  

    >Note: If you are editing existing content and the page has a listing for the Primary Reviewers like this:  `primary_reviewers: somegithubusername` then when you submit the pull request please request a review from those usernames.  

5. Reviewers will sign off on edits by approving or providing comments on a pull request, ideally one "expert" and one "novice" based on field of expertise.  If there is a `primary_reviewers` listed for content then one of the reviews must be from one of those members.  Others may move your content to combine it with other work, or make edits that you may want to review as well.  Keep an eye on your pull requests and comments on it in order to check back in if someone's edits need your review as well.  
6. Once reviews have been obtained, the pull request can be merged into the master and then any edits go live to the site [here.](https://sciwiki.fredhutch.org/)

### The Review Process
This Wiki is intended to be a consistent, consolidated place for contributions from both inside and outside the Fred Hutch community but curated by Fred Hutch community members via the Wiki-Reviewer team.  We use the `primary_reviewers` tag in our markdowns to indicate when there is a resident expert who should be contacted via pull request review requests when content in that markdown is edited or added to.  This process of contribution and review from multiple different users allows us to make sure that the content evolves in such a way that it it both more interpretable to the intended audience (Fred Hutch affiliated staff and collaborators), but also accurate, appropriate and continuously reviewed.  

Currently only one approving review of the content from a member of the Wiki-Reviewer team is required for a pull request to be merged.  Ideally before this point, a novice reviewer would weigh in with edits to the text, and an expert reviewer would provide the approving review.  To bring your content/edits to the attention of the community for editing and review, please submit a pull request from your branch to the master.  


### Getting Credit
Please remember to make a [markdown for yourself](https://github.com/FredHutch/wiki/blob/master/_drafts/contributorTemplate.md) in our `_contributors` directory so that we can give you credit for your contributions publicly on the site if you would like to.  

## Contributing via an external text editor
You can also contribute to the wiki from external editors that can interoperate with GitHub. We have had good experience with [Atom](https://github.atom.io/) but other text editors have GitHub integration as well.  Also there is a tutorial on how to use [VSCode](https://sciwiki.fredhutch.org/compdemos/vscode_markdown_howto/) which is what you will want to use if you plan to contribute many screenshots or other images.  

## Wiki Content Style Guide
### Github-Flavored Markdown
The content of this site is generated using GitHub "flavored" markdown.  A cheat sheet for the code required to create things like headings and table is [here.](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Our page TOC's are generated from these headings, so use ## H2 as your first level, and headings H2, H3 and H4 show up automatically in our TOC's).

### Content Structure
Our goal is the generate article-style content (with the exception of the demo's/resource library pages), with the following general sections:

#### Introduction
An introductory paragraph summarizing the page must be included and should be comprehensible for novices and experts alike.  This paragraph is a good place to define domain-specific words that appear in your article.  Also include a description or set of examples that might highlight why the reader might want to keep reading, whether they are novice or expert.  Good introductions can use your own research project to give the reader some context.

#### Graduated Content
The main content of the pages is up to you to structure.  Keep in mind that the wiki's articles are meant to provide enough background for a variety of readers to know what sorts of questions related to their particular research to pose when looking for in-person help.  Create headings that an advanced user could use the TOC links to go directly to the content they want while novices can also browse and slowly increase the complexity of the material throughout the page.  This gradual increase in content complexity from basic to advanced will give a reader some basic understanding of the topic before heading directly to the particular web-based (Fred Hutch sponsored or otherwise), in-person training/office hours, or on-campus expert to discuss or learn about their project in more detail.

#### Available Resources
Since we are not intending to write comprehensive explanations of every topic we touch on, the Available Resources sections or in-text links in our Wiki are really the intended endpoint for our readers. This section should focus on linking to comprehensive and established external educational resources of interest to the topic, online training tools from established entities, additional more detailed Fred Hutch documentation provided by Fred Hutch based experts/providers, in-person training opportunities at the Fred Hutch or locally, and if possible and approved by the expert, specific highlights of on-campus experts in a given field who are willing and able to provide consulting or advice on the topic.  Please make sure all links to any other site are correct and tested!!!!


### Inserting Links

If you would like to insert a link to another page in our site, please use:  
```
[text you want to have highlighted](/domain/page_name/)
```

If it is a link to an external site use:  
```
[text you want to have highlighted](https://my.url.com)
```


### In-text Images
If you'd like to add images to your entry, some text editors (eg. Atom or VSCode via their respective plugins) allow for copy-and-pasting of images.  You can read some instructions on how to get set up with VSCode in one of the Computing Demo's.  

One edit is that in order for Jekyll to correctly render the images in a page, the following text is the example format that that call to the image needs to be in for a markdown in the **_compdemos** folder:
```
![]({{ site.baseurl }}/compdemos/assets/2018-06-13-16-47-59.png)
```
If the markdown you are editing is in one of the other folders you'll need to change the `compdemos` string to whatever the text of your folder is.  

Both Atom and VSCode will make a directory called `assets` in the directory where the markdown is, and then will copy your in-text image file there so you can commit it all to the repo.  

### External Videos and Images

#### Youtube

When linking to videos like screencasts you typically want to show an image screenshot and clicking on that screenshot starts the video. Images of videos are stored at https://img.youtube.com/vi and they use the same video id you find in Youtube URLs, so The Gift of Time is ```https://youtu.be/rN7cmb1K2yA```. To embed, insert this into markdown:

    [![The Gift of Time](https://img.youtube.com/vi/rN7cmb1K2yA/0.jpg)](https://youtu.be/rN7cmb1K2yA "Click to see The Gift of Time")

It is also important to consider the following parameters for videos from outside sources:
* `rel=0` - this restricts the related videos shown at the end of payback to videos from the same channel rather than account-based recommendations
* `iv_load-policy` - set to *1* to display video annotations by default and *3* to disable annotations

So the above link modified would be:

    [![The Gift of Time](https://img.youtube.com/vi/rN7cmb1K2yA/0.jpg)](https://youtu.be/rN7cmb1K2yA?rel=0&iv_load_policy=3 "Click to see the amazing kitten")

If you need to make screencasts, free software exist for [Windows](https://www.apowersoft.com/free-online-screen-recorder), [Linux](https://launchpad.net/kazam), and [OSX](https://www.webascender.com/blog/free-screencast-software-built-right-mac-os-x/).

### Referencing a Fred Hutch username
Please if you need to reference a Fred Hutch username, do not write the entire email address out, just put the username in backticks like this:

```
`username`
```


## Repo structure

### Folders and Files that may be Edited:
####  Draft Folders with Templates for New Content
>NOTE:  Any draft content should be stored in the `draft` folder until it is ready for publication, and then an admin will move it to where it needs to go if it is new content, OR the writer can move demo's themselves when they are ready to go live.  

For new content: https://github.com/FredHutch/wiki/blob/master/draft/contentTemplate.md

For new contributor entries: https://github.com/FredHutch/wiki/blob/master/draft/contributorTemplate.md

####  Folders with Existing Content
Data Generation Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_generation

Data Generation Resource Library (note all markdowns in this folder will be rendered once merged into the master): https://github.com/FredHutch/wiki/tree/master/_gendemos

Scientific Computing Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_scicomputing

Scientific Computing Resource Library (note all markdowns in this folder will be rendered once merged into the master): https://github.com/FredHutch/wiki/tree/master/_compdemos

Contributors List (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_contributors



## Building the site locally

You may want to build a copy of this wiki locally (on your own computer) to make sure that it looks the way you want before pushing your changes.

### Steps

1. clone the repo somewhere
1. Install Ruby (version 1.9.2 or later).
**Note**: most modern Mac computers already have Ruby installed. If you still need Ruby,
it can be found [here](https://www.ruby-lang.org/en/downloads/).
1. On Mac, install xcode commandline tools `xcode-select --install`

1. You may need to install `bundler`. Type
   `which bundler` to see if it is already
   installed. If nothing is returned, then
   install `bundler` with `gem install bundler`.
   If that fails, try `sudo gem install bundler`.

1. You may need to install gems used by the site.
   Type `gem install -g Gemfile` to install all of the gems the site uses.

1. To build and view the site locally, from the cloned repo directory run
   `bundle install` then run `bundle exec jekyll serve`. Once the
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


## For Admins (everyone else, please do not edit these as your edits will be ignored/removed)

### Pages that run Demo and Contributors Collection pages:
Generation resource library collection page:  https://github.com/FredHutch/wiki/blob/master/generationdemos.md

Scientific Computing resource library collection page:  https://github.com/FredHutch/wiki/blob/master/computingdemos.md

SciComp Announcement resource library collection page:  https://github.com/FredHutch/wiki/blob/master/scicompannounce.md

Contributors list collection page: https://github.com/FredHutch/wiki/blob/master/contributorslist.md

### Folders containing website configuration files
Main website configuration file: https://github.com/FredHutch/wiki/blob/master/_config.yml

Navigation yml:
https://github.com/FredHutch/wiki/tree/master/_data

Custom styling that overrides the remote theme:
https://github.com/FredHutch/wiki/tree/master/assets/css

Header and footer configs:
https://github.com/FredHutch/wiki/tree/master/_includes
