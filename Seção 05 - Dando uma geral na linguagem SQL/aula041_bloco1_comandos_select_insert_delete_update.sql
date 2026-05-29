/*
	Selecionando o banco CLIENTES
*/

use CLIENTES
go


/*
	SELECTS na tabela customer
*/

-- Projeta os dados renomeando o cabeçalho das colunas:
select firstName as "NAME",
	   lastName as "LASTNAME",
	   city as "CITY"
from customer
go

-- Essa maneira gera problemas de performance ao banco:
select * from customer
go

 -- Filtra por pais:
select id, firstName, lastName, City, Country, Phone
from customer
where country = 'Sweden'
go

-- Ordenação com mais de uma coluna em ordem ascendente:
select firstName, lastName, city, country
from customer
order by country, city
go

-- Conta a quantidade de registros em uma coluna:
select count(id) as "QTD de registros"
from customer
go


/*
	SELECTS na tabela supplier
*/

-- Ordena pelo nome da empresa em ordem ascendente:
select companyName, contactName, City, Country
from supplier
order by companyName
go

-- Ordena pelo nome da empresa em ordem decrescente:
select companyName, contactName, city, country
from supplier
order by companyName desc
go

-- Projeta os registros filtrando por pais e removendo os campos repetidos:
select distinct country
from supplier
order by country
go

-- Projeta os registros filtrando por pais sem remover os campos repetidos:
select country
from supplier
order by country
go

select country, companyName, contactName, contactTitle, city, phone,fax
from supplier
order by country
go


/*
	SELECTS na tabela product
*/

-- Projeta os 10 primeiros registros ordenando peço unitário em ordem decrescente:
select top 10 id, productName, unitPrice, package
from product
order by unitPrice desc
go

-- Projeta apenas os valores unitários da tabela produto:
select unitPrice
from product
go

-- Projeta o menor preço da coluna unitPrice da tabela produto:
select min(unitPrice) as "Menor valor"
from product
go


/*
	SELECTS na tabela order
*/

-- Projeta os registros da tabela order:
select * from "order"
go

-- Projeta o maior preço da coluna totalAmount da tabela order filtrando o ano:
select max(totalAmount) as "Maior valor"
from "order"
where year(orderDate) = 2014
go

-- Projeta a soma da coluna totalAmount da tabela order filtrando por ano:
select sum(totalAmount) as "Valor total dos pedidos"
from "order"
where year(orderDate) = 2013
go

-- Projeta o valor médio da coluna totalAmount da tabela order
select avg(totalAmount) as "Valor médio dos pedidos"
from "order"
go