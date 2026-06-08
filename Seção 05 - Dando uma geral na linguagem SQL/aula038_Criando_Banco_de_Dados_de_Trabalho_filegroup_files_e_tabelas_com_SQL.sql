/* 
	Criando nosso Banco de Dados de Trabalho, filegroup, files e tabelas com SQL.
*/


/* CRIAR OBJETOS */

-- Selecionar o banco master: Procedimento padrão para criar um novo banco de dados com seus files e filegroups no SQL Server.
use master;


-- Criar banco de dados:
create database CLIENTES
on primary (
	name = 'CLIENTES', 
	filename = 'M:\Data\CLIENTES.mdf', 
	size = 32MB, 
	maxsize = 2GB, 
	filegrowth = 64MB
)
log on (
	name = 'CLIENTE_log', 
	filename = 'N:\Log\CLIENTES_log.ldf', 
	size = 32MB, 
	maxsize = unlimited, 
	filegrowth = 64MB
);


-- Altera o proprietário (owner) do banco de dados: Sempre especificar o "sa".
alter authorization
on database::CLIENTES
to sa;


-- Criar filegroup:
alter database CLIENTES
add filegroup CLIENTES_ANTIGOS_FG;

alter database CLIENTES
add filegroup CLIENTES_FUTUROS_FG;


-- Criar file:
alter database CLIENTES
add file(
	name = CLIENTES_ANTIGOS,
	filename = 'M:\Data\CLIENTES_ANTIGOS.ndf',
	size = 32MB,
	maxsize = unlimited,
	filegrowth = 64MB
)
to filegroup CLIENTES_ANTIGOS_FG;

alter database CLIENTES
add file(
	name = CLIENTES_FUTUROS,
	filename = 'M:\Data\CLIENTES_FUTUROS.ndf',
	size = 32MB,
	maxsize = unlimited,
	filegrowth = 64MB
)
to filegroup CLIENTES_FUTUROS_FG;


-- Selecionar o banco CLIENTES: Sair do banco master para criar os objetos no banco CLIENTES.
use CLIENTES;


-- Criar a tabela clientes não informando o filegroup.
create table clientes(
	id int identity,
	nome varchar(50) not null,
	cidade varchar(30) not null,
	uf char(2) not null
);

alter table clientes
add constraint pk_clientes
primary key (id);


-- Criar a tabela clientesFuturos informando o filegroup.
create table clientesFuturos(
	-- O "identity" faz o SQL Server gerar números sequenciais automaticamente para este campo.
	id int identity,
	nome varchar(50) not null,
	cidade varchar(30) not null,
	uf char(2) not null
)
-- Expecificando o filegroup da tabela.
on CLIENTES_FUTUROS_FG;

alter table clientesFuturos
add constraint pk_clientesFuturos
primary key (id);


-- Criar a tabela clientesAntigos informando o filegroup.
create table clientesAntigos(
	id int identity,
	nome varchar(50) not null,
	cidade varchar(30) not null,
	uf char(2) not null
)
-- Expecificando o filegroup da tabela.
on CLIENTES_ANTIGOS_FG;

alter table clientesAntigos
add constraint pk_clientesAntigos
primary key (id);


/* DELETAR OBJETOS */

-- Deletar tabela:
drop table clientes;

drop table clientesFuturos;

drop table clientesAntigos;


-- Deletar file criado:
alter database CLIENTES
remove file CLIENTESANTIGOS;

alter database CLIENTES
remove file CLIENTESFUTUROS;


-- Deletar filegroup criado:
alter database CLIENTES
remove filegroup CLIENTESANTIGOS_FG;

alter database CLIENTES
remove filegroup CLIENTESFUTUROS_FG;


-- Deletar o banco de dados:
-- Selecionar o banco master, procedimento padrão para deletar um banco de dados criado.
use master;

drop database CLIENTES;