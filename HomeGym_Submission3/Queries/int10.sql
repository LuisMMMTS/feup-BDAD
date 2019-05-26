.mode       columns
.headers    on
.nullvalue  NULL

--top 10 costumers com maior taxa review/compra (C.id, C.name, nºcompras, nºreview, taxa)

SELECT customerId, cName, nProducts, nReviews, (nProducts/nReviews) as productReviewRate FROM
 (
    SELECT C.id as customerId, CD.name as cName, count(QP.productId) as nProducts
    FROM Customer C JOIN CustomerDetails CD ON C.ssn = CD.ssn
                    JOIN Orders O ON C.id = O.customerId
					JOIN QuantityofProduct QP ON O.id = QP.orderId
    GROUP BY customerId
    ORDER BY customerId ASC
 ) N

JOIN

 (
    SELECT C.id as id, CD.name as customerName, count(PR.customerId) as nReviews
    FROM Customer C JOIN CustomerDetails CD ON C.ssn = CD.ssn
                    JOIN ProductReview PR ON PR.customerId = id
    
    GROUP BY id
    ORDER BY id ASC

 ) M

GROUP BY customerId
HAVING N.nProducts > 0
ORDER BY productReviewRate DESC
LIMIT 10;

