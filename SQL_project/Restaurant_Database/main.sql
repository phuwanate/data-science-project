--to find out who spent money the most
.open restaurant.db
  
CREATE Table IF NOT EXISTS menu
(
  menu_id int,
  name TEXT,
  course_type TEXT,
  taste TEXT,
  course_id int
);

CREATE Table IF NOT EXISTS course
(
  course_id int PRIMARY KEY,
  price real
);

CREATE Table IF NOT EXISTS customers
(
  customer_id int PRIMARY KEY,
  firstname TEXT,
  lastname TEXT,
  email TEXT,
  phone TEXT
);

CREATE Table IF NOT EXISTS invoices
(
  invoice_id int PRIMARY KEY,
  customer_id int,
  invoice_date DATE,
  total_amount int
);

CREATE Table IF NOT EXISTS invoices_course
(
  invoice_id int,
  course_id int
);

.read insert_data.sql