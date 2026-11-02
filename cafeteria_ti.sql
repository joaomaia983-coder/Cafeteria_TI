CREATE DATABASE IF NOT EXISTS cafeteria_ti;
USE cafeteria_ti;

DROP TABLE IF EXISTS pedido;
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

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
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

 INSERT INTO pedido (id_cliente, id_produto, quantidade, data_pedido) VALUES
 (1, 1, 2, '2026-11-01'),
 (1, 4, 1, '2026-11-01'),
 (2, 3, 1, '2026-11-02'),
 (3, 2, 3, '2026-11-02'),
 (4, 1, 1, '2026-11-02'),
 (2, 4, 2, '2026-11-02');
 
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