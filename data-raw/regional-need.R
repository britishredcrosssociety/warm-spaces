# Data from ad-hoc/analysis/cost-of-living
regional_need <-
  readr::read_rds("data-raw/imported-data/warm-spaces-regional-need.rds")

usethis::use_data(regional_need, overwrite = TRUE)
