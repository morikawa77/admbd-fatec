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