# ---- Load libs ----
library(shiny)
library(leaflet)
library(sf)
library(gridlayout)

# ---- App fun ----
appLaunch <- function() {
  shinyApp(ui, server)
}