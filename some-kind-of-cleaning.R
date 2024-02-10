library("rtrek")
library("tidyverse")


stTranscripts <- st_transcripts()

stTranscripts |> distinct(series)

VOY <- stTranscripts |> 
  filter(series == "VOY")

VOY_text <- VOY |> 
  select(season, number, title, text) |> 
  unnest(text) |> 
  filter(str_detect(line, pattern = "some (kind|sort|form|type)")) |> 
  mutate(
    what_said = str_extract(line, pattern = "some (kind|sort|form|type)")
  ) |> 
  select(-c(perspective,setting,description, line))

write_csv(VOY_text, "some_kind_of-data.csv")
