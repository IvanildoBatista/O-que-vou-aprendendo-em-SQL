-- Usando o AND, OR e o NOT
USE db_vendas

-- Selecionando tudo da tabela de vendas
SELECT * FROM tbl_vendas2

-----------------------------------------------------------
-- Condição AND
-----------------------------------------------------------

-- É Possível fazer duas consultas ao mesmo tempo
-- Adicionar Critério de seleção
SELECT * FROM tbl_vendas2
WHERE tbl_vendas2.data_venda = '2022-10-30' AND
      tbl_vendas2.vendedor = 25 AND
	  tbl_vendas2.valor_venda > 706
-- vai mostrar que só teve 3 vendas

SELECT TOP 5 * FROM tbl_itens_venda


-----------------------------------------------------------
-- Condição OR
-----------------------------------------------------------
-- Apenas um dos critério podem ser verdade

SELECT * FROM tbl_itens_venda
WHERE tbl_itens_venda.qtd > 7 OR tbl_itens_venda.valor_venda_total > 400
ORDER BY tbl_itens_venda.valor_venda_total DESC

-- Condição 1: OU a quantidade > 5 OU o valor unitário > 80
-- Condição 2: valor total > 700
SELECT * FROM tbl_itens_venda
WHERE (tbl_itens_venda.qtd > 7 OR tbl_itens_venda.valor_unitario > 80) AND
      tbl_itens_venda.valor_venda_total > 700
ORDER BY tbl_itens_venda.valor_venda_total DESC


-----------------------------------------------------------
-- Condição NOT
-----------------------------------------------------------

-- Selecionado tudo que não é maior que 900
SELECT * FROM tbl_vendas2
WHERE NOT tbl_vendas2.valor_venda > 900
ORDER BY tbl_vendas2.valor_venda

-- Selecionar as observações que não são maiores que 90
-- e o vendendor não seja o 13
SELECT * FROM tbl_vendas2
WHERE NOT (tbl_vendas2.valor_venda > 900 AND tbl_vendas2.vendedor = 13)
ORDER BY tbl_vendas2.valor_venda DESC