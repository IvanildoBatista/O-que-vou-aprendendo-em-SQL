--realizar operações de linhas
USE db_vendas

SELECT DISTINCT vendedor FROM tbl_vendas2
--tem vendedor com o seu codigo igual a zero
-- o certo é que isso não ocorra
-- logo, 0 deve ser 1, 1 deve ser 2, etc...
-- devemos corrigir fazendo um UPDATE

------------------------------------------------------------------------------------------
 -- Somando valores
------------------------------------------------------------------------------------------

UPDATE tbl_vendas2
SET vendedor = vendedor + 1 -- irei adicionar o valor 1 para cada código de vendedor
-- o que eu faço aqui modifica todas as linhas

--Caso eu queira fazer um update para modificar o codigo do vendedor apenas para 
-- os valores que estão abaixo de 10

UPDATE tbl_vendas2
SET vendedor = vendedor+10
WHERE vendedor <> 10 -- uso o where para localizar/filtar os valores diferentes de 10

-- adicionando uma nova coluna
ALTER TABLE tbl_vendas2
ADD acrescimo float null

USE db_vendas

-- inserindo valores para a variável acrescimo
UPDATE tbl_vendas2
SET acrescimo = RAND()*10 --a função RAND serve para puxar um valor aleatorio

-- Criar nova coluna
ALTER TABLE tbl_vendas2
ADD valor_com_acrescimo float null

UPDATE tbl_vendas2
SET valor_com_acrescimo = valor_venda + acrescimo


------------------------------------------------------------------------------------------
 -- Subtraindo valores
------------------------------------------------------------------------------------------
USE db_vendas

-- Como subtrair valores
--digamos que não temos o valor de venda
ALTER TABLE tbl_vendas2
DROP COLUMN valor_venda
-- Irei recriar a coluna valor de venda com a operação de subtração

-- reinserindo a coluna de valor de venda
ALTER TABLE tbl_vendas2
ADD valor_venda float null

UPDATE tbl_vendas2
SET valor_venda = valor_com_acrescimo - acrescimo

SELECT * FROM tbl_vendas2

------------------------------------------------------------------------------------------
 -- multiplicando valores
------------------------------------------------------------------------------------------

USE db_vendas

CREATE TABLE tbl_itens_venda(
	cod_item int not null,
	venda int not null,
	valor_unitario float not null,
	qtd int not null
)

--com essa query toda, posso inserir valores aleatórios no banco de dados
DECLARE @currentID int;
DECLARE @nextID int;

SET @currentID = (SELECT MAX(cod_item) FROM tbl_itens_venda) + 1;

IF @currentID IS NULL
	SET @nextID = 1
ELSE
	SET @nextID = @currentID

INSERT INTO tbl_itens_venda(cod_item,venda,valor_unitario, qtd)
VALUES(@nextID,	RAND()* 20,	RAND()*100,	RAND()*10)

SELECT * FROM tbl_itens_venda

-- depois de inserir, podemos trabalhar com a tabela nova

SELECT * FROM tbl_itens_venda ORDER BY qtd
-- há muitos produtos com a quantidade 0, o que não faz sentido

--substituindo os valores zero por 1 
UPDATE tbl_itens_venda
SET qtd = 1
WHERE qtd = 0

-- Agora irei calcular o valor da venda
-- onde vou multiplicar o valor_unitario * qtd
-- criando uma nova coluna
ALTER TABLE tbl_itens_venda
ADD valor_venda_total float null

UPDATE tbl_itens_venda
SET valor_venda_total = qtd * valor_unitario

--visualizando por valor da venda total do maior para o menor
SELECT * FROM tbl_itens_venda ORDER BY valor_venda_total DESC 

------------------------------------------------------------------------------------------
 -- dividindo valores
------------------------------------------------------------------------------------------

USE db_vendas

ALTER TABLE tbl_vendas2
ADD total_desconto float null

UPDATE tbl_vendas2
SET total_desconto = valor_venda*desconto

-- Qual seria a porcentagem do total de desconto em relação ao 
-- valor total com acrescimo ???

ALTER TABLE tbl_vendas2
ADD porcentagem float null

UPDATE tbl_vendas2
SET porcentagem = total_desconto/valor_com_acrescimo

SELECT * FROM tbl_vendas2