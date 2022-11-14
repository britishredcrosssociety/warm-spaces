tableUI <- function(id) {
  DTOutput(
    NS(id, "table")
  )
}

tableServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderDT(
      datatable(
        ltla_proportions |> 
          select(
            `Local Authortiy` = ltla20_name,
            `Funding status` = funding,
            `Financially vulnerable postcodes NOT within a 30 min walk of a warm space (%)` = prop_outside_30_min,
            `Financially vulnerable postcodes within a 30 min walk of a warm space (%)` = prop_within_30_min
          ),
        rownames = FALSE
      )
    )
  })
}

tableTest <- function() {
  ui <- fluidPage(
    tableUI("test")
  )

  server <- function(input, output, session) {
    tableServer("test")
  }

  shinyApp(ui, server)
}
