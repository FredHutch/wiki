# Contributing to SciWiki
This curated Wiki relies upon the Fred Hutch research community itself to improve, expand and evolve over time.  Because the Wiki's content spans many research areas, we need and welcome contributions from a similarly wide range of researchers and Fred Hutch staff.  Whether this contribution is as novice reviewers for a topic outside of their expertise or as expert contributors for those topics of most interest to them, no contribution is too little (or too large).

To contribute to the Wiki you only need to have your GitHub username added to the Fred Hutch Github Institution (and the AllFredHutchTeam).  Email `scicomp` and provide your GitHub username and request to be added.  If you are interested in being part of the Wiki Reviewers Team (see below for their role), please email `apaguiri` and Amy will add you to the GitHub team for that.  

# Outline of this document:
[Content Contribution and Review Process](#content-contribution-and-review-process)

[Contributing via an external editor](#contributing-via-an-external-editor)

[Wiki content style guide](#wiki-content-style-guide)

[Repository structure](#repo-structure)

[Building a copy of this Wiki locally](#building-the-site-locally)

[For Admins](#for-admins)


## Content Contribution and Review Process

### Content Types
We manage the content of this site via a set of markdown files that contain long, article-style text (our main pages in the site) and a handful of focused cookbook/demo-style documents (Resource Libraries). 

Articles use an outline structure to allow graduated content, starting from basic information and progressing to more detailed content for expert users/readers. Using headers (H2 through H4) in the text allows the automatically rendered Table of Contents to facilitate readers' ability to jump around the documents to get to needed content as well as the creation of anchors to allow for linking directly to portions of content in a longer page.  By keeping related text together in a small number of pages, it allows us to provide more context for people who are learning about a topic, allows finding of other related information a reader might not have known to look for, AND allows content providers to manage content in ONE PLACE rather than spread throughout the site.  

> Note: This site is created by researchers and staff who are not web designers nor technical writers by training!  Thus, we have opted for a relatively flat organizational structure to keep it simpler for content curators and to reduce the risk of information becoming stale and irrelevant as much as possible.  

The more focused, how-to style, Resource Library entries in both the Data Generation and Scientific computing domains can use headers as well to populate a Table of Contents for each of these pages.  These documents are intended to be fairly detailed examples or content that is linked to by Articles, but address a specific use case or example scenario that may be only intended for advanced users/readers.  Once a number of related Resource library entries are created, Editors may consider consolidating the information and moving it into the main site as a full Article to highlight the content to new readers.  

Both Articles and Resource Library entries are full-text searchable using the search feature (the magnifying glass in the header).  This search ability is the primary strength behind this Wiki and will be the primary way people will find content, as, again, no web designers or technical writers are involved in this grassroots project.  

### Adding/Editing Content

#### Methods to Edit
There are multiple ways to edit content on our site, including: 

For spot checks, small edits/refinements or those of us not familiar with git or GitHub:
- Clicking on the "Edit this Page" icon on any page, providing your edits, committing them to a branch and doing a pull request (GitHub will guide you in this process).

For larger edits, multi-page edits, structural changes or expert users of git/GitHub:
- Cloning the Wiki repository to your local machine, committing edits to a new branch, pushing those edits to GitHub and doing a pull request (requires knowledge of git and GitHub workflows). 

#### General Editing Process
To edit one of the content-containing markdowns (see below regarding Repo structure for more info about where these markdowns are) from GitHub, follow these steps:

1. Create a branch off the master branch for your edits. Do not fork the repo or others cannot submit additional edits to your content.  Consider naming the branch in such a way that indicates what domain the edits will primarily be in (such as "generation-typos" or "intro-to-rhino").  Avoid making branches with names that don't attempt to describe the types of changes made whenever possible. For your content to be merged into the master, it will need to be edited by others, and it is possible that others may have substantial content to add to your edits.  If the branches are named according to content being added (generally) then others can contribute to that content too.  
2. Commit your edits to existing markdowns as you go, and update from the master branch before continuing to work on your branch.  You will reduce future conflicts if you get in the habit of updating from the master and committing frequently.  
3. Publish/push your branch to GitHub to share your edits with the group.
4. When you are done editing, create a pull request from your branch. This pull request step highlights your branch for consideration by potential contributors and editors! Suggest reviewers based on the content of the edits if you'd like by tagging their GitHub usernames (using @...).  Request admin assistance if your content may be new and need to be hooked up to the sidebar or other web-specific needs (this is currently done by tagging `vortexing` or `bmcgough` for a review).  

    >Note: If you are editing existing content and the page has a listing for the Primary Reviewers like this:  `primary_reviewers: somegithubusername` then when you submit the pull request please request a review from those usernames.  

5. Reviewers will sign off on edits by approving or providing comments on a pull request, ideally one "expert" and one "novice" based on field of expertise.  If there is a `primary_reviewers` listed for content then one of the reviews must be from one of those members.  Others may move your content to combine it with other work, or make edits that you may want to review as well.  Keep an eye on your pull requests and comments on it in order to check back in if someone's edits need your review as well.  
6. Once approving reviews have been obtained, the pull request can be merged into the master and then any edits go live to the site [here.](https://sciwiki.fredhutch.org/)

### The Review Process
This Wiki is intended to be curated by content owners, local experts, and service providers at the Fred Hutch in order to ensure accuracy and relevancy to our community.  Thus, contributions and reviews can only be made by users who have GitHub usernames affiliated with the Fred Hutch institution.  We use the `primary_reviewers` tag in our markdowns to indicate when there is a resident expert who should be contacted via pull request review requests when content in that markdown is edited or added to.  This process of contribution and review from multiple different users allows us to make sure that the content evolves in such a way that it it both more interpretable to the intended audience (Fred Hutch affiliated staff), but also accurate, appropriate and continuously reviewed.  Currently only one approving review of the content is required for a pull request to be merged. 

When a pull request is made, it automatically requests a pull request review from any member of the [Wiki Reviewer Team](https://github.com/orgs/FredHutch/teams/wiki-reviewers).  Membership in this team is open to any Fred Hutch user who is interested.  Email `apaguiri` and Amy will add you to the team!


### Getting Credit
Please remember to make a [markdown for yourself](https://github.com/FredHutch/wiki/blob/master/_drafts/contributorTemplate.md) in our `_contributors` directory so that we can give you credit for your contributions publicly on the site if you would like to.  

## Contributing via an external text editor
You can also contribute to the wiki from external editors that can interoperate with GitHub. We have had good experience with [Atom](https://github.atom.io/) but other text editors have GitHub integration as well.  Also there is a tutorial on how to use [VSCode](https://sciwiki.fredhutch.org/compdemos/vscode_markdown_howto/) which is what you will want to use if you plan to contribute many screenshots or other images.  

## Wiki Content Style Guide
### Github-Flavored Markdown
The content of this site is generated using GitHub "flavored" markdown.  A cheat sheet for the code required to create things like headings and table is [here.](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Our page TOC's are generated from these headings, so use ## H2 as your first level, and headings H2, H3 and H4 show up automatically in our TOC's).

### Inserting Links

If you would like to insert a link to another page in our site, please use:  
```
[text you want to have highlighted](/domain/markdownfile_name/)
```

If it is a link to an external site use:  
```
[text you want to have highlighted](https://my.url.com)
```


### In-text Images
If you'd like to add images to your entry, some text editors (eg. Atom or VSCode via their respective plugins) allow for copy-and-pasting of images.  You can read some instructions on how to get set up with VSCode in one of the Computing Demo's.  

One edit is that in order for Jekyll to correctly render the images in a page, the following text is the example format that that call to the image needs to be in for a markdown in the **_compdemos** folder:
```
![](/compdemos/assets/2018-06-13-16-47-59.png)
```
If the markdown you are editing is in one of the other folders you'll need to change the `compdemos` string to whatever the text of your folder is and please leave out the underscore at the beginning of the folder name.  

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
The general contributor should likely have no reason/need to not edit any of the files in the main directory of the repository, nor in any other subfolders besides the ones described below.  The folders below contain the content portions of the site, while the other folders and files contain all the necessary information to actually BUILD the website itself.  

### Content-Housing Folders
Data Generation Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_generation

Data Generation Resource Library (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_gendemos

Scientific Computing Content, organized with filenames that start with xxx_ based on what section they are intended to show up in the sidebar: https://github.com/FredHutch/wiki/tree/master/_scicomputing

Computing Resource Library (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_compdemos

Contributors List (note all markdowns in this folder will be rendered): https://github.com/FredHutch/wiki/tree/master/_contributors


###  Draft Folders with Templates for New Content
>NOTE:  Any content that will need to be an entirely new page should be stored in the `draft` folder until it is ready for publication, and then an admin will move it to where it needs to go when it is considered finished.  

For new content: https://github.com/FredHutch/wiki/blob/master/_drafts/contentTemplate.md

For new contributor entries: https://github.com/FredHutch/wiki/blob/master/_drafts/contributorTemplate.md


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

Computing resource library collection page:  https://github.com/FredHutch/wiki/blob/master/computingdemos.md

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

### Other pages:
Our index page: https://github.com/FredHutch/wiki/blob/master/index.md
Our outreach page: https://github.com/FredHutch/wiki/blob/master/outreach.md
Our page containing rendered draft files: https://github.com/FredHutch/wiki/blob/master/drafts.md




