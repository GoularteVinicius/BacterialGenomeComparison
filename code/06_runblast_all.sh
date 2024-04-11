#!/bin/bash

# Este script executa uma série de buscas de sequências de proteínas usando o comando blastp.
# Ele percorre todos os arquivos com a extensão .fa no diretório especificado.

path_fa="data/pairwise_orthologs/All_Bacteria/OrthoFinder/Results_Apr10/Orthogroup_Sequences"
total_arquivos=$(ls "$path_fa"/*.fa | wc -l)
progresso_atual=0

for m in "$path_fa"/*.fa;
do
    # Extrai apenas o nome do arquivo (sem o caminho completo)
    arquivo=$(basename "$m")

    # Executa o blastp com os seguintes parâmetros:
    # -db virulance_database/db: Especifica o banco de dados a ser usado para a busca.
    # -query $m: Usa o valor da variável 'm' como o arquivo de consulta.
    # -out data/blast_results/All_Bacteria/rslt_${m}.tab: Especifica o arquivo de saída onde os resultados serão gravados.
    # -evalue 1e-5: Define o valor do limiar de significância.
    # -outfmt 6: Formato de saída tabular.
    blastp -db virulance_database/db -query "$m" -out "data/blast_results/All_Bacteria/rslt_${arquivo}.tab" -evalue 1e-5 -outfmt 6

    # Atualiza o progresso
    progresso_atual=$((progresso_atual + 1))
    percentual=$((progresso_atual * 100 / total_arquivos))

    # Exibe o progresso a cada 10%
    if ((percentual % 10 == 0)); then
        echo "Progresso: $percentual%"
    fi
done
