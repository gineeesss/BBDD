INSERT INTO Oficinas (CodigoOficina, Ciudad, Pais, CodigoPostal, Telefono, LineaDireccion1)
VALUES ('BDJZ', 'Badajoz', 'España', '06003', '666666666', 'San Onofre');

INSERT INTO Empleados (CodigoEmpleado, Nombre, Apellido1, Extension, Email, CodigoOficina, Puesto)
VALUES (32, 'Paco', 'Porras', '7777', 'guauguau@miau.com', 'BDJZ', 'Representante Ventas');

INSERT INTO Clientes (CodigoCliente, NombreCliente, Telefono, Fax, LineaDireccion1, Ciudad, Pais, CodigoEmpleadoRepVentas, LimiteCredito)
VALUES (39, 'Jesucristo', '777777777', '987654321', 'San Juan', 'Badajoz', 'España', 32, 1000.00);

INSERT INTO Pedidos (CodigoPedido, FechaPedido, FechaEsperada, Estado, CodigoCliente)
VALUES (129, CURDATE(), CURDATE() + INTERVAL 7 DAY, 'Pendiente', 39);

INSERT INTO DetallePedidos ()
VALUES 
    (129, 'AR-006', 3, 10 ,5),
    (129, 'AR-001', 2, 100, 3);


UPDATE Clientes
SET CodigoCliente = UUID()
WHERE CodigoCliente = 39; 

SELECT *
FROM Pedidos
WHERE CodigoCliente = 39; 



DELETE FROM Clientes
WHERE CodigoCliente = 39;

SELECT *
FROM Pedidos
WHERE CodigoCliente = 39; 

