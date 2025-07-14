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
** Observamos lo siguiente:
```
explain SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
| id   | select_type | table     | type | possible_keys | key  | key_len | ref  | rows   | Extra       |
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
|    1 | SIMPLE      | employees | ALL  | NULL          | NULL | NULL    | NULL | 299290 | Using where |
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
1 row in set (0.002 sec)
```
> rows: revisó 299290 registros para encontrar la respuesta
> possible_keys: no tiene índices para que apoyen la búsqueda

** Recordemos el total de registros que contiene la tabla employees
```
select count(*) from employees;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+
1 row in set (0.042 sec)
```
** Mostramos los índices que contiene la tabla employees
```
SHOW INDEX FROM employees \G

*************************** 1. row ***************************
        Table: employees
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: emp_no
    Collation: A
  Cardinality: 299290
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
      Ignored: NO
1 row in set (0.001 sec)
```

** Este comando también nos muestra los índices que contiene la tabla employees
```
describe employees;
```
** Agregamos un índice en el atributo ***last_name***
```
ALTER TABLE employees ADD INDEX index_lastname (last_name);

```






** El siguiente comando elimina el índice creado
```
ALTER TABLE employees DROP INDEX index_name;
```
