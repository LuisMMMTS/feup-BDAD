.mode columns
.headers on
.nullvalue nullvalue

--Diz quantas orders e o valor destas orders de cada clientes numa dada data
SELECT C.id, CD.Name, count(*) as nOrders, sum(O.totalPrice) as totalPrice
FROM Customer C JOIN Orders O ON C.id = O.customerId
				JOIN CustomerDetails CD ON C.ssn = CD.ssn
WHERE '2015-07-12'<= O.orderDate AND O.orderDate<='2019-01-01' -- data pode ser alterada
GROUP BY C.id
HAVING nOrders > 0
ORDER BY totalPrice