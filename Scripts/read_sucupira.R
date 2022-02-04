# load list of Sucupira files to read
files.to.read <-
  list.files(
    file.path(getwd(), "Sucupira"),
    pattern = "xlsx",
    full.names = TRUE,
    recursive = TRUE
  )

# initialize vectors and lists
sucupira <- c()
sucupira.raw <- c()
sucupira.list <- list()

for (file in 1:length(files.to.read)) {
  sucupira <- read_excel(files.to.read[file], sheet = sheet)
  
  # search for "|" (meaning there are changes within a given year)
  has.any.change <- grep('\\|', as.character(sucupira[, ]))
  
  if (length(has.any.change) != 0) {
    warning(
      paste(
        "Resolving duplicated entryes marked with '|' in Sucupira data of ",
        files.to.read[file]
      ),
      sep = ""
    )
    rows.to.change <- c()
    cols.to.change <- c()
    data.to.change <- c()
    for (i in 1:dim(sucupira)[1]) {
      for (j in 1:dim(sucupira)[2]) {
        # duplicate entries based on "|"
        has.change <- grep('\\|', as.character(sucupira[i, j]))
        if (length(has.change) != 0) {
          rows.to.change <- c(rows.to.change, i)
          cols.to.change <- c(cols.to.change, j)
          data.to.change <- rbind(data.to.change, sucupira[i,])
        }
      }
    }
    
    # replace values
    index <- 1
    for (i in unique(rows.to.change)) {
      for (j in cols.to.change[rows.to.change == i]) {
        split.data <-
          unlist(strsplit(as.character(sucupira[i, j]), " \\| "))
        data.to.change[(index:(index + length(split.data) - 1)), j] <-
          split.data
      }
      index <- index + length(split.data)
    }
    
    # delete original entries with "|"
    sucupira <- sucupira[-unique(rows.to.change), ]
    
    # append changed data
    sucupira <- rbind(sucupira, data.to.change)
  }

  sucupira.raw <-
    rbind(sucupira.raw, sucupira)
  
  sucupira.list[[file]] <- sucupira
}
