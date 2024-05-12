library("rix")

path_env_arrow <- file.path("env_arrow")

rix_init(
  project_path = path_env_arrow,
  rprofile_action = "overwrite",
  message_type = "simple"
)

rix(
  r_ver = "af63e7a15daf283b4ce634006b3767f9c0eb0c58",
  r_pkgs = c("dplyr", "arrow"),
  overwrite = TRUE,
  project_path = path_env_arrow
)


arrow_test <- function() {
  library(arrow)
  library(dplyr)
  
  arrow_cars <- arrow_table(cars)
  
  arrow_cars %>%
    filter(speed > 10) %>%
    as.data.frame()
}


out_nix_arrow <- with_nix(
  expr = function() arrow_test(),
  program = "R",
  exec_mode = "non-blocking",
  project_path = path_env_arrow,
  message_type = "simple"
)