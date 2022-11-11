mapUI <- function(id) {
  leafletOutput(
    NS(id, "map"),
    height = 1000
  )
}

mapServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$map <-
      renderLeaflet({
        leaflet(options = leafletOptions(zoomControl = FALSE)) |>
          setView(lat = 54, lng = -2.0, zoom = 7) |>
          addProviderTiles(
            providers$CartoDB.Positron,
            options = providerTileOptions(minZoom = 7)
          ) |>
          setMaxBounds(-12, 49, 3.0, 61) |>
          htmlwidgets::onRender(
            "function(el, x) {
            L.control.zoom({position:'bottomleft'}).addTo(this);
             }"
          ) |> 
          addPolygons(
            data = isochrones,
            weight = 0.7,
            opacity = 0.5,
            color = "red",
            dashArray = "0.1",
            fillOpacity = 0.2,
 
          ) |> 
          addAwesomeMarkers(
              data = warm_spaces,
              layerId = ~Address,
              group = "base",
              label = ~Address,
              options = markerOptions(
                opacity = .5,
                riseOnHover = TRUE
              ),
              icon = awesomeIcons(
                icon = "group",
                library = "fa",
                markerColor = "red",
                iconColor = "#FFFFFF"
              )
            )
      })
  })
}

mapTest <- function() {
  ui <- bootstrapPage(
    tags$head(
      tags$style(type = "text/css", "html, body {width:100%;height:100%;}")
    ),
    mapUI("test")
  )
  server <- function(input, output, session) {
    mapServer("test")
  }
  shinyApp(ui, server)
}
