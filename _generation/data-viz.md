---
title: Data Visualization
primary_reviewers: k8hertweck
---

A growing area of large scale data analysis is the visualization and sharing of results of analyses.  Because of the utility of and need to communicate results and implications of often large and complex datasets in concise and clear ways, there has been an explosion of platforms, tools, software and approaches for data visualization.  While that is a boon to your research, as there is likely a good tool ready for you, it also can be overwhelming and challenging to choose a path to follow.  Here we have tried to provide a jump start for connecting with and applying data visualization tools and approaches at the Fred Hutch.  While this is not an exhaustive list, we have highlighted what tends to be the most commonly employed or easiest to access resources.

## Software for data visualization

### Desktop software

Fred Hutch's Center IT (CIT) supports a wide range of commonly used software at little to no cost to you! We've pulled out a shortlist of software relevant to data visualization, but you can view the entire software catalog [here](https://centernet.fredhutch.org/cn/u/center-it/software.html). Tableau, MATLAB, and Microsoft Excel all are great data visualization options for users who prefer a point and click data visualization option.

- [Tableau](https://www.tableau.com/)
  - [Internal: Fred Hutch Tableau FAQ](https://centernet.fredhutch.org/cn/u/tableau/faq.html)
  - [Internal: Tableau Hutch User Group](https://centernet.fredhutch.org/cn/u/tableau.html)
- [MATLAB](https://www.mathworks.com/products/matlab.html)
  - [Get Started with MATLAB](https://www.mathworks.com/help/matlab/getting-started-with-matlab.html)
  - [MATLAB at Fred Hutch](https://sharedresources.fredhutch.org/libresources/matlab)
- [Microsoft Excel](https://www.microsoft.com/en-us/microsoft-365/excel)

### Plotting in R

While it is possible to [plot using base R](https://bookdown.org/rdpeng/exdata/the-base-plotting-system-1.html), there are many packages available to make plotting easier and more visually appealing. Data visualization in R has been dominated by the `ggplot` package and a wealth of add-on packages that allow for further customization (such as `RColorBrewer` for color palettes and themes, etc). Meanwhile, the communication of data visualizations via interactive webapps like Shiny apps, are also R based and lend themselves well to displaying `ggplot` and `plotly` type visualizations.   

**Packages for plotting**

- [ggplot2](https://ggplot2.tidyverse.org/)
  - [ggplot2 cheatsheet](https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)
  - Fredhutch.io's [Introduction to R](https://github.com/fredhutchio/r_intro) course covers ggplot in [class 4](https://github.com/fredhutchio/r_intro/blob/master/class4.md)
- [Plotly](https://plotly-r.com/)
  - [Getting started with Plotly in ggplot2](https://plotly.com/ggplot2/getting-started/)
- [Shiny](https://shiny.rstudio.com/)
  - [Learn Shiny](https://shiny.rstudio.com/tutorial/)
  - [Mastering Shiny - Hadley Wickham](https://mastering-shiny.org/)
  - [Fred Hutch Biomedical Data Science Wiki entry on Shiny applications](https://sciwiki.fredhutch.org/compdemos/shiny/)

**Packages that extend ggplot capabilities**
- [ggbeeswarm](https://github.com/eclarke/ggbeeswarm)
- [ggtext](https://wilkelab.org/ggtext/)
- _read more about ggplot extensions [here](https://exts.ggplot2.tidyverse.org/)_

**Packages for arranging plots**

- [Cowplot](https://wilkelab.org/cowplot/articles/plot_grid.html)
- [Patchwork](https://patchwork.data-imaginist.com/)

**Packages for coloring plots**
- [A comprehensive list of color palettes in R](https://github.com/EmilHvitfeldt/r-color-palettes)
- [Colorblindr](https://github.com/clauswilke/colorblindr)

### Plotting in Python

Historically the `Matplotlib` had been the go-to library for scientific data visualization in Python. `Matplotlib` is still a powerful plotting tool, but it's syntax is complex and the graphics can look outdated when compared to R's `ggplot2`. The `seaborn` library was developed as an easier to use and updated version of `Matplotlib` and the `plotnine` library was developed to mimic `ggplot`'s grammar of graphics style plotting syntax. Still, some Python users choose to do their data processing in Python and switch to R for visualization. The `plotly` and `Altair` are two options for interactive visualizations.

- [Seaborn](https://seaborn.pydata.org/index.html)
  - [Seaborn user guide and tutorials](https://seaborn.pydata.org/tutorial.html)
- [Matplotlib](https://matplotlib.org/index.html)
  - [Matplotlib tutorial](https://nbviewer.jupyter.org/github/jrjohansson/scientific-python-lectures/blob/master/Lecture-4-Matplotlib.ipynb)
- [Plotnine](https://plotnine.readthedocs.io/en/stable/)
  - Fredhutch.io's [Introduction to Python](https://github.com/fredhutchio/python_intro) course covers plotnine in [class 4](https://nbviewer.jupyter.org/github/fredhutchio/python_intro/blob/master/class4.ipynb)
- [Plotly](https://plotly.com/python/)
  - [A Kaggle Plotly tutorial for beginners](https://www.kaggle.com/kanncaa1/plotly-tutorial-for-beginners/notebook)
- [Altair](https://altair-viz.github.io/)

## Resources

### Data visualization resources at Fred Hutch
- Join the [Coop Communities Slack](https://fhbig.slack.com/) and follow the #data-viz channel. This channel is a space to share visualization ideas, ask questions, and troubleshoot code!
- [FredHutch.io](http://www.fredhutch.io/) offers introduction to [R](https://www.fredhutch.io/resources/#introduction-to-r) and [Python](https://www.fredhutch.io/resources/#introduction-to-python) courses that touch on data visualization along with other fundamentals for beginners.
- [The Data Visualization Center](https://viz.fredhutch.org/) is co-sponsored by Fred Hutch and Brotman Baty. They develop infrastructure and technology for visualization and analysis of data including scRNA-Seq, ATAC-Seq, and CyTOF. They focus on grant-funded collaborations involving data integration, analytical pipelines, and publishing interactive visualization websites for large-scale data.

### Books on data visualization

**General**
- [Fundamentals of Data Visualization - Claus Wilke](https://serialmentor.com/dataviz/index.html)

**R**
- [R for Data Science, Chapter 3: Data visualisation - Garrett Grolemund and Hadley Wickham](https://r4ds.had.co.nz/data-visualisation.html)
- [ggplot2: Elegant Graphics for Data Analysis - Hadley Wickham, Danielle Navarro, and Thomas Lin Pedersen](https://ggplot2-book.org/)
- [R Graphics Cookbook - Winston Chang](https://r-graphics.org/index.html)

**Python**
- [Python Data Science Handbook, Chapter 4: Data visualization with Seaborn - Jake VanderPlas](https://jakevdp.github.io/PythonDataScienceHandbook/04.14-visualization-with-seaborn.html)

### Other data visualization resources!

- [Flowing Data](https://flowingdata.com/)
- [Nightingale: The journal of the Data Visualization Society](https://medium.com/nightingale)
- [The Pudding](https://pudding.cool/)
- [Information is Beautiful](https://informationisbeautiful.net/)
- [The TidyX Screencast](https://www.youtube.com/c/TidyX_screencast/featured)
