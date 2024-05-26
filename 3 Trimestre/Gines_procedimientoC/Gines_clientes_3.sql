USE jardineria
CREATE TABLE clientes_3(
	CodigoCliente int(11) PRIMARY KEY,
	NombreCliente varchar(50),
	LimiteCredito decimal(15,2),
	TipoCliente enum('A','B','C','D')
);

INSERT INTO clientes_3 (CodigoCliente, NombreCliente, LimiteCredito, TipoCliente)
SELECT CodigoCliente, NombreCliente, LimiteCredito, 'A'
FROM Clientes
LIMIT 4;

MariaDB [jardineria]> UPDATE clientes_3 SET TipoCliente = 'B' WHERE CodigoCliente = 1;
MariaDB [jardineria]> UPDATE clientes_3 SET TipoCliente = 'D' WHERE CodigoCliente = 4;
MariaDB [jardineria]> UPDATE clientes_3 SET TipoCliente = 'C' WHERE CodigoCliente = 3;

