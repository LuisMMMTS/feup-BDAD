.mode columns
.headers on
.nullvalue nullvalue

--update cart total price

CREATE TRIGGER calculateCartPrice
AFTER INSERT ON Orders
BEGIN
UPDATE Cart
SET totalPrice = totalPrice + New.totalPrice;
END;