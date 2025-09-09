#! /bin/bash

# Script que compacta arquivos em um arquivo tar.gz. 
# Uso: ./compactador.sh arquivo_saida.tar.gz arquivo1 arquivo2 ...
# Exemplo: ./compactador.sh backup.tar.gz /home/user/documentos /home/user/imagens

if [ "$#" -lt 2 ]; then
        echo "O programa $0 requer nome do arquivo e arquivos a serem compactados"
        echo "Tente novamente!"
        exit 1
fi

arquivo_saida="$1"
arquivos=("${@:2}")

if [ -e "$arquivos" ]; then
        tar -czf "$arquivo_saida" "${arquivos[@]}"
        echo "Compactado com sucesso em $arquivo_saida"
else
        echo "Os arquivos informados não foram encontrados. Tente novamente."
fi