DELIMITER //

CREATE PROCEDURE pa_borrar_mascotas2(IN nombre_mascota VARCHAR(10))
BEGIN
    DECLARE edad_mascota INT;

    IF EXISTS (SELECT * FROM mascotas WHERE nombre = nombre_mascota) THEN
        SELECT TIMESTAMPDIFF(YEAR, fechaNacim, CURDATE()) INTO edad_mascota FROM mascotas WHERE nombre = nombre_mascota;

        SELECT * FROM mascotas WHERE nombre = nombre_mascota;

        IF edad_mascota > 15 THEN 
            DELETE FROM mascotas WHERE nombre = nombre_mascota;
            SELECT "Se ha borrado la mascota porque tiene más de 15 años.";
        ELSE
            SELECT "No se ha borrado la mascota porque no tiene más de 15 años.";
        END IF;
    ELSE
        SELECT "La mascota no se encuentra en el registro.";
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE pa_borrar_mascotas3(IN nombre_mascota VARCHAR(10))
BEGIN
    DECLARE edad_mascota INT;

    IF EXISTS (SELECT * FROM mascotas WHERE nombre = nombre_mascota) THEN
        SELECT TIMESTAMPDIFF(YEAR, fechaNacim, CURDATE()) INTO edad_mascota FROM mascotas WHERE nombre = nombre_mascota;

        SELECT * FROM mascotas WHERE nombre = nombre_mascota;

        IF edad_mascota > 15 THEN 
            DELETE FROM mascotas WHERE nombre = nombre_mascota;
            SELECT "Se ha borrado la mascota porque tiene más de 15 años.";
        ELSEIF edad_mascota = 15 THEN
            SELECT "La mascota tiene 15 años. Dentro de un año se eliminará.";
        ELSE
            SELECT "No se ha borrado la mascota porque tenía menos de 15 años.";
        END IF;
    ELSE
        SELECT "La mascota no se encuentra en el registro.";
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE pa_borrar_mascotas4(IN nombre_mascota VARCHAR(10))
BEGIN
    DECLARE edad_mascota INT;

    IF EXISTS (SELECT * FROM mascotas WHERE nombre = nombre_mascota) THEN
        SELECT TIMESTAMPDIFF(YEAR, fechaNacim, CURDATE()) INTO edad_mascota FROM mascotas WHERE nombre = nombre_mascota;

        SELECT * FROM mascotas WHERE nombre = nombre_mascota;

        CASE 
            WHEN edad_mascota > 15 THEN
                DELETE FROM mascotas WHERE nombre = nombre_mascota;
                SELECT "Se ha borrado la mascota porque tiene más de 15 años.";
            WHEN edad_mascota = 15 THEN
                SELECT "La mascota tiene 15 años. Dentro de un año se eliminará.";
            WHEN edad_mascota < 2 THEN
                SELECT "La mascota necesita una revisión cada 6 meses.";
            ELSE
                SELECT "No se ha borrado la mascota porque tenía menos de 15 años.";
        END CASE;
    ELSE
        SELECT "La mascota no se encuentra en el registro.";
    END IF;
END //

DELIMITER ;