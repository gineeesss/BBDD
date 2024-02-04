/*1. Visualizar los códigos de los representantes de ventas que atienden
a más de 3 clientes. Mostrar también el número de clientes a los
que atienden.*/

SELECT CodigoEmpleadoRepVentas AS "Representante de Ventas", count(*)
FROM Clientes
GROUP BY CodigoEmpleadoRepVentas
HAVING count(*)>3;



/*2. Mostrar el código de los clientes que han pagado de media al menos
1200 euros. Mostrar también la media de lo pagado.*/


SELECT CodigoCliente, AVG(Cantidad) AS Media
FROM Pagos
GROUP BY CodigoCliente
HAVING AVG(Cantidad)>=1200; 




/*3. Sacar los códigos de los pedidos en que el total de unidades pedidas
sea inferior a 15. Mostrar también el total de unidades pedidas.*/


SELECT CodigoPedido, SUM(Cantidad)
FROM DetallePedidos
GROUP BY CodigoPedido
HAVING SUM(Cantidad) <15;


/*4. Mostrar las fechas en las que se entregaron entre 1 y 10
pedidos. Mostrar también la cantidad de pedidos entregados.*/

SELECT FechaEntrega, COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY FechaEntrega
HAVING COUNT(*) BETWEEN 1 AND 10
ORDER BY TotalPedidos DESC;


