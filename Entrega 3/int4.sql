.mode       columns
.headers    on
.nullvalue  NULL

--Clientes que mais pouparam com descontos (CustomerId, Valor Total compras sem desconto, Valor poupado)


--Tabela com productId, preço, valor do desconto
CREATE VIEW [DiscountedValueProduct]
AS SELECT P.id, P.price, PD.discount
  FROM Product P, ProductDiscount PD,
  INNER JOIN DiscountedValueProduct
  ON P.discountId = PD.id;

--Tabela productId OrderId CustomerId e Quantity
CREATE VIEW [CostumerProduct] -- Tabela com producID vezes
AS SELECT QP.productId, sum(QP.quantity) as quantity, QP.orderId, OD.customerId
  FROM QuantityofProduct QP, Orders OD
  GROUP BY OD.customerId

SELECT ..
FROM  CostumerProduct CP, DiscountedValueProduct DP
    WHERE CP.QP.producId = DP.P.id






