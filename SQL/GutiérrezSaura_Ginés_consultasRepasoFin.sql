Realizar las siguientes consultas en la base de datos EMPRESA:
1. Hallar la comisión, el nombre y el salario de los empleados con más de tres
hijos, ordenados por comisión y, dentro de comisión, alfabéticamente.

SELECT Comision, Nombre, Salario
FROM EMPLEADOS
WHERE Num_hijos > 3
ORDER BY Comision, Nombre;


2. Obtener los nombres de los departamentos que no dependen de otros.

SELECT Nombre
FROM DEPARTAMENTOS
WHERE Dpto_jefe IS NULL;


3. Obtener, por orden alfabético, los nombres y los salarios de los empleados cuyo
salario esté comprendido entre 1250 y 1300 euros.

SELECT Nombre, Salario
FROM EMPLEADOS
WHERE Salario BETWEEN 1250 AND 1300
ORDER BY Nombre;


4. Datos de los empleados que cumplen la condición anterior o tienen al menos un
hijo.

SELECT *
FROM EMPLEADOS
WHERE Salario BETWEEN 1250 AND 1300
   OR Num_hijos > 0;


5. Muestre para cada empleado el número de meses que lleva el empleado en la
empresa junto con su nombre.


-- Usar función TIMESTAMPDIFF --> TIMESTAMPDIFF(Month, Fecha_ingreso, NOW()) NOW O CURRENT_DATE O CURDATE
SELECT Nombre, TIMESTAMPDIFF(Month, Fecha_ingreso, NOW()) AS Meses_en_empresa
FROM EMPLEADOS;


6. Calcule aquellos empleados que llevan más de 25 años en la empresa. Muestre el
nombre, el departamento y la fecha de ingreso de cada uno de ellos.

SELECT Nombre, Departamento, Fecha_ingreso
FROM EMPLEADOS
WHERE TIMESTAMPDIFF(YEAR, Fecha_ingrreso, CURRENT_DATE())> 25;


7. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da
una gratificación de 10 euros por hijo, el total de esta gratificación no supera la
centésima parte del salario.

SELECT Nombre
FROM EMPLEADOS
WHERE (10 * Num_hijos) <= Salario / 100
ORDER BY Nombre;



8. Hallar, por orden de número de empleado, el nombre y el salario total
(salario más comisión) de los empleados cuyo salario total supera los 1300
euros mensuales.

SELECT Nombre, Salario + Comision AS Salario_total
FROM EMPLEADOS
WHERE Salario + Comision > 1300
ORDER BY Cod;


9. Obtener, por orden alfabético, los nombres de los departamentos que no
contengan la palabra 'Dirección' ni 'Sector'.

SELECT Nombre
FROM DEPARTAMENTOS
WHERE Nombre NOT LIKE '%Dirección%' AND Nombre NOT LIKE '%Sector%'
ORDER BY Nombre;


10. Obtener, por orden alfabético, los nombres de los departamentos que, o bien
tienen directores en funciones y su presupuesto no excede los 5000 euros, o bien no
dependen de ningún otro departamento.

SELECT Nombre
FROM DEPARTAMENTOS
WHERE (Dpto_jefe IS NOT NULL AND Presupuesto <= 5000)
   OR Dpto_jefe IS NULL
ORDER BY Nombre;



11. Mostrar el número de empleados que trabajan en cada departamento.

SELECT d.Nombre AS Departamento, COUNT(*) AS Num_empleados
FROM DEPARTAMENTOS d
JOIN EMPLEADOS e ON d.Numero = e.Departamento
GROUP BY d.Nombre;


# se comprueba si existe la bd, y se borra en ese caso
DROP DATABASE IF EXISTS EMPRESA;

CREATE DATABASE EMPRESA;

CREATE TABLE CENTROS (
	Numero INT PRIMARY KEY,
	Nombre VARCHAR(25) NOT NULL,
	Direccion VARCHAR(30) NOT NULL
);

SHOW CREATE TABLE CENTROS;
DESCRIBE CENTROS;

CREATE TABLE DEPARTAMENTOS (
	Numero INT PRIMARY KEY,
	Centro INT NOT NULL,
	Director INT NOT NULL,
	Tipo_dir ENUM('P','F') NOT NULL,
	Presupuesto DECIMAL(6,2) NOT NULL,
	Dpto_jefe INT NULL,
	Nombre VARCHAR(25) NOT NULL,
	CONSTRAINT fk_Centro FOREIGN KEY (Centro) REFERENCES CENTROS(Numero)
);

SHOW CREATE TABLE DEPARTAMENTOS;
DESCRIBE DEPARTAMENTOS;

CREATE TABLE EMPLEADOS (
	Cod INT PRIMARY KEY,
	Departamento INT NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Fecha_nacimiento DATE NOT NULL,
	Fecha_ingreso DATE NOT NULL,
	Salario DECIMAL(6,2) NOT NULL,
	Comision DECIMAL(5,2) NOT NULL,
	Num_hijos INT NOT NULL,
	NOmbre VARCHAR(25),
	CONSTRAINT fk_Departamento FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTOS(Numero)
);

