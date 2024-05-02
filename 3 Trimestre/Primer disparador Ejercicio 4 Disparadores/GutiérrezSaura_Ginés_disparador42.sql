DROP DATABASE IF EXISTS RUTAS;
CREATE DATABASE RUTAS;

USE RUTAS;

DROP TABLE IF EXISTS DISTANCIAS;
CREATE TABLE DISTANCIAS(
	ruta VARCHAR(10),
	distancia_km DECIMAL(6,2),
	distancia_milla DECIMAL(6,2),
	PRIMARY KEY (ruta)
);

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


-- 2 dp_modi_distancia


INSERT INTO DISTANCIAS (ruta, distancia_km) VALUES
("A",10);
INSERT INTO DISTANCIAS (ruta, distancia_milla) VALUES
("B",10);

DROP TRIGGER IF EXISTS dp_modi_distancia; 
DELIMITER //
CREATE TRIGGER dp_modi_distancia BEFORE UPDATE ON DISTANCIAS
FOR EACH ROW
BEGIN
    IF NEW.distancia_km IS NULL THEN
	    SET NEW.distancia_km = 0.621371 * NEW.distancia_milla;
	ELSE -- NEW.distancia_milla IS NULL THEN
	    SET NEW.distancia_milla = 1.609344 * NEW.distancia_km;
	END IF;
END //
delimiter ;	
	
UPDATE DISTANCIAS
SET distancia_km = 33
WHERE ruta='A';

UPDATE DISTANCIAS
SET distancia_km = 7
WHERE ruta='B';
	
	
	
	
	
	
	
	
	
	
	
	
	
	
