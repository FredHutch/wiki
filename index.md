---
title: About this Project
layout: splash
permalink: /
header:
  overlay_color: "#000"
  overlay_filter: "0.5"
  overlay_image: /images/campus.jpeg
excerpt: "The Biomedical Data Science Wiki project aims to create a curated collection of biomedical data science and research computing documentation regarding policies, resources and tools supporting data intensive research available both to researchers at large and at the Fred Hutch. "
feature_row:
  - title: "Data Science"
    excerpt: "This domain contains documentation supporting reearchers doing biomedical data science at the Hutch and beyond curated by the Fred Hutch Data Science Lab."
    url: /datascience/ds_index/
    btn_label: "Read More"
    btn_class: "btn--info"
  - title: "Scientific Computing"
    excerpt: "This domain houses researcher-oriented documentation for high performance computing and data management tools supported by Fred Hutch Center IT as provided by the Scientific Computing group (SciComp). "
    url: /scicomputing/comp_index/
    btn_label: "Read More"
    btn_class: "btn--info"
  - title: "Hutch Data Core"
    excerpt: "This domain describes resources provided by the Hutch Data Core, a group within Shared Resources supporting the bioinformatics and data-intensive research at Fred Hutch downstream of our Shared Resources."
    url: /hdc/hdc_index/
    btn_label: "Read More"
    btn_class: "btn--info"
fhDaSL:
  - image_path: /images/FH-virtual-backgrounds-00019.png
    alt: "placeholder image dasl"
    title: "FH DaSL"
    excerpt: 'Learn more about the Fred Hutch Data Science Laboratory'
    url: "https://data.fredhutch.org"
    btn_label: "Link Out"
    btn_class: "btn--primary"
TDSirc:  
  - image_path: /images/frehutch-withjerry.jpeg
    alt: "placeholder image tds"
    title: "Fred Hutch TDS IRC"
    excerpt: 'Learn more about the Fred Hutch Translational Data Science Integrated Research Center'
    url: "https://www.fredhutch.org/en/research/institutes-networks-ircs/translational-data-science-integrated-research-center.html"
    btn_label: "Link Out"
    btn_class: "btn--primary"
feature_row2:
  - title: "How to Contribute"
    excerpt: "This project relies upon the Fred Hutch research community itself to improve, review, expand and evolve over time. The content spans a wide range of research realms and thus we welcome contributions from a similarly wide range of researchers and staff. Find more information on how to contribute here."      
    url: https://github.com/FredHutch/wiki/blob/main/README.md
    btn_label: "Read More"
    btn_class: "btn--info"
  - title: "Our Contributors"
    excerpt: "The content of this Wiki is generated through the work of researcher and staff content providers, novice and expert reviews, and valuable editing input. Find out more about who has made this site what it is here."
    url: /contributors/
    btn_label: "Read More"
    btn_class: "btn--info"
  - title: "Data Generation"
    excerpt: "This domain is being deprecated but contains information that ranges from important IRB and human subjects privacy matters to human specimen banking and processing, to large scale molecular profiling."
    url: /generation/gen_index/
    btn_label: "Read More"
    btn_class: "btn--info"
---
{% include feature_row %}

{% include feature_row id="fhDaSL" type="left" %}

{% include feature_row id="TDSirc" type="right" %}

{% include feature_row id="feature_row2"%}
