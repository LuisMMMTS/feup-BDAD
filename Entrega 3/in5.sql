.mode       columns
.headers    on
.nullvalue  NULL

--Tabela para obter produtos mais bem classificados e a sua quantidade vendida
SELECT * FROM
 (
    SELECT P.id, P.name, sum(QP.quantity) as totalQuantity, PR.rating
    FROM Product P JOIN ProductReview PR JOIN QuantityofProduct QP ON PR.productId = P.id AND QP.productId = P.id
    WHERE 
    GROUP BY P.id
    ORDER BY PR.rating DESC
) ProductQuantityReview

WHERE ProductQuantityReview.PR.rating > 3
ORDER BY ProductInfo.id;