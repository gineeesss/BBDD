#si existe, se borra la base de datos vehiculos
DROP DATABASE IF EXISTS  Vehiculos;

#se crea la base de datos vehiculos y se pone en uso;
CREATE DATABASE Vehiculos;
USE Vehiculos;

#se crean primero las tablas automoviles y propietarios
CREATE TABLE automoviles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(25) NOT NULL,
    modelo VARCHAR(25) NOT NULL,
    consumo DECIMAL(4,2) NOT NULL,
    emisiones INT NOT NULL,
    imagen BLOB
)
COMMENT='tabla automoviles'
ENGINE=InnoDB;

CREATE TABLE propietarios(
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(12) NOT NULL
)
COMMENT='tabla propietarios'
ENGINE=InnoDB;

#ahora se crea la tabla propietariosautomoviles, una tabla que sale a partir de las dos anteriores
#por lo que su clave primaria es compuesta por las claves de las otras y se añade un atributo{fecha de compra}

CREATE TABLE propietariosAutomoviles(
    dni VARCHAR(9),
    id INT,
    fechaCompra DATE,
    CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES propietarios(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES automoviles(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (dni, id) #se define la clave compuesta
)
COMMENT='tabla de propietarios con sus automoviles'
ENGINE=InnoDB;

# mostrar creacion y esquema de tabla automoviles	
SHOW CREATE TABLE automoviles;
DESCRIBE automoviles;

# mostrar creacion y esquema de tabla propietarios	
SHOW CREATE TABLE propietarios;
DESCRIBE propietarios;

# mostrar creacion y esquema de tabla propietariosAutomoviles	
SHOW CREATE TABLE propietariosAutomoviles;
DESCRIBE propietariosAutomoviles;
