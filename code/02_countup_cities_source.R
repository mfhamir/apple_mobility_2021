# The main goal of this script will be to use the dplyr packages to count
# up the number of cities and counties in each given state that is provided and
# then return a csv.

# Muhammed Hamir
# october 6th, 2021
# mfhamir@dons.usfca.edu

# load function
source("code/functions/tally_state_cities_counties.R")

# use function in for loop
for (the_state in c("output/applemobilitytrends-2021-09-26_Alabama.csv",
                   "output/applemobilitytrends-2021-09-26_Maryland.csv",
                   "output/applemobilitytrends-2021-09-26_Idaho.csv",
                   "output/applemobilitytrends-2021-09-26_Arizona.csv",
                   "output/applemobilitytrends-2021-09-26_Iowa.csv")) {
  tally_state_cities_counties(the_state)

  print(the_state)
  print("State data has been tallied")
}

