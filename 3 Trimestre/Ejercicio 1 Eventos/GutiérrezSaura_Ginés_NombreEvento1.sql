-- even_banco

CREATE DATABASE BANCO;
USE BANCO;
CREATE TABLE CUENTAS(
	numero VARCHAR(16) PRIMARY KEY,
	nombre VARCHAR(20),
	saldo DECIMAL(7,2)
);

DROP PROCEDURE IF EXISTS borrar_cuentasA0;
DELIMITER //
CREATE PROCEDURE borrar_cuentasA0()
BEGIN
    DELETE FROM CUENTAS WHERE saldo=0;
END //
DELIMITER ;

DROP EVENT IF EXISTS even_banco;
CREATE EVENT even_banco
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 3 HOUR
DO
BEGIN
CALL borrar_cuentasA0();
END;


