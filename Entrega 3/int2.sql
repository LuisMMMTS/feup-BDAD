.mode columns
.headers on
.nullvalue nullvalue

--Quantas vez que um cliente especificado comprou um mesmo produto; atributos( product id, product name, quantitidade)

SELECT QP.productId, P.name, sum(QP.quantity) as totalQuantity, C.id
FROM QuantityofProduct QP JOIN Product P JOIN Orders O JOIN Customer C
    ON QP.productId = P.id AND  O.customerId = C.id
WHERE C.id like '%123520%'
GROUP BY C.id
ORDER BY quantity DESC

--problema: orders feitas pelo mesmo cliente do mesmo produto... 
--- obj : somar essas quantidades 


