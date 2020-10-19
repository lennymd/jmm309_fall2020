# Formula 1 Monaco Races

# Monaco is a difficult track, it's been raced in since 1950. It also attracts a lot of money
# Questions I care about:
# 1. Which driver has won the most races?
# 2. Which teams has won the most races?

# Let's load the data
library(tidyverse)
race_results <- read_csv("../data/race_results_statsf1.csv")
monaco <- filter(race_results, race_name == "Monaco")

# Now that I have all the monaco races let's answer the questions

# Answering Question 1

# Let's find the winners. Just the winners:
monaco_winners <- filter(monaco, position == '1')

# Looking at monaco_winners, they raced in monaco in 1950 and then skipped 51 to 54.
monaco_winning_drivers <- group_by(monaco_winners, driver)
monaco_winning_teams_count <- summarize(monaco_winning_drivers, wins=n())
arrange(monaco_winning_teams_count, desc(wins))

# Question 2

# This is basically question 1, but wherver we wrote driver, we write team.

