# Requisitos

## Requisitos Funcionais (RF)

| ID | Descrição |
|----|-----------|
| RF01 | Cadastrar nome do cliente |
| RF02 | Cadastrar produto (nome, valor unitário, categoria) |
| RF03 | Registrar marcação: cliente, produto, quantidade, data e se foi no crediário ou não |
| RF04 | Registrar pagamentos vinculados a uma marcação (total ou parcial), com data e valor |
| RF05 | Guardar registro de confirmação de pagamento por duas semanas |
| RF06 | Separar visualização por páginas/sessões: PAGOS e PENDENTES (marcações parcialmente pagas aparecem em Pendentes) |
| RF07 | Cadastrar e listar categorias de produtos |
| RF08 | Registrar log de ações do sistema (quem fez, o quê, em qual tabela e registro) |

## Requisitos Não Funcionais (RNF)

| ID | Descrição |
|----|-----------|
| RNF01 | Persistência de dados |
| RNF02 | Logs e auditoria de registros |
| RNF03 | Testes unitários |
| RNF04 | Não misturar regra de negócio com interface |
| RNF05 | Configurações separadas do código (banco, venv, API's, `.env`) |
| RNF06 | Versionamento com Git |
| RNF07 | Carregar telas e funções em no máximo 2 segundos |
| RNF08 | Deploy no GitHub e GitLab |
| RNF09 | Documentação básica |
| RNF10 | Cobertura mínima de testes unitários (70%) |
| RNF11 | Pipelines e CI/CD (principalmente no GitLab) |
| RNF12 | Ser manutenível e escalável |
| RNF13 (bônus) | Implementar práticas de segurança, como exercício |