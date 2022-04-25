# all packages required for this R project
# Create using PACKUP add-in to generate this code with all the required libraries for this Rmd
# 1. create code chunk
# 2. library(packup)
# 3. packup()

packs <-
  c(
    "alluvial",
    "anytime",
    "bsplus",
    "cowplot",
    "dplyr",
    "DT",
    "fontawesome",
    "geobr",
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
    "packup",
    "plyr",
    "rAltmetric",
    "RColorBrewer",
    "rcrossref",
    "readtext",
    "readxl",
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

for (i in 1:length(packs)) {
  library(packs[i], character.only = TRUE)
}