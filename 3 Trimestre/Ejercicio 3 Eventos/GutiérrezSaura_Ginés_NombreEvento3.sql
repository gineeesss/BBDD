even_asociacion: Usando la base de datos ASOCIACION, escribir un
evento que cada día, un segundo después de medianoche, elimine
de la tabla SOCIO_BAJA, los socios que se dieron de baja hace más de
cuatro años.
El evento comenzará el 1-06-2024 y terminará el 31-08-2024

DELIMITER //
DROP EVENT IF EXISTS SOCIO_BAJA;
CREATE EVENT SOCIO_BAJA
ON SCHEDULE EVERY DAY
STARTS '2024-06-01 00:00:05'
ENDS '2024-08-31 00:00:00'
DO
BEGIN
    DELETE FROM BAJAS_SOCIOS
    WHERE TIMESTAMPDIFF(YEAR,fecha_baja,CURDATE()) > 4;
END//
DELIMITER ;

SET GLOBAL event_scheduler = ON;
SHOW VARIABLES LIKE 'event_scheduler';
