# Let's load the tidyverse and our data
library(tidyverse)
race_results <- read_csv("https://raw.githubusercontent.com/lennymd/jmm309_fall2020/main/data/race_results_statsf1.csv")

#Question 1: Which location has hosted the most amount of races?
#get rid of duplicates
distinct_location <- race_results %>%
  select(race_id, race_name) %>%
  distinct(race_id, race_name)

#count
get_distinct_location <- distinct_location %>%
  select(race_name) %>%
  group_by(race_name) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

#Question 2: Who won the most at the location which has hosted the most amount of races?
#get rid of duplicates
#distinct race winners for Britain
distinct_winners_Britain <- race_results %>%
  select(driver, position, race_id, race_name) %>%
  filter(position == 1, race_name == "Britain") %>%
  distinct(race_id, driver)

#who won the most in Britain?
winners_Britain <- distinct_racers_Britain %>%
  group_by(driver) %>%
  summarize(count = n()) %>%
  arrange(desc(count))



#distinct races for Italy
distinct_racers_Italy <- race_results %>%
  select(driver, position, race_id, race_name) %>%
  filter(position == 1) %>%
  filter(race_name == "Italy") %>%
  distinct(race_id, driver)
#who wont the most in Italy?
races_Italy <- distinct_racers_Italy %>%
  group_by(driver) %>%
  summarize(count = n()) %>%
  arrange(desc(count))
