sucupira.raw <- c()
files.to.read <-
  list.files(file.path(getwd(), "Sucupira"),
             pattern = "xlsx",
             full.names = TRUE,
             recursive = TRUE)
for (i in 1:length(files.to.read)) {
  sucupira.raw <-
    rbind(sucupira.raw, read_excel(files.to.read[i], sheet = sheet))
  }