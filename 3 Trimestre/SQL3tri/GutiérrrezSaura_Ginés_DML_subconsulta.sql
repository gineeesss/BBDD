# Usa subconsultas en los filtros y realiza las siguientes actualizaciones y
# borrados:

# 1. Borra los clientes que no tengan pedidos.

DELETE FROM Clientes
WHERE CodigoCliente NOT IN (SELECT DISTINCT CodigoCliente FROM Pedidos);

# 2. Incrementa en un 20 % el precio de los productos que no tengan
# pedidos.

UPDATE Productos
SET PrecioVenta = PrecioVenta*1.2
WHERE CodigoProducto NOT IN (SELECT DISTINCT CodigoProducto FROM DetallePedidos);

# 3. Borra los pagos del cliente con menor límite de crédito.

DELETE FROM Pagos
WHERE CodigoCliente = (SELECT CodigoCliente FROM Clientes ORDER BY LimiteCredito ASC LIMIT 1);

# 4. Establece a 0 el límite de crédito del cliente que menos unidades
# pedidas tenga del producto 'OR-179'


UPDATE Clientes
SET LimiteCredito = 0
WHERE CodigoCliente = (
SELECT CodigoCliente
FROM Pedidos p INNER JOIN DetallePedidos d USING(CodigoPedido)
WHERE d.CodigoProducto = 'OR-179'
ORDER BY SUM(d.Cantidad) ASC
LIMIT 1
);