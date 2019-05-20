.mode columns
.headers on
.nullvalue nullvalue

SELECT Orders.CustomerId, sum(Orders.TotalPrice) as TotalPrice
FROM Customer JOIN Orders ON Customer.id = Orders.CustomerId
GROUP BY Orders.CustomerId;