
delimiter //
drop trigger if exists insertar_edad_checar;
CREATE TRIGGER insertar_edad_checar BEFORE INSERT ON alumnos
       FOR EACH ROW
       BEGIN
           IF NEW.edad < 0 THEN
               SET NEW.edad = 0;
           ELSEIF NEW.edad >= 200 THEN
               SET NEW.edad = 100;
           END IF;
       END;
       //
 delimiter ;