#!/bin/bash

# Este script executa o OrthoFinder para cada arquivo listado no arquivo "04_lista_pairwise.txt".
# Ele utiliza os seguintes parâmetros:
# -oa: Modo de análise ortológica.
# -M msa: Usa alinhamento múltiplo de sequências (MSA) como método de análise.
# -S blast: Usa BLAST como método de busca de sequências homólogas.
# -f data/pairwise_orthologs/$m: Especifica o diretório onde os arquivos estão localizados.

# Loop através de cada arquivo listado em "04_lista_pairwise.txt"
for m in $(cat code/04_lista_pairwise.txt)
do
    # Executa o OrthoFinder com os parâmetros especificados
    orthofinder -oa -M msa -S blast -f "data/pairwise_orthologs/$m"
done
