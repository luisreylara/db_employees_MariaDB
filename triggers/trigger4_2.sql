delimiter //
drop trigger if exists insertar_edad_checar;
CREATE TRIGGER BORRAR_VENTA_LOG AFTER DELETE ON ventas
       FOR EACH ROW
       BEGIN
          insert into log_borrado_ventas (codigo, costo, usuario)
          values
          (old.codigo,old.costo,user());
       END;
       //
 delimiter ;