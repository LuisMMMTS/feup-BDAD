.mode       columns
.headers    on
.nullvalue  NULL

--encontrar as datas de promoção de um produto especifico e o valor da promoção (PID, P.NAME, DATA_ININCO, DATA_FIM)
SELECT P.id, P.name, PD.startDate, PD.finishDate, PD.discount
FROM Product P JOIN ProductDiscount PD 
WHERE P.discountId = PD.id AND P.id = 10100 AND PD.discount <> 0;

--diferenca entre like e = ?