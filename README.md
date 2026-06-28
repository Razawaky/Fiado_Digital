# Fiado Digital

Sistema simples para controle de fiado/crediário de um pequeno comércio: cadastro de clientes, produtos e registro de marcações (o que foi levado, quantidade, data e status de pagamento).

Projeto pessoal de estudo, com foco em praticar Engenharia de Software (requisitos, regras de negócio, arquitetura, documentação) junto com desenvolvimento back-end.

## Stack

- **Backend**: Python + Flask
- **Banco de dados**: SQLite
- **Frontend**: HTML + Tailwind + Sass
- **Deploy**: Docker

Detalhes e justificativas de cada escolha em [`docs/decisoes-tecnicas.md`](docs/decisoes-tecnicas.md).

## Documentação

- [Requisitos (RF/RNF)](docs/requisitos.md)
- [Regras de Negócio](docs/regras-de-negocio.md)
- [Decisões Técnicas (ADRs)](docs/decisoes-tecnicas.md)
- Diagramas UML — em [`docs/diagramas/`](docs/diagramas/)

## Como rodar

```bash
git clone <url-do-repositorio>
cd fiado-digital
docker compose up
```

Depois, acesse `http://localhost:5000` no navegador.

## Status

🚧 Em desenvolvimento — fase de modelagem/design.
