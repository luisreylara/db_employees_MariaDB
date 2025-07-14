drop table if exists ventas;
create table ventas(
id int NOT NULL AUTO_INCREMENT, 
codigo varchar(10), 
costo float DEFAULT 0.0,
fecha datetime DEFAULT CURRENT_TIMESTAMP,
primary key(id));

drop table if exists log_borrado_ventas;
create table log_borrado_ventas(
id int NOT NULL AUTO_INCREMENT, 
codigo varchar(10), 
costo float DEFAULT 0.0,
usuario varchar(50),
fecha datetime DEFAULT CURRENT_TIMESTAMP,
primary key(id));

insert into ventas (codigo, costo) values (111,12.12);
insert into ventas (codigo, costo) values (222,22.22);
insert into ventas (codigo, costo) values (333,33.00);