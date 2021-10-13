# The goal of this script is to use the readr and tidyr packages in order to
# convert the mobility data from wide to long.

# Muhammed Hamir
# October 9th, 2021
# mfhamir@dons.usfca.edu

# load the package "readr" and "tidyr"
library(readr)
library(tidyr)


# we would like to convert mobility data from wide to long

source("code/functions/convert_mobility_wide_to_long.R")

states <- c("Delaware", "Alabama", "Nevada", "Ohio", "Texas")

# test out the use of this function
convert_to_long(
    input_subsetted_data = "output/subsetted_states_wide/applemobilitytrends-2021-09-19_Kansas.csv")
