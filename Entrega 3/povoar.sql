PRAGMA	foreign_keys	=	ON;

INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (813715341, 'Michael Underwood', '1995-11-19');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123512, 813715341, 'michael_underwood@sapo.pt');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (822974293, 'Bradley Marlowe', '1960-8-25');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123513, 822974293, 'bradley_marlowe@educatin.gov');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (679764754, 'Heather Stclair', '1978-10-23');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123514, 679764754, 'heather_stclair@Biqle.ru');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (146495536, 'Christopher Harper', '1988-5-18');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123515, 146495536, 'christopher_harper@live.com');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (567387220, 'Wanda Whitmire', '1953-9-28');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123516, 567387220, 'wanda_whitmire@outlook.com');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (329271694, 'Angelina Tate', '1972-5-06');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123517, 329271694, 'angelina_tate@gmail.com');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (175260908, 'Dana Mercer', '1973-03-14');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123518, 175260908, 'dana_mercer@sapo.pt');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (368169353, 'Wilton Monteagudo', '1962-6-19');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123519, 368169353, 'wilton_monteagudo@sapo.pt');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (554447932, 'Stephen Johnston', '1972-1-04');
INSERT INTO Customer(Id, SSN, EMAIL)
	VALUES (123520, 554447932, 'stephen_johnston@educatin.gov');
INSERT INTO CustomerDetails(SSN, Name, BirthDate) 
	VALUES (503812047, 'Antonio Mcmullen', '1962-3-09');
INSERT INTO Customer(Id, SSN, EMAIL) 
	VALUES (123521, 503812047, 'antonio_mcmullen@outlook.com');

INSERT INTO Admin(customerId, employeeId, sector, jobTitle) 
    VALUES (123512, 13, 'Logistic', 'Logistic planner');
INSERT INTO Admin(customerId, employeeId, sector, jobTitle) 
    VALUES (123513, 12, 'IT', 'Database Manager');
INSERT INTO Admin(customerId, employeeId, sector, jobTitle) 
    VALUES (123514, 11, 'IT', 'Database Manager');
INSERT INTO Admin(customerId, employeeId, sector, jobTitle) 
    VALUES (123515, 10, 'Logistic', 'Logistic planner');	
	
