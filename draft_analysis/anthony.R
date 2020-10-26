# Let's load the tidyverse and our data
library(tidyverse)
library(readxl)
# race_results <- read_csv("https://raw.githubusercontent.com/lennymd/jmm309_fall2020/main/data/race_results_statsf1.csv")

# collisions <- collisions %>% mutate(extra2 = str_replace(extra, "ÔøΩ", ""))

# Load dataset from Excel (File > Import Dataset > From Excel ... ) using the sheet retired_only from the file: race_results_extracolumn.xlsx

## Reasons for retirement
retirement_reasons <- retired_only %>% select(extra) %>% group_by(extra)%>% summarise(count = n()) %>% arrange(desc(count))


# Accidents by year
accidents_by_year <- retired_only %>% select(extra, year) %>% filter(extra == "Accident") %>% group_by(year)%>% summarise(count = n()) %>% arrange(desc(count))

# Collisions by year


# Accidents by track
accidents_by_track <- retired_only %>% select(extra, race_name) %>% filter(extra == "Accident") %>% group_by(race_name)%>% summarise(count = n()) %>% arrange(desc(count))

# Collisions by track

# Deaths by track
