#! /bin/bash

# Exibe os 10 processos que mais consomem memória no sistema.
echo "--- Ofensores de Memória - "$(date +"%Y-%m-%d-%H:%M:%S")""
ps aux --sort=-%mem | head -n 10