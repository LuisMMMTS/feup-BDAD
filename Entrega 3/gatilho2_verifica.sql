.mode       columns
.headers    on
.nullvalue  NULL

--atenção verificar que TRIGGER 1 foi lido, senão apenas o cart 206 será atualizado.

INSERT INTO Payment VALUES (11, 'Visa', 4443439882621377);
INSERT INTO Cart VALUES (210, 11, 0);

SELECT totalPrice FROM Cart WHERE Cart.id=210;

INSERT INTO Orders VALUES (123514, 210, 31, '2017-1-23', 20);
SELECT totalPrice FROM Cart WHERE Cart.id=210;

