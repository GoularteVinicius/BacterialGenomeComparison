cd /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison/data/pairwise_orthologs/All_Bacterias/OrthoFinder/Results_Apr10/Orthogroup_Sequences


	for m in $(cat /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison/code/06_lista_all_blast.txt)

	do

	blastp -db /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison/virulance_database/db -query $m -out ${m}_resultados -evalue 1e-5

	mv *_resultados /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison/data/blast_results/All_Bacteria
	
	done



