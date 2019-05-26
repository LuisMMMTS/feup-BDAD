.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

--check if user can make review

CREATE TRIGGER review_check
AFTER INSERT ON ProductReview
WHEN ((SELECT COUNT(*) AS contagem FROM (
SELECT Q.orderID, O.id
    FROM QuantityOfProduct Q JOIN Orders O ON O.id=Q.orderID
    WHERE Q.productID=NEW.productid AND O.customerId=NEW.customerId)) < 1)
    BEGIN
    SELECT raise(ROLLBACK, "The product wasn't bought by the client in ProductReview");
END;