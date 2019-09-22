
# Render reports
library(purrr)
library(rmarkdown)
library(here)

# Select all Rmd files
rmd_files <- here::here("src", "Rmd", list.files())

# Render each and store the output in the output folder
map(rmd_files, ~ rmarkdown::render(.x, output_dir = here("output")))
