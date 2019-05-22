.mode       columns
.headers    on
.nullvalue  NULL

--top 10 costumers com maior taxa review/compra (C.id, C.name, nºcompras, nºreview, taxa)

SELECT id, cName, nOrders, nReviews, nOrders/nReviews AS ordersReviewRate
FROM
 (
    SELECT C.id AS id, CD.name AS cName, count(O.id) AS nOrders, 
    FROM Customer C JOIN CustomerDetails CD ON C.ssn = CD.ssn
                    JOIN Orders O ON id = O.customerId
    GROUP BY id
    ORDER BY id ASC
 ) N

JOIN ON N.id = M.id

 (
    SELECT C.id AS id, CD.name AS cName, count(PR.id) AS nReviews
    FROM Customer C JOIN CustomerDetails CD ON C.ssn = CD.ssn
                    JOIN ProductReview PR ON PR.customerId = id
    
    GROUP BY id
    ORDER BY id ASC

 ) M

WHERE N.nOrders > 0
ORDER BY N.id;

