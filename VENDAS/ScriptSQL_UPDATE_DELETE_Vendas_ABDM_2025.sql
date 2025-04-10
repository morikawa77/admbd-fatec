----------------------------------------------------------------
-- ACESSAR O BANCO DE DADOS
----------------------------------------------------------------
use VendasABDM25
go

----------------------------------------------------------------
-- CRUD - CREATE - READ - UPDATE - DELETE
----------------------------------------------------------------

----------------------------------------------------------------
-- UPDATE
----------------------------------------------------------------

-- 1) Alterar a quantidade em estoque do produto 2 para 90 unidades
update Produtos set qtd = 90 where idProduto = 2 
go 

-- 2) Alterar o status de todos os pedidos para 3, sempre que o status estiver com NULL 
update Pedidos set status = 3 where status is null 
go 

-- 3) Dar baixa em estoque do produto 17
select SUM(qtd) from Itens_Pedidos where produtoId = 17
go 

update Produtos set qtd = qtd - 4 where idProduto = 17
go 

select * from Produtos where idProduto = 17
go 

-- 4) Dar baixa em estoque do produto 3
update Produtos set qtd = qtd - (select SUM(qtd) from Itens_Pedidos where produtoId = 3) where idProduto = 3
go

-- 5) Calcular o total do Pedido 1 e atualizar esse valor na tabela de Pedidos e alterar o status para 3
select SUM(qtd * valor) Valor_total from Itens_Pedidos where pedidoId = 1
go 

update Pedidos set status = 3, valor = (select SUM(qtd * valor) Valor_total from Itens_Pedidos where pedidoId = 1) where idPedido = 1
go


-- 6) Atualizar o status de todas as pessoas cadastradas, colocando-as como ativas (status = 1) no sistema
update Pessoas set status = 1
go 

-- 7) Dar aumento de 10% no valor de todos os Produtos
update Produtos set valor = valor * 1.10
go 


-- 8) Dar 5% de desconto para todos os produtos com valor <= 10.50
update Produtos set valor = valor * 0.95 where valor <= 10.50
go 

-- 9) Zerar a quantidade de estoque de todos os produtos que não foram vendidos. Colocar estes produtos como inativos (status = 2)
update Produtos set status = 2, qtd = 0 where idProduto not in (select produtoId from Itens_Pedidos)
go 

-- 10) Atualizar a quantidade de produtos em estoque para + 10, com quantidade < 20 na tabela de produtos e passar o status para 1
update Produtos set status = 1, qtd = qtd + 10 where qtd < 20
go 

----------------------------------------------------------------
-- CRUD - CREATE - READ - UPDATE - DELETE
----------------------------------------------------------------

----------------------------------------------------------------
-- DELETE
----------------------------------------------------------------

-- 1) Excluir todos os pedidos que não tem itens cadastrados
delete from Pedidos where idPedido not in (select pedidoId from Itens_Pedidos)
go 

-- 2) Excluir todos os produtos que nunca foram vendidos
delete from Produtos where idProduto not in (select produtoId from Itens_Pedidos)
go 