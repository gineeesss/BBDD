CREATE TABLE mascotas_ext (
    nombre VARCHAR(10),
    carpeta VARCHAR(50) NOT NULL,
    PRIMARY KEY(nombre),
    FOREIGN KEY(nombre) REFERENCES mascotas(nombre)
);
INSERT INTO mascotas
VALUES('Luna', '2019-12-08', 'Ana Vals');
INSERT INTO mascotas
VALUES('Tintin', '2017-10-25', 'Pedro Lopez');
INSERT INTO mascotas_ext
VALUES('Luna', 'ana vals_luna');
INSERT INTO mascotas_ext
VALUES('Tintin', 'pedro lopez_tintin');

DELIMITER //
DROP TRIGGER IF EXISTS dp_mascota_acutual;
CREATE TRIGGER dp_mascota_actual AFTER UPDATE ON mascotas
FOR EACH ROW
BEGIN
    DECLARE nueva_carpeta VARCHAR(50);
    SET nueva_carpeta = CONCAT(LOWER(NEW.propietario),'_',LOWER(NEW.nombre));
    UPDATE mascotas_ext SET carpeta = nueva_carpeta
    WHERE nombre = NEW.nombre;
END //
delimiter ;
UPDATE mascotas SET propietario = 'Pepi San'
WHERE nombre='Robin';




DELIMITER //
CREATE TRIGGER dp_mascota_eliminar BEFORE DELETE ON 
FOR EACH ROW
BEGIN
    DELETE FROM mascotas_ext
    WHERE nombre=OLD.nombre
END //
delimiter ;

DELETE FROM mascotas WHERE nombre='Robin'