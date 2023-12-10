# Autor: Ginés
# Fecha: 10-12-23

# Crear la base de datos FILMOTECA y usarla
CREATE DATABASE IF NOT EXISTS FILMOTECA;
USE FILMOTECA;

# Crear la tabla GENEROS
CREATE TABLE GENEROS (
    codigo INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=INNODB;
# Ver tabla y creación
describe GENEROS;
show create table GENEROS;

# Crear la tabla PELICULAS con claves foráneas
CREATE TABLE PELICULAS (
    codigo INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    anio INT,
    genero INT,
    CONSTRAINT fk_genero FOREIGN KEY (genero) REFERENCES GENEROS(codigo) ON DELETE CASCADE
) ENGINE=INNODB;
# Ver tabla y creación
describe PELICULAS;
show create table PELICULAS;

# Crear la tabla DIRECTORES con claves foráneas y eliminación en cascada
CREATE TABLE DIRECTORES (
    nombre VARCHAR(255) PRIMARY KEY,
    nacionalidad VARCHAR(255),
    fechaNacimiento DATE
) ENGINE=INNODB;
# Ver tabla y creación 
describe DIRECTORES;
show create table DIRECTORES;

# Crear la tabla ACTORES
CREATE TABLE ACTORES (
    nombre VARCHAR(255) PRIMARY KEY,
    nacionalidad VARCHAR(255),
    fechaNacim DATE,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'V'))
) ENGINE=INNODB;
# Ver tabla y creación
describe DIRECTORES;
show create table DIRECTORES;

# Crear la tabla ACTORES-PELICULAS con claves foráneas y eliminación en cascada
CREATE TABLE ACTORES_PELICULAS (
    pelicula INT,
    actor VARCHAR(255),
    personaje VARCHAR(255) NOT NULL,
    anio INT,
    CONSTRAINT fk_pelicula FOREIGN KEY (pelicula) REFERENCES PELICULAS(codigo) ON DELETE CASCADE,
    CONSTRAINT fk_actor FOREIGN KEY (actor) REFERENCES ACTORES(nombre) ON DELETE CASCADE
) ENGINE=INNODB;
# Ver tabla y creación 
describe DIRECTORES;
show create table DIRECTORES;
