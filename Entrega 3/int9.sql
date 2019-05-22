.mode       columns
.headers    on
.nullvalue  NULL

-- produto mais vendido por Pais (Nome, P.Id, quantidade)

SELECT * FROM
 (
    SELECT L.id, L.country, P.id , P.name, sum(QP.quantity) as totalQuantity
    FROM Location L JOIN CustomerLocation CL ON L.id = CL.locationId
                    JOIN Customer C  ON C.id = CL.customerId 
                    JOIN Orders O  ON O.customerId = C.id
                    JOIN QuantityOfProduct QP ON QP.orderId = O.id
                    JOIN Product P On P.id = QP.productId
    WHERE L.country like 'P%' -- country starting with P
    GROUP BY L.id, P.id -- group by country and then by product -> all var's in group by bmust be in select
    ORDER BY country ASC
) N
WHERE N.totalQuantity > 0
ORDER BY N.id;
