.mode       columns
.headers    on
.nullvalue  NULL

--ProductId ; ProductName ; Quantity
CREATE VIEW IF NOT EXISTS [ProductSales_WITHOUT_discount] as
    SELECT P.id, P.name, sum(QP.quantity) as QuantityNoDiscount
    FROM Product P JOIN ProductDiscount PD JOIN QuantityOfProduct QP JOIN Orders OD
    ON PD.id = P.discountId AND QP.productId = P.id AND QP.orderId = OD.id
    WHERE PD.discount = 0 OR OD.orderDate < PD.startDate OR OD.orderDate > PD.finishDate
    GROUP BY P.id
    Order By P.id ASC;


--ProductId ; ProductName ; Quantity
CREATE VIEW IF NOT EXISTS [ProductSales_WITH_discount] as
    SELECT P.id, P.name, sum(QP.quantity) as QuantityDiscount
    FROM Product P JOIN ProductDiscount PD JOIN QuantityOfProduct QP JOIN Orders OD
    ON PD.id = P.discountId AND QP.productId = P.id AND QP.orderId = OD.id
    WHERE PD.discount > 0 AND OD.orderDate > PD.startDate AND OD.orderDate < PD.finishDate
    GROUP BY P.id
    Order By P.id ASC;

--comparar o numero de compras para cada produto quando é aplicada uma promoção e quando não é
SELECT *
FROM ProductSales_WITH_discount NATURAL JOIN ProductSales_WITHOUT_discount
GROUP BY ProductSales_WITH_discount.id
ORDER BY ProductSales_WITH_discount.id;