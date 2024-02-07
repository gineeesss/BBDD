/*# 1. Sacar un listado de clientes indicando el nombre del cliente y cuántos pedidos
ha realizado.*/

SELECT c.NombreCliente, count(*) AS "Pedidos Realizados"
FROM Clientes c INNER JOIN Pedidos p USING (CodigoCliente)
GROUP BY c.NombreCliente;


/*# 2. Sacar un listado con los nombres de los clientes y el total pagado por cada uno
de ellos.
*/

SELECT c.NombreCliente, SUM(Cantidad)  AS "Total Pago por CLiente"
FROM Clientes c INNER JOIN Pagos p USING(CodigoCliente)
GROUP BY c.NombreCliente
ORDER BY SUM(Cantidad) DESC;

/*# 3. Sacar el nombre de los clientes que hayan hecho pedidos en 2008.*/

SELECT DISTINCT c.NombreCliente
FROM Clientes c INNER JOIN Pedidos p USING(CodigoCliente)
WHERE YEAR(p.FechaPedido) = 2008;

/*# 4. Listar el nombre del cliente y el nombre y apellido de sus representantes de
aquellos clientes que no hayan realizado pagos.*/

SELECT DISTINCT c.NombreCliente, e.Nombre, e.Apellido1
FROM Clientes c 
LEFT JOIN Pagos p USING(CodigoCliente) 
INNER JOIN Empleados e ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
WHERE p.CodigoCliente IS NULL;

/*# 5. Sacar un listado de clientes donde aparezca el nombre de su comercial y la
ciudad donde está su oficina.*/

SELECT c.NombreCliente, e.Nombre as "Nombre Comercial", o.Ciudad as "Ciudad Oficina"
FROM Clientes c INNER JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado INNER JOIN Oficinas o USING(CodigoOficina)
GROUP BY c.NombreCliente;

/* # 6. Sacar el nombre, apellidos, oficina y cargo de aquellos que no sean represen-
tantes de ventas.*/

SELECT Nombre, Apellido1, Apellido2, CodigoOficina, Puesto
FROM Empleados
WHERE (Puesto != "Representante Ventas");

/*# 7. Sacar cuántos empleados tiene cada oficina, mostrando el nombre de la ciudad
donde está la oficina.*/

SELECT o.Ciudad, COUNT(e.CodigoEmpleado) as "Total Empleados"
FROM Oficinas o JOIN Empleados e USING(CodigoOficina)
GROUP BY o.Ciudad;

/*# 8. Sacar un listado con el nombre de los empleados, y el nombre de sus respectivos
jefes.
*/

/*# 9. Sacar el nombre, apellido, oficina (ciudad) y cargo del empleado que no repre-
sente a ningún cliente.
*/

/*# 10. Sacar la media de unidades en stock de los productos agrupados por gama.
*/

/*# 11. Sacar los clientes que residan en la misma ciudad donde hay una oficina, indi-
cando dónde está la oficina.
*/

/*# 13. Sacar el número de clientes que tiene asignado cada representante de ventas.
*/

/*# 12. Sacar los clientes que residan en ciudades donde no hay oficinas ordenado por
*/

/*# la ciudad donde residen.
*/

/*# 14. Sacar cuál fue el cliente que hizo el pago con mayor cuantía y el que hizo el
pago con menor cuantía.
*/

/*# 15. Sacar un listado con el precio total de cada pedido.
*/

/*# 16. Sacar los clientes que hayan hecho pedidos en el 2008 por una cuantía superior
a 2000 euros.
*/

/*# 17. Sacar cuántos pedidos tiene cada cliente en cada estado.
*/

/*# 18. Sacar los clientes que han pedido más de 200 unidades de cualquier producto*/
