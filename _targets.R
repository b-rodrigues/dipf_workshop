library(targets)
library(tarchetypes)

list(
  tar_target(
    life_cycle_savings,
    read.csv("life_cycle_savings.csv")
  ),
  tar_force(
    name = paper,
    command = quarto::quarto_render("fosdem_pres.qmd"),
    format = "file", 
    force = TRUE
  )

)
