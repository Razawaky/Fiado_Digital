# Regras de Negócio (RdN)

## Validação de dados

- RdN01: Uma marcação só pode ser criada se cliente e produto já existirem cadastrados
- RdN02: Quantidade deve ser maior que zero (QTD > 0)

## Exclusão de cliente

- RdN03: Cliente não pode ser excluído (nem arquivado) se tiver pendente em aberto
- RdN04: Se for excluir um cliente sem pendente em aberto, o sistema deve pedir confirmação antes de executar a ação

## Navegação e estrutura de telas

- RdN05: Deve existir uma página somente com a lista de nomes dos clientes
- RdN06: Ao clicar no nome do cliente, deve abrir a página/sessão de registro desse cliente, mostrando:
  - Nome do cliente
  - Dados já registrados
  - Valor total da conta a pagar
  - Barra de navegação lateral (sidebar/navbar) para as sessões "Pendentes" e "Realizadas"
- RdN07: Na página principal (lista de clientes), deve haver:
  - Botão para cadastrar novo cliente
  - Barra de navegação para a sessão de Produtos
- RdN08: Na sessão de Produtos, deve listar os nomes dos produtos cadastrados e ter botão para cadastrar novos
- RdN09: O botão de cadastro deve abrir um modal com o formulário de CRUD (cliente ou produto, conforme o contexto)

## Escalabilidade prevista

- RdN10: O sistema deve ser projetado de forma que, se houver necessidade futura de implementar a função "arquivar cliente", isso possa ser feito de forma simples, sem grandes refatorações

## Exclusão de produto

- RdN11: Ao excluir um produto, o sistema deve pedir confirmação antes de executar a ação (mesmo fluxo de "Confirmar Ação" usado na exclusão de cliente)