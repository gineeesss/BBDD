# autor: Ginés Gutiérrez Saura

# fecha:13-12-23





# ejercicio1 Añadir en la tabla AUTOMÓVILES un atributo que irá delante del campo Consumo. Se llamará Tipo, será obligatorio y sólo podrá tomar los siguientes valores: utilitario, monovolumen, todoterreno y familiar

ALTER TABLE automoviles

ADD COLUMN tipo VARCHAR(15) NOT NULL

CHECK (Tipo IN ('utilitario', 'monovolumen', 'todoterreno', 'familiar'))

AFTER modelo;





# ejercicio2 Cambiar el tipo del campo Emisiones a real con dos dígitos en la partedecimal y dos en la parte entera



ALTER TABLE automoviles

MODIFY COLUMN emisiones DECIMAL(4,2) NOT NULL;





# ejercicio3 Comprobar que se han hecho las modificaciones anteriores en la tabla AUTOMÓVILES



DESCRIBE automoviles;



# ejercicio4 El atributo FechaNacimiento de la tabla PROPIETARIOS se pasará a llamar nacimiento

ALTER TABLE propietarios

CHANGE COLUMN fechaNacimiento nacimiento DATE NOT NULL;





# ejercicio5 Comprobar que se ha efectuado el cambio



DESCRIBE propietarios;



# ejercicio6 Borrar el atributo Imagen de la tabla AUTOMÓVILES

ALTER TABLE automoviles

DROP COLUMN imagen;





# ejercicio7 Comprobar que se ha borrado

DESCRIBE automoviles;





# ejercicio8 Cambiar el nombre de la tabla PROPIETARIOS por CLIENTES (tener cuidado con la tabla conjunta porque se sigue llamando propetarioAutomoviles...)

RENAME TABLE propietarios TO clientes;



# ejercicio9 Eliminar la base de datos Veterinario.

DROP DATABASE Veterinario;



# ejercicio10. Crear la base de datos Mascotas.

CREATE DATABASE  Mascotas;

USE Mascotas;



# ejercicio11. Crear una tabla ANIMALES con los atributos: nom_animal, tipo, raza, peso y color. La clave primaria será nom_animal.

CREATE TABLE ANIMALES(

nom_animal VARCHAR(25) PRIMARY KEY,

tipo VARCHAR(25) ,

raza VARCHAR(25),

peso DECIMAL(5,2),

color VARCHAR(25)

);



# ejercicio12. Crear la tabla VACUNACIONES con tres campos: nombre, fechaVacunacion y descripcionVacuna. La clave primaria estará formada por los dos primeros campos. Poner un nombre simbólico tanto a la clave primaria como a la foránea.



CREATE TABLE VACUNACIONES (

    nombre VARCHAR(25),

    fechaVacunacion DATE,

    descripcionVacuna VARCHAR(25),

    CONSTRAINT PK_VACUNACIONES PRIMARY KEY (nombre, fechaVacunacion),

    CONSTRAINT FK_ANIMALES FOREIGN KEY (nombre) REFERENCES ANIMALES(nom_animal)

);



# ejercicio13. Quitar la restricción de clave foránea. Comprobar.



ALTER table VACUNACIONES

DROP CONSTRAINT FK_ANIMALES;


##para eliminar la clave primaria de una tabla, primero tengo que eliminar la relacion que tenga el atributo con otras tablas


# ejercicio14. Quitar la restricción de clave primaria en la tabla ANIMALES.



alter table ANIMALES 

DROP PRIMARY KEY;





# ejercicio15. Cambiar el nombre del atributo nom_animal por Nombre.



ALTER TABLE ANIMALES CHANGE COLUMN nom_animal Nombre VARCHAR(25) NOT NULL;



# ejercicio16. Poner la restricción de clave primaria al atributo anterior. Comprobar que se ha hecho la modificación.



ALTER TABLE ANIMALES ADD CONSTRAINT PK_ANIMALES PRIMARY KEY (Nombre);
#el de arriba meh, mejor el de abajo
ALTER TABLE ANIMALES ADD PRIMARY KEY(Nombre);

DESCRIBE ANIMALES;



# ejercicio17. Volver a poner la restricción de clave foránea en la tabla ANIMALES asignándole un nombre simbólico.



ALTER TABLE VACUNACIONES  ADD CONSTRAINT FK_ANIMALES FOREIGN KEY(nombre) REFERENCES ANIMALES(NOmbre);



# ejercicio18. Mostrar las características de creación de la tabla ANIMALES



show create table VACUNACIONES;

