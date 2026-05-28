/* 
	Selecionar o banco master: Procedimento padrão para criar um novo banco de dados com seus files e filegroups no SQL Server.
*/
use master
go


/* 
	Criar o banco de dados CLIENTES:
*/
create database CLIENTES
	on primary (
		name = 'CLIENTES', 
		filename = 'M:\Data\CLIENTES.mdf', 
		size = 64MB, 
		maxsize = unlimited, 
		filegrowth = 64MB)
	log on (
		name = 'CLIENTE_log', 
		filename = 'N:\Log\CLIENTES_log.ldf', 
		size = 64MB, 
		maxsize = unlimited, 
		filegrowth = 64MB)
go


/* 
	Altera o proprietário (owner) do banco de dados: Sempre especificar o "sa".
*/
alter authorization
	on database::CLIENTES
	to sa
go


/* 
	Selecionar o banco CLIENTES: Sair do banco master para criar os objetos no banco CLIENTES. 
*/
use CLIENTES
go


/* 
	Criando a tabela customer: (cliente) 
*/
create table customer (
	id int identity,
	firstName nvarchar(40) not null, -- nome
	lastName nvarchar(40) not null, -- sobrenome
	city nvarchar(40), -- cidade
	country nvarchar(40), -- pais
	phone nvarchar(20), -- telefone
)
go

-- Constraints da tabela customer:
alter table customer
	add constraint pk_customer 
		primary key (id)
go


/* 
	Criando a tebela order: (pedido) 
*/
create table "order" (
	id int identity,
	orderDate datetime not null default getdate(), -- dataPedido
	orderNumber nvarchar(10), -- numeroPedido
	totalAmount decimal(12,2) default 0, -- valorTotal
	customerId int not null
)
go

-- Constraints da tabela order:
alter table "order"
	add constraint pk_order
		primary key (id)
go

alter table "order"
	add constraint fk_order_customer
		foreign key (customerId) references customer (id)
go


/* 
	Criando a tabela supplier: (fornecedor) 
*/
create table supplier (
	id int identity,
	companyName nvarchar(40) not null, -- nomeEmpresa
	contactName nvarchar(50), -- nomeContato
	contactTitle nvarchar(40), -- cargoContato
	city nvarchar(40), -- cidade
	country nvarchar(40), -- pais
	phone nvarchar(30), -- telefone
	fax nvarchar(30) -- fax
)
go

-- Costraint de supplier:
alter table supplier
	add constraint pk_supplier
		primary key (id)
go


/* 
	Criando a tabela product: (produto) 
*/
create table product (
	id int identity,
	productName nvarchar(50) not null, -- nomeProduto
	unitPrice decimal(12,2) default 0, -- precoUnitario
	package nvarchar(30), -- embalagem
	isDiscontinued bit not null default 0, -- foiDescontinuado
	supplierId int not null -- idFornecedor
)
go

-- Constraints da tabela product:
alter table product
	add constraint pk_product
		primary key (id)
go

alter table product
	add constraint fk_product_supplier
		foreign key (supplierId) references supplier (id)
go


/* 
	Criando a tabela orderItem: (itemPedido) 
*/
create table orderItem (
	id int identity,
	unitPrice decimal(12,2) not null default 0, -- precoUnitario
	quantity int not null default 1, -- quantidade
	idOrder int not null, -- idPedido
	idProduct int not null -- idProduto
)
go

-- Constraints da tabela orderItem:
alter table orderItem
	add constraint pk_orderItem
		primary key (id)
go

alter table orderItem
	add constraint fk_orderItem_order
		foreign key (idOrder) references "order" (id)
go

alter table orderItem
	add constraint fk_orderItem_product
		foreign key (idProduct) references product (id)
go