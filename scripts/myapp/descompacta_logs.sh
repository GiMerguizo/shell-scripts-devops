echo "Descompactando arquivos de log..."

ARQUIVO_DIR="../../myapp/logs-processados"

echo "Arquivos que serão descompactados: "
tar -tzvf "${ARQUIVO_DIR}/logs_$(date +%F).tar.gz"

read -p "Deseja descompactar (S/N)? " resposta
if [[ "$resposta" == "S" || "$resposta" == "s" ]]; then
    tar -xzf "${ARQUIVO_DIR}/logs_$(date +%F).tar.gz" -C "$ARQUIVO_DIR"
    echo "Arquivos descompactados em $ARQUIVO_DIR"
    rm "${ARQUIVO_DIR}/logs_$(date +%F).tar.gz"
elif [[ "$resposta" == "N" || "$resposta" == "n" ]]; then
    echo "Operação cancelada pelo usuário."
    exit 0
else
    echo "Resposta inválida. Por favor, responda com 'S' ou 'N'."
    exit 1
fi

