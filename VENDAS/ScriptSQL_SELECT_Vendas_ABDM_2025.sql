----------------------------------------------------------------
-- ACESSAR O BANCO DE DADOS
----------------------------------------------------------------
use VendasABDM25
go

----------------------------------------------------------------
-- CRUD - CREATE - READ - UPDATE - DELETE
----------------------------------------------------------------

----------------------------------------------------------------
-- READ - SELECT
----------------------------------------------------------------

----------------------------------------------------------------
-- 1) Consultar nome cpf de todas as pessoas cadastradas
----------------------------------------------------------------
select nome, cpf from Pessoas
go

----------------------------------------------------------------
-- 2) Consultar todas as colunas de todas as pessoas cadastradas
----------------------------------------------------------------
select * from Pessoas
go

----------------------------------------------------------------
-- 3) Consultar nome cpf das Pessoas que tem status = 2
----------------------------------------------------------------
select nome, cpf from Pessoas where status = 2
go

----------------------------------------------------------------
-- 4) Consultar todos os produtos com valor entre 5.00 e 25.00
----------------------------------------------------------------
select * from Produtos where valor >= 5.00 and valor <= 25.00
go

----------------------------------------------------------------
-- 5) Consultar todos os produtos com valor menor 5.00 ou maior que 25.00
----------------------------------------------------------------
select * from Produtos where valor < 5.00 or valor > 25.00
go

-- ou 
select * from Produtos where not (valor >= 5.00 and valor <= 25.00)
go

----------------------------------------------------------------
-- 6) Consultar todos os produtos com valor entre 5.00 e 25.00
----------------------------------------------------------------
-- usando between
select * from Produtos where valor between 5.00 and 25.00
go 

----------------------------------------------------------------
-- 7) Consultar todos os produtos com valor menor 5.00 ou maior que 25.00
----------------------------------------------------------------
-- usando not between
select * from Produtos where valor not between 5.00 and 25.00
go

-- 8) Consultar todos os dados das pessoas cujo nome começa com Luci 
select *
from Pessoas
where nome like 'Luci%'
go

-- 9) Consultar todos os dados das pessoas cujo nome termine com a letra O 
select *
from Pessoas
where nome like '%o'
go

-- 10) Consultar todos os dados das pessoas cujo nome tem a sílaba al em qualquer parte do nome 
select *
from Pessoas
where nome like '%al%'
go

-- 11) Consultar todos os dados das pessoas cujo nome que não começam com Luci 
select *
from Pessoas
where nome not like 'Luci%'
go

-- 12) Consultar todos os dados das pessoas cujo nome não tem a sílaba al em qualquer parte do nome 
select *
from Pessoas
where nome not like '%al%'
go

-- 13) Consultar id, descrição e quantidade em estoque dos produtos que tem chocolate na descrição
select idProduto as Cod_Produto, descricao as Produto, qtd as Qtd_Estoque
from Produtos
where descricao like '%chocolate%'
go

-- 14) Consultar id, descrição, valor dos produtos que a descrição não termina com a letra O. Saída tem que mostrar o cabeçalho como Cod_Produto, Produto, Preco
select idProduto as Cod_Produto, descricao as Produto, valor as Preco
from Produtos
where descricao not like '%o'
go

-- 15) Consultar id, descrição e valor dos produtos cujo valor seja 5.00 ou 15.00 ou 25.00
select idProduto, descricao, valor
from Produtos
where valor in (5.00, 15.00, 25.00)
go

-- 16) Consultar id, descrição e valor dos produtos cujo valor não seja 5.00 ou 15.00 ou 25.00, renomeando as colunas da tabela de saída
select idProduto Cod_Produto, descricao Produto, valor Preco
from Produtos
where valor not in (5.00, 15.00, 25.00)
go

-- 17) Consultar id, nome e status das Pessoas com status null
select idPessoa, nome, status
from Pessoas
where status is null
go

-- 18) Consultar id, descricao e status dos Produtos com status null
select idProduto, descricao, status
from Produtos
where status is null 
go

-- 19) Consultar id, data e status de todos os pedidos com status != null
select idPedido [No. Pedido], data 'Data Pedido', status 'Situacao Produto'
from Pedidos
where status is not null 
go

-- 20) Consultar id, nome de todas as pessoas em ordem BY
select idPessoa, nome
from Pessoas
order by nome asc -- default é asc
go

-- 21) Consultar id, descricao, valor dos produtos com status diferentes de null. A saída deve trazer os produtos do mais caro ao mais barato
select idProduto, descricao, valor
from Produtos
where status is not null
order by valor DESC
go

-- 22) Consultar id, descricao, valor dos produtos com status diferentes de null. A saída deve trazer os produtos em ordem alfabética pela descriçao do mais caro ao mais barato
select idProduto, descricao, valor
from Produtos
where status is not null
order by descricao asc, valor asc
go