INSERT INTO Company(id, name, city, revenue) 
	VALUES (0, 'APPLE', 'Tokyo', 15000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (1, 'APPLE', 'Paris', 20000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (2, 'APPLE', 'Lisbon', 12000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (3, 'APPLE', 'Pequim', 12000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (4, 'ASUS', 'Xangai', 543000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (5, 'ALCATEL', 'Cascais', 16000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (6, 'BISARO', 'Setubal', 7000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (7, 'BISARO', 'Evora', 5000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (8, 'EUROFUMEIRO', 'Coimbra', 9000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (9, 'ENCHIDOS DE LAMEGO', 'Lamego', 3000000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (10, 'AUCHAN', 'Setubal', 1000000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (11, 'AUCHAN', 'Fatima', 2000000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (12, 'A SALOINHA', 'Albufeira', 900000);
INSERT INTO Company(id, name, city, revenue) 
	VALUES (13, 'A SALOINHA', 'Algarve', 800000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (14, 'MARK', 'Porto', 600000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (15, 'CLEMENTONI', 'Lisbon', 6500000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (16, 'RIK&ROK', 'Tavira', 1650000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (17, 'HASBRO', 'Peniche', 1500000);
INSERT INTO Company(id, name, city, revenue)
	VALUES (18, 'MAJORA', 'Cascais', 2700000);
	
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (0, 0, '2017-02-15', '2018-08-26');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (1, 0.1, '2018-10-18', '2019-04-20');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (2, 0.5, '2016-06-24', '2016-08-24');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (3, 0.7, '2019-01-01', '2019-02-15');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (4, 0.8, '2019-07-23', '2019-08-25');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (5, 0.3, '2017-09-16', '2017-11-19');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (6, 0, '2015-02-15', '2018-08-27');
INSERT INTO ProductDiscount(id,discount,startDate, finishDate) 
	VALUES (7, 0, '2015-01-18', '2016-03-21');		
	
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10020,'3 Ralados P/Gratinar 200 G','Cold Meats',4.75,'True',0, 6);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10021,'Alheira  180G','Cold Meats',12.99,'True',0, 7);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10022,'Alheira  200 G','Cold Meats',5.90,'False',1, 7);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10023,'Alheira De Galo  180G','Cold Meats',8.49,'False',0, 6);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10024,'Alheira De Vinhais Igp  200 G','Cold Meats',25.99,'False',0, 6);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10025,'Alheira  170 G','Cold Meats',29.49,'True',1, 9);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10026,'Alheira Com Cogumelos 200 G','Cold Meats',15.59,'False',0, 9);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10027,'Alheira Com Queijo 200 G','Cold Meats',32.49,'False',0, 9);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10028,'Alheira De Bacalhau Emb. 200 G','Cold Meats',5.59,'False',0, 8);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10029,'Alheira De Mirandela Igp 200 G','Cold Meats',19.99,'True',0, 8);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10030,'Alheira Light 200 G','Cold Meats',1.89,'True',0, 8);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10100, 'Macbook Air Gold', 'Laptops', 2000.89, 'True', 2, 0);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10101, 'Macbook Air Gold 13', 'Laptops', 1285.99, 'False', 3, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10102, 'Macbook Air Silver 13', 'Laptops', 1910.89, 'True', 0, 0);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10103, 'Macbook Air Silver', 'Laptops', 900, 'True', 0, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10104, 'Macbook Air Spgrey', 'Laptops', 780.99, 'True', 5, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10105, 'Macbook Air Spgrey', 'Laptops', 2500, 'False', 0, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10106, 'Macbook Pro I5 128Gb', 'Laptops', 1000.19, 'True', 2, 2);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10107, 'Macbook Pro I5 8Gb', 'Laptops', 3200.92, 'False', 1, 2);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10108, 'Macbook Pro I5 8Gb128 Silver', 'Laptops', 1200.49,'False',0, 2);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10109, 'Macbook Pro Silver', 'Laptops', 1300.99, 'False', 7, 1);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 	
	VALUES (10010,'Batatas Fritas Rodelas 150 G', 'Snacks', 1.99, 'True', 5, 12);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 	
	VALUES (10011,'Batatas Fritas Rodelas 90 G', 'Snacks', 1.39, 'False', 6, 12);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10013,'Batatas Fritas Palha 200 G', 'Snacks', 2.19, 'False', 0, 10);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10014,'Batatas Fritas Palha 400 G', 'Snacks', 4.15, 'True', 7, 10);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10015,'Batatas Fritas Receita Tradicional 200 G', 'Snacks', 2.45, 'True', 2, 14);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10016,'Batatas Fritas Receita Tradicional 400 G', 'Snacks', 3.79, 'False', 0, 11);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10017,'Batatas Fritas Rodelas 200 G', 'Snacks', 2.59, 'False', 0, 14);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10018,'Batatas Fritas Rodelas 400 G', 'Snacks', 4.79, 'False', 6, 14);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 	
	VALUES (10019, 'Batatas  Fritas Lisa 100 G', 'Snacks', 1.89, 'True', 0, 10);	
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10136, 'Rugged Phone Dual Sim', 'Smartphones', 189 , 'True', 7, 4);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10126, 'Smartphone Dourado 4.7 32Gb Iphone 7', 'Smartphones', 129.99, 'False', 0, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10127, 'Smartphone Gold 64Gb Iphone 8', 'Smartphones', 689.99, 'True',0, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10134, 'Smartphone Silver 64Gb Iphone 8', 'Smartphones', 569.99, 'False', 4, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10137, 'Smartphone Sp.Grey 64 Iphone Xs', 'Smartphones', 879.99, 'False', 0, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10138, 'Smartphone Verm 256Gb Iphone Xr', 'Smartphones', 659.99, 'False', 3, 3);
INSERT INTO Product(id,name,line,price,inStock,discountId,companyId) 
	VALUES (10140, 'Smartphone Preto Zenfone 5', 'Smartphones', 769.99, 'False', 3, 4);	
	
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (1, 'Paypal', 4711449666569544);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (2, 'Visa', 4851879195152542);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (3, 'Visa', 4445510523822875);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (4, 'Mastercard', 4894177942643017);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (5, 'ShopCard', NULL);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (6, 'Mastercard', 4553562033049947);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (7, 'ShopCard', NULL);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (8, 'Mastercard', 4502632751767736);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (9, 'ShopCard', NULL);
INSERT INTO Payment(id,paymentMethod,creditCardNumber) 
	VALUES (10, 'Visa', 4443439882621377);
	
