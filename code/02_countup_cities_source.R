# The main goal of this script will be to use the dplyr packages to count
# up the number of cities and counties in each given state that is provided and
# then return a csv.

# Muhammed Hamir
# october 6th, 2021
# mfhamir@dons.usfca.edu

#load package "dplyr"
library("dplyr")
# load function
source("code/functions/tally_state_cities_counties.R")

# use function in for loop
the_state <- c("Alabama", "Maryland", "Idaho", "Arizona", "Iowa")

# test out the use of the function
for (state in the_state) {
  tally_state_cities_counties(
    input_state_file = paste0("output/subsetted_states_wide/",
                                  "applemobilitytrends-2021-09-26_",
                                  state,
                                  ".csv"),
     state_to_subset = state
)
}
