delimiter //
drop procedure if exists person_bi;
CREATE TRIGGER person_bi BEFORE INSERT ON person
FOR EACH ROW
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Mensaje de Error : la edad debe ser mayor o igual a 18 ';
    END IF; //
delimiter ;

