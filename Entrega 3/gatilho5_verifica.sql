.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

SELECT ord FROM orders
WHERE orders.customerId=123521;

INSERT INTO Orders VALUES (123521, 211, 34, '2017-1-23', 20);
INSERT INTO QuantityOfProduct VALUES (10020, 34, 14);
INSERT INTO Orders VALUES (123521, 211, 35, '2017-1-23', 20);
INSERT INTO QuantityOfProduct VALUES (10021, 35, 34);

SELECT ord FROM orders
WHERE orders.customerId=123521;