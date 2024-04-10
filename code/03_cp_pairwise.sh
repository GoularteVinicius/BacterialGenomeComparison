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

# Directory containing the .aa files (modify the path if needed)
aa_dir="data/interim/get_anno"

# Directory for pairwise directories (modify the path if needed)
pairwise_dir="data/pairwise_orthologs"

# Loop through each bacteria
for ((i=0; i<${#bacteria[@]}; i++)); do
  bacteria1=${bacteria[$i]}
  
  # Loop through bacteria names after the current one
  for ((j=i+1; j<${#bacteria[@]}; j++)); do
    bacteria2=${bacteria[$j]}
    
    # Create directory name with sorted order
    dir_name=$(printf "%s_%s\n" "${bacteria1}" "${bacteria2}")
    
    # Check if directory exists
    if [ -d "$pairwise_dir/$dir_name" ]; then
      # Construct source and destination filenames
      source1="$aa_dir/${bacteria1}.fasta.aa"
      source2="$aa_dir/${bacteria2}.fasta.aa"
      dest1="$pairwise_dir/$dir_name/${bacteria1}.fasta"
      dest2="$pairwise_dir/$dir_name/${bacteria2}.fasta"
      
      # Copy files with extension change
      cp "$source1" "$dest1" && echo "Copied $source1 to $dest1"
      cp "$source2" "$dest2" && echo "Copied $source2 to $dest2"
    fi
  done
done

