# Cafeteria TI - Banco de Dados

Projeto de banco de dados de uma cafeteria pensada para quem trabalha com tecnologia (devs, analistas, estudantes de TI e etc). Feito para praticar SQL no primeiro semestre de Ciência da Computação.

## Sobre o projeto

Fiz esse banco de dados para praticar SQL. A ideia é uma cafeteria que vende para o pessoal da area de TI, por isso os produtos têm nomes de programação, como **Café Debug** e **Cookie Cache**.

## Tabelas

| Tabela | O que guarda |

| `cliente` | Quem compra (nome, telefone, email) |
| `produto` | O que a cafeteria vende (nome, categoria, preço) |
| `pedido` | Cada compra, ligando um cliente a um produto (quantidade e data) |

## Como as tabelas se relacionam

- Um **cliente** pode fazer vários **pedidos**.
- Um **produto** pode aparecer em vários **pedidos**.
- A tabela `pedido` usa **chaves estrangeiras** (`id_cliente` e `id_produto`) para ligar tudo.

```
cliente  1 ──── N  pedido  N ──── 1  produto
```

## Conceitos de SQL praticados

- `CREATE DATABASE` e `CREATE TABLE`
- `PRIMARY KEY` e `AUTO_INCREMENT`
- `FOREIGN KEY`
- `INSERT INTO`
- `SELECT`
- `INNER JOIN`
- `SUM`, `AVG` e `GROUP BY`
- `UPDATE`

## Como executar

1. Abra um editor de SQL com MySQL (eu usei o [OneCompiler](https://onecompiler.com/mysql)).
2. Copie o conteúdo do arquivo `cafeteria_ti.sql`.
3. Execute o script **na ordem em que está**: primeiro as tabelas `cliente` e `produto`, depois `pedido` (que depende das duas).

## Exemplos de consultas

**Ver os pedidos com o nome do cliente e do produto:**
```sql
SELECT c.nome AS cliente, p.nome AS produto, pe.quantidade, pe.data_pedido
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN produto p ON pe.id_produto = p.id_produto;
```

**Total gasto por cliente:**
```sql
SELECT c.nome, SUM(pe.quantidade * p.preco) AS total_gasto
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN produto p ON pe.id_produto = p.id_produto
GROUP BY c.nome;
```

## O que aprendi

- Eu achava que dava para colocar tudo numa tabela só, mas separar em cliente, produto e pedido deixa tudo bem mais organizado.
- A ordem de criação importa. Se tentar inserir um pedido antes de ter o cliente e o produto, dará erro.
- No começo o JOIN me confundiu, mas agora entendo que ele troca o número do id pelo nome de verdade.
- Ainda preciso praticar mais o GROUP BY.

## Ideias para o futuro

- Criar uma tabela de funcionários.
- Permitir vários produtos no mesmo pedido (hoje cada pedido aceita só um).
- Adicionar um controle de estoque, para acompanhar a saída dos produtos.
- Mais para frente, quero tentar conectar esse banco ao meu site "Café & Código", quando eu aprender o suficiente para isso.

## Autor

Feito por **João Vitor Alves Maia**, estudante de Ciência da Computação (1º semestre).