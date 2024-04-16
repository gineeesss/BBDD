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

DELIMITER //
DROP PROCEDURE IF EXISTS pa_condicion1;
CREATE PROCEDURE pa_condicion1(IN nombreInsert varchar(10), IN fechaNacimInsert date, IN propietarioInsert varchar(40))
BEGIN
	DECLARE edadMascota INT;
	
	INSERT INTO mascotas VALUES(nombreInsert,fechaNacimInsert,propietarioInsert);
	
	SELECT fa_edad_mascota(nombreInsert) INTO edadMascota;
	
	IF edadMascota > 5 THEN
        SELECT "Hola" AS mensaje;
    ELSE
        SELECT "Adiós" AS mensaje;
    END IF;
END //

DELIMITER ;

CALL pa_condicion1("miau",'2000-01-01',"paco porros");		




--EJERCICIO 2
Escribir una función fa_mayor que reciba dos enteros como parámetros y devuelva el
mayor de ellos. En caso de que sean iguales devolverá un 0.



Escribir un procedimiento pa_condicion2 al que se le pasarán dos nombres de
mascotas como parámetros de entrada.
    Utilizando las funciones fa_edad_mascota () y fa_ mayor(), mostrar un mensaje en
    el que se indique cual es la edad de la mascota mayor o se informe de que tienen la
    misma edad .
    
    En el mensaje de salida se incluirá el nombre de la mascota mayor o el nombre de las
    dos mascotas en el caso de que tengan la misma edad.
