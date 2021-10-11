# script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Ohio
# and then write out a csv file that only has that subset

# Muhammed Hamir
# mfhamir@dons.usfca.edu
# Sept 8th, 2021

# read in the compete csv file
covid_data <- readr::read_csv("data/raw_data/",
                              "applemobilitytrends-2021-09-07.csv")

# subset the dataset to only include the sub.region column has
# "ohio" in it.
ohio_data <- covid_data[covid_data$sub.region == "Ohio", ]

# save the ohio data to a new csv file in the output directory
readr::write_csv(ohio_data, file = "output/subsetted_states_wide/",
                                   "ohio_apple_mobility_data.csv")
