# Data Joins
# Let's look at how we can join 2 tables. Sometimes we'll need to combine data
# from multiple places so this is a good thing to know.
# (I really don't like VLOOKUP)


library(tidyverse)

race_results <- read_csv("race_results_statsf1.csv")
winners <- read_csv("winners.csv")

schumacher <- filter(winners, driver=="Michael SCHUMACHER")

# Inner joins look for only the things that are in common in both dataset 1 and 2.
# In this case what lines do we have in common between race_results and schumacher.
df_inner <- inner_join(race_results, schumacher, by= c("driver" = "driver"))

# Get everything in the left dataset, plus overlap. Things might duplicate.
df_left <- left_join(race_results, schumacher, by= c("driver" = "driver"))

# Get everything in the right dataset, plus overlap. Things might duplicate.
# Probably don't need this.
df_right <- right_join(race_results, schumacher, by= c("driver" = "driver"))

# Get everything that relates.
df_full <- full_join(race_results, schumacher, by= c("driver" = "driver"))

# Like an inner join, but without duplicates.
df_semi <- semi_join(race_results, schumacher, by= c("driver" = "driver"))

# Exclude things.
df_anti <- anti_join(race_results, schumacher, by= c("driver" = "driver"))

# We can make our joins more explicit and less prone to repetition by mapping more
# column names in the 'by' argument.
df_inner2 <- inner_join(race_results, schumacher, by=c("driver" = "driver",
                                                         "year" = "year",
                                                         "team" = "constructor_clean"))
