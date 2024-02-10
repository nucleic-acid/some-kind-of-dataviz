library("tidyverse")
library("rtrek")
library("trekfont")
library("showtext")

# setup fonts, adapted from {trekfont} documentation: ----
fonts <- c("StarNext", "Federation", "FederationBold")
path <- system.file(paste0("fonts/", fonts, ".ttf"), package = "trekfont")
for(i in seq_along(fonts)) font_add(fonts[i], path[i])
font_families()
showtext_auto()

# read data cleaned in some-kind-of-cleaning.R ----

some_kind_of_df <- read_csv("some_kind_of-data.csv")

# exploratory analysis ----

some_kind_of_df |> 
  group_by(character) |> 
  count(what_said, sort = T) |> 
  pivot_wider(id_cols = c(character), names_from = what_said, values_from = n)
