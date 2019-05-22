.mode       columns
.headers    on
.nullvalue  NULL

--Tabela para obter produtos mais bem classificados e a sua quantidade vendida
SELECT * FROM
 (
    SELECT P.id as id, P.name, avg(PR.rating) as rating, count(PR.rating) as numReview
    FROM Product P JOIN ProductReview PR JOIN ON PR.productId = P.id
    GROUP BY P.id
    ORDER BY PR.rating DESC
) ProductQuantityReview

WHERE ProductQuantityReview.rating > 3
ORDER BY ProductQuantityReview.id;
