#!/bin/bash

LOG_DIR="monitoramento_sistema"

mkdir -p $LOG_DIR

grep -E "fail(ed)?|error|denied|unauthorized" /var/log/syslog | awk '{print $1, $2, $3, $5, $6, $7}' > $LOG_DIR/monitoramento_logs_sistema.txt

if ping -c 1 8.8.8.8 > /dev/null; then
    echo "$(date): Conexão com a internet está ativa." >> $LOG_DIR/monitoramento_rede.txt
else
    echo "$(date): Sem conexão com a internet." >> $LOG_DIR/monitoramento_rede.txt
fi

if curl -s --head https://www.alura.com | grep "HTTP/2 200" > /dev/null; then
    echo "$(date): Conexao com a Alura bem-sucedida." >> $LOG_DIR/monitoramento_rede.txt
else
    echo "$(date): Falha ao conectar com a Alura." >> $LOG_DIR/monitoramento_rede.txt
fi