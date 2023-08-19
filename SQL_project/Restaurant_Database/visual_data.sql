--List all table name form sqlite_schema and filter pattern 'sqlite_' out
.mode box
SELECT 
    name AS table_name
FROM 
    sqlite_schema
WHERE 
    type ='table' AND 
    name NOT LIKE 'sqlite_%';

-- Retrieve data to get the largest amount of spending money
-- sub3-sub7 to sum total_amount (group by customer_id 1 - 5)
-- sub8 to union all result (sub3-sub7)

.mode box
WITH 
sub1 AS
(
  SELECT
    cus.customer_id AS cus_id,
    cus.firstname AS f_name,
    cus.lastname AS l_name
  FROM customers AS cus
), 
sub2 AS
(
  SELECT
    inv.invoice_id AS inv_id,
    inv.customer_id AS cus_id,
    STRFTIME('%Y-%m', inv.invoice_date) AS month_id,
    inv.total_amount AS total_amount
  FROM invoices AS inv
),
sub3 AS
(
  SELECT
     sub2.cus_id AS cus_id,
     SUM(sub2.total_amount) AS total_amount
  FROM sub2
  WHERE sub2.cus_id = 1
),
sub4 AS
(
  SELECT
    sub2.cus_id AS cus_id,  
    SUM(sub2.total_amount) AS total_amount
  FROM sub2
  WHERE sub2.cus_id = 2
),
sub5 AS
(
  SELECT
    sub2.cus_id AS cus_id,
    SUM(sub2.total_amount) AS total_amount
  FROM sub2
  WHERE sub2.cus_id = 3
),
sub6 AS
(
  SELECT
     sub2.cus_id AS cus_id,
     SUM(sub2.total_amount) AS total_amount
  FROM sub2
  WHERE sub2.cus_id = 4
),
sub7 AS
(
  SELECT
     sub2.cus_id AS cus_id,
     SUM(sub2.total_amount) AS total_amount
  FROM sub2
  WHERE sub2.cus_id = 5
),
sub8 AS
(
  SELECT * FROM sub3
    UNION 
  SELECT * FROM sub4
    UNION
  SELECT * FROM sub5
    UNION 
  SELECT * FROM sub6
    UNION 
  SELECT * FROM sub7
)

SELECT
  customers.*,
  MAX(sub8.total_amount) AS largest_amount,
  "Won!" AS Won_Prize
FROM customers
JOIN sub8
  ON  customers.customer_id = sub8.cus_id;