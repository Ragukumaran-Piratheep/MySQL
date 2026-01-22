MariaDB [student_marks]> create table marks(
    -> studentID int not null auto_increment,
    -> first_name varchar(30),
    -> last_name varchar(30),
    -> mark int,
    -> primary key(studentID));
Query OK, 0 rows affected (0.172 sec)

MariaDB [student_marks]> show tables;
+-------------------------+
| Tables_in_student_marks |
+-------------------------+
| marks                   |
+-------------------------+
1 row in set (0.001 sec)

MariaDB [student_marks]> describe marks;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| studentID  | int(11)     | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(30) | YES  |     | NULL    |                |
| last_name  | varchar(30) | YES  |     | NULL    |                |
| mark       | int(11)     | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (0.030 sec)

MariaDB [student_marks]> insert into marks (first_name,last_name, mark)
    -> values
    -> ("Fred", "Jones", 78), ("Bill", "James", 67), ("Carol", "Smith", 82), ("Bob", "Duncun", 60), ("Joan", "Davis", 86);
Query OK, 5 rows affected (0.189 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [student_marks]> select * from marks;
+-----------+------------+-----------+------+
| studentID | first_name | last_name | mark |
+-----------+------------+-----------+------+
|         1 | Fred       | Jones     |   78 |
|         2 | Bill       | James     |   67 |
|         3 | Carol      | Smith     |   82 |
|         4 | Bob        | Duncun    |   60 |
|         5 | Joan       | Davis     |   86 |
+-----------+------------+-----------+------+
5 rows in set (0.001 sec)

MariaDB [student_marks]> select concat_ws(first_name, last_name) as FullName from marks;
+----------+
| FullName |
+----------+
| Jones    |
| James    |
| Smith    |
| Duncun   |
| Davis    |
+----------+
5 rows in set (0.001 sec)
MariaDB [student_marks]> select studentID, first_name, last_name, concat(first_name,last_name) as FullName, mark from marks;
+-----------+------------+-----------+------------+------+
| studentID | first_name | last_name | FullName   | mark |
+-----------+------------+-----------+------------+------+
|         1 | Fred       | Jones     | FredJones  |   78 |
|         2 | Bill       | James     | BillJames  |   67 |
|         3 | Carol      | Smith     | CarolSmith |   82 |
|         4 | Bob        | Duncun    | BobDuncun  |   60 |
|         5 | Joan       | Davis     | JoanDavis  |   86 |
+-----------+------------+-----------+------------+------+
5 rows in set (0.001 sec)
