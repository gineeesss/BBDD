DROP FUNCTION IF EXISTS fa_porcentaje_tipo_cliente;
DELIMITER 
CREATE FUNCTION fa_porcentaje_tipo_cliente(tipo char)
RETURNS INT
BEGIN
    DECLARE porcentaje int;
    SET porcentaje = 0;
    IF tipo = 'A' THEN
	    SET porcentaje = 10;
	ELSEIF tipo = 'B' THEN
	    SET porcentaje = 7;
	ELSEIF tipo = 'C' THEN
	    SET porcentaje = 5;
	ELSEIF tipo = 'D' THEN
	    SET porcentaje = 3;
	END IF;
	RETURN porcentaje;
END 
DELIMITER ;
-- función simple que recibe un char (el tipo) y según cual devuelve un entero (porcentaje)