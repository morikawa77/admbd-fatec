-- Aula dia 27/02/2024 

/*
No SQL Server rodando no Linux (ou em qualquer outro ambiente que não seja o SQL Server Management Studio - SSMS), o comando GO pode não ser reconhecido corretamente porque ele é um comando interpretado pelo SSMS e pelo SQLCMD, mas não faz parte da linguagem SQL padrão.

Como corrigir:
Remova o GO da sua query.
Se precisar executar múltiplos comandos, separe-os com ;.
*/


-- Criar o Banco de Dados
create database VendasABDM
go


-- Acessar o Banco de Dados VendasABDM
use VendasABDM 
go

-- Criar a tabela Pessoas
create table Pessoas (
	idPessoa int not null primary key identity,
	nome varchar(50) not null, 
	cpf varchar(14) not null unique, 
	status int null check(status in (1,2,3))
)
go

-- Criar a tabela Clientes
create table Clientes (
	pessoaId int not null primary key,
	renda decimal(10,2) not null,
	credito decimal(10,2) not null,
	-- chave estrangeira FK
	foreign key(pessoaId) references Pessoas(idPessoa),
	-- restrições
	check(renda >= 700.00),
	check(credito >= 100.00)
)
go 

-- Criar a tabela Vendedores
create table Vendedores (
	pessoaId int not null primary key,
	salario decimal(10,2) not null,
	-- chave estrangeira FK
	foreign key(pessoaId) references Pessoas(idPessoa),
	-- restrições
	check(salario >= 1000.00)
)
go

-- Consultar o dicionário de dados de uma tabela
sp_help Pessoas
go

-- Criar a tabela Pedidos
create table Pedidos (
	idPedido int not null primary key identity,
	data datetime not null,
	valor decimal(10,2) null,
	status int null,
	vendedorId int not null,
	clienteId int not null,
	-- Chaves estrangeiras
	foreign key(vendedorId) references Vendedores(pessoaId),
	foreign key(clienteId) references Clientes(pessoaId),
	-- Restrições
	check(valor > 0.0),
	check(status in (1,2,3))	
)
go

-- Criar a tabela Produtos
create table Produtos (
	idProduto int not null primary key identity,
	descricao varchar(100) not null,
	qtd int null check(qtd >=0),
	valor decimal(10,2) null check(valor > 0),
	status int null check(status >=1 and status <=2)	
	-- status int null check(status = 1 or status = 2)
)
go

-- Criar a tablela Itens_Pedidos
create table Itens_Pedidos (
	pedidoId int not null references Pedidos(idPedido),
	produtoId int not null references Produtos(idProduto),
	qtd int null check(qtd > 0),
	valor decimal(10,2) null check(valor > 0)
	-- Chave primária composta (N:N)
	primary key(pedidoId, produtoId)
)
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