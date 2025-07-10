
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

```