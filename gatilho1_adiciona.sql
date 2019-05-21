.mode columns
.headers on
.nullvalue nullvalue

--update order total price

CREATE TRIGGER calculateOrderPrice
AFTER INSERT ON QuantityOfProduct
BEGIN
UPDATE Orders
SET totalPrice = totalPrice + New.quantity * (
    SELECT Product.price
        FROM Product 
        WHERE Product.id = New.productId
        )*0.01*(
        SELECT ProductDiscount.discount FROM ProductDiscount 
        WHERE ProductDiscount.id=(SELECT Product.discountId FROM Product WHERE Product.id = New.productId))
WHERE Orders.Id=New.productId;
END;