create_dt <- function(x) {
  DT::datatable(
    x,
    rownames = FALSE,
    extensions = 'Buttons',
    options = list(
      pageLength = 4,
      scrolX = F,
      dom = 'Bftip',
      searchHighlight = TRUE,
      buttons = c('copy', 'csv', 'pdf')
    ),
  escape = FALSE
  )
}