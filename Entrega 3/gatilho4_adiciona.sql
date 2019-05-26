.mode columns
.headers on
.nullvalue nullvalue

--check if user can make review

CREATE TRIGGER review_check
AFTER INSERT ON ProductReview
BEGIN
SELECT Q.orderID
    FROM QuantityOfProduct as Q
    WHERE QuantityOfProduct.productID=new.productID;
SELECT O.id 
    FROM Orders as O
    WHERE Orders.customerId=new.customerId;

SELECT COUNT(*) FROM O.id NATURAL JOIN Q.orderID;

contagem =  CASE WHEN contagem = 0 THEN ROLLBACK END;


 end;