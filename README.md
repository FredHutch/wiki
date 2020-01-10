Would like to contribute? Please see our [CONTRIBUTING GUIDLINES](https://github.com/FredHutch/wiki/tree/master/CONTRIBUTING.md).

Want to learn more about the background and history of the wiki? 
Please see our [ABOUT PAGE](https://sciwiki.fredhutch.org/about/) on the Fred Hutch Biomedical Data Science Wiki.

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
