USE db_vendas

SELECT * FROM tbl_vendas2

DECLARE @currentID int;
DECLARE @nextID int;

SET @currentID = (SELECT MAX(cod_venda) FROM tbl_vendas2) + 1;

IF @currentID IS NULL
	SET @nextID = 1
ELSE
	SET @nextID = @currentID
INSERT INTO tbl_vendas2(
	cod_venda,
	data_venda,
	desconto,
	valor_venda,
	vendedor
) VALUES(@nextID, 
'2022-10-27', RAND(), RAND() + (RAND() * 1000)+RAND(),
	RAND() * 10)

SELECT * from tbl_vendas2 ORDER BY cod_venda DESC

----------------------------------------------------------------------------------------------------------------
--Selecionar/filtrar
----------------------------------------------------------------------------------------------------------------

USE db_vendas
-- Selecionar as 10 primeiras
SELECT TOP 10 * FROM tbl_vendas2
-- Selecionar as 10 primeiras das colunas codigo de venda, data de venda e valor de venda
SELECT TOP 10 cod_venda, data_venda, valor_venda FROM tbl_vendas2

-- 10 menores valores
SELECT TOP 10 cod_venda, data_venda, valor_venda FROM tbl_vendas2
ORDER  BY valor_venda
-- 10 maiores valores
SELECT TOP 10 cod_venda, data_venda, valor_venda FROM tbl_vendas2
ORDER  BY valor_venda DESC

-- 10 maiores valores do dia 30/10/2022
SELECT TOP 10 cod_venda, data_venda, valor_venda FROM tbl_vendas2
WHERE data_venda = '2022-10-30'
ORDER  BY valor_venda DESC


-- O maior valor do dia 30/10/2022
SELECT TOP 1 cod_venda, data_venda, valor_venda FROM tbl_vendas2
WHERE data_venda = '2022-10-30'
ORDER  BY valor_venda DESC

----------------------------------------------------------------------------------------------------------------
--Selecionar valores distintos
----------------------------------------------------------------------------------------------------------------
--buscar valores que não se repetem
SELECT DISTINCT * FROM tbl_vendas2

SELECT DISTINCT DATA_VENDA, vendedor FROM tbl_vendas2

SELECT DISTINCT DATA_VENDA, vendedor FROM tbl_vendas2 ORDER BY vendedor ASC

SELECT DISTINCT vendedor, cod_venda FROM tbl_vendas2 ORDER BY vendedor ASC

SELECT DISTINCT cod_venda, data_venda, vendedor
FROM tbl_vendas2
WHERE data_venda='2022-10-30'
ORDER BY vendedor ASC

SELECT DISTINCT cod_venda, data_venda
FROM tbl_vendas2
WHERE data_venda='2022-10-30'
ORDER BY cod_venda ASC

SELECT DISTINCT data_venda FROM tbl_vendas2
/*-- O maior valor do dia 30/10/2022
SELECT TOP 1 cod_venda, data_venda, valor_venda FROM tbl_vendas2
WHERE data_venda = '2022-10-30'
ORDER  BY valor_venda DESC*/
