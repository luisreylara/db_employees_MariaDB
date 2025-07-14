

delimiter |
drop TRIGGER if exists testref;
CREATE TRIGGER testref BEFORE INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
  END;
|

delimiter ;