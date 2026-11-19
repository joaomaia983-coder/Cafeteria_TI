# Cafeteria TI - Banco de Dados

Projeto de banco de dados de uma cafeteria pensada para quem trabalha com tecnologia (devs, analistas, estudantes de TI e etc). Feito para praticar SQL no primeiro semestre de Ciência da Computação.

## Sobre o projeto

Fiz esse banco de dados para praticar SQL. A ideia é uma cafeteria que vende para o pessoal da area de TI, por isso os produtos têm nomes divertidos, como **Café Debug** e **Cookie Cache**.

## Tabelas

| Tabela | O que guarda |

| `cliente` | Quem compra (nome, telefone, email) |
| `produto` | O que a cafeteria vende (nome, categoria, preço) |
| `funcionario` | Quem trabalha na cafeteria (nome, cargo, data de admissão, salário) |
| `pedido` | Cada compra, ligando um cliente, um produto e o funcionário que atendeu (quantidade e data) |
| `item_pedido` | Quais produtos fazem parte de cada pedido, a quantidade e o preço no dia da compra |

## Como as tabelas se relacionam

- Um **cliente** pode fazer vários **pedidos**.
- Um **produto** pode aparecer em vários **pedidos**.
- Um **funcionário** pode atender vários **pedidos**.
- A tabela `pedido` usa **chaves estrangeiras** (`id_cliente`, `id_produto` e `id_funcionario`) para ligar tudo.

```
cliente      1 ──── N  pedido
produto      1 ──── N  pedido
funcionario  1 ──── N  pedido
```

## Conceitos de SQL praticados

- `CREATE DATABASE` e `CREATE TABLE`
- `PRIMARY KEY` e `AUTO_INCREMENT`
- `FOREIGN KEY`
- `INSERT INTO`
- `SELECT`
- `INNER JOIN`
- `SUM`, `AVG`, `COUNT` e `GROUP BY`
- `UPDATE`

## Como executar

1. Abra um editor de SQL com MySQL (eu usei o [OneCompiler](https://onecompiler.com/mysql)).
2. Copie o conteúdo do arquivo `cafeteria_ti.sql`.
3. Execute o script **na ordem em que está**: primeiro as tabelas `cliente` e `produto`, depois `pedido` (que depende das duas).

## Exemplos de consultas

**Ver os pedidos com o nome do cliente e do produto:**
```sql
SELECT pe.id_pedido, c.nome AS cliente, p.nome AS produto, i.quantidade, pe.data_pedido
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN item_pedido i ON i.id_pedido = pe.id_pedido
INNER JOIN produto p ON i.id_produto = p.id_produto;
```

**Total gasto por cliente:**
```sql
SELECT c.nome, SUM(i.quantidade * i.preco_unitario) AS total_gasto
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN item_pedido i ON i.id_pedido = pe.id_pedido
GROUP BY c.nome;
```

**Quantidade de pedidos por funcionário:**
```sql
SELECT f.nome AS funcionario, COUNT(pe.id_pedido) AS total_pedidos
FROM funcionario f
INNER JOIN pedido pe ON pe.id_funcionario = f.id_funcionario
GROUP BY f.nome;
```
## O que aprendi

- Eu achava que dava para colocar tudo numa tabela só, mas separar em cliente, produto e pedido deixa tudo bem mais organizado.
- A ordem de criação importa. Se tentar inserir um pedido antes de ter o cliente e o produto, dará erro.
- Aprendi que o INNER JOIN só mostra as linhas que têm correspondência nas duas tabelas. Se um pedido não tivesse funcionário, ele sumiria do resultado.
- Com a tabela item_pedido, um pedido passou a ter vários produtos, como uma comanda. Ela guarda o preco_unitario para o pedido antigo não mudar se o preço do produto for atualizado.
- Ao mudar a estrutura, os SELECTs antigos deram erro e tive que ajustar os JOINs. Também aprendi que, para apagar, o item_pedido vem primeiro no DROP TABLE, porque depende do pedido.
- Ainda preciso praticar mais o GROUP BY.

## Ideias para o futuro

## Próximos passos

- [x] Tabela de funcionários
- [x] Vários produtos por pedido (tabela item_pedido)
- [ ] Controle de estoque dos produtos
- [ ] Tabela de forma de pagamento (Pix, cartão, dinheiro)
- [ ] Coluna de status do pedido (aberto, pronto, entregue)
- [ ] Conectar o banco ao site **Café & Código**, claro que somente quando eu aprender o suficiente para isso.

## Autor

Feito por **João Vitor Alves Maia**, estudante de Ciência da Computação (1º semestre).