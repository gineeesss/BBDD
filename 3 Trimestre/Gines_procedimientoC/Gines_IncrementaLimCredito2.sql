DROP PROCEDURE IF EXISTS IncrementaLimCredito2;
delimiter //
CREATE PROCEDURE IncrementaLimCredito2 ()
BEGIN
    DECLARE tipo char;
    DECLARE Terminado INTEGER DEFAULT 0;
    DECLARE curClientes CURSOR FOR
        SELECT TipoCliente FROM clientes_3;
-- cursor que sólo obtiene el tipo del registro
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET Terminado = 1;
    DECLARE EXIT HANDLER FOR NOT FOUND rollback;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION rollback;
    
    START TRANSACTION;
    OPEN curClientes;
    
    FETCH curClientes INTO tipo;
    WHILE NOT Terminado DO
	    UPDATE clientes_3
	    SET LimiteCredito = LimiteCredito + (LimiteCredito * fa_porcentaje_tipo_cliente(tipo)/100)
        WHERE TipoCliente = tipo;
-- hay que poner una condicion para que solo se ejecute la función con su tipo
        FETCH curClientes INTO tipo;
     END WHILE;
    CLOSE curClientes;
    COMMIT;
END//
delimiter ;

CALL IncrementaLimCredito2();