for i in ../data/raw/*.fasta;
do
if 
augustus --species=E_coli_K12 "$i" > "$i.gff";
done
mv ../data/raw/*.gff ../data/interim/

for i in ../data/interim/*.gff;
do
../software/Augustus/scripts/getAnnoFasta.pl "$i";
done
