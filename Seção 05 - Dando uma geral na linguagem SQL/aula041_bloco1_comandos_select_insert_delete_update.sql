/*
	Seleciona o banco CLIENTES
*/

use CLIENTES;


/*
	Listar as tabelas existentes no banco:
*/

select table_name as [Tabela]
from information_schema.tables;


/*
	SELECTS na tabela customer
*/

-- Projeta os dados renomeando o cabeçalho das colunas:
select firstName as [NAME],
	   lastName as [LASTNAME],
	   city as [CITY]
from customer;

-- Essa maneira gera problemas de performance ao banco:
select * from customer;

 -- Filtrar por pais:
select id as [ID],
	   firstName as [NOME],
	   lastName as [SOBRENOME],
	   city as [CIDADE],
	   country as [PAÍS],
	   phone as [TELEFONE]
from customer
where country = 'Brazil' or country = 'Brasil';

-- Ordenação com mais de uma coluna em ordem ascendente:
select firstName as [NOME],
	   lastName as [SOBRENOME],
	   country as [PAIS],
	   city as [CIDADE]
from customer
order by country asc, city asc;

-- Conta a quantidade de registros em uma coluna:
select count(id) as [REGISTROS]
from customer;

select count(id) as [REGISTROS]
from customer
where country = 'Brasil' or country = 'Brazil';


/*
	SELECTS na tabela supplier
*/

-- Ordena pelo nome da empresa em ordem ascendente:
select companyName as [Empresa],
	   contactName as [Contato],
	   city as [Cidade],
	   country as [País]
from supplier
order by companyName;

-- Ordena pelo nome do país e da cidade em ordem crescente:
select companyName as [Company],
	   contactName as [Contact],
	   city as [City],
	   country as [Country]
from supplier
order by country asc;

-- Projeta os registros filtrando por pais e removendo os campos repetidos:
select distinct country as [Country]
from supplier
order by country;

-- Projeta os registros filtrando por pais sem remover os campos repetidos:
select country as [COUNTRY],
	   companyName as [COMPANY]
from supplier
order by country;


/*
	SELECTS na tabela product
*/

-- Projeta os 10 primeiros produtos ordenando por preço unitário em ordem crescente:
select top 10 id, 
			  productName, 
			  unitPrice,
			  package
from product
order by unitPrice desc;

-- Projeta apenas os valores unitários da tabela produto:
select unitPrice
from product;

-- Projeta o menor preço da coluna unitPrice da tabela produto:
select min(unitPrice) as [Menor valor]
from product;


/*
	SELECTS na tabela order
*/

-- Projeta os registros da tabela order:
select * from [order];

-- Projeta o maior preço da coluna totalAmount da tabela order filtrando o ano:
select max(totalAmount) as [Maior valor]
from [order]
where year(orderDate) = 2014;

-- Projeta a soma da coluna totalAmount da tabela order filtrando por ano:
select sum(totalAmount) as [Valor total dos pedidos]
from [order]
where year(orderDate) = 2013;

-- Projeta o valor médio da coluna totalAmount da tabela order
select avg(totalAmount) as [Valor médio dos pedidos]
from [order];