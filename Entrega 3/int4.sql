.mode       columns
.headers    on
.nullvalue  NULL

--Clientes que mais pouparam com descontos (CustomerId, Valor Total compras sem desconto, Valor poupado)


--Tabela com productId, preço, OrderDate, quantidade
CREATE VIEW IF NOT EXISTS [Customer_Product] as
SELECT C.id as clientId, QP.productId, P.price as price, O.orderDate, sum(QP.quantity) as totalQuantity
FROM QuantityofProduct QP JOIN Product P ON QP.productId = P.id
						  JOIN Orders O  ON O.Id = QP.orderId
						  JOIN Customer C ON O.customerId = C.id
GROUP BY O.id;

--Tabela com productId, preço, valor do desconto
CREATE VIEW IF NOT EXISTS [Product_and_Discount] as
   SELECT P.id as productId, PD.id as discountId, PD.discount as discount, PD.startDate, PD.finishDate
   FROM Product P JOIN ProductDiscount PD ON PD.id = P.discountId;

SELECT Customer_Product.clientId, sum(Customer_Product.price*Customer_Product.discount) as discountedSum
FROM Customer_Product NATURAL JOIN Product_and_Discount
GROUP BY Customer_Product.clientId
HAVING discountedSum > 0
ORDER BY discountedSum DESC;




