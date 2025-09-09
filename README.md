# Scripts em Shell para DevOps

Coleção de **scripts em Bash** criados para automação, monitoramento e tarefas comuns no dia a dia de **Administração de Sistemas e DevOps**.  
Inclui scripts para gerenciamento de sistema, monitoramento e manutenção.

## 📂 Estrutura do Repositório
- `scripts/sistema/` → Scripts para monitoramento e manutenção do sistema
- `scripts/utilitarios/` → Funções auxiliares (compactar e descompactar arquivos, criação de diretórios, etc.)
- `docs/` → Documentação e exemplos de uso

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