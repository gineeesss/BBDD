-- 2 dp_super_precio

CREATE TABLE SUPER_PRECIOS(
	bar VARCHAR(20),
	cerveza VARCHAR (25),
	fecha DATE,
	precio DECIMAL(4,2),
	PRIMARY KEY (bar,cerveza,fecha)
);

DROP TRIGGER IF EXISTS dp_super_precio;
DELIMITER //
CREATE TRIGGER  dp_super_precio AFTER INSERT ON PRECIOS
FOR EACH ROW
BEGIN
    IF NEW.precio > 3 THEN
	    INSERT INTO SUPER_PRECIOS (bar,cerveza,fecha,precio) VALUES (NEW.bar,NEW.cerveza,CURDATE(),NEW.precio);
	END IF;
END //
DELIMITER ;

INSERT INTO PRECIOS VALUES
('kakaroto','agua chica gamer',2),
('Bar Badajoz','Pipí',5);
