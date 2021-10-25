load("dplyr")

source("code/functions/tally_state_cities_counties.R")

# test the function
count_cities_counties_state(input_state_file = paste0("output/",
                                                      "subsetted_states",
                                                      "_tallied/",
                                                      "applemobilitytrends-",
                                                      "2021-09-26.csv_",
                                                      "Arizona.csv"))