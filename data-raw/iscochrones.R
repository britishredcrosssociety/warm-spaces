library(sf)

# Data from ad-hoc/analysis/cost-of-living
isochrones <-
  readr::read_rds("data-raw/imported-data/warm-spaces-isochrones.rds") |> 
  st_as_sf()

usethis::use_data(isochrones, overwrite = TRUE)
