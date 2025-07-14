drop trigger if exists before_ventas_insert;  

 delimiter //
 create trigger before_ventas_insert before insert on ventas
   for each row
 begin
   update libros set stock=libros.stock-new.cantidad
     where new.codigolibro=libros.codigo; 
 end //
 delimiter ;


 drop trigger if exists before_ventas_delete;  
  
 delimiter //
 create trigger before_ventas_delete before delete on ventas
   for each row
 begin
  update libros set stock=libros.stock+old.cantidad
     where old.codigolibro=libros.codigo;   
 end //
 delimiter ;

