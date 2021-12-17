# script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory


# Muhammed Hamir
# mfhamir@dons.usfca.edu
# Sept 20th, 2021

#Load functions
source("code/functions/subset_mobility_data_to_state.R")

# assign input file name
input_file_name <- "data/raw_data/applemobilitytrends-2021-09-26.csv"

# use function within a for loop
for (my_state in c("Alabama", "Maryland", "Idaho", "Arizona", "Iowa")) {
  subset_mobility_data_to_state(input_file_name, my_state)

  print(my_state)
  print("state has been subsetted by state from mobility dataset")
}
