# The goal of this script is to use the readr and tidyr packages in order to
# convert the mobility data from wide to long.

# Muhammed Hamir
# October 9th, 2021
# mfhamir@dons.usfca.edu

# load the package "readr" and "tidyr"
library("readr")
library("tidyr")

# we now want to convert the data from wide to long

# continuing from the function that subsetted the mobility data to state
convert_to_long <- function(input_subsetted_data) {
  # read  in complete csv file
  read_state <- readr::read_csv(input_subsetted_data)
  # starting off with dplyr chains
  long_state_data <- tidyr::pivot_longer(read_state,
                                         cols = starts_with("202"),
                                         names_to = "date",
                                         values_to = "relative_mobility")

  # save the state data to a new csv file in the output directory
  readr::write_csv(long_state_data, file = paste0("output/",
                                                  "subsetted_states_long/",
                                                  tools::file_path_sans_ext(
                                                    basename(
                                                      input_subsetted_data)),
                                                  "_",
                                                  "long",
                                                  "_",
                                                  "format",
                                                  ".csv"))
}