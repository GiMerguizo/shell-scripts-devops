#! /bin/bash

# Exibe os 10 processos que mais consomem CPU no sistema.
echo "--- Ofensores de CPU --- "$(date +"%Y-%m-%d-%H:%M:%S")""
ps ax -o user,pid,ppid,%cpu,%mem,stat,start,command --sort=-%cpu | head -n 10