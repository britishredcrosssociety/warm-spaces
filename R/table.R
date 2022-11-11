tableUI <- function(id) {
  DTOutput(
    NS(id, "table")
  )
}

tableServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderDT(
      datatable(
        ltla_need |>
          mutate(proportion = proportion * 100) |>
          mutate(proportion = round(proportion, 1)) |> 
          select(
            `Local Authortiy` = ltla20_name,
            `% financially vulnerable postcodes not within walking distance of a warm space` = proportion,
            `Funding status` = funding
          ),
        rownames = FALSE,
        options = list(dom = "t", pageLength = 100)
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
