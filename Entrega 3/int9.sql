.mode       columns
.headers    on
.nullvalue  NULL

-- produto mais vendido por localidade (Nome, P.Id, quantidade)

SELECT ProductByCountry.id as id, ProductByCountry.country as country, ProductByCountry.productName as bestSellingProduct, max(ProductByCountry.totalQuantity) as timesSold FROM
 (
    SELECT L.id as id, L.country as country, P.id , P.name as productName, sum(QP.quantity) as totalQuantity
    FROM Location L JOIN CustomerLocation CL ON L.id = CL.locationId
                    JOIN Customer C  ON C.id = CL.customerId 
                    JOIN Orders O  ON O.customerId = C.id
                    JOIN QuantityOfProduct QP ON QP.orderId = O.id
                    JOIN Product P On P.id = QP.productId
    GROUP BY L.id, P.id -- group by country and then by product -> all var's in group by bmust be in select
    ORDER BY country ASC
) ProductByCountry
GROUP BY ProductByCountry.id
ORDER BY ProductByCountry.id;
