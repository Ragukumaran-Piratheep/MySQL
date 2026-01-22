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
