# This is the source script that runs each and every state using a loop and
# produces a data set that accounts for the count of counties and cities by
# type

# Muhammed Hamir
# october 6th, 2021
# mfhamir@dons.usfca.edu

# test out the function
source("code/functions/tally_state_cities_counties.R")

# For multiple states
for (the_state in c("Delaware", "Maryland", "Idaho", "Arizona", "Iowa")) {
  print(countup_cities_counties_by_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-09-26.csv",
    state_we_subset = the_state))
}
