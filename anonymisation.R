library(tidyverse)

# Need higher guess_max so that read_csv() guesses column types correctly 

data <- read_csv("data/raw_data.csv", guess_max = 18000)

passed <- read.csv("data/passed.csv")

passed_yes <- passed %>%
  filter(passed == TRUE)

just_passed <- inner_join(data, passed_yes, by = "participant")

final_data <- just_passed %>%
  group_by(participant) %>%
  dplyr::mutate(ID = cur_group_id())

final_data$participant <- NULL

final_data <- final_data %>%
  rename(participant = ID)

write_csv(final_data, "data/additive_data.csv") # change this according to the exp
