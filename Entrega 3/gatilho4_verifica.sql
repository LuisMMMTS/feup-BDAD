.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;


SELECT customerId from ProductReview;
INSERT INTO ProductReview VALUES (123517,10014,5,'2017-5-16');
SELECT customerId from ProductReview;
INSERT INTO ProductReview VALUES (123517,10013,5,'2017-5-16');
SELECT customerId from ProductReview;