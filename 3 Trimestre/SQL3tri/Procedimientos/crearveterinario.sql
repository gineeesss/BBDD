CREATE DATABASE veterinario;

USE veterinario;

CREATE TABLE mascotas (
nombre VARCHAR(10),
fechaNacim DATE NOT NULL,
propietario VARCHAR(40) NOT NULL,
PRIMARY KEY(nombre)
);
INSERT INTO mascotas
VALUES('Cuqui', '2012-05-20', 'Pedro López');
INSERT INTO mascotas
VALUES('Sultán', '2014-11-07', 'Ana Vals');
INSERT INTO mascotas
VALUES('Chati', '2021-09-13', 'Pedro López');

USE veterinario;
CREATE PROCEDURE pa_mascotas_lista( )
SELECT * FROM mascotas;

CALL pa_mascotas_lista();

CREATE PROCEDURE pa_mascotas_cantidad()
SELECT COUNT(*) FROM mascotas;

CALL pa_mascotas_cantidad();

SHOW CREATE PROCEDURE pa_mascotas_lista\G

SHOW PROCEDURE STATUS
LIKE 'pa_mascotas_lista'\G

SHOW PROCEDURE STATUS
WHERE Db='veterinario'\G

DROP PROCEDURE IF EXISTS pa_mascotas_lista2;

DELIMITER //
CREATE PROCEDURE pa_mascotas_lista2()
BEGIN
SELECT *FROM mascotas;
SELECT count(*) FROM mascotas;
END //
DELIMITER ;

CALL pa_mascotas_lista2;

SET @propietario =(SELECT propietario
FROM mascotas
WHERE nombre = 'Cuqui');

SELECT nombre, fechaNacim
FROM mascotas
WHERE propietario = @propietario;
