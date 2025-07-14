delimiter //
drop trigger if exists insertar_checar;
CREATE TRIGGER insertar_checar BEFORE INSERT ON account
       FOR EACH ROW
       BEGIN
           IF NEW.amount < 0 THEN
               SET NEW.amount = 0;
           ELSEIF NEW.amount > 100 THEN
               SET NEW.amount = 100;
           END IF;
       END;
       //
 delimiter ;