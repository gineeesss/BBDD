-- 1 dp_insert_precio

DROP TRIGGER IF EXISTS dp_insert_precio;
DELIMITER //
CREATE TRIGGER dp_insert_precio BEFORE INSERT ON PRECIOS
FOR EACH ROW
BEGIN
    DECLARE cerveza_count INT;
    SELECT COUNT(*) INTO cerveza_count FROM CERVEZAS WHERE nombre=NEW.cerveza;
    IF cerveza_count = 0 THEN
        INSERT INTO CERVEZAS(nombre,fabricante) VALUES (NEW.cerveza,NULL);
    END IF;
END //
delimiter ;    

INSERT INTO PRECIOS VALUES
('perreria','auuuu',15.80),
('gatera','miau',3.33);
