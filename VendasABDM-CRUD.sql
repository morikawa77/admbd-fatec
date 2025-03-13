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

