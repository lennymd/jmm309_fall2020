# This is a comment. We're going to answer a few R questions:
# 1. How many races have happened in Monaco?
# 2. What team has won the most in Monaco? Driver?
# 3. How many collisions have there been in Monaco?
# 4. Who has raced the most?
# 5. Who has won the most races?
# 6. Which teams has the most champions to date?
# 7. Which team raced the most?
# 8. Which country has the most Grand Prixs?
# 9. What was the main reason for drivers to not finish races?


# Let's load the tidyverse and our data
library(tidyverse)

# when you use underscores in variables, it's called 🐍-case
race_results <- read_csv("../data/race_results_statsf1.csv")
