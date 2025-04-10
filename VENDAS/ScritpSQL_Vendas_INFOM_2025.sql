----------------------------------------------------------------
-- CRIAR O BANCO DE DADOS
----------------------------------------------------------------
create database VendasABDM25
go

----------------------------------------------------------------
-- ACESSAR O BANCO DE DADOS
----------------------------------------------------------------
use VendasABDM25
go

----------------------------------------------------------------
-- CRIAR AS TABELAS DO BANCO DE DADOS
----------------------------------------------------------------

----------------------------------------------------------------
-- CRIAR A TABELA PESSOAS
----------------------------------------------------------------
create table Pessoas
(
	idPessoa	int			not null	primary key		identity, -- auto incremento
	nome		varchar(50)	not null,
	cpf			varchar(14)	not null	unique,
	status		int				null,
	-- restrição: 1 - ativo | 2 - inativo
	check(status in (1,2))
)
go

----------------------------------------------------------------
-- CRIAR A TABELA CLIENTES
----------------------------------------------------------------
create table Clientes
(
	pessoaId	int		not null	primary key,
	renda		money	not null,
	credito		money	not null,
	-- definir a chave estrangeria que relaciona Pessoa com Cliente
	foreign key(pessoaId)	references	Pessoas(idPessoa),
	-- restrições
	check(renda   >= 700.00),
	check(credito >= 100.00)
)
go

----------------------------------------------------------------
-- CRIAR A TABELA VENDEDORES
----------------------------------------------------------------
create table Vendedores
(
	pessoaId	int		not null	primary key,
	salario		money	not null,
	-- definir a chave estrangeria que relaciona Pessoa com Vendedor
	foreign key(pessoaId)	references	Pessoas(idPessoa),
	-- restrições
	check(salario >= 1000.00)
)
go

----------------------------------------------------------------
-- CRIAR A TABELA DE PEDIDOS
----------------------------------------------------------------
create table Pedidos
(
	idPedido	int				not null	primary key		identity,
	data		datetime		not null,
	valor		decimal(10,2)		null	check(valor > 0.0),
	status		int					null	check(status between 1 and 3), -- 1 em andamento | 2 finalizado | 3 entregue
	vendedorId	int				not null	references Vendedores(pessoaId),
	clienteId	int				not	null	references Clientes(pessoaId)
)
go

----------------------------------------------------------------
-- CRIAR A TABELA PRODUTOS
----------------------------------------------------------------
create table Produtos
(
	idProduto	int				not null	primary key		identity,
	descricao	varchar(100)	not null,
	qtd			int					null	check(qtd >= 0),
	valor		money				null	check(valor > 0.0),
	status		int					null	check(status in (1,2))
)
go

----------------------------------------------------------------
-- CRIAR A TABELA ITENS_PEDIDOS (TABELA ASSOCIATIVA DA RELAÇÃO N:N)
----------------------------------------------------------------
create table Itens_Pedidos
(
	pedidoId	int		not null,
	produtoId	int		not null,
	qtd			int		not null	check(qtd > 0),
	valor		money	not null	check(valor > 0.0),
	-- definir a chave primária composta
	primary key(pedidoId, produtoId),
	-- definir as chaves estrangeiras
	foreign key(pedidoId)	references	Pedidos(idPedido),
	foreign key(produtoId)	references	Produtos(idProduto)
)
go

----------------------------------------------------------------
-- Consultar todos os dados das tabelas
----------------------------------------------------------------
select * from Pessoas
go

select * from Clientes
go

select * from Vendedores
go

select * from Pedidos
go

select * from Produtos
go

select * from Itens_Pedidos
go

