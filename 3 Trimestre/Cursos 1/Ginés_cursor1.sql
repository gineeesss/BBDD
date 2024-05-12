Crear un procedimiento pa_edades3 que, utilizando un cursor,
muestre para cada mascota su nombre, el nombre de su propietario
y su edad.
Antes de terminar el procedimiento, mostrar un mensaje
indicando la cantidad de mascotas que tienen menos de 3 años.
NOTA: Se utilizará una variable para ir contabilizando las mascotas
menores.

DECLARE terminado INT DEFAULT 0;
DECLARE v_usuario VARCHAR(30);
DECLARE v_email VARCHAR(30);
DECLARE cursor CURSOR FOR SELECT usuario,email FROM mascotas;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
SET terminado = 1;
OPEN cursor;
FETCH cursor INTO v_usuario,v_email;
WHILE terminado = 0 DO

    DECLARE v_edad INT;
    SET v_edad = fa_edad_mascota(v_usuario);
    SELECT v_usuario AS 'Nombre de la mascota', v_email AS 'Nombre del propietario', v_edad AS 'Edad';
    IF v_edad < 3 THEN
        SET @mascotas_menores := @mascotas_menores + 1;
    END IF;
    FETCH cursor INTO v_usuario,v_email;
END WHILE;
CLOSE cursor;
SELECT CONCAT('La cantidad de mascotas menores de 3 años es: ', @mascotas_menores);