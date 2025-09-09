#! /bin/bash

# Verifica se um processo específico está em execução e exibe seu status.
echo "Verificando a execução de um Processo"

read -p "Informe o nome do processo que deseja verificar: " processo

if pgrep "$processo" &> /dev/null
then
        echo "O processo $processo esta em execucao"
else
        echo "O processo $processo nao esta em execucao"
fi

sudo service "$processo" status