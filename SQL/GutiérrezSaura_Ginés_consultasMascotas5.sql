CREATE DATABASE Veterinario2;

USE Veterinario2;

CREATE TABLE MASCOTAS(
	nombre VARCHAR(10),
	especie VARCHAR(12) NULL,
	raza VARCHAR(15) NOT NULL,
	sexo ENUM("M","H") NOT NULL,
	edad INT NOT NULL,
	PRIMARY KEY (nombre)
);

INSERT INTO MASCOTAS VALUES
("Rai","perro","Yorkshi Terrier","H",13),
("Mandarina","gato","Gato" "Comun","H",4),
("Tobi","perro","PitB Terrier","H",6),
("Chloe","gato","Bicolor","M",5),
("Atilano","pajaro","canario","H",5),
("Curro","pajaro","canario","H",1),
("Gorriontxu","pajaro","jilguero","M",2)
;

#1. Mostrar el nombre y la edad de todas las mascotas que tengan más de 10 años.

SELECT nombre, edad
FROM MASCOTAS
WHERE edad>10;

#2. Mostrar el nombre, la especie y la edad de todas las mascotas hembras que tengan como máximo 5 años.

SELECT nombre,especie,edad
FROM MASCOTAS
WHERE sexo="M" and edad<=

#3. Mostrar el nombre, la raza, el sexo y la edad de todas los perros que tengan menos de 2 años o más de 7 años.

SELECT nombre,especie,raza,sexo,edad
FROM MASCOTAS
WHERE especie="perro" and (edad<=2 or edad>=7);

#4. Mostrar el nombre, especie y edad de perros, gatos y cobayas.

SELECT nombre,especie,edad
FROM MASCOTAS
WHERE especie in ("perro","gato","cobaya");

#5. Mostrar el nombre, el sexo y la edad de las mascotas cuya edad esté entre 12 y 15 años.

SELECT nombre,sexo,edad
FROM MASCOTAS 
WHERE edad BETWEEN 12 and 15;

#6. Mostrar el nombre y la especie de todas las mascotas que no tengan raza.

SELECT nombre,especie
FROM MASCOTAS
WHERE raza is null;

#7. Mostrar el nombre, especie, sexo y edad de las mascotas cuyo nombre comience por la letra F.

SELECT nombre,especie,sexo,edad
FROM MASCOTAS
WHERE nombre LIKE "f%";

#8. Mostrar el nombre, especie, sexo y edad de las mascotas cuyo nombre esté compuesto por cinco letras.

SELECT nombre,especie,sexo,edad
FROM MASCOTAS
WHERE nombre LIKE "_____";

#9. Mostrar el nombre, la especie, la edad y el sexo de todas las mascotas ordenadas por especie. Las mascotas de cada especie estarán a su vez ordenadas de mayor a menor edad.

SELECT nombre,especie,edad,sexo
FROM MASCOTAS 
ORDER BY especie, edad DESC;

#10. Mostrar el nombre, la especie y la edad de las cinco mascotas mayores

SELECT nombre,especie,edad
FROM MASCOTAS 
ORDER BY edad DESC LIMIT 5;
