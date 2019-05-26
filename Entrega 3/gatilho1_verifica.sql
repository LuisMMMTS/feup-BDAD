.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = on;

SELECT totalPrice FROM Orders WHERE Orders.id=20;

INSERT INTO QuantityOfProduct VALUES (10025, 20, 1);

SELECT totalPrice FROM Orders WHERE Orders.id=20;