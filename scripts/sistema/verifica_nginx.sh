#! /bin/bash

# Verifica se o serviço Nginx está em execução.
echo "Verificando a execucao do Nginx"
if pgrep nginx &> /dev/null
then
        echo "Nginx esta operando $( date +"%Y-%m-%d%H:%M:%S")"
else
        echo "Nginx fora de operacao $( date +"%Y-%m%d%H:%M:%S")"
fi