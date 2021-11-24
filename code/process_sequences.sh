#!/bin/bash
# This bash script will be given the sars-cov2 file (fasta) which will then process the data
# It will alllow us to calculate and then display the total number of sequences in the file
# and with the help us tally the number of sequences by country and ultimately order them by size

# Muhammed Hamir
# mfhamir@dons.usfca.edu
# November 08 2021

# The data file we will analyze

if [ $# -eq 0 ]
then
  echo "To run this script, supply two arguments"
  echo "Supply the path to the grip compressed SARS-Cov2 fasta file"
  echo "For aditional output, add 'ALL' as the second argument"
  exit 1
fi

# Process to provide the count sequences per country, in order
# If there is a second argument ALL, that info will be outputted in addition to the country
# sequence count.
if [[ $# -eq 1 ]]
then
  bioawk -c fastx '{print $comment}' "$1" | cut -d "|" -f 21 | sort | uniq -c | sort -n -r
  exit 0
fi 

if [ $# -eq 2 ] && [ "$2" = "ALL" ]
then
  echo "The total number sequences in the file:"
  bioawk -c fastx '{print $name $comment}' "$1" | wc -l
  echo "This would be the total number of Sars-Cov-2 sequences per country, this will be"
  bioawk -c fastx '{print $comment}' "$1" | cut -d "|" -f 21 | sort | uniq -c | sort -n -r
  exit 0

else
  echo "ERROR: check through file for errors"
  exit 0
fi
