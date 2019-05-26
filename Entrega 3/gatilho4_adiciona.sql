.mode columns
.headers on
.nullvalue nullvalue

--check if user can make review

CREATE TRIGGER review_check
AFTER INSERT ON ProductReview
WHEN [SELECT COUNT(*) AS contagem FROM (
SELECT Q.orderId, O.id
    FROM QuantityOfProduct Q JOIN Orders O ON O.id=Q.orderId
    WHERE Q.productId=New.productId AND O.customerId=New.customerId)>0]

BEGIN

SELECT raise(ROLLBACK, "erro");

end;
