.mode columns
.headers on
.nullvalue nullvalue

--Quantas vezes um cliente especificado comprou um mesmo produto; atributos( product id, product name, quantitidade)
SELECT QP.productId, P.name, sum(QP.quantity) as totalQuantity
FROM QuantityofProduct QP JOIN Product P JOIN Orders O JOIN Customer C
    ON QP.productId = P.id AND  O.Id = QP.orderId
WHERE O.customerId = 123515 -- pode ser alterado
GROUP BY P.id
ORDER BY totalQuantity DESC;