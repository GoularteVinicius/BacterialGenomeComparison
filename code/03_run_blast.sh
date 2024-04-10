for m in $(cat lista)

do

blastp -db db -query $m -out ${m}_resultados -evalue 1e-5

done

mv *_resultados blast_resultados/
