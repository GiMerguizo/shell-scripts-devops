#!/bin/bash

# variável para guardar o diretório dos logs
LOG_DIR="../../myapp/logs"
ARQUIVO_DIR="../../myapp/logs-processados"
TEMP_DIR="../../myapp/logs-temp"

mkdir -p $ARQUIVO_DIR
mkdir -p $TEMP_DIR

echo "Verificando logs no diretório $LOG_DIR"

# IFS é definido como vazio para preservar espaços em nomes de arquivos
# Usa `find -print0` para emitir nomes separados por NUL e passa para um loop `while`.
# `IFS=` preserva espaços em branco; `read -r -d '' arquivo` lê cada nome terminado em NUL,
# onde `-r` evita interpretação de backslashes e `-d ''` define o delimitador NUL.
# Isso permite processar arquivos com espaços e caracteres especiais de forma segura.
find $LOG_DIR -name "*.log" -print0 | while IFS= read -r -d '' arquivo; do 
    # echo "Arquivo encontrado: $arquivo"
    grep "ERROR" $arquivo > "${arquivo}.filtrado"
    grep "SENSITIVE_DATA" $arquivo >> "${arquivo}.filtrado"
    echo "Tratando dados sensíveis..."
    sed -i 's/User password is .*/User password is [REDACTED]/g' "${arquivo}.filtrado"
    sed -i 's/User password reset request with token .*/User password reset request with token [REDACTED]/g' "${arquivo}.filtrado"
    sed -i 's/API key leaked: .*/API key leaked: [REDACTED]/g' "${arquivo}.filtrado"
    sed -i 's/User credit card last four digits: .*/User credit card last four digits: [REDACTED]/g' "${arquivo}.filtrado"
    sed -i 's/User session initiated with token: .*/User session initiated with token: [REDACTED]/g' "${arquivo}.filtrado"
    sort -o "${arquivo}.filtrado" "${arquivo}.filtrado"
    uniq "${arquivo}.filtrado" > "${arquivo}.unico"
    # diff "${arquivo}" "${arquivo}.unico" > /dev/null
    # echo "Mensagens de erro e dados sensíveis extraídas para ${arquivo}.filtrado"

    num_palavras=$(wc -w < "${arquivo}.unico")
    num_linhas=$(wc -l < "${arquivo}.unico")

    # extrai somente o nome do arquivo, sem o caminho
    nome_arquivo=$(basename "$arquivo")

    # echo "O arquivo ${arquivo}.unico contém $num_linhas linhas e $num_palavras palavras."
    echo "Arquivo: ${nome_arquivo}" >> "${ARQUIVO_DIR}/log_stats_$(date +%F).txt"
    echo "Número de linhas: $num_linhas" >> "${ARQUIVO_DIR}/log_stats_$(date +%F).txt"
    echo "Número de palavras: $num_palavras" >> "${ARQUIVO_DIR}/log_stats_$(date +%F).txt"
    echo "----------------------------------------" >> "${ARQUIVO_DIR}/log_stats_$(date +%F).txt"

    if [[ "$nome_arquivo" == *frontend* ]]; then
        sed 's/^/[FRONTEND] /' "${arquivo}.unico" >> "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log"
    elif [[ "$nome_arquivo" == *backend* ]]; then
        sed 's/^/[BACKEND] /' "${arquivo}.unico" >> "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log"       
    else
        cat "${arquivo}.unico" >> "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log"
    fi
done

sort -k2 "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log" -o "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log"

echo "Compactando logs..."
mv "${ARQUIVO_DIR}/logs_combinados_$(date +%F).log" "${TEMP_DIR}/"
mv "${ARQUIVO_DIR}/log_stats_$(date +%F).txt" "${TEMP_DIR}/"
tar -czf "${ARQUIVO_DIR}/logs_$(date +%F).tar.gz" -C "$TEMP_DIR" .
rm -r "$TEMP_DIR"
echo "Logs processados e compactados em ${ARQUIVO_DIR}/logs_$(date +%F).tar.gz"