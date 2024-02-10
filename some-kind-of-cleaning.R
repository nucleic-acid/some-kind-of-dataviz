library("rtrek")
library("tidyverse")


stTranscripts <- st_transcripts()

stTranscripts |> distinct(series)


all_lines <- stTranscripts |> 
  select(series, season, number, title, text) |> 
  unnest(text) |> 
  filter(str_detect(line, pattern = "some (kind|sort|form|type)")) |> 
  mutate(
    what_said = str_extract(line, pattern = "some (kind|sort|form|type)")
  ) |> 
  select(-c(perspective,setting,description, line))

write_csv(all_lines, "some-kind-of-cleaned-data.csv")