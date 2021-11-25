# This is the source script that runs each and every state using a loop and
# produces a data set that accounts for the count of counties and cities by
# type

# Muhammed Hamir
# october 6th, 2021
# mfhamir@dons.usfca.edu

# test out the function
source("code/archived_versions/count_up_counties_cities.R")

#For a single state
countup_cities_counties_by_state(
  input_file_name = "Data/Raw_Data/applemobilitytrends-2021-09-26.csv",
  state_we_subset = "Delaware")


# For multiple states
for (the_state in c("Delaware", "Maryland", "Idaho", "Arizona", "Iowa")) {
  print(countup_cities_counties_by_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-09-26.csv",
    state_we_subset = the_state))
}