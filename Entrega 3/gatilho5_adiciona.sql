.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

CREATE TRIGGER enough_stock
AFTER INSERT ON QuantityOfProduct
WHEN [Product.storage-New.quantity)<=0]
BEGIN
UPDATE QuantityOfProduct
SET quantity = Product.storage
WHERE Product.Id = New.productId;
END;