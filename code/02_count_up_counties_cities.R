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
countup_cities_counties_by_state <- function(input_file_name,
                                              state_we_subset) {
  
all_data <- read.csv(input_file_name)

state_data <- all_data[all_data$sub.region == state_we_subset, ]
  
  # check subsetted data has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR, no rows matching data values created. Did you load the right 
       subsetted file")
  }
  
count_cities_counties_by_type <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()


write.csv(state_data, file = paste0("output/Subsetted_states/",
                                    basename(input_file_name),
                                    "_",
                                    state_we_subset,
                                    ".csv"))
}