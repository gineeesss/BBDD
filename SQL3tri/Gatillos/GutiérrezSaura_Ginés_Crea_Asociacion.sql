DROP DTABASE IF EXISTS ASOCIACION;
CREATE DATABASE ASOCIACION;

USE ASOCIACION;

CREATE TABLE SOCIOS(
	numero INT AUTO_INCREMENT,
	nombre VARCHAR(30),
	domicilio VARCHAR(45),
	telefono VARCHAR(11),
	PRIMARY KEY(numero)
);
CREATE TABLE BAJAS_SOCIOS(
	numero INT,
	nombre VARCHAR(30),
	domicilio VARCHAR(45),
	telefono VARCHAR(11),
	fecha_baja DATE,
	PRIMARY KEY (numero)
);

INSERT INTO SOCIOS(nombre,domicilio,telefono) VALUES
('Antonio Orozco','Miau','dsad'),
('Paco Pajero','Guau','dasasd'),
('Nicki Minaj','auuuu','dasd');