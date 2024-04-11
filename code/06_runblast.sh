cd ../

for n in $(cat code/06_lista_blast.txt)

do 

cd data/pairwise_orthologs/$n/OrthoFinder/Results_Apr10/Single_Copy_Orthologue_Sequences


	for m in $(cat *.fa)

	do

	blastp -db /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison/virulance_database/db -query $m -out ${m}_resultados -evalue 1e-5

	done

mv *_resultados /data/blast_results/$n

done
