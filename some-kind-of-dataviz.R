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

