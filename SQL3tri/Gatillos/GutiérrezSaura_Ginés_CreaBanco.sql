DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
CREATE TABLE CUENTAS(
	n_cuenta VARCHAR(10) PRIMARY KEY,
	saldo DECIMAL(7,2)
);
CREATE TABLE HISTORIAL_CUENTAS(
	n_cuenta VARCHAR(10),
	fecha_modificacion DATETIME,
	saldo_anterior DECIMAL(9,2),
	saldo_actual DECIMAL(9,2),
	PRIMARY KEY(n_cuenta,fecha_modificacion),
	FOREIGN KEY (n_cuenta) REFERENCES CUENTAS(n_cuenta)
);

INSERT INTO CUENTAS VALUES
('kikiriki',6969.69),
('kakaroto',777);
