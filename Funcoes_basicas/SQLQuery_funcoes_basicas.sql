-- Funções do SQL Server

-- CREATE DB
   -- Permite criar um novo banco de dados
CREATE DATABASE sys_compras
CREATE DATABASE sys_compras1
CREATE DATABASE sys_compras2
CREATE DATABASE sys_compras3
CREATE DATABASE sys_compras4
CREATE DATABASE sys_compras5
CREATE DATABASE sys_compras6
--Posso criar vários sys_compras1, sys_compras2, sys_compras3, sys_compras4...

-- ALTER DB
   -- Permite alterar um banco de dados existente
ALTER DATABASE sys_compras
	MODIFY NAME = new_sys_compras --modificando o nome do banco de dados

-- DROP DB
   -- Permite excluir um banco de dados
ALTER DATABASE new_sys_compras
	MODIFY NAME = sys_compras --modificando o nome do banco de dados

DROP DATABASE sys_compras
DROP DATABASE sys_compras1
DROP DATABASE sys_compras2
DROP DATABASE sys_compras3
DROP DATABASE sys_compras4
DROP DATABASE sys_compras5
DROP DATABASE sys_compras6


---USE
--Escolhando o banco de dados que será utilizado
USE sys_compras

CREATE TABLE teste (
cod_test   int,
name_test  varchar(50)
);


-- CREATE TABLE
   --Permite criar uma tabela
USE sys_compras

CREATE TABLE tbl_compras (
cod_compra         int not null,
data_compra        varchar(50),
compra_aprovada    bit,
total_compra       decimal,
);

SELECT * INTO tbl_compras_copy
	FROM tbl_compras

--ALTER TABLE
   --Permite modificar uma tabela
     -- alterar uma coluna
ALTER TABLE tbl_compras
	ALTER COLUMN data_compra datetime

ALTER TABLE tbl_compras
	ALTER COLUMN compra_aprovada bit not null;
	 -- excluir ua coluna

ALTER TABLE tbl_compras
	DROP COLUMN data_compra;

	 -- adicionar uma coluna

ALTER TABLE tbl_compras
	ADD data_compra date not null;

--DROP TABLE
	-- Permite excluir uma tabela
DROP TABLE tbl_compras_copy