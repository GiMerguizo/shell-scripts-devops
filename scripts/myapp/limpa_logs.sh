#!/bin/bash

echo "Limpando logs..."

# LOG_DIR="../../myapp/logs"
ARQUIVO_DIR="../../myapp/logs-processados"

cd $ARQUIVO_DIR
# pwd
echo "Arquivos que serão deletados: "
ls
rm log*
ls

echo "Finalizado."




