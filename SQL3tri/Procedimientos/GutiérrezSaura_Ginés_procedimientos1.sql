--1. pa_media_var: Mostrar la media de edad de las mascotas de Pedro López.
--Guardar la media en una variable y mostrar el resultado con un mensaje.

SELECT AVG(YEAR(CURDATE())-YEAR(fechaNacim))
FROM mascotas
WHERE propietario='Pedro López';
 
--(OUT media_pedro DECIMAL(4,2)
 --AVG(TIMESTAMPDIFF(YEAR(fechaNacim,CURDATE())
DROP PROCEDURE IF EXISTS pa_media_var;
DELIMITER //
CREATE PROCEDURE pa_media_var()
BEGIN
	DECLARE media_pedro DECIMAL(4,2);
	
	SELECT AVG(YEAR(CURDATE())-YEAR(fechaNacim)) INTO media_pedro
	FROM mascotas
	WHERE propietario='Pedro López';
	SELECT CONCAT('La media de edad de los animales de pedro es: ',media_pedro) AS 'Media';
END//
DELIMITER ;

CALL pa_media_var;




--2. pa_media_par: Modificar el procedimiento anterior de forma que calcule la media de edad de
--las mascotas del propietario que se desee. Para ello, el nombre del propietario se introducirá
--mediante un parámetro.

DROP PROCEDURE IF EXISTS pa_media_par;
DELIMITER //
CREATE PROCEDURE pa_media_par(nombre VARCHAR(40))
BEGIN
	DECLARE media_persona DECIMAL(4,2);
	
	SELECT AVG(YEAR(CURDATE())-YEAR(fechaNacim)) INTO media_persona
	FROM mascotas
	WHERE propietario=nombre;
	SELECT CONCAT('La media de edad de los animales de ',nombre,' es: ',media_persona) AS 'Media';
END//
DELIMITER ;

CALL pa_media_par('Ana Vals');
CALL pa_media_par('Pedro López');

--3. pa_media_par2: Modificar el procedimiento pa_media_par de forma que, cuando se calcule la
--media de edad de las mascotas del propietario que se desee, el resultado se quede almacenado en
--un parámetro de salida. Al igual que el procedimiento pa_media_par, el nombre del propietario a
--buscar se introducirá mediante un parámetro de entrada.



--4. pa_mascotas_borrar: Eliminar el registro de una mascota cuyo nombre se pasará como parámetro.