SHOW CREATE TABLE EMPLEADOS;
DESCRIBE EMPLEADOS;

ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT fk_Dpto_jefe FOREIGN KEY (Dpto_jefe) REFERENCES DEPARTAMENTOS(Numero);
ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT fk_Director FOREIGN KEY (Director) REFERENCES EMPLEADOS(Cod);

SHOW CREATE TABLE DEPARTAMENTOS;
DESCRIBE DEPARTAMENTOS;

INSERT INTO CENTROS VALUES
(10, 'SEDE CENTRAL', 'C/ ALCALA 820, MADRID'),
(20, 'RELACION CON CLIENTES', 'C/ ATOCHA 405, MADRID');
	
INSERT INTO DEPARTAMENTOS VALUES
(100, 10, 260, 'P', 12, null ,'DIRECCION GENERAL');

INSERT INTO EMPLEADOS VALUES
(110, 121, '350', '1969-11-10', '1990-02-10', 1310, 0, 3, 'PONS, CESAR');

-- Insertar registros en la tabla CENTROS
INSERT INTO CENTROS VALUES
(11, 'OFICINA PRINCIPAL', 'Av. Principal 123, Madrid'),
(12, 'OFICINA SECUNDARIA', 'C/ Secundaria 456, Madrid'),
(13, 'CENTRO DE PRODUCCIÓN', 'Av. Producción 789, Madrid'),
(14, 'CENTRO DE DISTRIBUCIÓN', 'C/ Distribución 012, Madrid'),
(15, 'OFICINA DE VENTAS', 'Av. Ventas 345, Madrid');

-- Insertar registros en la tabla DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS VALUES
(101, 11, 261, 'P', 15, null ,'DEPARTAMENTO DE MARKETING'),
(102, 12, 262, 'F', 20, null ,'DEPARTAMENTO DE FINANZAS'),
(103, 13, 263, 'P', 18, null ,'DEPARTAMENTO DE PRODUCCIÓN'),
(104, 14, 264, 'F', 25, null ,'DEPARTAMENTO DE LOGÍSTICA');

-- Insertar registros en la tabla EMPLEADOS
INSERT INTO EMPLEADOS VALUES
(111, 101, '123456789', '1975-05-20', '1995-08-15', 2000, 0, 2, 'GARCÍA, ANA'),
(112, 101, '987654321', '1980-10-15', '2000-03-10', 1800, 0, 1, 'RODRÍGUEZ, CARLOS'),
(113, 102, '456123789', '1978-03-10', '1998-12-20', 2200, 0, 3, 'LÓPEZ, JUAN'),
(114, 103, '789456123', '1982-08-25', '2003-05-05', 2500, 0, 0, 'MARTÍNEZ, MARÍA'),
(115, 104, '321654987', '1973-12-01', '1995-10-30', 1900, 0, 2, 'SÁNCHEZ, LUIS'),
(116, 102, '654987321', '1977-06-18', '1998-09-25', 2100, 0, 1, 'GÓMEZ, ELENA'),
(117, 103, '147258369', '1985-09-10', '2006-11-12', 2300, 0, 4, 'FERNÁNDEZ, DAVID'),
(118, 104, '369258147', '1988-04-05', '2008-07-20', 2400, 0, 3, 'DÍAZ, ANA'),
(119, 102, '258369147', '1976-11-30', '1999-06-15', 2000, 0, 2, 'PÉREZ, MIGUEL'),
(120, 101, '147369258', '1983-07-12', '2004-04-10', 2300, 0, 1, 'RUIZ, CRISTINA'),
(121, 103, '258147369', '1979-02-28', '2000-08-05', 2100, 0, 3, 'JIMÉNEZ, SERGIO'),
(122, 104, '369147258', '1986-06-05', '2007-03-18', 2200, 0, 0, 'TORRES, PAULA'),
(123, 102, '147369852', '1981-09-15', '2001-12-22', 2400, 0, 2, 'ROMERO, JAVIER'),
(124, 101, '258369147', '1974-08-22', '1996-05-20', 1900, 0, 1, 'NAVARRO, RAQUEL'),
(125, 103, '369147258', '1970-11-10', '1993-10-15', 1800, 0, 0, 'VICENTE, ALBERTO'),
(126, 104, '147258369', '1972-03-18', '1994-09-28', 2000, 0, 2, 'SUÁREZ, SILVIA'),
(127, 102, '369258147', '1978-04-30', '1999-11-10', 2200, 0, 3, 'GALÁN, EVA'),
(128, 101, '258369147', '1987-10-05', '2008-01-15', 2400, 0, 2, 'MOLINA, RUBÉN'),
(129, 103, '147369258', '1984-05-08', '2005-02-28', 2100, 0, 1, 'REYES, PATRICIA'),
(130, 104, '369147258', '1976-12-25', '1998-08-20', 2300, 0, 4, 'GÓMEZ, DANIEL');

INSERT INTO EMPLEADOS VALUES
(131, 101, '123456789', '1975-05-20', '1995-08-15', 1260, 0, 2, 'LUSINA, PACA');
