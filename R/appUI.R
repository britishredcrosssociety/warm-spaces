ui <- function() {
  grid_page(
    layout = grid_config,
    grid_card(
      "header",
      alignment = "center",
      has_border = TRUE,
      tags$h3("Find unmet need for warm spaces ")
    ),
    grid_card(
      "map",
      alignment = "center",
      has_border = TRUE,
      mapUI("map")
    ),
    grid_card(
      "table",
      alignmen = "center",
      has_border = TRUE,
      tableUI("table")
    )
  )
}
