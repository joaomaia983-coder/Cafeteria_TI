CREATE DATABASE IF NOT EXISTS cafeteria_ti;
USE cafeteria_ti;

DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS produto;

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE produto (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(6,2) NOT NULL
);

CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(8,2) NOT NULL
 );

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    id_funcionario INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO produto (nome, categoria, preco) VALUES
('Café Debug', 'Bebida', 8.50),
('Espresso Compilado', 'Bebida', 7.00),
('Cappuccino Full Stack', 'Bebida', 12.00),
('Cookie Cache', 'Doce', 6.50);

INSERT INTO cliente (nome, telefone, email) VALUES
('Bruna Silva', '11911110001', 'bruna@email.com'),
('Kaue Santos', '11911110002', 'kaue@email.com'),
('Julia Bezerra', '11911110003', 'julia@email.com'),
('Luiza Alves', '11911110004', 'luiza@email.com');

INSERT INTO funcionario (nome, cargo, data_admissao, salario) VALUES
 ('Melissa Silva', 'Barista', '2026-08-12', 2500.00),
 ('Samuel Dagorte', 'Barista', '2026-01-23', 2500.00),
 ('Alice Almeida', 'Caixa', '2026-01-22', 2200.00),
 ('João Maia', 'Gerente', '2026-01-06', 4500.00);

 INSERT INTO pedido (id_cliente, id_produto, id_funcionario, quantidade, data_pedido) VALUES
 (1, 1, 1, 2, '2026-11-01'),
 (1, 4, 1, 1, '2026-11-01'),
 (2, 3, 2, 1, '2026-11-02'),
 (3, 2, 3, 3, '2026-11-02'),
 (4, 1, 3, 1, '2026-11-02'),
 (2, 4, 2, 2, '2026-11-02');
 
 SELECT * FROM produto;
 
 SELECT c.nome AS cliente, p.nome AS produto, pe.quantidade, pe.data_pedido
 FROM pedido pe
 INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
 INNER JOIN produto p ON pe.id_produto = p.id_produto;
 
 SELECT c.nome, SUM(pe.quantidade * p.preco) AS total_gasto
 FROM pedido pe
 INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
 INNER JOIN produto p ON pe.id_produto = p.id_produto
 GROUP BY c.nome;
 
 SELECT AVG(preco) AS preco_medio FROM produto;
 
 UPDATE produto SET preco = 9.00 WHERE id_produto = 1;
 
 SELECT pe.id_pedido,
		c.nome AS cliente,
        p.nome AS produto,
        f.nome AS atendido_por
FROM pedido pe
INNER JOIN cliente c ON pe.id_cliente = c.id_cliente
INNER JOIN produto p ON pe.id_produto = p.id_produto
INNER JOIN funcionario f ON pe.id_funcionario = f.id_funcionario;

SELECT f.nome AS funcionario,
		COUNT(pe.id_pedido) AS total_pedido
FROM funcionario f
INNER JOIN pedido pe ON pe.id_funcionario = f.id_funcionario
GROUP BY f.nome;