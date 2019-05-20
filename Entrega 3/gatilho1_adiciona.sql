.mode columns
.headers on
.nullvalue nullvalue


DROP TRIGGER IF EXISTS calculateTotalPrice;

CREATE TRIGGER calculateTotalPrice
AFTER INSERT ON QuantityOfProduct
BEGIN
UPDATE Orders
SET totalPrice = totalPrice + New.quantity * (SELECT Product.price FROM Product WHERE Product.id = New.productId);
END;