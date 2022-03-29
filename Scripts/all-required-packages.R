# all packages required for this R project
# Create using PACKUP add-in to generate this code with all the required libraries for this Rmd
if (!require(alluvial))
  install.packages(alluvial) # for alluvial plots
if (!require(bsplus))
  install.packages(bsplus) # for carousel outputs
if (!require(cowplot))
  install.packages(cowplot) # for mutipannel plots
if (!require(dplyr))
  install.packages(dplyr) # for string manipulation
if (!require(fontawesome))
  install.packages(fontawesome) # for Font Awesome icons
if (!require(geobr))
  install.packages(geobr) # for BR geospacial data
if (!require(ggplot2))
  install.packages(ggplot2) # for gg_style plotting
if (!require(ggpubr))
  install.packages(ggpubr) # for
if (!require(grid))
  install.packages(grid) # for mutipannel plots
if (!require(gridExtra))
  install.packages(gridExtra) # for mutipannel plots
if (!require(gtsummary))
  install.packages(gtsummary) # for summary tables
if (!require(htmlwidgets))
  install.packages(htmlwidgets) # for saving HTML as images
if (!require(igraph))
  install.packages(igraph) # for network analysis
if (!require(kableExtra))
  install.packages(kableExtra) # for printing tables
if (!require(knitr))
  install.packages(knitr) # for
if (!require(magrittr))
  install.packages(magrittr) # for
if (!require(RColorBrewer))
  install.packages(RColorBrewer) # for custom color palettes
if (!require(readtext))
  install.packages(readtext) # for reading TXT files
if (!require(readxl))
  install.packages(readxl) # for reading Excel files
if (!require(Rmisc))
  install.packages(Rmisc) # for
if (!require(sf))
  install.packages(sf) # for plotting geospacial data
if (!require(tm))
  install.packages(tm) # for text manipulation
if (!require(vioplot))
  install.packages(vioplot) # for violin plots
if (!require(webshot2))
  install.packages(webshot2) # for saving HTML as images
if (!require(wordcloud2))
  install.packages() # for generating wordclouds