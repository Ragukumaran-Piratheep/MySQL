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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

MariaDB [student_marks]> create table department(
    -> dept_id int not null auto_increment primary key,
    -> dept_name varchar(100),
    -> building varchar(50));
Query OK, 0 rows affected (0.302 sec)

MariaDB [student_marks]> describe department;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| dept_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| dept_name | varchar(100) | YES  |     | NULL    |                |
| building  | varchar(50)  | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.026 sec)

MariaDB [student_marks]> create table student(
    -> stduent_id int not null primary key,
    -> student_name varchar(30),
    -> age int,
    -> marks int,
    -> dept_id int not null,
    -> foreign key(dept_id) references department(dept_id));
Query OK, 0 rows affected (0.223 sec)

MariaDB [student_marks]> describe student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| stduent_id   | int(11)     | NO   | PRI | NULL    |       |
| student_name | varchar(30) | YES  |     | NULL    |       |
| age          | int(11)     | YES  |     | NULL    |       |
| marks        | int(11)     | YES  |     | NULL    |       |
| dept_id      | int(11)     | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.058 sec)

MariaDB [student_marks]> insert into department(dept_id, dept_name, building)
    -> values
    -> (1,'Computer Science', 'Block A'),
    -> (2, 'Mathematics', 'block B'),
    -> (3, 'Physics', 'Block C');
Query OK, 3 rows affected (0.187 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [student_marks]> insert into student(
    -> stduent_id, student_name, age, marks, dept_id)
    -> values
    -> (101, 'Alice', 20, 85, 1),
    -> (102, 'Bob', 22, 78, 1),
    -> (103, 'Charlie', 21, 92, 2),
    -> (104, 'David', 20, 65, 2),
    -> (105, 'Eva', 20, 88, 3);
Query OK, 5 rows affected (0.137 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [student_marks]> select * from deprtment;

    
MariaDB [student_marks]> select * from department;
+---------+------------------+----------+
| dept_id | dept_name        | building |
+---------+------------------+----------+
|       1 | Computer Science | Block A  |
|       2 | Mathematics      | block B  |
|       3 | Physics          | Block C  |
+---------+------------------+----------+
3 rows in set (0.001 sec)

MariaDB [student_marks]> select * from student;
+------------+--------------+------+-------+---------+
| stduent_id | student_name | age  | marks | dept_id |
+------------+--------------+------+-------+---------+
|        101 | Alice        |   20 |    85 |       1 |
|        102 | Bob          |   22 |    78 |       1 |
|        103 | Charlie      |   21 |    92 |       2 |
|        104 | David        |   20 |    65 |       2 |
|        105 | Eva          |   20 |    88 |       3 |
+------------+--------------+------+-------+---------+
5 rows in set (0.001 sec)
MariaDB [student_marks]> select * from student where student_name like 'A%';
+------------+--------------+------+-------+---------+
| stduent_id | student_name | age  | marks | dept_id |
+------------+--------------+------+-------+---------+
|        101 | Alice        |   20 |    85 |       1 |
+------------+--------------+------+-------+---------+
1 row in set (0.000 sec)

MariaDB [student_marks]> select age, marks from student where age > 20 and marks > 80;
+------+-------+
| age  | marks |
+------+-------+
|   21 |    92 |
+------+-------+
1 row in set (0.001 sec)

MariaDB [student_marks]> select * from student where age > 20 and marks > 80;
+------------+--------------+------+-------+---------+
| stduent_id | student_name | age  | marks | dept_id |
+------------+--------------+------+-------+---------+
|        103 | Charlie      |   21 |    92 |       2 |
+------------+--------------+------+-------+---------+
1 row in set (0.001 sec)
