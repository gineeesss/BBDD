#Borramos la base de datos si existe
DROP DATABASE IF EXISTS VETERINARIO;

#Creamos la base de datos veterinario y la ponemos en uso
CREATE DATABASE IF NOT EXISTS VETERINARIO;
USE VETERINARIO;


#Creamos las tablas CLIENTES Y MASCOSTAS que componen la base de datos
MariaDB [VETERINARIO]>CREATE TABLE clientes (
    dni varchar(9) PRIMARY KEY,
    nombre varchar(50),
    direccion varchar (60)
    )comment="Autor: Gines, Fecha; 30-11-23";


CREATE TABLE mascotas (
	codigo integer PRIMARY KEY,
	nombre varchar(50),
	cliente varchar(9),
	CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES clientes (dni) ON DELETE CASCADE
)comment="Autor: Gines, Fecha: 30-11-23 18:00" ;

#Mostramos las bases de datos para comprobar que se ha creado correctamente
SHOW DATABASES;

#Mostramos las tablas que hemos creado en la base de datos
SHOW TABLES;
	
  	
