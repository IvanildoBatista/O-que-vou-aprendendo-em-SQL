--CREATE DATABASE db_vendas
USE db_vendas

DROP TABLE tbl_vendas;

CREATE TABLE tbl_vendas2(
cod_venda int not null,
data_venda date not null,
vendedor int not null,
valor_venda decimal not null
)
------------------------------------------------------------------------------------------
-- Inserindo valores (INSERT INTO)
------------------------------------------------------------------------------------------
USE db_vendas
INSERT INTO tbl_vendas2(cod_venda, data_venda, vendedor, valor_venda)
VALUES(1, '2025-01-19',10,239.56)-- aqui a ordem importa, pois a tabela será preenchida
                                 -- com esses valores





------------------------------------------------------------------------------------------
-- Modificar os valores de uma tabela (UPDATE)
------------------------------------------------------------------------------------------
--Vou inserir outros valores antes

INSERT INTO tbl_vendas2(cod_venda, data_venda, vendedor, valor_venda)
VALUES(3, '2025-01-20',11,9000) -- (2, '2025-01-20',10,25000),
                                -- (3, '2025-01-20',11,18000)
								--(4, '2025-01-23',14,6000)

USE db_vendas
UPDATE tbl_vendas2
SET data_venda = '2025-01-20', vendedor= 10

USE db_vendas
UPDATE tbl_vendas2
SET cod_venda = '2'
WHERE cod_venda = '1'


------------------------------------------------------------------------------------------
-- Deletando valores
------------------------------------------------------------------------------------------

USE db_vendas
--type 1
--deleta os valores da tabela e não a tabela
DELETE tbl_vendas2

--type 2
INSERT INTO tbl_vendas2(cod_venda, data_venda, vendedor, valor_venda)
VALUES(4,'2025-01-22',13,16000) ,(2, '2025-01-20',12,24000), (1, '2025-01-19', 11, 23000),
(3, '2025-01-18', 15, 2000), (5, '2025-01-18', 09, 12000), (6, '2025-01-08', 14, 67000)

DELETE FROM tbl_vendas2

------------------------------------------------------------------------------------------
 -- Comando WHERE
------------------------------------------------------------------------------------------

--deletando onde o código de vendas é igual a 6
USE db_vendas
DELETE FROM tbl_vendas2  WHERE cod_venda = '6';

UPDATE tbl_vendas2
SET vendedor = 15
WHERE cod_venda = 1

USE db_vendas

UPDATE tbl_vendas2
SET desconto = '0.15'
WHERE valor_venda > = 20000

------------------------------------------------------------------------------------------
--Selecionar colunas e linhas
------------------------------------------------------------------------------------------


USE db_vendas

--Type 1
SELECT * FROM tbl_vendas2

--Type 2
SELECT * FROM tbl_vendas2
--WHERE desconto > 0
WHERE desconto IS NULL

--Type 3
SELECT cod_venda, valor_venda FROM tbl_vendas2
-- não necessariamente o filtro precisa estar na coluna
WHERE data_venda = '2025-01-18'


SELECT TOP (1000) [cod_venda]
      ,[data_venda]
      ,[vendedor]
      ,[valor_venda]
	  ,[desconto]
  FROM [db_vendas].[dbo].[tbl_vendas2]







