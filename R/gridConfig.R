main_layout <- c(
  "1rem  1fr    1fr   ",
  "120px header header",
  "auto  map    table "
)

mobile_layout <- c(
  "1rem  1fr   ",
  "120px header",
  "100px map   ",
  "100px table "
)

grid_config <- new_gridlayout(
  main_layout,
  alternate_layouts = list(
    list(
      layout = mobile_layout,
      width_bounds = c(max = 600)
    )
  )
)