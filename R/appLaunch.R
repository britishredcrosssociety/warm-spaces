# ---- Load libs ----
library(shiny)
library(leaflet)
library(sf)

# ---- App fun ----
appLaunch <- function() {
  # ui <- bootstrapPage(

  #   # - Add tags to render map fullscreen -
  #   tags$head(
  #     tags$link(href = "https://fonts.googleapis.com/css?family=Oswald", rel = "stylesheet"),
  #     tags$style(type = "text/css", "html, body {width:100%;height:100%; font-family: Oswald, sans-serif;}"),
  #     tags$style("h1 {color:#262626;}"),
  #     tags$style("h4 {color:#5C747A;}"),
  #     tags$style("p {color:#9CAAAE;}"),
  #     tags$style("a {color:#9CAAAE;}")
  #   ),

  #   # - Call map module -
  #   mapUI("map"),

  #   # - Title & subheading -
  #   absolutePanel(
  #     top = 10, left = 20, style = "z-index:500; text-align: lwft;",
  #     tags$h1("Warm spaces"),
  #     tags$h4("Subtitle goes here."),
  #     tags$p(
  #       "Source:",
  #       tags$a(href = "https://ocsi.uk/", target = "_blank", "OCSI"),
  #       "&",
  #       tags$a(href = "https://localtrust.org.uk/", target = "_blank", "Local Trust")
  #     )
  #   )
  # )
  # server <- function(input, output, session) {
  #   mapServer("map")
  # }
  # shinyApp(ui, server)
}