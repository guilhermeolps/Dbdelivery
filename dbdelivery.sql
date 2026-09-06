
 -- Criação das tabelas, insert e select

CREATE DATABASE IF NOT EXISTS db_delivery;
USE db_delivery;

-- Tabela Cliente
CREATE TABLE cliente (
    codigo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    telefone_cliente VARCHAR(20) NOT NULL,
    cep_cliente CHAR(8) NOT NULL,
    numero_residencia VARCHAR(10) NOT NULL
);

-- Tabela Entregador
CREATE TABLE entregador (
    codigo_entregador INT AUTO_INCREMENT PRIMARY KEY,
    nome_entregador VARCHAR(100) NOT NULL,
    telefone_entregador VARCHAR(20) NOT NULL
);

-- Tabela Cardápio
CREATE TABLE cardapio (
    codigo_item INT AUTO_INCREMENT PRIMARY KEY,
    nome_sanduiche VARCHAR(45) NOT NULL,
    valor_item DECIMAL(10,2) NOT NULL
);

-- Tabela Status do Pedido
CREATE TABLE status_pedido (
    codigo_status INT AUTO_INCREMENT PRIMARY KEY,
    descricao_status VARCHAR(45) NOT NULL
);

-- Tabela Pedido
CREATE TABLE pedido (
    codigo_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATETIME NOT NULL,
    codigo_cliente INT NOT NULL,
    codigo_entregador INT NOT NULL,
    codigo_status INT NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (codigo_entregador) REFERENCES entregador(codigo_entregador),
    FOREIGN KEY (codigo_status) REFERENCES status_pedido(codigo_status)
);

-- Tabela Itens do Pedido
CREATE TABLE itens_pedido (
    codigo_pedido INT NOT NULL,
    codigo_item INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (codigo_pedido, codigo_item),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
    FOREIGN KEY (codigo_item) REFERENCES cardapio(codigo_item)
);




-- Insert dos dados para realizar as querys 

INSERT INTO cliente(codigo_cliente, nome_cliente, telefone_cliente, cep_cliente, numero_residencia)
VALUES(1 , "Guilherme De Oliveira Lopes Carolina",  "41-99999999", "00000000", 00);

INSERT INTO  entregador(codigo_entregador, nome_entregador, telefone_entregador)
VALUES (1, "Gabriel Felipe Da Silva", "41-99999999");

INSERT INTO status_pedido(codigo_status, descricao_status)
VALUES (1, "Em preparação");

INSERT INTO pedido(codigo_pedido, data_emissao, codigo_cliente, codigo_entregador, codigo_status)
VALUES(1, '2026-08-31 14:30:00', 1, 1, 1 );


-- Select para visualizar os pedidos que possuem o código de status 1, pedidos que estão em preparação.
SELECT * FROM pedido WHERE codigo_status = 1;