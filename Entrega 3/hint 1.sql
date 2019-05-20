.mode columns
.headers on
.nullvalue nullvalue

SELECT * FROM
 (
    SELECT C.id, CD.Name, COUNT(*) as nOrders
    FROM Customer C JOIN Orders O JOIN CustomerDetails CD ON C.id = O.CustomerId AND C.ssn = CD.ssn
    WHERE '2018-07-12'<= O.orderDate AND O.orderDate<='2019-01-01'
    GROUP BY C.id
) N
WHERE N.nOrders > 0
ORDER BY N.id;