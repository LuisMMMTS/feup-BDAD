.mode columns
.headers on
.nullvalue nullvalue

CREATE TRIGGER enough_stock
AFTER INSERT ON QuantityOfProduct
WHEN [Product.storage-New.quantity)<=0 WHERE Product.id]
BEGIN
ROLLBACK

WHERE Product.Id = New.productId;
END;