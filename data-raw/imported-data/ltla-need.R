# Data from ad-hoc/analysis/cost-of-living
ltla_need <-
  readr::read_rds("data-raw/imported-data/warm-spaces-ltla-need.rds")

usethis::use_data(ltla_need, overwrite = TRUE)
