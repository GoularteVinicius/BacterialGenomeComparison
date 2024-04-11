#!/bin/bash

# Lista de nomes de bactérias (modifique conforme necessário)
bacteria=(
  "Acinetobacter_baumannii"
  "Mycobacterium_leprae"
  "Mycobacterium_tuberculosis"
  "Neisseria_gonorrhoeae"
  "Pseudomonas_aeruginosa"
  "Salmonella_enterica"
)

# Loop através de cada bactéria
for ((i=0; i<${#bacteria[@]}; i++)); do
  bacteria1=${bacteria[$i]}
  
  # Loop através dos nomes de bactérias após a atual
  for ((j=i+1; j<${#bacteria[@]}; j++)); do
    bacteria2=${bacteria[$j]}
    
    # Cria o nome do diretório com ordem classificada (lexicograficamente)
    dir_name=$(printf "%s_%s\n" "${bacteria1}" "${bacteria2}")
    
    # Cria o diretório
    mkdir -p data/pairwise_orthologs/"$dir_name"
    echo "Diretório criado: $dir_name"
  done
done
