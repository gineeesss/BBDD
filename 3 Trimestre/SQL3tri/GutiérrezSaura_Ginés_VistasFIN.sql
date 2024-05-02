    Utilizar la base de datos EMPRESA para los siguientes ejercicios:

USE EMPRESA;

# 1. Crear una vista llamada vista1 que muestre el nombre y el número de los departamentos. Una vez creada,
# comprobar los datos de la vista.

CREATE VIEW vista1 AS
SELECT Nombre, Numero
FROM DEPARTAMENTOS;

SELECT * FROM vista1;

# 2. Insertar un nuevo departamento en la tabla departamentos.
# 135 10 150 P 18 120 SERVICIOS

INSERT INTO DEPARTAMENTOS VALUES
(135, 10, 150, 'P', 18, 120, "SERVICIOS");


# 3. Comprobar los datos de la vista1.

SELECT * FROM vista1;


# 4. Borrar el departamento 111 de la tabla departamentos.

ALTER TABLE EMPLEADOS
DROP FOREIGN KEY fk_Departamento;

DELETE FROM DEPARTAMENTOS
WHERE Numero=111;

# 5. Comprobar los datos de la vista1.

SELECT * FROM vista1;

# 6. Cambiar el nombre del atributo Nombre de la tabla departamentos a Nom.

ALTER TABLE DEPARTAMENTOS 
CHANGE COLUMN Nombre Nom VARCHAR(25);

# 7. Comprobar los datos de la vista1. ¿Qué ocurre?

SELECT * FROM vista1;


# 8. Cambiar el nombre del atributo Nom de la tabla departamentos a Nombre.

ALTER TABLE DEPARTAMENTOS 
CHANGE COLUMN Nom Nombre VARCHAR(25);

# 9. Crear una vista llamada vista2 que contenga el número de empleados que tiene cada departamento, y el
# nombre del departamento (incluso aquellos que no tienen empleados). Los nombres de los campos son:
# departamento y totalEmpleados

CREATE VIEW vista2 AS 
SELECT d.Nombre, COUNT(*) AS totalEmpleados
FROM DEPARTAMENTOS d LEFT JOIN EMPLEADOS e ON d.Numero = e.Departamento
GROUP BY Nombre;

# 10. Comprobar los datos de vista2.

SELECT * FROM vista2;

# 11. Insertar un nuevo empleado en la tabla empleados con los datos que quieras.

INSERT INTO EMPLEADOS VALUES
(9, 135, "666", '2020-01-04', '2024-02-29', 412.21, 1, 4, "Charmander");


 12. Comprobar los datos de vista2 ¿Se ha actualizado?

SELECT * FROM vista2;

# 13. Actualizar el sueldo de Julio Perez a 1700.

UPDATE EMPLEADOS
SET Salario = 1700
WHERE Nombre = 'PEREZ, JULIO';


# 14. Crear una vista llamada vista3 que contenga el salario más alto de un empleado. Junto al sueldo aparecerá
# el nombre del empleado que lo cobra.

CREATE VIEW vista3 AS
SELECT NOmbre, Salario
FROM EMPLEADOS
WHERE Salario = (SELECT MAX(Salario) FROM EMPLEADOS);

# 15. Comprobar los datos de vista3

SELECT * FROM vista3;


# 16. Aplicar un descuento del 20% al sueldo de Antonio Lopez.

UPDATE EMPLEADOS
SET Salario = Salario * 0.8
WHERE Nombre = 'LOPEZ, ANTONIO';

# 17. Comprobar los datos de la vista3. ¿Ha habido algún cambio?

SELECT * FROM vista3;

# 18. Crear la vista4 que contenga el código de los directores que tienen al menos dos hijos. Comprobar los
# datos de la vista4.

CREATE VIEW vista4 AS
SELECT e.Cod
FROM EMPLEADOS e RIGHT JOIN DEPARTAMENTOS d ON e.Cod = d.Director
WHERE Num_hijos >= 2;

SELECT * FROM vista4;

# 19. Crear una vista5 que contenga, el código de los directores que tienen al menos dos hijos junto con su
# nombre. Comprobar los datos de la vista5.

CREATE VIEW vista5 AS
SELECT e.Cod, e.NOmbre
FROM EMPLEADOS e RIGHT JOIN DEPARTAMENTOS d ON e.Cod = d.Director
WHERE Num_hijos >= 2;

SELECT * FROM vista5;

# 20. Crear una vista6 que obtenga la fecha de ingreso del empleado más nuevo de cada departamento, junto
# con el nombre del departamento. Comprobar los datos de la vista6.

CREATE VIEW vista6 AS 
SELECT MAX(Fecha_ingreso), d.Nombre
FROM EMPLEADOS e JOIN DEPARTAMENTOS d ON e.Departamento = d.Numero
GROUP BY d.NOmbre;
 
SELECT * FROM vista6;

# 21. Modificar la vista anterior para que obtenga la fecha de ingreso del más antiguo de cada departamento.

ALTER VIEW vista6 AS 
SELECT MIN(Fecha_ingreso), d.Nombre
FROM EMPLEADOS e JOIN DEPARTAMENTOS d ON e.Departamento = d.Numero
GROUP BY d.NOmbre;

SELECT * FROM vista6;

# 22. Crear la vista7 que contenga todos los campos de los empleados del departamento 112. . Comprobar los
# datos de la vista7.

CREATE VIEW vista7 AS
SELECT *
FROM EMPLEADOS
WHERE Departamento=112;

# 23. Crear la vista8 que contenga el nombre y fecha de ingreso en la empresa de los empleados del
# departamento 112. Para ello se debe utilizar la vista anterior. Comprobar los datos de la vista8.

CREATE VIEW vista8 as
SELECT NOmbre, Fecha_ingreso
FROM vista7;

# 24. Borrar la vista7.

DROP VIEW vista7;

# 25. Comprobar los datos de la vista8.
