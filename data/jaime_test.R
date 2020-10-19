# Which location has hosted the most amount of races?

library(tidyverse)
df<- read_csv("race_results_statsf1--ORIGINAL.csv")

races <- select(df, race_id, race_name)
unique_races <- distinct(races, race_id, race_name)
race_count<- unique_races %>% group_by(race_name) %>% summarise(count=n())

# Loading an excel file
library(readxl)
collisions <- read_excel("race_results_statsf1--Collisions.xlsx", sheet="Sheet1")
collision_count<- collisions %>% group_by(race_name) %>% summarise(count=n())
