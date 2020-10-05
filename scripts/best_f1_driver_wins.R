# Who's the best formula 1 driver
#
# What do we mean by best? In this case we're saying best == most wins.
# Columns I care about for this analysis:
# 1. driver -> knowing the driver's name is key
# 2. p_prelim -> since this is the numerical position the driver finished, we can
# use it to count how many race wins.
#
# This analysis could go multiple ways. I'll first filter all the race winners.
# Then I'll count how many times they're in that filtered dataset.
# Each count is a race they won.

# [Editor's note: When we write a script, it's always good to load the libraries
#  first. It's not good to set the user's working directory. Let them do that.]
library(tidyverse)

# Load dataset
race_results <- read_csv("race_results_statsf1.csv")

# Filter to only keep winners. That's when p_prelim == 1
winners <- filter(race_results, p_prelim == 1)

# For the next step, I have the idea that summarise() will work, so I borrowed
# a code example from:
# https://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise
winning_drivers <- group_by(winners, driver)
wins <- summarize(winning_drivers, count=n())

# I opened the wins object using the environment pane.Then I sorted descending
# by count and got Michael Schumacher.
# We can also try the following: Use the arrange() function. This will show me
# a preview of the top 10 based on wins from most to least.

arrange(wins, desc(count))
