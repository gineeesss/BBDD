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

CREATE FUNCTION fa_par(n1 int) RETURNS INT
BEGIN
    RETURN n1%2 ;
END //

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


 -- 3 pa_veces_repeat

DELIMITER //

DROP PROCEDURE IF EXISTS pa_veces_repeat;

CREATE PROCEDURE pa_veces_repeat(IN a int, IN b int)
BEGIN
    DECLARE contador INT;
    DECLARE secuencia VARCHAR(69);
    SET contador = b;
    SET secuencia = '';
    IF b > 0 THEN
        REPEAT
            SET secuencia = CONCAT(secuencia,a,' ');
            SET contador = contador - 1;
        UNTIL contador = 0 END REPEAT;
        SELECT secuencia AS holi;  
    ELSE 
        SELECT 'Erro, el segundo número tiene que ser positivo' AS GUAK;
    END IF;
END;

//

delimiter ;



-- 4 pa_veces_while
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


--5 pa_tabla
DELIMITER //

DROP PROCEDURE IF EXISTS pa_tabla;

CREATE PROCEDURE pa_tabla(IN a INT)
BEGIN
    DECLARE contador INT;
    DECLARE resultado INT;
    DECLARE salida VARCHAR(255);
    SET contador = 1;
    SET salida = '';
    SET resultado = 0;
    IF a > 0 THEN
        REPEAT
            SET resultado = a * contador;
            SET contador = contador + 1;
            SET salida = CONCAT(salida,contador-1,' x ',a,' = ',resultado,'\n');
        UNTIL contador = 11 END REPEAT;    
        SELECT salida AS nya;
    ELSE 
        SELECT 'El numero no es positivo/entero' AS guat;
    END IF;
END;

//

delimiter ;



































