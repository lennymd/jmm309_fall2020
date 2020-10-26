library(tidyverse)
race_results <- read_csv("https://raw.githubusercontent.com/lennymd/jmm309_fall2020/main/data/race_results_statsf1.csv")
monaco <- filter(race_results, race_name == "Monaco")
monaco_winners <- filter(monaco, position == '1')
monaco_winning_drivers <- group_by(monaco_winners, driver)
monaco_winning_teams_count <- summarize(monaco_winning_drivers,
                                        wins=n())
monaco_winning_teams_count_descending <- arrange(monaco_winning_teams_count, desc(wins))
