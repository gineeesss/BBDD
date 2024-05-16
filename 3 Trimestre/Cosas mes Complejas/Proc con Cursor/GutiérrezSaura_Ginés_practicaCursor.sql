CREATE TABLE ActualizacionLimiteCredito(
    Fecha DATETIME,
    CodigoCliente INTEGER,
    Incremento NUMERIC(15,2)
) engine=innodb;

delimiter //
CREATE PROCEDURE IncrementaLimCredito (IN porcentaje INTEGER)
BEGIN
    DECLARE TotalPedidos,Credito,Incremento NUMERIC(15,2);
    DECLARE Cliente, Terminado INTEGER DEFAULT 0;
    DECLARE curClientes CURSOR FOR
        SELECT LimiteCredito,CodigoCliente FROM Clientes;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET Terminado = 1;
    DECLARE EXIT HANDLER FOR NOT FOUND rollback;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION rollback;
    
    OPEN curClientes;
    START TRANSACTION;
    
    FETCH curClientes INTO Credito,Cliente;
    WHILE NOT Terminado DO
        SELECT SUM(Cantidad*PrecioUnidad) INTO TotalPedidos
        FROM DetallePedidos NATURAL JOIN Pedidos
        WHERE YEAR(FechaPedido) BETWEEN 2008 AND 2010
        AND Pedidos.CodigoCliente=Cliente;
        IF TotalPedidos IS NOT NULL THEN #Si hay pedidos
            SET Incremento=TotalPedidos*Porcentaje/100;
            UPDATE Clientes SET
                LimiteCredito=LimiteCredito+Incremento
            WHERE CodigoCliente=Cliente;
            INSERT INTO ActualizacionLimiteCredito
            VALUES(now(),Cliente,Incremento);
        END IF;
       
        FETCH curClientes INTO Credito,Cliente;
     END WHILE;

COMMIT;
END//
delimiter ;

select CodigoCliente, NombreCliente, Ciudad, LimiteCredito from Clientes;

CALL IncrementaLimCredito(15);

select c.CodigoCliente, c.NombreCliente, c.Ciudad, c.LimiteCredito, l.Incremento from Clientes c inner join ActualizacionLimiteCredito l;

