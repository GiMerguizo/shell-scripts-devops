# Scripts em Shell para DevOps

Coleção de **scripts em Bash** criados para automação, monitoramento e tarefas comuns no dia a dia de **Administração de Sistemas e DevOps**.  
Inclui scripts para gerenciamento de sistema, monitoramento e manutenção.

## 📂 Estrutura do Repositório
- `scripts/myapp` → Scripts de exemplo para logs de uma aplicação com backend e frontend
- `scripts/sistema/` → Scripts para monitoramento e manutenção do sistema
- `scripts/utilitarios/` → Funções auxiliares (compactar e descompactar arquivos, criação de diretórios, etc.)
- `docs/` → Documentação e exemplos de uso

### 👀 Review dos scripts
```bash
.
├── myapp
│   └── monitoramento-logs.sh
├── sistema
│   ├── consumo_cpu.sh
│   ├── consumo_memoria.sh
│   ├── verifica_nginx.sh
│   └── verifica_processo.sh
└── utilitarios
    ├── comp_descomp.sh
    └── compactador.sh
```

## 🚀 Como usar
Clone o repositório:
```bash
git clone https://github.com/GiMerguizo/shell-scripts-devops.git
cd scripts-shell-devops/
chmod +x boas-vindas.sh
./boas-vindas.sh
```

Para rodar os scripts, é necessário dar a permissão de execução antes:
```bash
chmod +x <nome_script.sh>
```
- Exemplo:
```bash
cd scripts/sistema
chmod +x compactador.sh
./compactador.sh
```

## 📌 Requisitos
- Bash
- Ambiente Linux (testado em Ubuntu/Debian)

## 📝 Resumo do script `scripts/myapp/monitoramento-logs.sh`

O script percorre arquivos .log da aplicação, filtra linhas relevantes (por exemplo, contendo "ERROR" ou "SENSITIVE_DATA"), anonimiza dados sensíveis (senhas, tokens, chaves, cartões), remove duplicatas, gera estatísticas por arquivo (nº de linhas e palavras), classifica registros indicando se vêm do frontend ou backend, combina e ordena os logs resultantes e, por fim, compacta os arquivos processados.