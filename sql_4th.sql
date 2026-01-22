MariaDB [pscompany]> show tables;
+---------------------+
| Tables_in_pscompany |
+---------------------+
| products            |
| suppliers           |
+---------------------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> describe products;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| productID   | int(11)       | NO   | PRI | NULL    |       |
| productCode | char(3)       | NO   |     | NULL    |       |
| name        | varchar(30)   | NO   |     | NULL    |       |
| Quantity    | int(11)       | NO   |     | NULL    |       |
| price       | decimal(10,2) | NO   |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
5 rows in set (0.066 sec)

MariaDB [pscompany]> describe suppliers;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| supplierID | int(11)     | NO   | PRI | NULL    |       |
| name       | varchar(30) | NO   |     | NULL    |       |
| phone      | char(8)     | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.194 sec)

MariaDB [pscompany]> select * from suppliers;
+------------+------+----------+
| supplierID | name | phone    |
+------------+------+----------+
|          1 | ABX  | 88884444 |
|          2 | XYZ  | 88882222 |
|          3 | ABX  | 88883333 |
|          4 | QQ   | 88881111 |
+------------+------+----------+
4 rows in set (0.886 sec)

MariaDB [pscompany]> select * from products;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      1001 | PEN         | Pen Red   |     5000 |  1.23 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.25 |
|      1003 | PEN         | pen green |     2000 |  1.25 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.48 |
|      2001 | PEN         | Pen 3B    |      500 |  0.52 |
|      2002 | PEN         | Pen 4B    |      100 |  0.62 |
|      2003 | PEN         | Pen 5B    |      100 |  0.73 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.000 sec)

MariaDB [pscompany]> select name from products where name not like 'Pen%';
Empty set (0.001 sec)

MariaDB [pscompany]> select name from products where name not like 'Pencil%';
+-----------+
| name      |
+-----------+
| Pen Red   |
| Pen Blue  |
| pen green |
| Pen 2B    |
| Pen 3B    |
| Pen 4B    |
| Pen 5B    |
+-----------+
7 rows in set (0.001 sec)
MariaDB [pscompany]> select name, price from products where name like 'P%';
+-----------+-------+
| name      | price |
+-----------+-------+
| Pen Red   |  1.23 |
| Pen Blue  |  1.25 |
| pen green |  1.25 |
| Pen 2B    |  0.48 |
| Pen 3B    |  0.52 |
| Pen 4B    |  0.62 |
| Pen 5B    |  0.73 |
+-----------+-------+
7 rows in set (0.001 sec)

MariaDB [pscompany]> select name, price from products where name like 'P_%';
+-----------+-------+
| name      | price |
+-----------+-------+
| Pen Red   |  1.23 |
| Pen Blue  |  1.25 |
| pen green |  1.25 |
| Pen 2B    |  0.48 |
| Pen 3B    |  0.52 |
| Pen 4B    |  0.62 |
| Pen 5B    |  0.73 |
+-----------+-------+
7 rows in set (0.000 sec)

MariaDB [pscompany]> select name, price from products where name like 'P_a%';
Empty set (0.000 sec)

MariaDB [pscompany]> select name, price from products where name like 'P_%';
+-----------+-------+
| name      | price |
+-----------+-------+
| Pen Red   |  1.23 |
| Pen Blue  |  1.25 |
| pen green |  1.25 |
| Pen 2B    |  0.48 |
| Pen 3B    |  0.52 |
| Pen 4B    |  0.62 |
| Pen 5B    |  0.73 |
+-----------+-------+
7 rows in set (0.000 sec)

MariaDB [pscompany]> select quantity, price, name from products where quantity >= 5000 and price < 1.24 and name like 'P_%';
+----------+-------+---------+
| quantity | price | name    |
+----------+-------+---------+
|     5000 |  1.23 | Pen Red |
|    10000 |  0.48 | Pen 2B  |
+----------+-------+---------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select price from products where price not between 1.0 and 2.0;
+-------+
| price |
+-------+
|  0.48 |
|  0.52 |
|  0.62 |
|  0.73 |
+-------+
4 rows in set (0.000 sec)
MariaDB [pscompany]> select price from products where price >= 2.0 and price <= 1.0;
Empty set (0.001 sec)

MariaDB [pscompany]> select price from products where price not between 1.0 and 2.0;
+-------+
| price |
+-------+
|  0.48 |
|  0.52 |
|  0.62 |
|  0.73 |
+-------+
4 rows in set (0.001 sec)
MariaDB [pscompany]> select price, quantity from products where price between 1.0 and 2.0 and quantity between 1000 and 2000;
+-------+----------+
| price | quantity |
+-------+----------+
|  1.25 |     2000 |
+-------+----------+
1 row in set (0.001 sec)
                     select quantity from products;
+----------+ompany]>
| quantity |
+----------+
|     5000 |
|     8000 |
|     2000 |
|    10000 |
|      500 |
|      100 |
|      100 |
+----------+
7 rows in set (0.001 sec)

