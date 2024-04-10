#!/bin/bash

# List of bacteria names (modify as needed)
bacteria=(
  "Acinetobacter_baumannii"
  "Mycobacterium_leprae"
  "Mycobacterium_tuberculosis"
  "Neisseria_gonorrhoeae"
  "Pseudomonas_aeruginosa"
  "Salmonella_enterica"
)

# Loop through each bacteria
for ((i=0; i<${#bacteria[@]}; i++)); do
  bacteria1=${bacteria[$i]}
  
  # Loop through bacteria names after the current one
  for ((j=i+1; j<${#bacteria[@]}; j++)); do
    bacteria2=${bacteria[$j]}
    
    # Create directory name with sorted order (lexicographically)
    dir_name=$(printf "%s_%s\n" "${bacteria1}" "${bacteria2}")
    
    # Create the directory
    mkdir -p data/pairwise_orthologs/"$dir_name"
    echo "Created directory: $dir_name"
  done
done
