.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

--update storage

CREATE TRIGGER lowStorage
AFTER INSERT ON QuantityOfProduct
BEGIN
UPDATE Product
SET storage = storage - New.quantity,
    inStock =  CASE WHEN (storage-New.quantity) = 0 THEN 'False' ELSE 'True' END,
    almostSoldOut =  CASE WHEN (storage-New.quantity = 0 or storage-New.quantity>=20) THEN 'False' ELSE 'True' END
    WHERE Product.Id = New.productId;
END;
