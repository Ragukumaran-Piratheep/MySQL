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
