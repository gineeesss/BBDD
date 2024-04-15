DELIMITER //

CREATE PROCEDURE pa_borrar_mascotas2(IN nombre_mascota VARCHAR(10))
BEGIN
    DECLARE edad_mascota INT;
    --SELECT fa_edad_mascota(nombre_mascota) INTO edad;
    --SELECT CONCAT('Has elegido eliminar la masccota ', nombre_mascota,' con la edad: 'edad,' años') AS "";

    --IF EXISTS (SELECT * FROM mascotas WHERE nombre = nombre_mascota) THEN
    SELECT * FROM masctoas WHERE nombre=nombre_mascota
        IF fa_edad_mascota(nombre_mascota) > 15 THEN 
            DELETE FROM mascotas WHERE nombre = nombre_mascota;
            SELECT CONCAT("Se ha borrado la mascota ",nombre_mascota" porque tiene más de 15 años.") AS "";
        ELSE
            SELECT "No se ha borrado la mascota porque no tiene más de 15 años.";
        END IF;
   -- ELSE
   --     SELECT "La mascota no se encuentra en el registro.";
   -- END IF;
END //

DELIMITER ;



-- asdasDASDADAS

INSERT INTO mascotas
VALUES ('PerroAUU', '2000-12-12', 'Jesulin');


DELIMITER //
DROP PROCEDURE IF EXISTS pa_borrar_mascotas3;

CREATE PROCEDURE pa_borrar_mascotas3(IN nombre_mascota VARCHAR(10))
BEGIN

    SELECT * FROM mascotas WHERE nombre = nombre_mascota;
        --SELECT TIMESTAMPDIFF(YEAR, fechaNacim, CURDATE()) INTO edad_mascota FROM mascotas WHERE nombre = nombre_mascota;
        IF fa_edad_mascota(nombre_mascota) > 15
            THEN
            CALL pa_mascotas_borrar(nombre_mascota);
            SELECT CONCAT('Se hs borrado ',nombre_mascota) AS "";
        ELSEIF  fa_edad_mascota(nombre_mascota)=  15 THEN 
            SELECT "Se ha borrado la mascota porque tiene más de 15 años.";
        ELSEIF edad_mascota = 15 THEN
            SELECT CONCAT("La mascota ",nombre_mascota," tiene 15 años. Dentro de un año se eliminará.");
        ELSE
            SELECT "No se ha borrado la mascota porque tenía menos de 15 años.";
        END IF;
END //

DELIMITER ;

CALL pa_borrar_mascotas3(PerroAUU);



--sdsasdasdasdas

DELIMITER //

CREATE PROCEDURE pa_borrar_mascotas4(IN nombre_mascota VARCHAR(10))
BEGIN
    DECLARE edad_mascota INT;

    SELECT * FROM mascotas WHERE nombre = nombre_mascota
        SELECT fa_edad_mascota(nombre_mascota) INTO edad;
        CASE 
            WHEN edad_mascota > 15 THEN
                CALL pa_mascotas_borrar(nombre_mascota);
                SELECT "Se ha borrado la mascota porque tiene más de 15 años.";
            WHEN edad_mascota = 15 THEN
                SELECT "La mascota tiene 15 años. Dentro de un año se eliminará.";
            WHEN edad_mascota < 2 THEN
                SELECT "La mascota necesita una revisión cada 6 meses.";
            ELSE
                SELECT "No se ha borrado la mascota porque tenía menos de 15 años.";
        END CASE;
END //

DELIMITER ;