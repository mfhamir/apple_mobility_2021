# This is the pathway to compress the file into a command line argument

# Muhammed Hamir
# mfhamir@dons.usfca.edu
# November 08 2021

# The following defensive programs will ensure that the user enters one and only one argument to ensure the script runs
# calculate the number of data sets and entries

if [ $# -eq 0 ]
then
  echo "To run this script, supply one arguments"
  echo "This would be name of the file"
  exit 1
fi

if [ $# -gt 1 ]
then
  echo "To run this script you are allowed to only have one argument, since that argument is the file path to the covid Sequencing Data"
  exit 1
fi


bioawk -c fastx '{print $name $comment}' "$1" | wc -l
bioawk -c fastx '{print $comment}' "$1"| cut -d "|" -f 21 | sort | uniq -c | sort -n -r
exit 1
fi
