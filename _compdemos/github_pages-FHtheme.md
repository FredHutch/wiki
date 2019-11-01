---
title: Fred Hutch Inspired GitHub Pages Websites
main_author: Amy Paguirigan
---
The Biomedical Data Science Wiki site, as well as the [Fred Hutch Bioinformatics Interest Group](https://fredhutch.github.io/FHBig/) are now using a user-customized common theme that is Fred Hutch "inspired".  One important use of GitHub repositories for Bioinformatics is the ability to use GitHub Pages to spin up custom documentation or other content containing websites.  While the theme you use is completely up to you, after much tweaking this site and FHBig, we have created a Fred Hutch GitHub repository that contains a template website that will allow you to hit the ground running with your doc's sites while also making the sites look a bit more Fred Hutch inspired.  

The repository can be found [here, at the Fred Hutch FH-minimal-mistakes repo.](https://github.com/FredHutch/FH-minimal-mistakes)  It is a customized version of the theme [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) and uses this theme as a remote theme (meaning when the developer updates their site, yours will update too, forcing the majority of the maintenance to the developer rather than you!).  

Of note, if you want to retain the Fred Hutch colors, you MUST leave this line in the config.yml unchanged:
```
minimal_mistakes_skin: "contrast"
```
If you change the Minimal Mistakes skin to something other than "contrast" you will lose the Fred Hutch colors.  

Please contact Amy Paguirigan (`apaguiri`, sciwiki) or Chao-Jen Wong (`cwon2`, FHBig) for advice or commiseration in using this theme/repo, or go to the FHBig Slack Workspace (see the link at the bottom of this page), and ask your questions in the #wiki-contributors channel.  Given that this was simply community service effort, our documentation on how to use the theme repo is minimal at this point but we will endeavor to keep updating it as we continue to use the theme as well.  
