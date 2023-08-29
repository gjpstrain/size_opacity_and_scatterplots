library(tidyverse)

raw <- read_csv("data/all_data.csv")

just_columns <- raw %>%
  select(c("participant", "unique_item_no", "slider.response")) %>%
  filter(unique_item_no %in% c(181,182,183,184,185,186)) %>%
  mutate_all(~replace(., is.na(.), 0))

# The slider is at zero by default, so replacing NULL entries with 0 allows
# us to account for the fact that some participants may have simply left the
# slider on 0.

my_id <- unique(just_columns$participant)

just_columns$answer = NULL

if (just_columns$unique_item_no == 184){
  just_columns$answer = 1
}

new_df <- just_columns %>%
  mutate(answer = case_when(
    unique_item_no == 181 ~ 0.1,
    unique_item_no == 182 ~ 0.1,
    unique_item_no == 183 ~ 0.1,
    unique_item_no == 184 ~ 0.9,
    unique_item_no == 185 ~ 0.9,
    unique_item_no == 186 ~ 0.9
  )) %>%
  mutate(correct = case_when(
    unique_item_no < 184 ~ slider.response < answer,
    unique_item_no > 183 ~ slider.response > answer
  )) %>%
  group_by(participant) %>%
  summarise(total_correct = sum(correct)) %>%
  arrange(-total_correct)

new_df$passed <- new_df$total_correct > 3

write_csv(new_df, "data/passed.csv")

# The data frame new_df has two columns - participant id, and total attention check questions correct.

# If doing multiple rounds of exp, we need to anti_join() multiple "passed" csv
# so we get a list of PIDs only from the next round of the experiment

