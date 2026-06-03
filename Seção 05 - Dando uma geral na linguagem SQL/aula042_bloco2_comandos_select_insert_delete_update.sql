/*
	Selecionando o banco CLIENTES
*/

use CLIENTES
go


/*
	WHERE, AND, OR, NOT, IN, BETWEEN, LIKE, IS NULL, CLAUSE
*/

-- AND:
select id as [Cód],
	   firstName as [Nome],
	   lastName as [Sobrenome],
	   city as[Cidade],
	   country as [País]
from customer
where firstName = 'Thomas' and lastName = 'Hardy'
go

select id,
	   orderDate,
	   customerId,
	   totalAmount
from [order]
where (totalAmount >= 500 and totalAmount <= 15000)
order by totalAmount desc
go


-- OR:
select id,
	   firstName,
	   lastName,
	   city,
	   country
from customer
where country = 'Spain' or country = 'France'
go


-- NOT:
select id,
	   firstName,
	   LastName,
	   City,
	   Country
from customer
where not country = 'USA'
go

select id,
	   orderDate,
	   customerId,
	   totalAmount
from [order]
where not (totalAmount >= 50 and totalAmount <= 15000)
order by totalAmount asc
go


-- IN:
select id as [Cód],
	   companyName as [Empresa],
	   city as [Cidade],
	   country as [País]
from supplier
where country in ('USA','UK','Japan')
go


-- NOT IN:
select id as [Cód],
	   ProductName as [Produto],
	   unitPrice as [Preço]
from product
where unitPrice not in (10,20,30,40,50)
go


-- BETWEEN:
select id,
	   productName,
	   unitPrice
from product
where unitPrice between 5 and 100
order by unitPrice
go

select count(id) as [Total de IDs],
	   sum(totalAmount) as [Total de final]
from [order]
where orderDate between '1/1/2013' and '1/31/2013'
go


-- NOT BETWEEN:
select id,
	   productName,
	   unitPrice
from product
where unitPrice not between 5 and 100
order by unitPrice
go


-- LIKE:
select id,
	   productName,
	   unitPrice,
	   package
from product
where productName like 'Ca%' -- Contenha um ou mais caracteres após o "Ca"
go

select id,
	   productName,
	   unitPrice,
	   package
from product
where productName like 'Cha_' or -- Contenha apenas um caracteres após o "Cha"
	  productName like 'Chan_' -- Contenha apenas um caracteres após o "Chan"
go


-- IS NULL:
select id,
	   companyName,
	   phone,
	   fax
from supplier
where fax is null
go


-- IS NOT NULL:
select id,
	   companyName,
	   phone,
	   fax
from supplier
where fax is not null
go