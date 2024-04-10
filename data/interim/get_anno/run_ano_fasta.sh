%%bash

for i in /home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison_main/data/interim/get_anno/*.gff;

do

/home/naiad/UFABC/LAB_Bioinfo/trabalho_final/BacterialGenomeComparison_main/data/interim/get_anno/getAnnoFasta.pl "$i";

done
