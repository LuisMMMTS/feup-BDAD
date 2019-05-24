.mode columns
.headers on
.nullvalue nullvalue

--update order total price

CREATE TRIGGER calculateOrderPrice
AFTER INSERT ON QuantityOfProduct
BEGIN
UPDATE Orders
SET totalPrice = totalPrice + round(New.quantity * (
    SELECT Product.price
        FROM Product 
        WHERE Product.id = New.productId
        )*(1-(
        SELECT ProductDiscount.discount FROM ProductDiscount 
        WHERE ProductDiscount.id=(SELECT Product.discountId FROM Product WHERE Product.id = New.productId))),2)
WHERE Orders.Id=New.orderID;
END;