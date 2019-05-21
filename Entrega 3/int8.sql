.mode       columns
.headers    on
.nullvalue  NULL

--Paises onde sao feitas mais compras, valor dessas compras, numero de clientes
--Ex(Portugal, 50.000$ vendas, 250 clientes)
CREATE VIEW IF NOT EXISTS[Country_NumCostumers]
	SELECT L.country, count(C.id) as numCustomers
	FROM Location L JOIN CustomerLocation CL ON L.id = CL.locationId JOIN Customer C ON CL.customerId = C.id
	GROUP BY L.country;

	
