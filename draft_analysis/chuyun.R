# Let's load the tidyverse and our data
library(tidyverse)
df <- read_csv("https://raw.githubusercontent.com/lennymd/jmm309_fall2020/main/data/race_results_statsf1.csv")

# Question 1: Who has raced in F1 the most times?
driver_list <- df %>% select(driver) %>%
                        group_by(driver) %>%
                        summarise(count = n()) %>%
                        arrange(desc(count))

# Question 2: Which driver has won the most championships?
winning_drivers <- df %>% filter(p_prelim == 1) %>%
                  group_by(driver) %>%
                  summarise(count=n()) %>%
                  arrange(desc(count))

# Question 3: Which team has the most champions to date?
winning_teams <- df %>% filter(p_prelim == 1) %>%
                  group_by(team) %>%
                  summarise(count=n()) %>%
                  arrange(desc(count))
