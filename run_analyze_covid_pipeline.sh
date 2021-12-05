#!/bin/bash

set -euo pipefail

# A bash script to drive the rendering of a Rmarkdown file using some
# parameters passed in from the shell
# This script expects two command line parameters
# the first should be a US state, and the second is the raw apple data
# file csv file downloaded from apple.com

# Muhammed Hamir
# October 15, 2021
# mfhamir@dons.usfca.edu

if [ $# -eq 0 ]
then
 echo "To run this script, supply two arguments:"
 echo "The first is the name of the state"
 echo "the second is the path to the mobility data csv file"
 echo "the third is the path to the sequence summary report text file."
 exit 1
fi

state=$1
state=${state// /_}

RMD_PARAMS="params = list(state = '$1', data = '$2', seqdata = '$3')"
RMD_OUTPUT="output_dir = 'output', output_file = 'Analysis_$state'"

Rscript -e "rmarkdown::render('Analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"
