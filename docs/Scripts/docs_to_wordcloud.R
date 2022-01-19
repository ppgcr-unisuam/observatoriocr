# for reproducibility
set.seed(0)

# create a corpus
docs <- Corpus(VectorSource(data.to.cloud))

# cleaning text
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
tryCatch(docs <- tm_map(docs, removeWords, stopwords("portuguese")))
tryCatch(docs <- tm_map(docs, removeWords, stopwords("english")))

# create a document-term matrix
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix), decreasing = TRUE)
df <- data.frame(word = names(words), freq = words)

# set minimum word frequency
df <- df[df$freq >= 1, ]

# set plot area
par(
  oma = c(0, 0, 0, 0),
  mar = c(0, 0, 0, 0),
  bg = "#2C3E50"
)
# generate word cloud
wordcloud <- wordcloud2(
  data = df,
  size = 0.5,
#  color = rev(viridis(length(unique(df$freq)))),
  color = colorRampPalette(brewer.pal(11, "Blues"))(diff(range(df$freq))),
  backgroundColor = "#2C3E50",
  shuffle = FALSE,
  rotateRatio = 0,
  ellipticity = 0.5
)

# save it in html
saveWidget(wordcloud, file.path(dir.path, "tmp.html"), selfcontained = F)

# and in png
webshot(file.path(dir.path, "tmp.html"), file.path(dir.path, paste0(sheet, ".png")), delay = 5, vwidth = 600, vheight = 600)

# delete the tmp folder and file
unlink(file.path(dir.path, "tmp_files"), recursive = TRUE)
unlink(file.path(dir.path, "tmp.html"))