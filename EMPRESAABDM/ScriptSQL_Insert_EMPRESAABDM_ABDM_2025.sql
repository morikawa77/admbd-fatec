------------------------------------------------------------------------------------------
-- CRIAR O BANCO DE DADOS
------------------------------------------------------------------------------------------
CREATE DATABASE EMPRESAABDM
GO

------------------------------------------------------------------------------------------
-- ACESSAR O BANCO DE DADOS
------------------------------------------------------------------------------------------
USE EMPRESAABDM
GO

------------------------------------------------------------------------------------------
-- CRIAR A TABELA DEPARTAMENTO
------------------------------------------------------------------------------------------
CREATE TABLE DEPARTAMENTOS
(
	IDDEPTO		INT				NOT NULL	PRIMARY KEY		IDENTITY,
	NOME		VARCHAR (30)	NOT NULL,
	TELEFONE	VARCHAR (15)		NULL
)
GO

------------------------------------------------------------------------------------------
-- CRIAR A TABELA DE FUNCIONÁRIOS
------------------------------------------------------------------------------------------
CREATE TABLE FUNCIONARIOS
(
	IDFUNC		INT				NOT NULL	PRIMARY KEY		IDENTITY,
	NOME		VARCHAR(50)		NOT NULL,
	CPF			VARCHAR(14)		NOT NULL	UNIQUE,
	DEPTOID		INT					NULL,
	-- DEFINIR CHAVE ESTRANGEIRA PARA RELACIONAR DEPARTAMENTO COM FUNCIONÁRIO
	FOREIGN KEY (DEPTOID)	REFERENCES	DEPARTAMENTOS(IDDEPTO)
)
GO

------------------------------------------------------------------------------------------
-- CADASTRAR DEPARTAMENTOS
------------------------------------------------------------------------------------------
INSERT INTO DEPARTAMENTOS (NOME, TELEFONE)
VALUES	('COMPRAS', '(17) 98745-3214'),
		('MARKETING', '(17) 98521-3256'),
		('VENDAS', '(17) 99452-3223'),
		('RECURSOS HUMANOS', '(17) 98541-4455'),
		('DIRETORIA','(17) 98774-2145')
GO

------------------------------------------------------------------------------------------
-- CADASTRAR PELO MENOS 11 FUNCIONÁRIOS, ALGUNS SEM RELACIONAMENTO COM DEPARTAMENTO
------------------------------------------------------------------------------------------
insert into Funcionarios (nome, cpf, deptoid)
values 	('Valeria Maria', '111.111.111-11', 1), --depto 1
		('Ana Maria', '222.222.222-22', 3), --depto 3
		('Jose Carlos', '333.333.333-33', null), --sem depto
		('Miguel Augusto', '444.444.444-44', 5), --depto 5
		('Pedro Augusto', '555.555.555-55', null), --sem depto
		('Danilo Volpe', '666.666.666-66', null), --sem depto
		('Julio Cesar', '777.777.777-77', 1), --depto 1
		('Roberto Carlos', '888.888.888-88', 3), --depto 3
		('Rita Lee', '999.999.999-99', 5), --depto 5
		('Cazuza', '101.101.101-10', null), --sem depto
		('Raul Seixas', '110.110.110-11', 5) --depto 5
go

------------------------------------------------------------------------------------------
-- INNER JOIN
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- 1) Consultar todos os departamentos com os seus funcionários
-- Saída: trazer departametos com os funcionarios relacionados
------------------------------------------------------------------------------------------
select D.idDepto [Cod. Depto], D.nome Departamento, D.telefone, F.idFunc [Cod. Func], F.nome Funcionario, F.cpf CPF from Departamentos D inner join Funcionarios F on D.idDepto = F.deptoId 
order by D.idDepto 
go 


------------------------------------------------------------------------------------------
-- LEFT JOIN
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- 2) Consultar todos os departamentos que tem ou não funcionários relacionados
------------------------------------------------------------------------------------------
select D.idDepto [Cod. Depto], D.nome Departamento, D.telefone, F.idFunc [Cod. Func], F.nome Funcionario, F.cpf CPF from Departamentos D left join Funcionarios F on D.idDepto = F.deptoId 
order by D.idDepto 
go 
