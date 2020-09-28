# Who's the best formula 1 driver
#
# What do we mean by best? In this case we're saying best == most wins.
# Columns I care about for this analysis:
# 1. driver -> knowing the driver's name is key
# 2. p_prelim -> since this is the numerical position the driver finished, we can use it to count how many race wins.
#
# This analysis could go multiple ways, but I'll first filter all the race winners
# and then count how many times they're in that filtered dataset. Each count is a race they won.


library(tidyverse)
