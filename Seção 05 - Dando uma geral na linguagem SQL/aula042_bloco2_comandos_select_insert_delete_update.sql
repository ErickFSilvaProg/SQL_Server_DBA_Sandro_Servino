/*
	Selecionando o banco CLIENTES
*/

use CLIENTES;


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
where firstName = 'Thomas' and lastName = 'Hardy';


select id,
	   orderDate,
	   id_customer,
	   totalAmount
from [order]
where (totalAmount >= 500 and totalAmount <= 15000)
order by totalAmount desc;


-- OR:
select id,
	   firstName,
	   lastName,
	   city,
	   country
from customer
where country = 'Spain' or country = 'France';


-- NOT:
select id,
	   firstName,
	   LastName,
	   City,
	   Country
from customer
where not country = 'USA'
order by country asc;


select id,
	   orderDate,
	   id_customer,
	   totalAmount
from [order]
where not (totalAmount >= 50 and totalAmount <= 15000)
order by totalAmount asc;


-- IN:
select id as [Cód],
	   companyName as [Empresa],
	   city as [Cidade],
	   country as [País]
from supplier
where country in ('USA','UK','Japan');


-- NOT IN:
select id as [Cód],
	   ProductName as [Produto],
	   unitPrice as [Preço]
from product
where unitPrice not in (10,20,30,40,50);


-- BETWEEN:
select id,
	   productName,
	   unitPrice
from product
where unitPrice between 5 and 100
order by unitPrice;


select count(id) as [Total de IDs],
	   sum(totalAmount) as [Total Geral]
from [order]
where orderDate between '1/1/2013' and '1/31/2013';


-- NOT BETWEEN:
select id,
	   productName,
	   unitPrice
from product
where unitPrice not between 5 and 100
order by unitPrice;


-- LIKE:
select id,
	   productName,
	   unitPrice,
	   package
from product
where productName like 'Ca%'; -- Contenha um ou mais caracteres após o "Ca"


select id,
	   productName,
	   unitPrice,
	   package
from product
where productName like 'Cha_' or -- Contenha apenas um caracteres após o "Cha"
	  productName like 'Chan_'; -- Contenha apenas um caracteres após o "Chan"


-- IS NULL:
select id,
	   companyName,
	   phone,
	   fax
from supplier
where fax is null;


-- IS NOT NULL:
select id,
	   companyName,
	   phone,
	   fax
from supplier
where fax is not null;