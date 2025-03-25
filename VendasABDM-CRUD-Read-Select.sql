-- Acessar o banco de dados
use vendasABDM
go 

-- CRUD

-- READ SELECT

-- 1) Consultar nome cpf de todas as pessoas cadastradas
select nome, cpf from Pessoas 
go 

-- 2) Consultar todas as colunas de todas as pessoas cadastradas
select * from Pessoas
go 

-- 3) Consultar nome cpf das pessoas que tem status = 2 
select  nome, cpf from Pessoas where status = 2 
go 

-- 4) Consultar todos os produtos com valor entre 5.00 e 25.00
select * from Produtos where valor >= 5.00 and valor <= 25.00
go 

-- 5) Consultar todos os produtos menor que 5.00 e maior que 25.00
select * from Produtos where valor < 5.00 or valor > 25.00
go 

-- outra forma 
select * from Produtos where not (valor >= 5.00 and valor <= 25.00)
go 

-- 6) Consultar todos os produtos com valor entre 5.00 e 25.00 usando between
select * from Produtos where valor between 5.00 and 25.00
go 

-- 7) Consultar todos os produtos menor que 5.00 e maior que 25.00 usando not between
select * from Produtos where valor not between 5.00 and 25.00
go

-- 8) Consultar todos os dados das pessoas cujo nome começa com Luci 
select * from Pessoas where nome like 'Luci%'
go 

-- 9) Consultar todos os dados das pessoas cujo nome termine com a letra O 
select * from Pessoas where nome like '%o'
go 

-- 10) Consultar todos os dados das pessoas cujo nome tem a sílaba al em qualquer parte do nome 
select * from Pessoas where nome like '%al%'
go

-- 11) Consultar todos os dados das pessoas cujo nome que não começam com Luci 
select * from Pessoas where nome not like 'Luci%'
go 

-- 12) Consultar todos os dados das pessoas cujo nome não tem a sílaba al em qualquer parte do nome 
select * from Pessoas where nome not like '%al%'
go

-- 13) Consultar id, descrição e quantidade em estoque dos produtos que tem chocolate na descrição
select idProduto as Cod_Produto, descricao as Produto, qtd as Qtd_Estoque from Produtos where descricao like '%chocolate%'
go

-- 14) Consultar id, descrição, valor dos produtos que a descrição não termina com a letra O. Saída tem que mostrar o cabeçalho como Cod_Produto, Produto, Preco
select idProduto as Cod_Produto, descricao as Produto, valor as Preco from Produtos where descricao not like '%o'
go 

-- 15) Consultar id, descrição e valor dos produtos cujo valor seja 5.00 ou 15.00 ou 25.00
select idProduto, descricao, valor from Produtos where valor in (5.00, 15.00, 25.00)
go 

-- 16) Consultar id, descrição e valor dos produtos cujo valor não seja 5.00 ou 15.00 ou 25.00, renomeando as colunas da tabela de saída
select idProduto Cod_Produto, descricao Produto, valor Preco from Produtos where valor not in (5.00, 15.00, 25.00)
go 
 
-- 17) Consultar id, nome e status das Pessoas com status null
select idPessoa, nome, status from Pessoas where status is null
go 

-- 18) Consultar id, descricao e status dos Produtos com status null
select idProduto, descricao, status from Produtos where status is null 
go 

-- 19) Consultar id, data e status de todos os pedidos com status != null
select idPedido [No. Pedido], data 'Data Pedido', status 'Situacao Produto' from Pedidos where status is not null 
go 

-- 20) Consultar id, nome de todas as pessoas em ordem BY
select idPessoa, nome from Pessoas order by nome asc -- default é asc
go 

-- 21) Consultar id, descricao, valor dos produtos com status diferentes de null. A saída deve trazer os produtos do mais caro ao mais barato
select idProduto, descricao, valor from Produtos where status is not null order by valor DESC
go 

-- 22) Consultar id, descricao, valor dos produtos com status diferentes de null. A saída deve trazer os produtos em ordem alfabética pela descriçao do mais caro ao mais barato
select idProduto, descricao, valor from Produtos where status is not null order by descricao asc, valor asc
go 

-- distinct
select distinct valor from Produtos order by valor 

-- 23) Consultar o valor do produto mais caro do estoque
select max(valor) [Produtoo mais caro] from Produtos
go 

-- 24) Consultar o valor do produto mais caro e o mais barato do estoque
select max(valor) [Produtoo mais caro], min(valor) [Produto mais barato] from Produtos
go 

-- 25) Consultar o valor médio do meu estoque, valor total do estoque, quantidade total de produtos em estoque, total de itens 
select avg(valor) [Preco medio], sum(valor * qtd) [Valor total estoque], sum(qtd) [Qtd totao de produtos], count(*) [Total de itens] from Produtos
go 

