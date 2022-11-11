tableUI <- function(id) {
  tableOutput(
    NS(id, "table")
  )
}

tableServer <- function(id) {
  moduleServer(id, function(input, output, session){
    output$table <- renderTable()
  })
}