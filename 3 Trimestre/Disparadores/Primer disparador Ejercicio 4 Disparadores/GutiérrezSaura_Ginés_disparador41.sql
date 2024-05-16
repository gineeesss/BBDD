--(1 Km=0.621371 millas y 1 Milla=1.609344 Km)

--dp_inser_distania

DROP TRIGGER IF EXISTS dp_inser_distancia;
DELIMITER //
CREATE TRIGGER dp_inser_distancia BEFORE INSERT ON DISTANCIAS	
FOR EACH ROW
BEGIN
	IF NEW.distancia_km IS NULL THEN
	    SET NEW.distancia_km = 0.621371 * NEW.distancia_milla;
	ELSE-- NEW.distancia_milla IS NULL THEN
	    SET NEW.distancia_milla = 1.609344 * NEW.distancia_km;
	END IF;
END //
delimiter ;



INSERT INTO DISTANCIAS (ruta, distancia_km) VALUES
("A",10);
INSERT INTO DISTANCIAS (ruta, distancia_milla) VALUES
("B",10);







