# Getting Altmetrics Data Using API and R
# by Arthur de Sá Ferreira

dois_list <-
  list(
    "10.1590/1980-0037.2014v16n3p287",
    "10.2174/1871527315666151111120403",
    "10.1590/S1980-65742021003221"
  )

columns_to_grab <-
  c(
    "title",
    "doi",
    "url",
    "issns",
    "journal",
    "authors",
    "issns1",
    "issns2",
    "published_on",
    "cited_by_posts_count",
    "cited_by_tweeters_count",
    "cited_by_fbwalls_count",
    "cited_by_accounts_count",
    "cited_by_videos_count",
    "cited_by_msm_count",
    "cited_by_feeds_count",
    "cited_by_patents_count",
    "score"
  )

doi_reshaped_data <-
  data.frame(matrix(
    vector(),
    nrow = 0,
    ncol = length(columns_to_grab),
    dimnames = list(c(), columns_to_grab)
  ))

doi_sort <- c()

for (input in 1:length(dois_list)) {
  raw_data <-
    read.csv(
      paste0("https://api.altmetric.com/v1/doi/", dois_list[[input]], collapse = ""),
      sep = ",",
      check.names = FALSE,
      strip.white = FALSE
    )
  
  split_data <- strsplit(colnames(raw_data), ":")
  
  split_names <- sapply(split_data, "[[", 1)
  
  split_data.2 <- c()
  for (i in 1:length(columns_to_grab)) {
    # bind label and data
    label <- columns_to_grab[i]
    data <-
      gsub("\\[|\\]", "", paste(split_data[[match(label, gsub("\\{|\\}", "", split_names))]][2:length(split_data[[match(label, gsub("\\{|\\}", "", split_names))]])], collapse = ":", sep = ""))
    split_data.2 <- rbind(split_data.2, c(label, data))
    
    # add multiple ISSN
    if (split_names[6] != "journals") {
      data <- gsub("\\[|\\]", "", paste(data, raw_data[[6]]))
    }
    
    # add multiple authors
    author.start <- match("authors", split_names)
    author.end <- match("type", split_names) - 1
    author.names <- c()
    for (k in (author.start):(author.end)) {
      author.names <- paste0(author.names, split_data[[k]], sep = ", ")
    }
    author.names <- gsub("\\[|\\]", "", author.names[2])
    author.names <- substr(author.names, 1, nchar(author.names) - 2)
  }
  
  # bind column data
  split_data.2 <- rbind(split_data.2, c("authors", author.names))
  
  # replace empty values by 0
  split_data.2[split_data.2 == ""] <- 0
  
  # bind rows data
  doi_reshaped_data[input, columns_to_grab] <- t(split_data.2)[2, ]
  doi_reshaped_data$author.names[input] <- author.names
  
  # wait 1 s before next call
  Sys.sleep(1)
}

# The Unix epoch is 00:00:00 UTC on 1 January 1970 (an arbitrary date)
# https://en.wikipedia.org/wiki/Unix_time
if(!is.null(doi_reshaped_data$published_on)){
  year_publ <-
    format(as.Date(
      as.POSIXct(as.numeric(doi_reshaped_data$published_on), origin = "1970-01-01")
    ), format = "%Y")
} else {
  year_publ <-
    format(as.Date(
      as.POSIXct(as.numeric(doi_reshaped_data$last_updated), origin = "1970-01-01")
    ), format = "%Y")
}
doi_reshaped_data$published_on <- year_publ

# convert score to integer (rouded up)
doi_reshaped_data$score <-
  ceiling(as.numeric(doi_reshaped_data$score))

# merge at least one ISSN to each journal to search for in the CSV provided by SCImago
issns <- matrix(NA, nrow = dim(doi_reshaped_data)[1])
# initialize with latest ISSN vector if available
if(length(doi_reshaped_data$issns) != 0){
  issns <- doi_reshaped_data$issns
}
# try replacing with first issn (print)
if(length(doi_reshaped_data$issns1) != 0){
  issns[is.na(issns)] <- doi_reshaped_data$issns1[is.na(issns)]
}
# try replacing with second issn (online)
if(length(doi_reshaped_data$issns2) != 0){
  issns[is.na(issns)] <- doi_reshaped_data$issns2[is.na(issns)]
}  
doi_reshaped_data$issn <- issns

# remove duplicate entries
doi_unique <-
  doi_reshaped_data[!duplicated(doi_reshaped_data$doi), ]

# sort columns by title
doi_sort <-
  doi_unique[order(doi_unique$title), ]

no_altmetric_dois_list <- dois_list[is.na(doi_reshaped_data)]
