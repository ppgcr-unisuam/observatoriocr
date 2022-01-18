# create a corpus
docs <- Corpus(VectorSource(data.to.cloud))

# cleaning text
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("portuguese"))

# create a document-term matrix
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix), decreasing = TRUE)
df <- data.frame(word = names(words), freq = words)

# generate word cloud
par(bg = "#2C3E50")
set.seed(0) # for reproducibility
wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 1,
  max.words = 200,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8, "Set3")
)