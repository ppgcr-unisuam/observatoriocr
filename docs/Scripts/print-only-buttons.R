print_buttons_dt <- function(x) {
  DT::datatable(
    x,
    extensions = 'Buttons',
    options = list(
      pageLength = 0,
      scrolX = F,
      dom = 'B',
      buttons = c('copy', 'csv', 'pdf'),
      searchHighlight = FALSE,
      headerCallback = JS("function(thead, display){",
                          "$(thead).remove();",
                          "}")
    ),
    escape = FALSE
  )
}