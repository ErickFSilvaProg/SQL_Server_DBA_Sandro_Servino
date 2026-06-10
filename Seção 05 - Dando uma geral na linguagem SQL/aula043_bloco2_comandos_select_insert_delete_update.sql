-- Selecionando o banco CLIENTES
use CLIENTES;


-- SQL GROUP BY:
select country as [PAÍSES],
	   count(id) as [CÓDIGOS]
from customer
-- O "where" sempre é inserida entes do "group by"
where country is not null
group by country;


select country as [PAÍSES],
	   city as [CIDADES],
	   count(id) as [CÓDIGOS]
from customer
-- O "where" sempre é inserida entes do "group by"
where country is not null
group by country, city
order by country, city;


-- SQL ALIAS: Apelidos.
select count(c.id) as [TotalCustomers],
	   c.country as [Nation]
from customer c
group by c.country;


select count(c.id) as [numberClients],
	   c.country
from  customer c
group by c.country
order by c.country;