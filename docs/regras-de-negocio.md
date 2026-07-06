# Regras de Negócio (RdN)

## Validação de dados

- RdN01: Uma marcação só pode ser criada se cliente e produto já existirem cadastrados
- RdN02: Quantidade deve ser maior que zero (QTD > 0)

## Pagamentos

- RdN12: O valor de cada pagamento deve ser maior que zero
- RdN13: O valor acumulado de pagamentos de uma marcação não pode ultrapassar o valor total dela
- RdN14: O status da marcação é calculado automaticamente com base nos pagamentos registrados:
  - Nenhum pagamento → `PENDENTE`
  - Pagamentos parciais (total pago < valor total) → `PARCIALMENTE PAGO`
  - Total pago >= valor total da marcação → `PAGO`
- RdN15: Não é permitido registrar novo pagamento em uma marcação com status `PAGO`

## Exclusão de cliente

- RdN03: Cliente não pode ser excluído (nem arquivado) se tiver marcação com status PENDENTE ou PARCIALMENTE PAGO em aberto
- RdN04: Se for excluir um cliente sem pendente em aberto, o sistema deve pedir confirmação antes de executar a ação

## Exclusão de produto

- RdN11: Ao excluir um produto, o sistema deve pedir confirmação antes de executar a ação (mesmo fluxo de "Confirmar Ação" usado na exclusão de cliente)

## Categorias

- RdN16: Todo produto deve estar vinculado a uma categoria existente
- RdN17: Uma categoria não pode ser excluída se houver produtos vinculados a ela

## Navegação e estrutura de telas

- RdN05: Deve existir uma página somente com a lista de nomes dos clientes
- RdN06: Ao clicar no nome do cliente, deve abrir a página/sessão de registro desse cliente, mostrando:
  - Nome do cliente
  - Dados já registrados
  - Valor total da conta a pagar
  - Barra de navegação lateral (sidebar/navbar) para as sessões "Pendentes" e "Realizadas", marcações parcialmente pagas aparecem em "Pendentes", pois ainda há saldo em aberto
- RdN07: Na página principal (lista de clientes), deve haver:
  - Botão para cadastrar novo cliente
  - Barra de navegação para a sessão de Produtos
- RdN08: Na sessão de Produtos, deve listar os nomes dos produtos cadastrados e ter botão para cadastrar novos
- RdN09: O botão de cadastro deve abrir um modal com o formulário de CRUD (cliente ou produto, conforme o contexto)

## Escalabilidade prevista

- RdN10: O sistema deve ser projetado de forma que, se houver necessidade futura de implementar a função "arquivar cliente" (via campo `is_active`), isso possa ser feito de forma simples, sem grandes refatorações