-- distinct
select distinct valor
from Produtos
order by valor

-- 23) Consultar o valor do produto mais caro do estoque
select max(valor) [Produtoo mais caro]
from Produtos
go

-- 24) Consultar o valor do produto mais caro e o mais barato do estoque
select max(valor) [Produtoo mais caro], min(valor) [Produto mais barato]
from Produtos
go

-- 25) Consultar o valor médio do meu estoque, valor total do estoque, quantidade total de produtos em estoque, total de itens 
select avg(valor) [Preco medio], sum(valor * qtd) [Valor total estoque], sum(qtd) [Qtd totao de produtos], count(*) [Total de itens]
from Produtos
go

-- JUNÇÃO (JOIN) ENTRE TABELAS
-- 26) Consultar todas as pessoas que são clientes. Objetivo é juntar dados das tabelas pessoas e clientes. 
select Pessoas.idPessoa Cod_Cliente, Pessoas.nome Cliente, Pessoas.cpf CPF_Cliente, Clientes.pessoaId Cod_Cliente, Clientes.renda Renda, Clientes.credito Credito
from Pessoas, Clientes
where Pessoas.idPessoa = Clientes.pessoaId
go

-- select usando apelidos (alias) dados as tabelas
select P.idPessoa Cod_Cliente, P.nome Cliente, P.cpf CPF_Cliente, C.pessoaId Cod_Cliente, C.renda Renda, C.credito Credito
from Pessoas as P, Clientes as C
where P.idPessoa = C.pessoaId
go

-- 27) Consultar todas as pessoas que são vendedores
select P.idPessoa Cod_Vendedor, P.nome Vendedor, P.cpf CPF_Vendedor, V.pessoaId Cod_Vendedor, V.salario
from Pessoas as P, Vendedores as V
where P.idPessoa = V.pessoaId
go

-- 28) Consultar todos os pedidos do cliente 1
-- Saída: código cliente, nome, cpf do cliente, renda do cliente, numero do pedido, data e status do pedido 
select P.idPessoa Cod_Cliente, P.nome Cliente, P.cpf CPF_Cliente, C.renda Renda, Ped.idPedido [No. Pedido], Ped.data Data, Ped.status Status
from Pessoas as P, Clientes as C, Pedidos as Ped
where P.idPessoa = C.pessoaId and C.pessoaId = Ped.clienteId and Ped.clienteId = 1
go

-- 29) Consultar todos os pedidos pelo vendedor 1007
-- Saída: código, nome, cpf, salário do. vendedor, no., data, status do pedido 
-- Objetivo: juntar dados das. tabelas Pessoas, Vendedores e Pedidos 
select P.idPessoa Cod_Vendedor, P.nome Vendedor, P.cpf CPF_Vendedor, V.salario Salario_Vendedor, Ped.idPedido [No. Pedidos], Ped.status status
from Pessoas as P, Vendedores as V, Pedidos as Ped
where P.idPessoa = V.pessoaId and V.pessoaId = Ped.vendedorId and Ped.vendedorId = 2
go

-- 30) Consultar todos os Pedidos de todos os Clientes
-- Saída: código cliente, nome, cpf do cliente, renda do cliente, numero do pedido, data e status do pedido 
select P.idPessoa Cod_Cliente, P.nome Cliente, P.cpf CPF_Cliente, C.renda Renda, Ped.idPedido [No. Pedido], Ped.data Data, Ped.status Status
from Pessoas as P, Clientes as C, Pedidos as Ped
where P.idPessoa = C.pessoaId and C.pessoaId = Ped.clienteId
order by Ped.data asc 
go

-- 31) Consultar todos os Pedidos de todos os Vendedores 
-- Saída: código, nome, cpf, salário do. vendedor, no., data, status do pedido 
select P.idPessoa Cod_Vendedor, P.nome Vendedor, P.cpf CPF_Vendedor, V.salario Salario_Vendedor, Ped.idPedido [No. Pedido], Ped.data Data, Ped.status Status
from Pessoas as P, Vendedores as V, Pedidos as Ped
where P.idPessoa = V.pessoaId and V.pessoaId = Ped.vendedorId
order by Ped.data asc 
go

-- 32) Consultar todos os produtos do pedido 1
-- Saída: no., data, status do pedido, código, nome, qtd, valor, total do item de cada um dos produtos,
select Ped.idPedido [No. Pedido], Ped.data Data, Ped.status Status, P.idProduto Cod_Produto, P.descricao Produto, IP.qtd Qtd_Vendida, IP.valor Valor_Pago, (IP.qtd * IP.valor) [Total Item]
from Pedidos Ped, Itens_Pedidos IP, Produtos P
where Ped.idPedido = IP.pedidoId and IP.produtoId = P.idProduto and Ped.idPedido = 3
go

