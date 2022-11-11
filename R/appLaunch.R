# ---- Load libs ----
library(shiny)
library(leaflet)
library(sf)
library(gridlayout)
library(DT)
library(dplyr)

# ---- App fun ----
appLaunch <- function() {
  shinyApp(ui, server)
}