# The goal of this script is to use the readr and tidyr packages in order to
# convert the mobility data from wide to long.

# Muhammed Hamir
# October 9th, 2021
# mfhamir@dons.usfca.edu

# load the package "readr" and "tidyr"
library(readr)
library(tidyr)

# we now want to convert the data from wide to long

# continuing from the function that subsetted the mobility data to state
convert_mobility_wide_to_long <- function(input_subsetted_mobility_data,
                                          state_to_subset) {
  # read  in complete csv file
  all_state_data_from_subset <- read.csv(input_subsetted_mobility_data)
  # starting off with dplyr chains
  convert_wide_to_long <- pivot_longer(data = all_state_data_from_subset,
                                       cols = starts_with("X202"),
                                       names_to = "date",
                                       names_prefix = "X,",
                                       values_to = "relative_mobility",
                                       values_drop_na = TRUE)
  # check that the subsetted data actually has data in it
  # is (nrow(count_cities_countries) == 0) {
  # stop("ERROR: no rows matching given state name. Did you make a mistake?")
  
  # save the state data to a new csv file in the output directory
  write.csv(convert_wide_to_long, file = paste0("output/convert_",
                                                state_to_subset,
                                                "_subsetted_wide_to",
                                                "long.csv"))
  }