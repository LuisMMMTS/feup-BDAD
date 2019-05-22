.mode columns	
.headers on	
.nullvalue nullvalue	

 --update storage	

 CREATE TRIGGER lowStorage	
AFTER INSERT ON Orders	
BEGIN	
UPDATE Product	
SET storage = storage - New.quantity,	
    inStock =  CASE WHEN storage = 0 THEN 'False' ELSE 'True' END,	
    almostSoldOut =  CASE WHEN (storage = 0 or storage>=20) THEN 'False' ELSE 'True' END;	
END;