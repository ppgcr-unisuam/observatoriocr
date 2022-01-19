# load list of Sucupira files to read
files.to.read <-
  list.files(
    file.path(getwd(), "Sucupira"),
    pattern = "xlsx",
    full.names = TRUE,
    recursive = TRUE
  )

# initialize vector and list
sucupira.raw <- c()
sucupira.list <- list()

for (i in 1:length(files.to.read)) {
  sucupira.raw <-
    rbind(sucupira.raw, read_excel(files.to.read[i], sheet = sheet))
  sucupira.list[[i]] <- read_excel(files.to.read[i], sheet = sheet)
}
