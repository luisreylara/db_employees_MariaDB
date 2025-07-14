** Trabajaremos en la base de datos ***employees***
> https://github.com/luisreylara/db_employees_MariaDB

** Ingresar a la BD employees y trabajaremos en la tabla employees
```
use employees;
```
** Observamos la tabla employees
```
describe employees;
```

** Realizamos una consulta buscando los apellidos que coincidan con ***Tempest***
```
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
```
** Le pedimos a SQL que nos explique con detalle la consulta anterior
```
explain SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
```
select count(*) from employees;

SHOW INDEX FROM employees \G
describe employees;

ALTER TABLE employees ADD INDEX index_lastname (last_name);

ALTER TABLE employees DROP INDEX index_name;
