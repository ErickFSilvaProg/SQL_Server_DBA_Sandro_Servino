/* 
	Selecionar o banco master: Procedimento padrão para criar um novo banco de dados com seus files e filegroups no SQL Server.
*/
use master;


/* 
	Criar o banco de dados CLIENTES: Especificando os files.
*/
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


/* 
	Altera o proprietário (owner) do banco de dados: Sempre especificar o "sa".
*/
alter authorization
on database::CLIENTES
to sa;


/* 
	Selecionar o banco CLIENTES: Sair do banco master para criar os objetos no banco CLIENTES. 
*/
use CLIENTES;


/* 
	Criando a tabela customer: (cliente) 
*/
create table customer (
	id int identity(1,1), -- O SQL Server gererá automaticamente um número começando em 1 e acrescentará mais 1 a cada novo registro.
	firstName nvarchar(40) not null, -- nome
	lastName nvarchar(40) not null, -- sobrenome
	city nvarchar(40), -- cidade
	country nvarchar(40), -- pais
	phone nvarchar(20) -- telefone
);

-- Constraints da tabela customer:
alter table customer
add constraint pk_customer 
primary key (id);


/* 
	Criando a tebela order: (pedido)
*/
create table [order] (
	id int identity(1,1),
	orderDate datetime not null default getdate(), -- dataPedido
	orderNumber nvarchar(10), -- numeroPedido
	totalAmount decimal(12,2) default 0, -- valorTotal
	id_customer int not null
);

-- Constraints da tabela order:
alter table [order]
add constraint pk_order
primary key (id);

alter table [order]
add constraint fk_order_customer
foreign key (id_customer) references customer (id);


/* 
	Criando a tabela supplier: (fornecedor) 
*/
create table supplier (
	id int identity(1,1),
	companyName nvarchar(40) not null, -- nomeEmpresa
	contactName nvarchar(50), -- nomeContato
	contactTitle nvarchar(40), -- cargoContato
	city nvarchar(40), -- cidade
	country nvarchar(40), -- pais
	phone nvarchar(30), -- telefone
	fax nvarchar(30) -- fax
);

-- Costraint de supplier:
alter table supplier
add constraint pk_supplier
primary key (id);


/* 
	Criando a tabela product: (produto) 
*/
create table product (
	id int identity(1,1),
	productName nvarchar(50) not null, -- nomeProduto
	unitPrice decimal(12,2) default 0, -- precoUnitario
	package nvarchar(30), -- embalagem
	isDiscontinued bit not null default 0, -- foiDescontinuado
	id_supplier int not null -- idFornecedor
);

-- Constraints da tabela product:
alter table product
add constraint pk_product
primary key (id);

alter table product
add constraint fk_product_supplier
foreign key (supplierId) references supplier (id);


/* 
	Criando a tabela orderItem: (itemPedido) 
*/
create table orderItem (
	id int identity(1,1),
	unitPrice decimal(12,2) not null default 0, -- precoUnitario
	quantity int not null default 1, -- quantidade
	id_order int not null, -- idPedido
	id_product int not null -- idProduto
);

-- Constraints da tabela orderItem:
alter table orderItem
add constraint pk_orderItem
primary key (id);

alter table orderItem
add constraint fk_orderItem_order
foreign key (id_order) references [order] (id);

alter table orderItem
add constraint fk_orderItem_product
foreign key (id_product) references product (id);
