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
    what = str_extract(line, pattern = "some (kind|sort|form|type)")
  )

write_csv(VOY_text, "some_kind_of.csv")
