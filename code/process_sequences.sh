# This is the pathway to compress the file into a command line argument

# Muhammed Hamir
# mfhamir@dons.usfca.edu
# November 08 2021

# The following defensive programs will ensure that the user enters one and only one argument to ensure the script runs

# calculate the number of data sets and entries

if [ $# -eq 0 ]
then
  echo "To run this script, supply two arguments"
  echo "Supply the path to the grip compressed SARS-Cov2 fasta file"
  echo "For aditional output, add 'ALL' as the second argument"
  exit 1
fi

if [[ $# -eq 1 ]]
then
  bioawk -c fastx '{print $comment}' "$1" | cut -d "|" -f 21 | sort | uniq -c | sort -n -r
  exit 1
fi 

elif [ $# -eq 2 ] && [[ "$2" == "ALL" ]]
then
  echo "The total number sequences in the file:"
  bioawk -c fastx '{print $name $comment}' "$1" | wc -l
  echo "This would be the total number of Sars-Cov-2 sequences per country, this will be"
  bioawk -c fastx '{print $comment}' "$1" | cut -d "|" -f 21 | sort | uniq -c | sort -n -r
  exit 1

else
  echo "ERROR: check through file for errors"
  exit 1
fi
