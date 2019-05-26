.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

SELECT name, storage, inStock, almostSoldOut FROM Product
WHERE Product.Id=10020 OR Product.Id=10021;

INSERT INTO QuantityOfProduct VALUES (10020, 20, 15);
INSERT INTO QuantityOfProduct VALUES (10021, 20, 31);

SELECT name, storage, inStock, almostSoldOut FROM Product
WHERE Product.Id=10020 OR Product.Id=10021;