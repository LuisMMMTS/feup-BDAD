.mode columns
.headers on
.nullvalue nullvalue

--check if user can make review

CREATE TRIGGER review_check
AFTER INSERT ON ProductReview
BEGIN
SELECT COUNT(*) AS contagem FROM (
SELECT Q.orderId, O.id
    FROM QuantityOfProduct Q JOIN Orders O ON O.id=Q.orderId
    WHERE Q.productId=New.productId AND O.customerId=New.customerId) aaaa


SELECT aaaa.contagem
CASE
    WHEN contagem =0  
        THEN ROLLBACK 
        END
        FROM aaaa.contagem 


 end;