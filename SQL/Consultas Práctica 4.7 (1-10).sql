-- 1. Sacar la ciudad y el teléfono de las oficinas de Estados Unidos.

SELECT Ciudad, Telefono
FROM Oficinas 
WHERE Pais="EEUU";

-- 2. Sacar el nombre, los apellidos y el email de los empleados a cargo de Alberto Soria.

SELECT Nombre, Apellido1, Email
FROM Empleados
WHERE CodigoJefe = (
    SELECT CodigoEmpleado
    FROM Empleados
    WHERE Nombre = 'Alberto' AND Apellido1 = 'Soria'
);

-- 3. Sacar el cargo, nombre, apellidos y email del jefe de la empresa.

SELECT Puesto, Nombre, Apellido1, Apellido2, Email
FROM Empleados
WHERE CodigoJefe IS NULL;

-- 4. Sacar el nombre, apellidos y cargo de aquellos que no sean representantes de ventas.

SELECT Nombre, Apellido1, Apellido2, Puesto
FROM Empleados
WHERE Puesto NOT LIKE "Representante Ventas";

-- 5. Sacar el número de clientes que tiene la empresa.

SELECT COUNT(*) AS "Numero Total Clientes"
FROM Clientes;

-- 6. Sacar el nombre de los clientes españoles.

SELECT NombreCliente
FROM Clientes 
WHERE Pais="España" OR Pais="Spain";

-- 7. Sacar cuántos clientes tiene cada país.

SELECT Pais, COUNT(*) AS "Clientes Totales"
FROM Clientes
GROUP BY Pais;

-- 8. Sacar cuántos clientes tiene la ciudad de Madrid.

SELECT COUNT(*) AS "Clientes de Madrid"
FROM Clientes
WHERE Ciudad="Madrid";

-- 9. Sacar cuántos clientes tienen las ciudades que empiezan por M.

SELECT COUNT(*) AS "Clientes de Ciudad que empieza por M"
FROM Clientes
WHERE Ciudad LIKE "M%" OR Ciudad LIKE "m%";

-- 10. Sacar el código de empleado y el número de clientes al que atiende cada re- presentante de ventas.

SELECT CodigoEmpleadoRepVentas AS "Codigo Empleado", COUNT(*) AS "Total Clientes"
FROM Clientes
GROUP BY CodigoEmpleadoRepVentas;

-- 11. Sacar el número de clientes que no tiene asignado representante de ventas.



-- 12. Sacar cuál fue el primer y último pago que hizo algún cliente.



-- 13. Sacar el código de cliente de aquellos clientes que hicieron pagos en 2008.




-- 14. Sacar los distintos estados por los que puede pasar un pedido.



-- 15. Sacar el número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo.



-- 16. Sacar cuántos productos existen en cada línea de pedido.



-- 17. Sacar un listado de los 20 códigos de productos más pedidos ordenado por cantidad pedida. (pista: Usar el filtro LIMIT de MySQL o el filtro rownum de Oracle.



-- 18. Sacar el número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la
-- fecha requerida. (pista: Usar la función addDate de MySQL o el operador + de Oracle).



--  19. Sacar la facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. NOTA: La base imponible 
-- se calcula sumando el coste del producto por el número de unidades vendidas. El IVA, es el 18 % de la base imponible, y el total, la suma de los dos campos anteriores.



-- 20. Sacar la misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por FR
