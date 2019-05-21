PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment(
	id INTEGER NOT NULL ON CONFLICT ABORT,
	paymentMethod TEXT NOT NULL ON CONFLICT ABORT,
	creditCardNumber INTEGER, 
	
	PRIMARY KEY(id),
	CHECK(paymentMethod == 'Paypal' OR paymentMethod == 'Mastercard' OR paymentMethod == 'ShopCard'  OR paymentMethod == 'Visa')
);

DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart(
	id INTEGER NOT NULL ON CONFLICT ABORT,
	paymentId INTEGER UNIQUE,
    totalPrice INTEGER NOT NULL DEFAULT(0),
	
	FOREIGN KEY (paymentId) REFERENCES Payment(Id)	ON DELETE SET NULL	ON UPDATE CASCADE, 
	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS Location;
CREATE TABLE Location(
  	id INTEGER NOT NULL ON CONFLICT ABORT,
  	postalCode TEXT NOT NULL ON CONFLICT ABORT, 
  	country TEXT NOT NULL ON CONFLICT ABORT,
	
  	PRIMARY KEY(id),
	UNIQUE(postalCode, country)
);

DROP TABLE IF EXISTS Company;
CREATE TABLE Company(
	id INTEGER,
  	name TEXT NOT NULL ON CONFLICT ABORT,
  	city TEXTNOT NULL ON CONFLICT ABORT, 
  	revenue INTEGER , -- may be null as a privacy measure
  	PRIMARY KEY (id),
	UNIQUE(name, city)
);

DROP TABLE IF EXISTS CustomerDetails;
CREATE TABLE CustomerDetails(
	ssn INTEGER UNIQUE NOT NULL ON CONFLICT ABORT,
	birthDate DATE NOT NULL ON CONFLICT ABORT,
	name TEXT NOT NULL ON CONFLICT ABORT,
	
	PRIMARY KEY (ssn),
	CHECK (date('now')-birthDate > 18)
);


DROP TABLE IF EXISTS Customer;
CREATE  TABLE Customer( 
  	id INTEGER NOT NULL ON CONFLICT ABORT,
 	email TEXT NOT NULL ON CONFLICT ABORT, -- email is not unique!
 	ssn INTEGER UNIQUE,
	
	FOREIGN KEY (ssn) REFERENCES CustomerDetails(ssn)	ON DELETE SET NULL	ON UPDATE CASCADE,
	PRIMARY KEY (Id)
);


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	customerId INTEGER,
	cartId INTEGER,
	id INTEGER NOT NULL ON CONFLICT ABORT,
	orderDate DATE NOT NULL ON CONFLICT ABORT,
	totalPrice INTEGER NOT NULL DEFAULT(0),
	FOREIGN KEY (customerId) REFERENCES Customer(Id)	ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY (cartId) REFERENCES Cart(id)			ON DELETE SET NULL	ON UPDATE CASCADE,
	PRIMARY KEY(id)
);


DROP TABLE IF EXISTS ProductDiscount;
CREATE TABLE ProductDiscount(
  	id INTEGER NOT NULL ON CONFLICT ABORT,
  	discount REAL NOT NULL ON CONFLICT ABORT, -- If no discount then discount = 0
  	startDate INTEGER NOT NULL ON CONFLICT ABORT,
  	finishDate INTEGER NOT NULL ON CONFLICT ABORT,
	
  	PRIMARY KEY (Id),
	CHECK(finishDate > startDate),
	CHECK(discount >= 0 AND discount <= 1)
);


DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
  	id INTEGER NOT NULL ON CONFLICT ABORT,
 	name TEXT NOT NULL ON CONFLICT ABORT,
	companyId INTEGER,
 	line TEXT NOT NULL ON CONFLICT ABORT,
	price INTEGER NOT NULL ON CONFLICT ABORT,
	discountId INTEGER, 
  	inStock BOOLEAN NOT NULL ON CONFLICT ABORT,
    storage INTEGER,
    almostSoldOut BOOLEAN NOT NULL DEFAULT('False'),
	
	PRIMARY KEY (id),
  	FOREIGN KEY (discountId) REFERENCES ProductDiscount(Id)		ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY (companyId) REFERENCES Company(id)			ON DELETE SET NULL	ON UPDATE CASCADE
);


DROP TABLE IF EXISTS ProductReview;
CREATE TABLE ProductReview(
	customerId INTEGER,
	productId INTEGER ,
	rating INTEGER NOT NULL ON CONFLICT ABORT, 
 	date DATE,
	
	FOREIGN KEY (customerId) REFERENCES customer (Id)	ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY (productId) REFERENCES Product (Id)		ON DELETE SET NULL	ON UPDATE CASCADE,
	PRIMARY KEY (customerId, productId),
	CHECK(rating >= 1 AND rating <= 5)
);



DROP TABLE IF EXISTS QuantityOfProduct;
CREATE TABLE QuantityOfProduct(
  	productId INTEGER,
  	orderId INTEGER,
	quantity INTEGER NOT NULL ON CONFLICT ABORT,
	
	FOREIGN KEY (productId) REFERENCES Product(id)	ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY (orderId) REFERENCES Orders(id)		ON DELETE SET NULL	ON UPDATE CASCADE,
	PRIMARY KEY (productId, orderId ),
	CHECK(quantity > 0)
);



DROP TABLE IF EXISTS CustomerLocation;
CREATE TABLE CustomerLocation(
  	locationId INTEGER,
  	customerId INTEGER,
	
	FOREIGN KEY (locationId) REFERENCES Location(Id)		ON DELETE SET NULL	ON UPDATE CASCADE,
	FOREIGN KEY (customerId) REFERENCES Customer(Id)		ON DELETE SET NULL	ON UPDATE CASCADE,
	PRIMARY KEY (customerId, locationId)
);


DROP TABLE IF EXISTS Admin;
CREATE TABLE Admin(
  	customerId INTEGER,
  	employeeId INTEGER UNIQUE NOT NULL ON CONFLICT ABORT,
	sector TEXT	NOT NULL ON CONFLICT ABORT,
	jobTitle TEXT NOT NULL ON CONFLICT ABORT,
	
	FOREIGN KEY (customerId) REFERENCES Customer(id)	ON DELETE SET NULL	ON UPDATE CASCADE,
  	PRIMARY KEY(customerId)
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
