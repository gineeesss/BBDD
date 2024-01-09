# 1. Todos los atributos de la tabla UNIVERSIDADES y de la tabla EMPLEADOS (excepto Ciudad) pasan a ser no nulos
ALTER TABLE UNIVERSIDADES
	MODIFY nombre_univ VARCHAR(25) NOT NULL,
	MODIFY ciudad VARCHAR(20),
	MODIFY cod_postal VARCHAR(5) NOT NULL;

ALTER TABLE EMPLEADOS
	MODIFY direcc VARCHAR(25) NOT NULL,
	MODIFY codPostal VARCHAR(20) NOT NULL,
	MODIFY fecha_nac DATE NOT NULL;


# 2. Modificar el campo presupuesto para que almacene 8 enteros y 2 decimales.

alter table DEPARTAMENTOS MODIFY presupuesto DECIMAL (8,2) NOT NULL;

# 3. Insertar dos registros en cada tabla, rellenando todos sus atributos y haciendo cumplir las restricciones de integridad. En el caso de la tabla EMPLEADOS, en uno de los registros introducidos se dejarán con el valor nulo el campo Ciudad.

INSERT INTO UNIVERSIDADES VALUES 
    ('00012', 'Universidad Cadiz', 'Cadiz', '41212'),
    ('21320', 'Universitat Barcelona', 'L Hospitalet', '09805');

INSERT INTO ESTUDIOS (dni_emple, universidad, titulacion, especialidad, anio, numero)
VALUES
('04591020Y', '00012', 'Ingeniería Informática', 'Desarrollo Software', 2015, 1),
('04591020Y', '21320', 'Administración de Empresas', 'Finanzas', 2012, 2);

INSERT INTO TRABAJOS (codigo, nombre, salario)
VALUES
('T1', 'Pescador', 4500.00),
('T2', 'Analista', 4000.00);

INSERT INTO HISTORIAL_LABORAL (Dni_emple, Trabajo_cod, fecha_inicio, fecha_fin)
VALUES
('04591020Y', 'T1', '2015-01-01', '2017-12-31'),
('04591020Y', 'T2', '2018-01-01', NULL);


# 4. Insertar en la tabla DEPARTAMENTOS una tupla en la que el jefe sea “123456666a” y el resto de los campos serán elegidos por el alumno. Si se produce algún error indicarlo y no se realizará corrección. ¿qué regla viola?

INSERT INTO DEPARTAMENTOS (nombre_dpto, jefe, presupuesto)VALUES
('Mando','123456666a','422.12');

# 5. Añadir una restricción que obligue a que la ciudad de los EMPLEADOS no puedacontener valores nulos. ¿Es posible hacerlo si alguna de las tuplas tenía el valor nulo en este atributo?

ALTER TABLE EMPLEADOS MODIFY ciudad VARCHAR(20) NOT NULL;


# 6. Añadir un nuevo atributo Valoración en la tabla de EMPLEADOS que indica de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar su andadura en la empresa. Poner el valor por defecto 5 para ese campo. ¿Qué valor tienen ese nuevo campo en los registros que ya existían en la tabla?

ALTER TABLE EMPLEADOS
ADD COLUMN valoracion INT DEFAULT 5 CHECK (valoracion BETWEEN 1 AND 10);


# 7. Insertar una nueva tupla en EMPLEADOS sin introducir ningún valor en el atributo nuevo.

INSERT INTO EMPLEADOS (dni, nombre, apellido1, apellido2, direcc, ciudad, codPostal, sexo, fecha_nac) VALUES
('04591020Y','Paco','Jimenez','Falero','Calle Koala','Badajo','06008','n','1832-12-12');

# 8. Quitar la restricción de clave única al atributo nombre en la tabla DEPARTAMENTOS.

ALTER TABLE DEPARTAMENTOS DROP INDEX nombre_dpto;


# 9. Eliminar la restricción NOT NULL del atributo dirección de la tabla EMPLEADOS.

ALTER TABLE EMPLEADOS MODIFY COLUMN direcc VARCHAR(25);

# 10. Quitar el valor por defecto de la columna valoración de la tabla EMPLEADOS.

ALTER TABLE EMPLEADOS MODIFY valoracion INT(2) CHECK ('valoracion' BETWEEN 1 AND 10);


# 11. Convertir la fecha de nacimiento de EMPLEADOS a tipo cadena (30).

--

# 12. Insertar un nuevo atributo en la tabla EMPLEADOS llamado teléfono (cadena 11).

ALTER TABLE EMPLEADOS ADD COLUMN telefono VARCHAR(11);

# 13. Mostrar las características de creación de las tablas EMPLEADOS y DEPARTAMENTOS . Capturar el resultado.

SHOW CREATE TABLE EMPLEADOS;

# 14. Mostrar los registros almacenados en cada tabla. Capturar el resultado

SELECT * FROM EMPLEADOS;
SELECT * FROM UNIVERSIDADES;
SELECT * FROM DEPARTAMENTOS;
SELECT * FROM ESTUDIOS;
SELECT * FROM TRABAJOS;;
SELECT * FROM HISTORIAL_LABORAL;

