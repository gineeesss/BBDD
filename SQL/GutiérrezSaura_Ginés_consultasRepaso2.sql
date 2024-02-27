Usando la Base de Datos “EMPRESA”, de la práctica anterior realizar las siguientes
consultas:

1. Insertar un departamento que tendrá el número 140. A continuación mostrar el
nombre de cada departamento y la cantidad de empleados que trabajan en cada uno
de ellos, incluido en el departamento nuevo

ALTER TABLE DEPARTAMENTOS MODIFY COLUMN Director INT(11) NULL;

INSERT INTO DEPARTAMENTOS VALUES(140,20,null,'P',8,100,"MIAU");

SELECT d.Nombre, COUNT(e.Cod)
FROM DEPARTAMENTOS d LEFT JOIN EMPLEADOS e ON d.Numero = e.Departamento
GROUP BY d.Nombre;

2. Hallar cuántos departamentos existen y el presupuesto anual medio de la
empresa para el global de todos los departamentos.

SELECT COUNT(Numero) AS 'Número de Departamentos', AVG(Presupuesto) AS 'Presupuesto Anual Medio'
FROM DEPARTAMENTOS;


3. Hallar el número de empleados y de extensiones telefónicas distintas
del departamento 112.

SELECT COUNT(DISTINCT Cod) AS 'Número de Empleados', COUNT(DISTINCT Telefono) AS 'Número de Extensiones Telefónicas'
FROM EMPLEADOS
WHERE Departamento = 112;


4. Idem para los departamentos que no tienen director en propiedad.

SELECT Numero
FROM DEPARTAMENTOS
WHERE Director IS NULL;


5. Datos de los empleados que trabajan en un centro con dirección en calle
Atocha (cualquier número y ciudad) y tienen dos hijos exactamente. No
use subconsultas anidadas.

SELECT e.*
FROM EMPLEADOS e
JOIN DEPARTAMENTOS d ON e.Departamento = d.Numero
JOIN CENTROS c ON d.Centro = c.Numero
WHERE c.Direccion LIKE '%ATOCHA%' AND e.Num_hijos = 2;

6. Extraiga los nombres de las parejas de empleados que trabajan en el mismo
centro y tienen los mismos ingresos como salario base. No use subconsultas
anidadas. Visualizar también el salario.

SELECT e1.Nombre AS 'Empleado 1', e2.Nombre AS 'Empleado 2', e1.Salario AS 'Salario'
FROM EMPLEADOS e1, EMPLEADOS e2, DEPARTAMENTOS d1, DEPARTAMENTOS d2
WHERE e1.Departamento = d1.Numero AND e2.Departamento = d2.Numero 
AND e1.Cod < e2.Cod AND d1.Centro = d2.Centro AND e1.Salario = e2.Salario;


7. Extraer los códigos de los departamentos que no hacen de departamento jefe.

SELECT Numero
FROM DEPARTAMENTOS
WHERE Numero NOT IN (SELECT DISTINCT Dpto_jefe FROM DEPARTAMENTOS WHERE Dpto_jefe IS NOT NULL);


8. Idem pero que sí hacen de departamento jefe de algún otro departamento.

SELECT DISTINCT Dpto_jefe
FROM DEPARTAMENTOS
WHERE Dpto_jefe IS NOT NULL;


9. Extraiga un listado donde aparezca el código de los departamentos y su
nombre conjuntamente con el código de los centros en donde están situados y el
nombre de estos centros.

SELECT d.Numero AS 'Código Departamento', d.Nombre AS 'Nombre Departamento', c.Numero AS 'Código Centro', c.Nombre AS 'Nombre Centro'
FROM DEPARTAMENTOS d JOIN CENTROS c ON d.Centro = c.Numero;


10. Utilice subconsultas para solventar la consulta número 5 de la relación
anterior.

SELECT e.*
FROM EMPLEADOS e
WHERE e.Departamento IN (SELECT d.Numero FROM DEPARTAMENTOS d WHERE d.Centro IN (SELECT Numero FROM CENTROS WHERE Direccion LIKE '%ATOCHA%')) AND e.Num_hijos = 2;

