# Decisões Técnicas (ADRs)

> ADR = Architecture Decision Record. Cada registro documenta uma decisão, as alternativas consideradas e a justificativa.

## ADR 001 — Linguagem e Framework Backend

- **Decisão**: Python + Flask
- **Alternativa considerada**: JS/Node (Express)
- **Justificativa**: Foco em aprender e se aprofundar em Python, mantendo a atenção na linguagem em si em vez de dividir esforço com sintaxe nova.

## ADR 002 — Banco de Dados

- **Decisão**: SQLite
- **Alternativa considerada**: MySQL
- **Justificativa**: Zero configuração de servidor, suficiente para o volume de uso do projeto. Lógica de SQL é a mesma do MySQL, já familiar.

## ADR 003 — Estilização (CSS)

- **Decisão**: Tailwind + Sass
- **Justificativa**: Já há prática prévia com Tailwind, o que acelera a construção do layout. Sass entra para refinamento visual e responsividade.

## ADR 004 — Arquitetura

- **Decisão**: Monolito, com organização interna em Camadas Simples (Apresentação → Rotas → Models, com regra de negócio e acesso a dados juntos no Model)
- **Alternativas consideradas**: MVC clássico, Camadas + Service Layer (Repository Pattern), Clean Architecture/Hexagonal, Microsserviços
- **Justificativa (camadas)**: Projeto pequeno, poucas entidades, poucas regras de negócio. Camadas simples aceleram a entrega da v1.
- **Justificativa (monolito x microsserviços)**: Domínio único, sem necessidade de escalar componentes separadamente. Microsserviços trariam complexidade desnecessária para esse contexto.
- **Trade-off aceito**: Regra de negócio e acesso a dados ficam juntos no Model, o que dificulta testar a regra isoladamente sem banco.
- **Adendo — gatilho de migração**: Se o projeto crescer, migrar e refatorar para Camadas + Service Layer (separar `services.py` de `repository.py`, aplicando Repository Pattern). Continua sendo monolito — a migração é de organização interna, não de infraestrutura.

## ADR 005 — Estratégia de Deploy

- **Decisão**: Docker (Dockerfile + docker-compose.yml), rodando localmente via `localhost`
- **Alternativa considerada**: Hospedagem externa (Render/Railway)
- **Justificativa**: PC de destino tem acesso root e Docker resolve a falta de Python/dependências instaladas no ambiente de destino.
- **Observação de segurança**: Não expor a porta na rede Wi-Fi (aberta) sem HTTPS.

## ADR 006 — Controle de Acesso

- **Decisão**: Sem controle de acesso por papel (role-based) nessa versão. Ator único ("Atendente"), todos com as mesmas permissões.
- **Justificativa**: Sistema operado por poucas pessoas de confiança no balcão, sem necessidade de diferenciação de permissões na v1.
- **Adendo — gatilho de evolução**: Se um dia for necessário (ex: restringir exclusão de cliente só ao dono), implementar login com papéis (Admin x Atendente) de forma incremental, sem reescrever a estrutura existente.

## ADR 007 — Evolução do Modelo de Dados (Pagamento Parcial e Categorias)

- **Contexto**: Ao desenhar o Diagrama ER, identificou-se que o campo único `status_pagamento` (pago/pendente) na Marcação não suporta pagamento parcial (ex: cliente paga metade da dívida em uma data, o restante depois).
- **Decisão 1**: Extrair `Payments` (Pagamentos) como tabela própria, vinculada a `Orders` (Marcação). Cada pagamento parcial vira um registro separado; o valor pago total é a soma dos pagamentos vinculados àquela marcação.
- **Decisão 2**: Extrair `Category` (Categoria) como tabela própria, em vez de campo texto livre em Produto — permite reuso da mesma categoria entre vários produtos.
- **Decisão 3 (revertida)**: Cogitado `customer_history` (histórico de alterações no cadastro do cliente), descartado por não ser uma necessidade real do projeto no momento — pode ser revisitado futuramente se necessário.
- **Justificativa geral**: Ajuste feito ainda na fase de modelagem (antes de codar), evitando retrabalho de refatoração posterior. Também mantém compatibilidade com o Log de Auditoria (RNF02) já previsto.