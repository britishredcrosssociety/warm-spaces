isochrones <-
  readr::read_rds("data-raw/imported-data/warm-spaces-isochrones.rds")

usethis::use_data(isochrones, overwrite = TRUE)
