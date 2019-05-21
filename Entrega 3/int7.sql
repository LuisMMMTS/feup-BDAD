.mode       columns
.headers    on
.nullvalue  NULL

--ProductId ; ProductName ; Quantity
CREATE VIEW [ProductSales_WITHOUT_discount] as
    SELECT P.id, P.name, sum(QP.quantity) as QuantityNoDiscount
    FROM Product P JOIN ProductDiscount PD JOIN QuantityOfProduct QP
    ON PD.id = P.discountId AND QP.productId = P.id
    WHERE PD.discount like '%0%'
    GROUP BY P.id
    Order By P.id ASC


--ProductId ; ProductName ; Quantity
CREATE VIEW [ProductSales_WITH_discount] as
    SELECT P.id, P.name, sum(QP.quantity) as QuantityDiscount
    FROM Product P JOIN ProductDiscount PD JOIN QuantityOfProduct QP
    ON PD.id = P.discountId AND QP.productId = P.id
    WHERE PD.discount > 0
    GROUP BY P.id
    Order By P.id ASC

--comparar o numero de compras para cada produto quando é aplicada uma promoção e quando não é
SELECT ProductSales_WITH_discount.P.id, 
    ProductSales_WITH_discount.P.name
    ProductSales_WITH_discount.QuantityNoDiscount,
    ProductSales_WITHOUT_discount.QuantityDiscount

FROM ProductSales_WITH_discount NATURAL JOIN ProductSales_WITHOUT_discount
GROUP BY ProductSales_WITH_discount.P.id
ORDER BY ProductSales_WITH_discount.P.id