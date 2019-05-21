.mode       columns
.headers    on
.nullvalue  NULL

--encontrar as datas de promoção de um produto especifico e o valor da promoção (PID, P.NAME, DATA_ININCO, DATA_FIM)
SELECT P.id, P.name, PD.startDate, PD.finishDate
FROM Product P JOIN ProductDiscount PD WHERE P.discountId = PD.id
WHERE P.id like '%10020%'

--diferenca entre like e = ?