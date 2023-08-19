--Insert data to all table if it not exists

INSERT OR IGNORE INTO menu values
  (1, "Peanut Dipping Sauce", "appetizer", "salty", 1),
  (2, "gluay kag", "appetizer", "sweet", 2),
  (3, "Popcorn", "appetizer", "sweer", 3),
  (4, "Tomyumkung", "soup", "hot", 1),
  (5, "Seafood Clear Soup", "soup", "salty", 2),
  (6, "Thai Seafood Spicy Soup", "soup", "hot", 3);

INSERT OR IGNORE INTO course VALUES
  (1, 2000),
  (2, 3000),
  (3, 4000);

INSERT OR IGNORE INTO customers VALUES
  (1, "Gontran", "Siebert", "gontran.s@gmail.com", "206-203-9032"),
  (2, "Diana",  "Maynard", "diana.m@gmail.com", "806-621-7057"),
  (3, "Bidane", "Croce", "bidane.c@hotmail.com", "214-364-3070"),
  (4, "Jens", "David", "jens.d@hotmail.com", "386-203-9710"),
  (5, "Ritika", "MacConnell", "ritika.m@windowslive.com", "912-382-2744");

INSERT OR IGNORE INTO invoices VALUES
  (1001, 1, "2023-01-01", 2000*1.07),
  (1002, 2, "2023-01-01", 4000*1.07),
  (1003, 3, "2023-01-03", 2000*1.07),
  (1004, 4, "2023-02-01", 3000*1.07),
  (1005, 4, "2023-02-05", 4000*1.07),
  (1006, 5, "2023-02-06", 2000*1.07),
  (1007, 2, "2023-03-06", 2000*1.07);

INSERT OR IGNORE INTO invoices_course VALUES
  (1001, 1),
  (1002, 3),
  (1003, 1),
  (1004, 2),
  (1005, 3),
  (1006, 1),
  (1007, 1);

.read visual_data.sql