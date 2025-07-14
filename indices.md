## Trabajaremos en la base de datos ***employees***
> https://github.com/luisreylara/db_employees_MariaDB

## Ingresar a la BD employees y trabajaremos en la tabla employees
```
use employees;
```
## Observamos la tabla employees
```
describe employees;
```

## Realizamos una consulta buscando los apellidos que coincidan con ***Tempest***
```
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
```
## Le pedimos a SQL que nos explique con detalle la consulta anterior
```
explain SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
```
## Observamos lo siguiente:
```
explain SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
| id   | select_type | table     | type | possible_keys | key  | key_len | ref  | rows   | Extra       |
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
|    1 | SIMPLE      | employees | ALL  | NULL          | NULL | NULL    | NULL | 299290 | Using where |
+------+-------------+-----------+------+---------------+------+---------+------+--------+-------------+
1 row in set (0.002 sec)
```
* > rows: revisó 299290 registros para encontrar la respuesta
* > possible_keys: no tiene índices para que apoyen la búsqueda

## Recordemos el total de registros que contiene la tabla employees
```
select count(*) from employees;
+----------+
| count(*) |
+----------+
|   300024 |
+----------+
1 row in set (0.042 sec)
```
## Mostramos los índices que contiene la tabla employees
```
SHOW INDEX FROM employees \G

*************************## 1. row ***************************
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

## Este comando también nos muestra los índices que contiene la tabla employees
```
describe employees;
```
## Agregamos un índice en el atributo ***last_name***
```
ALTER TABLE employees ADD INDEX index_lastname (last_name);
```
## Confirmamos que se creó el índice
```
describe employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   | MUL | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.009 sec)

```
## Podemos utilizar esta opción para ver el índice creado.
```
SHOW INDEX FROM employees \G
*************************## 1. row ***************************
        Table: employees
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: emp_no
    Collation: A
  Cardinality: 299069
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
      Ignored: NO
*************************## 2. row ***************************
        Table: employees
   Non_unique: 1
     Key_name: index_lastname
 Seq_in_index: 1
  Column_name: last_name
    Collation: A
  Cardinality: 1759
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
      Ignored: NO
2 rows in set (0.004 sec)

```

## Volvemos a ejecutar la misma consulta anterior
```
 explain SELECT first_name, last_name FROM employees WHERE last_name LIKE 'Tempest%';
+------+-------------+-----------+-------+----------------+----------------+---------+------+------+-----------------------+
| id   | select_type | table     | type  | possible_keys  | key            | key_len | ref  | rows | Extra                 |
+------+-------------+-----------+-------+----------------+----------------+---------+------+------+-----------------------+
|    1 | SIMPLE      | employees | range | index_lastname | index_lastname | 66      | NULL | 161  | Using index condition |
+------+-------------+-----------+-------+----------------+----------------+---------+------+------+-----------------------+
1 row in set (0.002 sec)
```

## Se explica a continuación el resultado de la consulta anterior
```
key:index_last_name
possible_keys: index_last_name
rows: 161
Estra: using index condition
```
## Lo anterior demuestra el total de registros recorridos para que la consulta ejecute con eficiencia la búsqueda.


## El siguiente comando elimina el índice creado
```
ALTER TABLE employees DROP INDEX index_name;
```
