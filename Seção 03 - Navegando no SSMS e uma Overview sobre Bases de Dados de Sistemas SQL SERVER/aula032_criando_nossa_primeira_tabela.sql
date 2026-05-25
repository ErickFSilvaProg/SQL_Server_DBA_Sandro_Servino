-- Informa o banco de dados que será utilizado para criar a tabela:
use clientes
go


-- Criar tabela no banco de dados:
create table cliente (
	idCliente int NOT NULL,
	nomeCliente varchar (30) NOT NULL,
	enderecoCliente varchar (50) NOT NULL,
	idadeCliente int NULL,
	constraint PK_cliente primary key clustered (idCliente asc)
)
go


-- Excluir tabela no banco de dados:
drop table cliente
go