# all packages required for this R project
# Create using PACKUP add-in to generate this code with all the required libraries for this Rmd
# 1. create code chunk
# 2. library(packup)
# 3. packup()

# most packages work fine if installed from CRAN

packs <-
  c(
    "alluvial",
    "anytime",
    "bsplus",
    "cowplot",
    "details",
    "devtools",
    "dplyr",
    "DT",
    "fontawesome",
    "ggplot2",
    "ggpubr",
    "grid",
    "gridExtra",
    "gtsummary",
    "hrbrthemes",
    "htmlwidgets",
    "httpuv",
    "igraph",
    "janitor",
    "kableExtra",
    "knitr",
    "lemon",
    "lubridate",
    "magrittr",
    "plyr",
    "rAltmetric",
    "RColorBrewer",
    "readtext",
    "readxl",
    "rmarkdown",
    "Rmisc",
    "rorcid",
    "sf",
    "stringr",
    "tidyverse",
    "tm",
    "tools",
    "usethis",
    "vioplot",
    "webshot2",
    "wordcloud2"
  )

for (i in 1:length(packs)) {
  if (!require(packs[i], character.only = TRUE, quietly = TRUE))
    install.packages(packs[i], character.only = TRUE)
}

# other packages work better if installed from gihtub

if (!require("geobr", character.only = TRUE, quietly = TRUE))
  devtools::install_github("ipeaGIT/geobr", subdir = "r-package")

if (!require("packup", character.only = TRUE, quietly = TRUE))
  devtools::install_github("milesmcbain/packup")

if (!require("rcrossref", character.only = TRUE, quietly = TRUE))
  remotes::install_github("ropensci/rcrossref")

# load all libraries

for (i in 1:length(packs)) {
  library(packs[i], character.only = TRUE)
}
