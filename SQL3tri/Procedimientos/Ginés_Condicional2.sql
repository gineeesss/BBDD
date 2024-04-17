-- EJERCICIO 1
Crear 2 tablas nuevas en Veterinario llamadas mascotas_jovenes y mascotas_mayores
con la misma estructura que la tabla mascotas.
    Escribir un procedimiento pa_condicion1 al que se le pasarán 3 parámetros con los
    datos de una nueva mascota. Se insertará en la tabla mascotas un registro con dichos
    datos.

    Calcular la edad de la mascota y guardarla en una variable. Si la mascota tiene más de
    5 años se escribirán todos sus datos en un registro de la tabla mascotas_mayores y se
    mostrará el contenido de la tabla. Cuando la mascota tenga cinco o menos años se
    almacenarán sus datos en la tabla mascotas_jovenes y se mostrará el contenido de la
    tabla.

CREATE TABLE mascotas_jovenes (
	nombre varchar(10) NOT NULL,
	fechaNacim date NOT NULL,
	propietario varchar(40) NOT NULL,
	PRIMARY KEY (nombre)
);
CREATE TABLE mascotas_mayores (
	nombre varchar(10) NOT NULL,
	fechaNacim date NOT NULL,
	propietario varchar(40) NOT NULL,
	PRIMARY KEY (nombre)
);

--ESO DE ARRIBA ES UNA MIERDA, CREAR LAS TABLAS USANDO LIKE
CREATE TABLE mascotas_jovenes LIKE mascotas;
CREATE TABLE mascotas_mayores LIKE mascotas;

DELIMITER //
DROP PROCEDURE IF EXISTS pa_condicion1;
CREATE PROCEDURE pa_condicion1(IN nombreInsert varchar(10), IN fechaNacimInsert date, IN propietarioInsert varchar(40))
BEGIN
    INSERT INTO mascotas_mayores VALUES(nombreInsert,fechaNacimInsert,propietarioInsert);
	DECLARE edadMascota INT;
	SET edadMascota=TIMESTAMPDIFF(YEAR,fechaNacimInsert,CURDATE());
    -- si tuviese la funcion fa_edad_mascota, haría SELECT fa_edad_mascota(nombreInsert) FROM mascotas;
	IF edadMascota > 5 THEN
	INSERT INTO mascotas_mayores
	VALUES(nombreInsert,fechaNacimInsert,propietarioInsert);
	ELSE
	INSERT INTO jovenes
	VALUES(nombreInsert,fechaNacimInsert,propietarioInsert);
    END IF;
END //

DELIMITER ;

CALL pa_condicion1("miau",'2000-01-01',"paco porros");		




--EJERCICIO 2
Escribir una función fa_mayor que reciba dos enteros como parámetros y devuelva el
mayor de ellos. En caso de que sean iguales devolverá un 0.

DELIMITER //
DROP FUNCTION IF EXISTS fa_mayor;
CREATE FUNCTION fa_mayor(a INT, b INT)
RETURNS INT
BEGIN
    DECLARE mayor INT;
    
    IF a > b THEN
        SET mayor = a;
    ELSEIF b > a THEN
        SET mayor = b;
    ELSE
        SET mayor = 0;
    END IF;
    
    RETURN mayor;
END //

DELIMITER ;


--EJERCICIO 3
Escribir un procedimiento pa_condicion2 al que se le pasarán dos nombres de
mascotas como parámetros de entrada.
    Utilizando las funciones fa_edad_mascota () y fa_ mayor(), mostrar un mensaje en
    el que se indique cual es la edad de la mascota mayor o se informe de que tienen la
    misma edad .
    
    En el mensaje de salida se incluirá el nombre de la mascota mayor o el nombre de las
    dos mascotas en el caso de que tengan la misma edad.

DELIMITER //

CREATE PROCEDURE pa_condicion2(IN mascota1 VARCHAR(10), IN mascota2 VARCHAR(10))
BEGIN
    DECLARE edad1 INT;
    DECLARE edad2 INT;
    DECLARE mensaje VARCHAR(100);
    
    SET edad1 = fa_edad_mascota(mascota1);
    SET edad2 = fa_edad_mascota(mascota2);
    
    IF fa_mayor(edad1, edad2) = 0 THEN
        SET mensaje = CONCAT("Las mascotas ", mascota1, " y ", mascota2, " tienen la misma edad.");
    ELSEIF fa_mayor(edad1, edad2) = edad1 THEN
        SET mensaje = CONCAT("La mascota ", mascota1, " es mayor con una edad de ", edad1, " años.");
    ELSE
        SET mensaje = CONCAT("La mascota ", mascota2, " es mayor con una edad de ", edad2, " años.");
    END IF;
   
END //

DELIMITER ;
