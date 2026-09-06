# Sistema de Delivery - Banco de Dados (MySQL)

Repositorio criado para o versionamento do projeto de banco de dados relacional desenvolvido para a atividade da faculdade. O projeto modela o fluxo de um sistema de delivery, contemplando clientes, entregadores, cardapio, pedidos e status.

---

## Modelo Logico do Banco de Dados (`db_delivery`)

Abaixo esta a representacao da estrutura relacional criada para o projeto:

```text
database/
├── cliente
│   ├── codigo_cliente (PK)
│   ├── nome_cliente
│   ├── telefone_cliente
│   ├── cep_cliente
│   └── numero_residencia
│
├── entregador
│   ├── codigo_entregador (PK)
│   ├── nome_entregador
│   └── telefone_entregador
│
├── cardapio
│   ├── codigo_item (PK)
│   ├── nome_sanduiche
│   └── valor_item
│
├── status_pedido
│   ├── codigo_status (PK)
│   └── descricao_status
│
├── pedido
│   ├── codigo_pedido (PK)
│   ├── data_emissao
│   ├── codigo_cliente (FK) -> cliente(codigo_cliente)
│   ├── codigo_entregador (FK) -> entregador(codigo_entregador)
│   └── codigo_status (FK) -> status_pedido(codigo_status)
│
└── items_pedido
    ├── codigo_pedido (PK/FK) -> pedido(codigo_pedido)
    ├── codigo_item (PK/FK) -> cardapio(codigo_item)
    ├── quantidade
    └── valor_unitario

Como Executar o Projeto?
Certifique-se de ter o MySQL instalado e em execucao (via MySQL Workbench, DBeaver ou linha de comando).

Copie o script contido na pasta de banco de dados do projeto.

Cole e execute os comandos para criar o banco, as tabelas, inserir os dados de teste e realizar as consultas.

Exemplo de Consulta (Select)
O script principal tambem conta com exemplos praticos de filtragem, como a listagem de pedidos que estao atualmente em preparacao (codigo_status = 1):

SELECT * FROM pedido WHERE codigo_status = 1;

Tecnologias Utilizadas:

MySQL (SGBD Relacional)

Modelagem Relacional / Normalizacao

