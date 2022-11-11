warm_spaces <-
  readr::read_rds("data-raw/imported-data/all-warm-spaces-geocoded.rds")

usethis::use_data(warm_spaces, overwrite = TRUE)
