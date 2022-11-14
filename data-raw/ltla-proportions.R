library(tidyverse)

# Data from ad-hoc/analysis/cost-of-living
ltla_within_distance <-
  read_rds("data-raw/imported-data/warm-spaces-ltla-need.rds") |>
  select(
    ltla20_code,
    ltla20_name,
    region20_name,
    prop_within_30_min = proportion
  )

ltla_outside_distance <-
  read_rds("data-raw/imported-data/warm-spaces-ltla-unmet-need.rds") |>
  select(
    ltla20_code,
    ltla20_name,
    region20_name,
    funding,
    prop_outside_30_min = proportion
  )

ltla_proportions <- ltla_outside_distance |>
  left_join(ltla_within_distance) |>
  mutate(
    prop_within_30_min = if_else(
      is.na(prop_within_30_min),
      0,
      prop_within_30_min
    )
  ) |>
  mutate(
    across(starts_with("prop_"), ~ .x * 100),
    across(starts_with("prop_"), ~ round(.x, 1)),
  ) |>
  group_by(region20_name) |>
  arrange(desc(prop_outside_30_min), .by_group = TRUE) |>
  ungroup()

usethis::use_data(ltla_proportions, overwrite = TRUE)
