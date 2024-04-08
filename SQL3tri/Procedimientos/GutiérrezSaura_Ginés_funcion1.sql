DROP FUNCTION IF EXISTS fa_edad_mascota;
DELIMITER //
CREATE FUNCTION fa_edad_mascota(nombreMascota VARCHAR(10)) RETURNS INT
BEGIN
	DECLARE edad INT;

	SELECT TIMESTAMPDIFF(YEAR,fechaNacim, CURDATE()) INTO edad
	FROM mascotas
	WHERE nombre=nombreMascota;
	
	RETURN edad;
END//
DELIMITER ;

SELECT fa_edad_mascota('Cuqui');