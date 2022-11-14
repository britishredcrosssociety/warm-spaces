mapUI <- function(id) {
  leafletOutput(
    NS(id, "map"),
    height = 900
  )
}

mapServer <- function(id, selected) {
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
          addPolygons(
            data = boundaries_ltla20,
            label = ~ltla20_name,
            layerId = ~ltla20_code,
            weight = 0.7,
            opacity = 0.5,
            color = "#5C747A",
            dashArray = "0.1",
            fillOpacity = 0.1,
            highlight = highlightOptions(
              weight = 5,
              color = "#5C747A",
              dashArray = "",
              fillOpacity = 0.1,
              bringToFront = TRUE
            )
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

    observeEvent(input$map_shape_click, {
      selected$area <- input$map_shape_click$id
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
