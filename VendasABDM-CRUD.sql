-- Aula dia 13/03/2024 

/*
No SQL Server rodando no Linux (ou em qualquer outro ambiente que não seja o SQL Server Management Studio - SSMS), o comando GO pode não ser reconhecido corretamente porque ele é um comando interpretado pelo SSMS e pelo SQLCMD, mas não faz parte da linguagem SQL padrão.

Como corrigir:
Remova o GO da sua query.
Se precisar executar múltiplos comandos, separe-os com ;.
*/

-- ACESSAR BANCO DE DADOS

use VendasABDM
go

-- Verificar se as tabelas estão sem informação
-- Consulta de todos os dados da tabela Pessoas
select * from Pessoas
-- Consulta de todos os dados da tabela Clientes
select * from Clientes
-- Consulta de todos os dados da tabela Vendedores
select * from Vendedores
-- Consulta de todos os dados da tabela Pedidos
select * from Pedidos
-- Consulta de todos os dados da tabela Produtos
select * from Produtos
-- Consulta de todos os dados da tabela Itens_Pedidos
select * from Itens_Pedidos

-- Inserir uma pessoa na tabela Pessoas
insert into Pessoas (nome, cpf, status) values ('Valeria Maria Volpe', '111.111.111-11', 1)
go

insert into Pessoas (nome, cpf) values ('Joao Vitor', '222.222.222-22')
go

insert into Pessoas(nome, cpf) values('Lucimar Sasso', '333.333.333-33')
go

insert into Pessoas values('Carlos Magnus','444.444.444-44', 2)
go 

-- não é uma boa prática
insert into Pessoas (cpf, nome, status) values ('555.555.555-5','Maura Frigo', null)
go


-- inserir várias pessoas em um único comando insert 
insert into Pessoas (nome, cpf, status) values 
('Adriano Simonato', '666.666.666-66', 1),
('Luciene Cavalcanti', '777.777.777-77', 2),
('Lumeire Schinelo', '888.888.888-88', 1),
('Lidiane Murad', '999.999.999-99', null),
('Henrique Dezani', '101.101.101-01', 2),
('Adriana Alvarenga Dezani', '202.202.202-02', 2)
go 

-- inserir dados na tabela Clientes (lembre-se que todo cliente é uma pessoa)
insert into Clientes (pessoaId,  renda,  credito) values (1, 5000.00, 1500.00)
go 

insert into Clientes values (4, 3500.00,  1250.00)
go 

insert into Clientes (pessoaId, renda, credito) values 
(5, 2500.00, 750.00),
(1004, 7500.00, 2500.00),
(1008, 1500.00, 750.00),
(1005, 2500.00, 1000.00)
go 

-- consultar todas as pessoas que são clientes 
select Pessoas.*, Clientes.* from Pessoas, Clientes where Pessoas.idPessoa = Clientes.pessoaId
go 

-- inserir dados na tabela Vendedores (lembre-se que todo vendedor é uma pessoa)
insert into Vendedores (pessoaId, salario) values (2, 4500.00)
go 

insert into Vendedores (pessoaId, salario) values 
(1003, 2520.00),
(1007, 7500.00)
go 

-- consultar todas as pessoas que são vendedores 
select Pessoas.*, Vendedores.* from Pessoas, Vendedores where. Pessoas.idPessoa = Vendedores.pessoaId
go 

-- inserir dados na tabela Produtos 
insert into Produtos (descricao, qtd,  valor, status) values ('Bolo de chocolate', 50, 25.00, 1)
go 

insert into Produtos (descricao, qtd, valor) values ('Cotuba', 100, 5.5)
go 

insert into Produtos values ('Coxinha de frango', 500, 2.5, 1)
go 

insert into Produtos (descricao, qtd, valor, status) values 
('Sorvete de creme', 25, 10.50, 1),
('Paçoca', 30, 3.50, 2),
('Suco de laranja', 40, 11.99, 1),
('Carambola', 12, 6.50, 1),
('Alface', 5, 4.50, 2),
('Ovo de páscoa', 500, 85.99, 1),
('Columba pascal', 100, 35.98, 1),
('Chocolate ao leite', 250, 15.90, 1),
('Chocolate 70%', 150, 8.50, null),
('Amendoim salgado', 250, 4.30, 2),
('Cenoura', 10, 9.80, 2),
('Lanche natural', 15, 15.00, 1),
('Tomate cereja', 40, 2.50, 1),
('Ovo Caipira', 60, 12.50, 1),
('Milho verde', 120, 6.50, null)
go

insert into Produtos values 
('Doce de leite', 30, 4.59, 2),
('Suco de uva', 25, 16.49, 1)
go

-- inserir dados na tabela Pedidos
insert into Pedidos (data, status, vendedorId, clienteId) values ('2025-01-23', 1, 2, 1) 
go

insert into Pedidos (data, status, vendedorId, clienteId) values (GETDATE(), 1, 2, 1004) 
go

