# Contributing to SciWiki
This curated Wiki relies upon the Fred Hutch research community itself to improve, expand and evolve over time.  Because the Wiki's content spans many research areas, we need and welcome contributions from a similarly wide range of researchers and Fred Hutch staff.  Whether this contribution is as novice reviewers for a topic outside of their expertise or as expert contributors for those topics of most interest to them, no contribution is too little (or too large).

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

The shorter, more focused, Resource Library entries can use headers as well to population the Table of Contents.  These documents are intended to be fairly detailed examples or content that is linked to by Articles, but address a specific use case or example scenario that may be only intended for advanced users/readers.  Once a number of related Resource library entries are created, Editors may consider consolidating the information and moving it into the main site as a full Article to highlight the content to new readers.  

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
4. When you are done editing, create a pull request from your branch. This pull request step highlights your branch for consideration by potential contributors and editors! Suggest reviewers based on the content of the edits.  Request admin assistance if your content may be new and need to be hooked up to the sidebar or other web-specific needs (this is currently done by tagging `vortexing` or `bmcgough` for a review).  

    >Note: If you are editing existing content and the page has a listing for the Primary Reviewers like this:  `primary_reviewers: somegithubusername` then when you submit the pull request please request a review from those usernames.  

5. Reviewers will sign off on edits by approving or providing comments on a pull request, ideally one "expert" and one "novice" based on field of expertise.  If there is a `primary_reviewers` listed for content then one of the reviews must be from one of those members.  Others may move your content to combine it with other work, or make edits that you may want to review as well.  Keep an eye on your pull requests and comments on it in order to check back in if someone's edits need your review as well.  
6. Once reviews have been obtained, the pull request can be merged into the master and then any edits go live to the site [here.](https://sciwiki.fredhutch.org/)

### The Review Process
This Wiki is intended to be curated by content owners, local experts, and service providers at the Fred Hutch in order to ensure accuracy and relevancy to our community.  Thus, contributions and reviews can only be made by users who have GitHub usernames affiliated with the Fred Hutch institution.  We use the `primary_reviewers` tag in our markdowns to indicate when there is a resident expert who should be contacted via pull request review requests when content in that markdown is edited or added to.  This process of contribution and review from multiple different users allows us to make sure that the content evolves in such a way that it it both more interpretable to the intended audience (Fred Hutch affiliated staff), but also accurate, appropriate and continuously reviewed.  Currently only one approving review of the content is required for a pull request to be merged. 


### Getting Credit
Please remember to make a [markdown for yourself](https://github.com/FredHutch/wiki/blob/master/_drafts/contributorTemplate.md) in our `_contributors` directory so that we can give you credit for your contributions publicly on the site if you would like to.  

## Contributing via an external text editor
You can also contribute to the wiki from external editors that can interoperate with GitHub. We have had good experience with [Atom](https://github.atom.io/) but other text editors have GitHub integration as well.  Also there is a tutorial on how to use [VSCode](https://sciwiki.fredhutch.org/compdemos/vscode_markdown_howto/) which is what you will want to use if you plan to contribute many screenshots or other images.  