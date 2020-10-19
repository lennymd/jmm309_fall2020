# This is a comment. We're going to answer a few R questions:
# [done] 1. How many races have happened in Monaco?
# [done] 2. What team has won the most in Monaco? Driver?
# [done] 3. How many collisions have there been in Monaco?
# [done] 4. Who has raced the most?
# [done] 5. Who has won the most races?
# [done] 6. Which teams has the most champions to date? ~ What team has the most wins
# [done] 7. Which team raced the most?
# [done] 8. Which country has the most Grand Prixs?
# 9. What was the main reason for drivers to not finish races?


# Let's load the tidyverse and our data
library(tidyverse)

# when you use underscores in variables, it's called 🐍-case
race_results <- read_csv("https://raw.githubusercontent.com/lennymd/jmm309_fall2020/main/data/race_results_statsf1.csv")


# Let's tackle the place questions (number 1, 8) first.

# Let's look at just race_name.

race_results %>% select(race_name) %>% group_by(race_name) %>% summarise(count = n()) %>% arrange(desc(count))
# another way of writing line 24 is to say: select(race_results, race_name)

# Let's remove the duplicates
distinct_1 <- race_results %>% select(race_name) %>% distinct(race_name)

# Let's get all the uniques, using a combo of race_id and race_name

distinct_2 <- race_results %>% select(race_id,race_name) %>% distinct(race_id, race_name)

# Now that we have no duplicates, let's count!

count_countries <- distinct_2 %>% group_by(race_name) %>% summarise(count = n()) %>% arrange(desc(count))

# My answer to Q8 is Britain and Italy are tied for first with 70 grand prixs each.
# My answer to Q1 is 66. There have been 66 races in Monaco.
# NTS: Find out why they didn't race in Monaco. What years did that happen? 1951-1954.

# Let's do Q4.

# Let's only count drivers who tried to race in our results
competed <- race_results %>%
            select(driver, team, position, race_id, race_name) %>%
            filter(!(position %in% c("f", "nq", "npq", "tf", "exc", "&")))

most_races_driver <- competed %>% distinct(race_id, driver) %>% group_by(driver) %>% summarise(count = n()) %>% arrange(desc(count))

# When you use distinct, it only keeps the columns you are trying to de-duplicate.

# A4: Rubens Barrichello

# Q5 is just like Q4, except we need to filter by position. We want the drivers who won first place at each race.

most_wins_driver <- competed %>% filter(position == "1") %>% group_by(driver) %>% summarise(count = n()) %>% arrange(desc(count))

#A5: Michael Schumacher.

# Let's do Questions 6, 7. Q7 is most races for a team.

most_races_team <- competed %>% distinct(race_id, team) %>% group_by(team) %>% summarise(count = n()) %>% arrange(desc(count))

# A7: Ferrari. They raced in 993 races out of 1018.
# NTS: find out Why did the miss the others? Could they have been the indy 500? Or something else?

# Q6 is about winning the most
most_wins_team <- competed %>% filter(position == "1") %>% group_by(team) %>% summarise(count = n()) %>% arrange(desc(count))

# A6: Ferrari at 238 wins

# To answer Q2, we look at Q6 and Q5 and filter each by race_name. WE want just the monaco wins.

most_wins_team_monaco <- competed %>% filter(position == "1", race_name == "Monaco") %>% group_by(team) %>% summarise(count = n()) %>% arrange(desc(count))

# For teams it's McLaren.

most_wins_driver_monaco <- competed %>% filter(position == "1", race_name == "Monaco") %>% group_by(driver) %>% summarise(count = n()) %>% arrange(desc(count))

# For driver it's Senna.



# To answer question 3, I imported an excel file (race_results_extracolumn.xlsx) using the File > Import Dataset > From Excel...
#
# I imported the collisions-only sheet and saved it as race_results_collision.
# We can base our answer of question 2.

monaco_collisions <- race_results_collisions %>% filter(race_name == "Monaco") %>% summarise(count = n())

monaco_collisions_by_year <- race_results_collisions %>% filter(race_name == "Monaco") %>% group_by(year) %>% summarise(count = n()) %>% arrange(desc(count))

# A3: There have been 89 collisions at Monaco. They're spread over 36 years

