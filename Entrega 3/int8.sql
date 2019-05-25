.mode       columns
.headers    on
.nullvalue  NULL

--Paises onde sao feitas mais compras, numero de orders
--Ex(Portugal, 50.000$ vendas, 250 clientes)
SELECT L.country, count(O.id) as numOrders
FROM Location L JOIN CustomerLocation CL ON L.id = CL.locationId 
		JOIN Orders O ON CL.customerId = O.customerId
GROUP BY L.country
ORDER BY numOrders DESC;

	
