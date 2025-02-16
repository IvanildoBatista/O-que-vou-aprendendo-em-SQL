-- Utilizando operadores lógicos
-- Limitar consultas
USE db_vendas
 SELECT * FROM tbl_itens_venda
 
 ----------------------------------------------------------------
 --Operador de diferença
 ----------------------------------------------------------------

 -- Símbolo : "<>"
 -- Selecionando as vendas cujas quantidades são diferente de 1
SELECT * FROM tbl_itens_venda 
 WHERE qtd <> 1
 ORDER BY qtd
 -- Usando strings de data
 SELECT * FROM tbl_vendas2 
 WHERE data_venda <> '30-10-2022'
 ORDER BY data_venda

 ----------------------------------------------------------------
 --Operador de maior que
 ----------------------------------------------------------------
 -- Selecionado valores de venda maior que 500
 -- também pode ser usado para strings e datas
 SELECT * FROM tbl_vendas2 
 WHERE valor_venda <> '500'


 ----------------------------------------------------------------
 --Operador de menor que
 ----------------------------------------------------------------
 
 --Selecionando as vendas com dados anteriores a 30/10/2022
SELECT * FROM tbl_vendas2 
 WHERE data_venda < '30-10-2022'
 ORDER BY data_venda

 -- Usando para criar outras colunas
 ALTER TABLE tbl_vendas2
 ADD nome varchar(50) null

 UPDATE tbl_vendas2
  SET nome = 'Paulo'
  WHERE valor_venda > 500

UPDATE tbl_vendas2
  SET nome = 'Luis'
  WHERE valor_venda <= 500 -- ainda terão valores NULL

 ----------------------------------------------------------------
 --Operador de maior ou igual que
 ----------------------------------------------------------------
 SELECT * FROM tbl_vendas2 
 WHERE valor_venda >= 500
 ORDER BY valor_venda

 SELECT * FROM tbl_vendas2 
 WHERE data_venda >= '30-10-2022'
 ORDER BY data_venda

 ----------------------------------------------------------------
 --Operador de menor ou igual que
 ----------------------------------------------------------------

  SELECT * FROM tbl_vendas2 
 WHERE valor_venda <= 500
 ORDER BY valor_venda

 SELECT * FROM tbl_vendas2 
 WHERE data_venda <= '30-10-2022'
 ORDER BY data_venda

 ----------------------------------------------------------------
 --Operador BETWEEN (entre)
 ----------------------------------------------------------------

 SELECT cod_venda, data_venda, valor_venda FROM tbl_vendas2
 WHERE valor_venda >= 500 AND valor_venda <= 700

SELECT cod_venda, data_venda, valor_venda FROM tbl_vendas2
 WHERE valor_venda BETWEEN 500 AND 700


 SELECT * FROM tbl_vendas2

 UPDATE tbl_vendas2
 SET nome = 'Luis'
 WHERE valor_venda > 500

 UPDATE tbl_vendas2
 SET nome = 'Paulo'
 WHERE valor_venda < 500

SELECT cod_venda, data_venda, valor_venda, nome FROM tbl_vendas2
 WHERE nome BETWEEN 'Paula' AND 'Paulo'


 ----------------------------------------------------------------
 --Operador LIKE
 ----------------------------------------------------------------
 --Usado para textos para filtrar uma parte específica

UPDATE tbl_vendas2
SET nome = 'Luiz'
WHERE valor_venda <= 500


UPDATE tbl_vendas2
SET nome = 'Paulo'
WHERE valor_venda >= 800

SELECT cod_venda, data_venda, valor_venda, nome FROM tbl_vendas2
WHERE nome LIKE '%uis'

SELECT cod_venda, data_venda, valor_venda, nome FROM tbl_vendas2
WHERE nome LIKE '%a%'

SELECT cod_venda, data_venda, valor_venda, nome FROM tbl_vendas2
WHERE nome LIKE 'p%____' --o underline serve para selecionar o numero de letras após a letra escolhida

 ----------------------------------------------------------------
 --Operador IN (em)
 ----------------------------------------------------------------
 -- é preciso passar um vetor com os nomes

SELECT cod_venda, data_venda, valor_venda, nome FROM tbl_vendas2
WHERE nome IN ('Luis','Paulo')



