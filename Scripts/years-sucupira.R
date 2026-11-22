# List years that have Sucupira data files, excluding empty or non-year folders.
sucupira_root <- file.path(getwd(), "Sucupira")
pastas_sucupira <- list.dirs(
  sucupira_root,
  full.names = TRUE,
  recursive = FALSE
)
pastas_sucupira <- pastas_sucupira[grepl("^[0-9]{4}$", basename(pastas_sucupira))]
pastas_com_dados <- vapply(
  pastas_sucupira,
  function(pasta) {
    length(list.files(pasta, pattern = "\\.xlsx$", ignore.case = TRUE)) > 0
  },
  logical(1)
)
anos <- sort(as.numeric(basename(pastas_sucupira[pastas_com_dados])))