INSERT INTO Cart(id,paymentId) 
	VALUES (200, 1);
INSERT INTO Cart(id,paymentId) 
	VALUES (201, 2);
INSERT INTO Cart(id,paymentId) 
	VALUES (202, 3);
INSERT INTO Cart(id,paymentId) 
	VALUES (203, 4);
INSERT INTO Cart(id,paymentId) 
	VALUES (204, 5);
INSERT INTO Cart(id,paymentId) 
	VALUES (205, 6);
INSERT INTO Cart(id,paymentId) 	
	VALUES (206, 7);
INSERT INTO Cart(id,paymentId) 
	VALUES (207, 8);
INSERT INTO Cart(id,paymentId) 
	VALUES (208, 9);
INSERT INTO Cart(id,paymentId) 	
	VALUES (209, 10);

INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (20, '2017-1-23', 123514, 206);
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (21, '2017-9-7', 123517, 207);
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (22, '2017-1-9', 123519, 208);
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (23, '2017-8-18', 123518, 201);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (24, '2019-2-15', 123515, 205);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (25, '2015-6-11', 123518, 204);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (26, '2017-11-9', 123518, 209);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (27, '2018-8-10', 123515, 207);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (28, '2017-5-7', 123516, 208);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (29, '2014-3-22', 123517, 203);	
INSERT INTO Orders(id,orderDate, customerId, cartId) 
	VALUES (30, '2016-12-15', 123519, 201);		

INSERT INTO Location(id, postalCode, country) 
	VALUES (1001, '3540-307', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1002, '1219-828', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1003, '1509-570', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1004, '5613-712', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1005, '6235-655', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1006, '2836-760', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1007, '4728-352', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1008, '8465-299', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1009, '6038-274', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1010, '2098-150', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1011, '2061-811', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1012, '3225-840', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1013, '1185-874', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1014, '8211-655', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1015, '1594-794', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1016, '1834-432', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1017, '7664-539', 'China');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1018, '1060-841', 'Japan');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1019, '2047-402', 'China');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1020, '2969-882', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1021, '5339-148', 'France');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1022, '4780-198', 'Portugal');
INSERT INTO Location(id, postalCode, country) 
	VALUES (1023, '6279-305', 'Portugal');	

INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1021, 123512);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1012, 123513);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1011, 123514);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1002, 123515);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1020, 123516);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1015, 123517);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1008, 123518);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1014, 123519);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1002, 123520);
INSERT INTO CustomerLocation(locationId, customerId) 
	VALUES (1019, 123521);	

INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10024, 20, 1);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10019, 21, 2);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10101, 22, 3);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10100, 23, 4);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10105, 24, 4);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10016, 25, 1);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10126, 26, 1);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10136, 27, 1);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10029, 28, 1);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10013, 29, 3);
INSERT INTO QuantityOfProduct(productId, orderId, quantity) 
	VALUES (10016, 30, 1);
	
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123514, 10017, 3, '2017-5-16');	
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123521, 10105, 4, '2018-8-18');
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123518, 10137, 1, '2016-11-21');		
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123515, 10025, 5, '2019-9-9');	
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123515, 10018, 2, '2017-12-24');
INSERT INTO ProductReview(customerId, productId, rating, date) 
	VALUES (123516, 10108, 4, '2018-7-16');		
