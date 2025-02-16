-- Usando o AND, OR e o NOT
USE db_vendas

-- Selecionando tudo da tabela de vendas
SELECT * FROM tbl_vendas2

-----------------------------------------------------------
-- Condi��o AND
-----------------------------------------------------------

-- � Poss�vel fazer duas consultas ao mesmo tempo
-- Adicionar Crit�rio de sele��o
SELECT * FROM tbl_vendas2
WHERE tbl_vendas2.data_venda = '2022-10-30' AND
      tbl_vendas2.vendedor = 25 AND
	  tbl_vendas2.valor_venda > 706
-- vai mostrar que s� teve 3 vendas

SELECT TOP 5 * FROM tbl_itens_venda


-----------------------------------------------------------
-- Condi��o OR
-----------------------------------------------------------
-- Apenas um dos crit�rio podem ser verdade

SELECT * FROM tbl_itens_venda
WHERE tbl_itens_venda.qtd > 7 OR tbl_itens_venda.valor_venda_total > 400
ORDER BY tbl_itens_venda.valor_venda_total DESC

-- Condi��o 1: OU a quantidade > 5 OU o valor unit�rio > 80
-- Condi��o 2: valor total > 700
SELECT * FROM tbl_itens_venda
WHERE (tbl_itens_venda.qtd > 7 OR tbl_itens_venda.valor_unitario > 80) AND
      tbl_itens_venda.valor_venda_total > 700
ORDER BY tbl_itens_venda.valor_venda_total DESC


-----------------------------------------------------------
-- Condi��o NOT
-----------------------------------------------------------

-- Selecionado tudo que n�o � maior que 900
SELECT * FROM tbl_vendas2
WHERE NOT tbl_vendas2.valor_venda > 900
ORDER BY tbl_vendas2.valor_venda

-- Selecionar as observa��es que n�o s�o maiores que 90
-- e o vendendor n�o seja o 13
SELECT * FROM tbl_vendas2
WHERE NOT (tbl_vendas2.valor_venda > 900 AND tbl_vendas2.vendedor = 13)
ORDER BY tbl_vendas2.valor_venda DESC