-- 1
DELIMITER //
CREATE FUNCTION fa_par(numero INT)
RETURNS INT
BEGIN
    DECLARE resultado INT;
    IF numero % 2 = 0 THEN
        SET resultado = 0; -- Es par
    ELSE
        SET resultado = 1; -- Es impar
    END IF;
    RETURN resultado;
END;
//
DELIMITER ;


-- 2
DELIMITER //
CREATE PROCEDURE pa_impares(numero INT)
BEGIN
    DECLARE contador_impares INT DEFAULT 0;
    DECLARE suma_impares INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    WHILE i < numero DO
        IF fa_par(i) = 1 THEN
            SET contador_impares = contador_impares + 1;
            SET suma_impares = suma_impares + i;
        END IF;
        SET i = i + 1;
    END WHILE;
    SELECT CONCAT('Cantidad de números impares: ', contador_impares) AS Resultado;
    SELECT CONCAT('Suma de números impares: ', suma_impares) AS Resultado;
END;
//
DELIMITER ;


 -- 3
DELIMITER //
CREATE PROCEDURE pa_veces_repeat(numero INT, veces INT)
BEGIN
    DECLARE contador INT;
    DECLARE salida VARCHAR(255);
    IF veces > 0 THEN
        SET contador = 1;
        SET salida = '';
        REPEAT
            SET salida = CONCAT(salida, numero, ' ');
            SET contador = contador + 1;
        UNTIL contador > veces END REPEAT;
        SELECT salida AS Resultado;
    ELSE
        SELECT 'Error: El segundo parámetro debe ser un número positivo.' AS Resultado;
    END IF;
END;
//
DELIMITER ;


-- 4
DELIMITER //
CREATE PROCEDURE pa_veces_while(numero INT, veces INT)
BEGIN
    DECLARE contador INT;
    DECLARE salida VARCHAR(255);
    IF veces > 0 THEN
        SET contador = 1;
        SET salida = '';
        WHILE contador <= veces DO
            SET salida = CONCAT(salida, numero, ' ');
            SET contador = contador + 1;
        END WHILE;
        SELECT salida AS Resultado;
    ELSE
        SELECT 'Error: El segundo parámetro debe ser un número positivo.' AS Resultado;
    END IF;
END;
//
DELIMITER ;
