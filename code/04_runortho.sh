for m in $(cat code/04_lista_pairwise.txt )

do

orthofinder -oa -M msa -S blast -f data/pairwise_orthologs/$m

done
