.mode       columns
.headers    on
.nullvalue  NULL

--Tabela para obter produtos mais bem classificados e a sua quantidade vendida
SELECT * FROM
 (
    SELECT P.id as id, P.name, avg(PR.rating) as rating, count(PR.rating) as numReviews
    FROM Product P JOIN ProductReview PR ON P.id = PR.productId
    GROUP BY P.id
    ORDER BY PR.rating DESC
) ProductQuantityReview

WHERE ProductQuantityReview.rating > 3 -- could also be done like int1 with having (just to be different)
ORDER BY ProductQuantityReview.id;
