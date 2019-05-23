.mode columns
.headers on
.nullvalue nullvalue

--Quantas vezes um cliente especificado comprou um mesmo produto; atributos( product id, product name, quantitidade)
SELECT QP.productId, P.name, sum(QP.quantity) as totalQuantity
FROM QuantityofProduct QP JOIN Product P ON QP.productId = P.id
						  JOIN Orders O  ON O.Id = QP.orderId
						  JOIN Customer C ON O.customerId = C.id
WHERE O.customerId = 123515 -- pode ser alterado
GROUP BY P.id
ORDER BY totalQuantity DESC;