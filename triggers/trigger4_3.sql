insert into ventas (codigo, costo) values (111,12.12);
insert into ventas (codigo, costo) values (222,22.22);
insert into ventas (codigo, costo) values (333,33.00);

select * from ventas;


delete from ventas where codigo = 111;
delete from ventas where codigo = 333;

select * from log_borrado_ventas;
