# the goal of this script is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually to save it to a csv

# Muhammed Hamir
# September 27th 2021
# mfhamir@dons.usfca.edu

# load the package "dplyr"
library("dplyr")

# we would like to get the count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted

# load in the dataset from the previous script
tally_state_cities_counties <- function(input_state_file) {

  state_data <- readr::read_csv(input_state_file)

  # starting off with dplyr chains
  count_by_type <- state_data %>%
   select(geo_type, region, transportation_type) %>%
   group_by(geo_type, transportation_type) %>%
   tally()

  # check subsetted data has data in it
  if (nrow(count_by_type) > 6) {
    stop("ERROR, rows exceed data values created. Did you load the right
         subsetted file")
  }
  # write out the result of the dplyr chain
  readr::write_csv(count_by_type, file = paste0("output/",
                                                "subsetted_states_tallied/",
                                                tools::file_path_sans_ext(
                                                  basename(input_state_file)),
                                                "_",
                                                "tally",
                                                "_",
                                                "counties",
                                                "_",
                                                "cities",
                                                ".csv"))
}
