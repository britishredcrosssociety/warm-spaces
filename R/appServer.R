server <- function(input, output, session) {

  # Global value to track state between map and table
  selected <- reactiveValues(area = vector())

  mapServer("map", selected = selected)
  tableServer("table", selected = selected)
}
