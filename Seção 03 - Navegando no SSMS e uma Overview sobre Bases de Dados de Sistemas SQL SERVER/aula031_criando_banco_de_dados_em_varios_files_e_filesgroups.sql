/* Criando Banco de Dados em vários files e filegroups utilizando a linguagem SQL */


-- Criar o banco de dados DE FORMA RESUMIDA:
create database CLIENTES
go


-- Criar o banco de dados DETALHADAMENTE:
CREATE DATABASE[CLIENTES]
CONTAINMENT = NONE

ON PRIMARY
(NAME = N'CLIENTES', FILENAME = N'M:\Data\CLIENTES_1.mdf', SIZE = 10240KB, MAXSIZE = 1024000KB, FILEGROWTH = 102400KB),
(NAME = N'CLIENTES2', FILENAME = N'M:\Data\CLIENTES_2.ndf', SIZE = 10240KB, MAXSIZE = 1024000KB, FILEGROWTH = 102400KB),

FILEGROUP [CLIENTES_IMPORTANTES]
(NAME = N'CLIENTES_IMPORTANTES', FILENAME = N'Q:\ClientesImportantes\CLIENTES_IMPORTANTES.ndf', SIZE = 102400KB, MAXSIZE = 1024000KB, FILEGROWTH = 102400KB)

LOG ON
(NAME = N'CLIENTES_log', FILENAME = N'N:\Log\CLIENTES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB)

WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO


/* ********************************************* */

-- Se houver conexões ativas com o banco de dados, é necessário forçar o encerramento delas primeiro.
-- Força o banco a ficar em modo de usuário único e encerra conexões ativas
ALTER DATABASE [NomeDoSeuBanco] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;


-- Deleta o banco de dados
DROP DATABASE [NomeDoSeuBanco];


-- Reverter um banco de dados do modo de usuário único (Single User) para o modo de múltiplos usuários (Multi User) no SQL Server
ALTER DATABASE [NomeDoSeuBanco] SET MULTI_USER;
-- ou
ALTER DATABASE [NomeDoSeuBanco] SET MULTI_USER WITH ROLLBACK IMMEDIATE;