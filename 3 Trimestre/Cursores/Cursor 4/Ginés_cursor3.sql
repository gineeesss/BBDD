USE EMPRESA;
CREATE TABLE EMPLE_DPTOS(
	n_dpto INT,
	Total_emple INT,
	PRIMARY KEY (n_dpto),
	FOREIGN KEY(n_dpto) REFERENCES DEPARTAMENTOS(Numero) 
);

DELIMITER //
CREATE PROCEDURE pa_empleados_dptos (IN numMinimo INT)
    DECLARE dep,empleados INT;
    DECLARE centroNombre, directorNombre VARCHAR(25);
    DECLARE Terminado INTEGER DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET Terminado = 1;
    DECLARE cursorConsulta CURSOR FOR
        SELECT d.Numero, c.Nombre, e.Nombre, COUNT(e.Cod)
        FROM DEPARTAMENTOS d 
        INNER JOIN EMPLEADOS e ON d.Numero = e.Departamento
        INNER JOIN CENTROS c ON d.Centro = c.Numero
        GROUP BY d.Numero;
    DECLARE EXIT HANDLER FOR NOT FOUND rollback;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION rollback;
    
    OPEN cursorConsulta;
    START TRANSACTION;
    
    FETCH cursorConsulta INTO dep,centroNombre,directorNombre,empleados
    WHILE NOT Terminado DO
        IF empleados < numMinimo
            INSERT INTO EMPLE_DPTOS VALUES
            (dep,empleados);
        END IF;
        
        FETCH cursorConsulta INTO dep,centroNombre,directorNombre,empleados
    END WHILE;
COMMIT;
END //
DELIMITER ;



-- Recorrer tabla de departamentos, trrabajar con su "Numero"

-- Consulta simple que devuelve numero dep, nombre cen, nombre dir, num empleados
SELECT d.Numero, c.Nombre, e.Nombre, COUNT(e.Cod)
FROM DEPARTAMENTOS d 
INNER JOIN EMPLEADOS e ON d.Numero = e.Departamento
INNER JOIN CENTROS c ON d.Centro = c.Numero
GROUP BY d.Numero;

-- Al final el procedimiento se visualiza la tabla EMPLE_DPTOS
SELECT CONCAT('Estos son los departamentos que tienen menos de ', numMinimo, 'empleados');
SELECT * FROM EMPLE_DPTOS;

Crear una nueva tabla en la base de datos EMPRESA:
EMPLE_DPTOS
- n_dpto entero
- Total_emple entero
Escribir un procedimiento pa_empleados_dptos que, utilizando
un cursor, muestre para cada departamento su número, nombre centro,
nombre del director y número de empleados que trabajan en él.
Aquellos departamentos cuya cantidad de empleados sea inferior
a un número que se pasará como parámetro, se incorporarán a la
tabla emple_dptos.
Por último, se visualizará el contenido de la tabla emple_dptos,
precedido del siguiente mensaje:
“Estos son los departamentos que tienen menos de n empleados:”
