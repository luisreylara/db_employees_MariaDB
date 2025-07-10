
Diagrama Entidad Relación

[red](https://github.com/luisreylara/db_employees_MariaDB/blob/main/employees.png)

## Comandos para restaurar la BD employees

```
source root/employees.sql ;

source root/load_departments.dump ;

source root/load_employees.dump ;

source root/load_dept_emp.dump ;

source root/load_dept_manager.dump ;

source root/load_titles.dump ;

source root/load_salaries1.dump ;
source root/load_salaries2.dump ;
source root/load_salaries3.dump ;

source root/show_elapsed.sql ;


MariaDB [employees]> use employees;
Database changed

MariaDB [employees]> show tables;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set

MariaDB [employees]> select count(*) from salaries;
+----------+
| count(*) |
+----------+
|  2844047 |
+----------+


MariaDB [employees]> select count(*) from titles;
+----------+
| count(*) |
+----------+
|   443308 |
+----------+

MariaDB [employees]> select count(*) from employees;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+

MariaDB [employees]> select count(*) from dept_manager;
+----------+
| count(*) |
+----------+
|       24 |
+----------+

MariaDB [employees]> select count(*) from dept_emp_latest_date ;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+

MariaDB [employees]> select count(*) from dept_emp;
+----------+
| count(*) |
+----------+
|   331603 |
+----------+

MariaDB [employees]> select count(*) from departments;
+----------+
| count(*) |
+----------+
|        9 |
+----------+

MariaDB [employees]> select count(*) from dept_emp_latest_date ;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+

MariaDB [employees]> select count(*) from current_dept_emp;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+

MariaDB [employees]> select * from employees limit 1 \G;
*************************** 1. row ***************************
    emp_no: 10001
birth_date: 1953-09-02
first_name: Georgi
 last_name: Facello
    gender: M
 hire_date: 1986-06-26
1 row in set (0.001 sec)

```