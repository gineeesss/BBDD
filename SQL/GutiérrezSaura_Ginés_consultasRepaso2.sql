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



3. Hallar el número de empleados y de extensiones telefónicas distintas
del departamento 112.



4. Idem para los departamentos que no tienen director en propiedad.



5. Datos de los empleados que trabajan en un centro con dirección en calle
Atocha (cualquier número y ciudad) y tienen dos hijos exactamente. No
use subconsultas anidadas.



6. Extraiga los nombres de las parejas de empleados que trabajan en el mismo
centro y tienen los mismos ingresos como salario base. No use subconsultas
anidadas. Visualizar también el salario.



7. Extraer los códigos de los departamentos que no hacen de departamento jefe.



8. Idem pero que sí hacen de departamento jefe de algún otro departamento.



9. Extraiga un listado donde aparezca el código de los departamentos y su
nombre conjuntamente con el código de los centros en donde están situados y el
nombre de estos centros.



10. Utilice subconsultas para solventar la consulta número 5 de la relación
anterior.