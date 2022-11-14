ui <- function() {
  grid_page(
    layout = grid_config,
    grid_card(
      "header",
      alignment = "center",
      has_border = FALSE,
      tags$h3("Find unmet need for warm spaces "),
      tags$p(""), # Note: using <p> for white space is bad practice. The h3 header above should be padded with CSS instead.
      tags$p("Zoom in and click on your local authority to update the table."),
      tags$p("Red pins are warm spaces. Areas a 30 minute walk from a warm space are shaded in red.")
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
