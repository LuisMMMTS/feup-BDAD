.mode       columns
.headers    on
.nullvalue  NULL

--Encontra os 10 produtos menos vendidos
SELECT QP.productId, P.name, sum(QP.quantity) as quantity
FROM QuantityofProduct QP JOIN Product P ON P.id = QP.productId
GROUP BY QP.productId;
ORDER BY quantity ASC
LIMIT 10;