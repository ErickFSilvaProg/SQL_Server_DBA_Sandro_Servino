/* 
	Criando nosso Banco de Dados de Trabalho, filegroup, files e tabelas com SQL.
*/


/* CRIAR OBJETOS */

-- Selecionar o banco master: Procedimento padrão para criar um novo banco de dados com seus files e filegroups no SQL Server.
use master
go


-- Criar banco de dados:
create database [CLIENTES]
	on primary 
		(name = N'CLIENTESATUAIS', filename = N'M:\Data\CLIENTES.mdf', size = 65536KB, filegrowth = 65536KB)
	log on 
		(name = N'CLIENTES_log', filename = N'N:\Log\CLIENTES_log.ldf', size = 65536KB, filegrowth = 65536KB)
go


-- Criar filegroup:
alter database CLIENTES
add filegroup CLIENTESANTIGOS_FG
go

alter database CLIENTES
add filegroup CLIENTESFUTUROS_FG
go


-- Criar file:
alter database CLIENTES
add file (
	name = CLIENTESANTIGOS,
	filename = 'M:\Data\CLIENTESANTIGOS.ndf',
	size = 64MB,
	maxsize = 128MB,
	filegrowth = 64MB
)
to filegroup CLIENTESANTIGOS_FG
go

alter database CLIENTES
add file (
	name = CLIENTESFUTUROS,
	filename = 'M:\Data\CLIENTESFUTUROS.ndf',
	size = 64MB,
	maxsize = 128MB,
	filegrowth = 64MB
)
to filegroup CLIENTESFUTUROS_FG
go


-- Selecionar o banco CLIENTES: Sair do banco master para criar os objetos no banco CLIENTES.
use CLIENTES
go


-- Criar tabela: Não informando o filegroup.
create table clientes (
	-- O "identity" faz o SQL Server gerar números sequenciais automaticamente para este campo.
	idCliente int identity primary key,
	nome varchar(50),
	cidade varchar(15),
	uf varchar(2)
)
go


-- Criar tabela: Informando o filegroup.
create table clientesFuturos (
	-- O "identity" faz o SQL Server gerar números sequenciais automaticamente para este campo.
	idCliente int identity primary key,
	nome nvarchar(50),
	cidade nvarchar(15),
	uf varchar(2)
)
-- Expecificando o filegroup da tabela.
on CLIENTESFUTUROS_FG
go

create table clientesAntigos (
	idCliente int identity primary key,
	nome nvarchar(50),
	cidade nvarchar(15),
	uf varchar(2)
)
on CLIENTESANTIGOS_FG
go


/* DELETAR OBJETOS */

-- Deletar tabela:
drop table clientes
go

drop table clientesFuturos
go

drop table clientesAntigos
go


-- Deletar file criado:
alter database CLIENTES
remove file CLIENTESANTIGOS
go

alter database CLIENTES
remove file CLIENTESFUTUROS
go


-- Deletar filegroup criado:
alter database CLIENTES
remove filegroup CLIENTESANTIGOS_FG
go

alter database CLIENTES
remove filegroup CLIENTESFUTUROS_FG
go


-- Deletar o banco de dados:
-- Selecionar o banco master, procedimento padrão para deletar um banco de dados criado.
use master
go

drop database CLIENTES
go