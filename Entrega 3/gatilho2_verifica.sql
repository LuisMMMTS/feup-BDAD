.mode       columns
.headers    on
.nullvalue  NULL
PRAGMA foreign_keys = on;

--atenção verificar que TRIGGER 1 foi lido, senão apenas o cart 206 será atualizado.

INSERT INTO Payment VALUES (12, 'Visa', 4443439882621377);
INSERT INTO Cart VALUES (211, 12, 0);

SELECT totalPrice FROM Cart WHERE Cart.id=211;

INSERT INTO Orders VALUES (123514, 211, 33, '2017-1-23', 20);
SELECT totalPrice FROM Cart WHERE Cart.id=211;

