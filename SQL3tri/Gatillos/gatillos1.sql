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