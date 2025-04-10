----------------------------------------------------------------
-- ACESSAR O BANCO DE DADOS
----------------------------------------------------------------
use VendasABDM25
go

----------------------------------------------------------------
-- CRUD - CREATE - READ - UPDATE - DELETE
----------------------------------------------------------------

----------------------------------------------------------------
-- CREATE - INSERT
----------------------------------------------------------------

----------------------------------------------------------------
-- INSERIR DADOS NA TABELA PESSOAS
----------------------------------------------------------------
insert into Pessoas (nome, cpf, status) 
values ('Valeria Maria Volpe', '111.111.111-11', 1)
go

-- inserção de dados com colunas em ordem aleatório
insert into Pessoas (cpf, nome, status) 
values ('222.222.222-22', 'Lucimar Sasso', 2)
go

-- inserção de dados nas colunas obrigatórias (not null)
insert into Pessoas (nome, cpf)
values ('Maura Frigo', '333.333.333-33')
go

-- inserção de dados sem especificar as colunas que recebm os dados.
-- Neste caso é obrigatório respeitar a ordem das colunas e cadastrar
-- dados em todas as colunas da tabela
insert into Pessoas values ('Carlos Magnus', '444.444.444-44', 2)
go

-- inserir várias linhas na tabela Pessoas em um único comando SQL
insert into Pessoas (nome, cpf, status)
values	('Adriano Simonato', '555.555.555-55', 2),
		('Lucimeire Schinelo', '666.666.666-66', null),
		('Luciene Cavalcanti', '777.777.777-77', 1),
		('Waldir Barros', '888.888.888-88', 2),
		('Evanivaldo Junior', '999.999.999-99', 2),
		('Lidiane Murad', '101.010.101-01',1)
go

select * from Pessoas
go

----------------------------------------------------------------
-- INSERIR DADOS NA TABELA CLIENTES (LEMBRE-SE QUE TODO CLIENTE
-- É UMA PESSOA)
----------------------------------------------------------------
insert into Clientes (pessoaId, renda, credito)
values	(1, 5000.00, 1500.00)
go

insert into Clientes values (4, 3500.00, 1250.00)
go

insert into Clientes (pessoaId, renda, credito)
values	(5, 2500.00, 750.00),
		(8, 7500.00, 2500.00),
		(10, 1500.00, 750.00),
		(6, 2500.00, 1000.00)
go


select * from Clientes
go

-- consultar todas as pessoas que são clientes
select Pessoas.*, Clientes.*
from Pessoas, Clientes
where Pessoas.idPessoa = Clientes.pessoaId
go

----------------------------------------------------------------
-- INSERIR DADOS NA TABELA VENDEDORES (LEMBRE-SE QUE TODO VENDEDOR
-- É UMA PESSOA)
----------------------------------------------------------------
insert into Vendedores (pessoaId, salario)
values	(2, 4500.00)
go

insert into Vendedores (pessoaId, salario)
values	(7, 2520.00),
		(9, 7500.00)
go

select * from Vendedores
go

-- consultar todas as pessoas que são vendedores
select Pessoas.*, Vendedores.*
from Pessoas, Vendedores
where Pessoas.idPessoa = Vendedores.pessoaId
go

----------------------------------------------------------------
-- INSERIR DADOS NA TABELA PRODUTOS
----------------------------------------------------------------
insert into Produtos (descricao, qtd, valor, status)
values	('Bolo de chocolate', 50, 25.00, 1)
go

insert into Produtos (descricao, qtd, valor)
values	('Cotuba', 100, 5.50)
go

insert into Produtos values ('Coxinha de frango', 500, 2.50, 1)
go

insert into Produtos (descricao, qtd, valor, status)
values	('Sorvete de creme', 25, 10.50, 1),
		('Pacoca', 30, 3.50, 2),
		('Suco de laranja', 40, 11.99, 1),
		('Carambola', 12, 6.50, 1),
		('Alface', 5, 4.50, 2),
		('Ovo de Pascoa', 500, 85.99, 1),
		('Columba pascal', 100, 35.98, 1),
		('Chocolate ao leite', 250, 15.90, 1),
		('Chocolate 70%', 150, 8.50, NULL),
		('Amendoin salgado', 250, 4.30, 2),
		('Cenoura', 10, 9.80, 2),
		('Lanche natural', 15, 15.00, 1),
		('Tomate cereja', 40, 2.50, 1),
		('Ovo caipira', 60, 12.50, 1),
		('Milho verde', 120, 6.50, null)
go

insert into Produtos 
values	('Doce de leite', 30, 4.59, 2),
		('Suco de uva', 25, 16.49, 1)
go

select * from Produtos
go


----------------------------------------------------------------
-- INSERIR DADOS NA TABELA PEDIDOS
----------------------------------------------------------------
-- DBCC USEROPTIONS; (comando para verificar opções do banco, como o formato de data)
-- SET DATEFORMAT YDM (comando para setar o formato de data)

insert into Pedidos (data, status, vendedorId, clienteId)
values	('2025-23-01', 1, 2, 1)
go

insert into Pedidos (data, status, vendedorId, clienteId)
values	(GETDATE(), 1, 2, 4)
go



select * from Pedidos
go

insert into pedidos (data, status, vendedorId, clienteId)
values	('2025-10-02', 2, 7, 6),
		('2025-12-02', 1, 7, 8),
		(getdate(), 1, 9, 5),
		(getdate(), 1, 2, 5),
		('2025-17-03', null, 2, 5)
go

-- inserir dados na tabela de itens_pedidos
insert into itens_pedidos (pedidoId, produtoId, qtd, valor)
values	(1, 3, 100, 2.50),
		(1, 8, 1, 4.50),
		(1, 10, 5, 35.98),
		(1, 11, 100, 15.25)
go

-- inserir itens do pedido 2
insert into itens_pedidos (pedidoid, produtoid, qtd, valor)
values	(2, 1, 5, 25.00),	
		(2, 20, 5, 16.49)
go

-- inserir itens do pedido 3
insert into itens_pedidos (pedidoid, produtoid, qtd, valor)
values	(3, 1, 10, 24.50),
		(3, 5, 15, 3.50),
		(3, 9, 120, 74.50),
		(3, 16, 2, 2.50),
		(3, 17, 3, 12.50)
go

-- inserir itens do pedido 4
insert into itens_pedidos (pedidoid, produtoid, qtd, valor)
values	(4, 19, 10, 4.59)
go

-- inserir itens do pedido 5
insert into itens_pedidos (pedidoid, produtoid, qtd, valor)
values	(5, 14, 2, 9.80),
		(5, 17, 1, 12.50),
		(5, 18, 12, 6.50),
		(5, 20, 5, 15.50)
go

-- inserir itens do pedido 7
insert into itens_pedidos (pedidoid, produtoid, qtd, valor)
values	(7, 2, 5, 5.50),
		(7, 3, 10, 2.50),
		(7, 15, 2, 15.00)
go

-- consultar itens de todos os pedidos
select * from itens_pedidos
go

-- consultar itens pedido especifico
select * from itens_pedidos
where pedidoid = 2
go