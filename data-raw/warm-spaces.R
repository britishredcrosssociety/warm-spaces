# Data from ad-hoc/analysis/cost-of-living
warm_spaces <-
  readr::read_rds("data-raw/imported-data/warm-spaces-geocoded.rds")

usethis::use_data(warm_spaces, overwrite = TRUE)
