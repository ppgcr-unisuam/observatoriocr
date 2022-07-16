create_dt <- function(x, title) {
  DT::datatable(
    x,
    rownames = FALSE,
    extensions = 'Buttons',
    options = list(
      pageLength = 4,
      scrolX = F,
      dom = 'Bftip',
      searchHighlight = TRUE,
      buttons = list(
        list(extend = "copy"),
        list(extend = "csv"),
        list(extend = 'pdf',
             title = title,
             filename = title)
      )
    ),
    escape = FALSE
  )
}