MariaDB [pscompany]> select quantity from products order by price;
+----------+
| quantity |
+----------+
|    10000 |
|      500 |
|      100 |
|      100 |
|     5000 |
|     8000 |
|     2000 |
+----------+
7 rows in set (0.001 sec)

MariaDB [pscompany]> select name, quantity from products order by quantity;
+-----------+----------+
| name      | quantity |
+-----------+----------+
| Pen 4B    |      100 |
| Pen 5B    |      100 |
| Pen 3B    |      500 |
| pen green |     2000 |
| Pen Red   |     5000 |
| Pen Blue  |     8000 |
| Pen 2B    |    10000 |
+-----------+----------+
7 rows in set (0.000 sec)

MariaDB [pscompany]> select * from products order by quantity;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      2002 | PEN         | Pen 4B    |      100 |  0.62 |
|      2003 | PEN         | Pen 5B    |      100 |  0.73 |
|      2001 | PEN         | Pen 3B    |      500 |  0.52 |
|      1003 | PEN         | pen green |     2000 |  1.25 |
|      1001 | PEN         | Pen Red   |     5000 |  1.23 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.25 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.48 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products order by quantity asc;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      2002 | PEN         | Pen 4B    |      100 |  0.62 |
|      2003 | PEN         | Pen 5B    |      100 |  0.73 |
|      2001 | PEN         | Pen 3B    |      500 |  0.52 |
|      1003 | PEN         | pen green |     2000 |  1.25 |
|      1001 | PEN         | Pen Red   |     5000 |  1.23 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.25 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.48 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products order by quantity desc;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      1004 | PEN         | Pen 2B    |    10000 |  0.48 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.25 |
|      1001 | PEN         | Pen Red   |     5000 |  1.23 |
|      1003 | PEN         | pen green |     2000 |  1.25 |
|      2001 | PEN         | Pen 3B    |      500 |  0.52 |
|      2002 | PEN         | Pen 4B    |      100 |  0.62 |
|      2003 | PEN         | Pen 5B    |      100 |  0.73 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.000 sec)

MariaDB [pscompany]> select avg(price) as 'average price' from products;
+---------------+
| average price |
+---------------+
|      0.868571 |
+---------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select productCode, count(*) as total from products group by productCode order by total;
+-------------+-------+
| productCode | total |
+-------------+-------+
| PEN         |     7 |
+-------------+-------+
1 row in set (0.001 sec)
MariaDB [pscompany]> select sum(quantity) as 'Total quantity' from products;
+----------------+
| Total quantity |
+----------------+
|          25700 |
+----------------+
1 row in set (0.001 sec)
MariaDB [pscompany]> select max(price) as 'Highest price', min(price) as 'Lowest price' from products;
+---------------+--------------+
| Highest price | Lowest price |
+---------------+--------------+
|          1.25 |         0.48 |
+---------------+--------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> update products set price = price * 1.10;
Query OK, 7 rows affected, 7 warnings (0.133 sec)
Rows matched: 7  Changed: 7  Warnings: 7

MariaDB [pscompany]> select * from products;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      1001 | PEN         | Pen Red   |     5000 |  1.35 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.38 |
|      1003 | PEN         | pen green |     2000 |  1.38 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.53 |
|      2001 | PEN         | Pen 3B    |      500 |  0.57 |
|      2002 | PEN         | Pen 4B    |      100 |  0.68 |
|      2003 | PEN         | Pen 5B    |      100 |  0.80 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.001 sec)
MariaDB [pscompany]> update products
    -> SET quantity = quantity - 100
    -> WHERE name = 'Pen Red';
Query OK, 1 row affected (0.088 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [pscompany]> select * from products;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      1001 | PEN         | Pen Red   |     4900 |  1.35 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.38 |
|      1003 | PEN         | pen green |     2000 |  1.38 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.53 |
|      2001 | PEN         | Pen 3B    |      500 |  0.57 |
|      2002 | PEN         | Pen 4B    |      100 |  0.68 |
|      2003 | PEN         | Pen 5B    |      100 |  0.80 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.000 sec)
MariaDB [pscompany]> update products set price = 1.23, quantity = quantity + 150 where name = 'Pen Red';
Query OK, 1 row affected (0.122 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [pscompany]> select * from products;
+-----------+-------------+-----------+----------+-------+
| productID | productCode | name      | Quantity | price |
+-----------+-------------+-----------+----------+-------+
|      1001 | PEN         | Pen Red   |     5050 |  1.23 |
|      1002 | PEN         | Pen Blue  |     8000 |  1.38 |
|      1003 | PEN         | pen green |     2000 |  1.38 |
|      1004 | PEN         | Pen 2B    |    10000 |  0.53 |
|      2001 | PEN         | Pen 3B    |      500 |  0.57 |
|      2002 | PEN         | Pen 4B    |      100 |  0.68 |
|      2003 | PEN         | Pen 5B    |      100 |  0.80 |
+-----------+-------------+-----------+----------+-------+
7 rows in set (0.001 sec)