-- 33) Consultar todos os produtos de todos os pedidos cadastrados
-- Saída: no., data, status do pedido, código, nome, qtd, valor, total do item de cada um dos produtos
-- Objetivo: juntar dados das. tabelas Pedidos, Itens_Pedidos e Produtos
select Ped.idPedido [No. Pedido], Ped.data Data_Pedido, Pr.idProduto Cod_Produto, Pr.descricao Produto, IP.qtd Qtd_Vendida, IP.valor Preco_Pago, (IP.qtd * IP.valor) Total_Item,
  case Ped.status
  when 1 then 'Em andamento'
  when 2 then 'Finalizado'
  when 3 then 'Entregue'
  else 'Cancelado'
end [Situacao Pedido]
from Pedidos Ped, Itens_Pedidos IP, Produtos Pr
where Ped.idPedido = IP.pedidoId and IP.produtoId = Pr.idProduto
go

-- 34) Consultar o Pedido 1 e calcular o total deste pedido
-- Saída: no., data, valor, status do pedido 
-- Objetivo: juntar dados das tabelas pedidos, itens_pedidos. Também usar a cláusula GROUP BY
select Ped.idPedido [No. Pedido], Ped.data, SUM(IP.qtd * IP.valor) [Total Pedido], Ped.status
from Pedidos Ped, Itens_Pedidos IP
where Ped.idPedido = IP.pedidoId and Ped.idPedido = 1
group by Ped.idPedido, Ped.data, Ped.status

-- 35) Consultar todos os pedidos e calcular o total de cada pedido
-- Saída: no., data, valor, status do pedido 
-- Objetivo: juntar dados das tabelas pedidos, itens_pedidos. Também usar a cláusula GROUP BY
select Ped.idPedido [No. Pedido], Ped.data, SUM(IP.qtd * IP.valor) [Total Pedido], Ped.status,
  case Ped.status 
  when 1 then 'Em andamento'
  when 2 then 'Finalizado'
  when 3 then 'Entregue'
  else 'Cancelado'
end [Situacao Pedido]
from Pedidos Ped, Itens_Pedidos IP
where Ped.idPedido = IP.pedidoId
group by Ped.idPedido, Ped.data, Ped.status

-- 36) Consultar todos os pedidos e calcular o total de cada pedido
-- Saída: no., data, valor, status do pedido para pedidos com total > 1000.00
-- Objetivo: juntar dados das tabelas pedidos, itens_pedidos. Também usar a cláusula GROUP BY e HAVING
select Ped.idPedido [No. Pedido], Ped.data, SUM(IP.qtd * IP.valor) [Total Pedido], Ped.status,
  case Ped.status
  when 1 then 'Em andamento'
  when 2 then 'Finalizado'
  when 3 then 'Entregue'
  else 'Cancelado'
end [Situacao Pedido]
from Pedidos Ped, Itens_Pedidos IP
where Ped.idPedido = IP.pedidoId
group by Ped.idPedido, Ped.data, Ped.status
having SUM(IP.qtd * IP.valor) > 1000.00

-- 37) Consultar todos os pedidos e calcular o total de cada pedido
-- Saída: no., data, valor, status do pedido para pedidos com status = 2
-- Objetivo: juntar dados das tabelas pedidos, itens_pedidos. Também usar a cláusula GROUP BY e HAVING
select Ped.idPedido [No. Pedido], Ped.data, SUM(IP.qtd * IP.valor) [Total Pedido], Ped.status,
  case Ped.status
  when 1 then 'Em andamento'
  when 2 then 'Finalizado'
  when 3 then 'Entregue'
  else 'Cancelado'
end [Situacao Pedido]
from Pedidos Ped, Itens_Pedidos IP
where Ped.idPedido = IP.pedidoId
group by Ped.idPedido, Ped.data, Ped.status
having Ped.status = 2

-- 38) Consultar todos os pedidos que não tem itens cadastrados e calcular o total de cada pedido
-- Saída: no., data, valor, status do pedido
-- Objetivo: juntar dados das tabelas pedidos, itens_pedidos. Também usar Select aninhado
select Ped.idPedido [No. Pedido], Ped.data, SUM(IP.qtd * IP.valor) [Total Pedido], Ped.status,
  case Ped.status
  when 1 then 'Em andamento'
  when 2 then 'Finalizado'
  when 3 then 'Entregue'
  else 'Cancelado'
end [Situacao Pedido]
from Pedidos Ped, Itens_Pedidos IP
where Ped.idPedido not in (select pedidoId
from Itens_Pedidos IP)
group by Ped.idPedido, Ped.data, Ped.status